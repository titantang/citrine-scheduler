/*
 * Copyright 2010 Last.fm
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package fm.last.syscommand;

/**
 * SysExecutorObserver implementation that stores the SysOut and SysErr strings in a StringBuffer.
 */
public class StringBufferSysCommandObserver implements SysExecutorObserver {

  private StringBuffer sysOutBuffer = new StringBuffer();
  private StringBuffer sysErrBuffer = new StringBuffer();
  private String newLine = System.getProperty("line.separator");

  public void sysErr(String sysErr) {
    sysErrBuffer.append(sysErr + newLine);
  }

  public void sysOut(String sysOut) {
    sysOutBuffer.append(sysOut + newLine);
  }

  public String getSysOut() {
    return sysOutBuffer.toString();
  }

  public String getSysErr() {
    return sysErrBuffer.toString();
  }

  public void close() {
    // no resources opened so nothing to do
  }

  public String getNewLine() {
    return newLine;
  }

  public void setNewLine(String newLine) {
    this.newLine = newLine;
  }

}
