Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16392144BB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409297; cv=none; b=lMaUgPoiyFztsDM4V7vTtkhRony7ZqhO4knP+NzvTacW4Qow9mPTPUwzC85jpilZsB/QN2MDJgX1bObLJC/sWMnqV7YKJsy4IusmpNGv29nV0ZgCuD+GHuoU0TWYrdkZgE1lI1Z4OpuSSoeZfiRhTKqdwKtGc6wARwM7El/w42g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409297; c=relaxed/simple;
	bh=HOVJLDvPYQ3QsgrHuKywB1AQoRb0FEESHW8nP6sy5FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+t9Xa1drEEA98nMDRn+qEIV3rrUnhiIaPb9ThIkQfYH3vZrDhvKaVIqeEo+G7vuw8v0nHp23KEsHum3VAdUQyZY5ccjcmextajysPGRCn7vJF6/pEenmK1vh8FtvoDp1L2JHmGMnq3NRptwcMEgpqhDCVxPqDDsVkt2+fj7duM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=pv1oOMvP; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="pv1oOMvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745409252; x=1746014052; i=spasswolf@web.de;
	bh=4QxWfURSiUpqtDF2oCAlK/hnZZ/Scx7Crj+x92UVXxI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pv1oOMvPAuAQGl6TGLzs/xYABK4fhYnkHRqZ1MzGFkyD66yP38OwHVYPGysra2pL
	 Vt2W4Iv9dPafWymEMpzLkxW+b65GHB+Esq4MXh8uHWXc8r8rgNIyzeUtP08RVPUzB
	 Zxkrt73t54D3HYHQm0WSPwdxAd2KfT8lT0RLH6zx+LJxHuukEw4jGlwx2vz1B0AmO
	 JghjQ77NzG8YfvqZKvpPdiFgYNYhMKE+CjROBHHEfLvfTT03/iP2+ZP/v/gxJXYP6
	 4OnzkkFYT5HnfTKhv4gWToetI7BwrqhNXCD92wQ/dqHxrvicF8KRhnJVm5orGyL+2
	 mPfVlhCGteHR54g7Xg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1Mcpqo-1uhAc20nuk-00nOr3; Wed, 23 Apr 2025 13:54:12 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: commit dd4cf8c9e1f4 leads to failed boot
Date: Wed, 23 Apr 2025 13:54:08 +0200
Message-ID: <20250423115409.3425-1-spasswolf@web.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9GLAxsskMEer2sj1BGHTFrIbRXDpIWq3qYbhGbQdcIjmucRii0+
 Qbs+dmsZPT/d0r7bVT3dXNUUHOhPI9zTuD57yh73ziHE9bfcpvd/pzrvhKH47IQxsTK/Wx1
 fKQQt17FGdSzD8IUk6yjoZBP74Vwcdp7kqJaBdKQulo1ojAJ7zlvYx6hbTJOnQuUcsly0K+
 ++yZPvz3CR1nawi3HyUKw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fq0p/Rr5uHo=;KwOWlK7/5+65jhWpnoZA2KU3qDb
 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
 TfPgI3SJcQ==

Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop runnning
debian sid. When booting kernel message appear on screen but no messages from
init (systemd). There are also no logs written even thought emergency sync
via magic sysrq works (a message is printed on screen), presumably because
/ is not mounted. I bisected this (from 6.15-rc3 to next-20250422) and found
commit dd4cf8c9e1f4 as the first bad commit.
Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.

Hardware:
CPU (from /proc/cpuinfo):
vendor_id	: AuthenticAMD
cpu family	: 25
model		: 80
model name	: AMD Ryzen 7 5800H with Radeon Graphics
stepping	: 0
microcode	: 0xa50000c
$ lspci -nn
00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne Root Complex [1022:1630]
00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne IOMMU [1022:1631]
00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy Host Bridge [1022:1632]
00:01.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Bridge [1022:1633]
00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy Host Bridge [1022:1632]
00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe GPP Bridge [1022:1634]
00:02.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe GPP Bridge [1022:1634]
00:02.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe GPP Bridge [1022:1634]
00:02.4 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe GPP Bridge [1022:1634]
00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy Host Bridge [1022:1632]
00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir Internal PCIe GPP Bridge to Bus [1022:1635]
00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller [1022:790b] (rev 51)
00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge [1022:790e] (rev 51)
00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric; Function 0 [1022:166a]
00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric; Function 1 [1022:166b]
00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric; Function 2 [1022:166c]
00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric; Function 3 [1022:166d]
00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric; Function 4 [1022:166e]
00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric; Function 5 [1022:166f]
00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric; Function 6 [1022:1670]
00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric; Function 7 [1022:1671]
01:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express Switch [1002:1478] (rev c3)
02:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch [1002:1479]
03:00.0 Display controller [0380]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23 [Radeon RX 6600/6600 XT/6600M] [1002:73ff] (rev c3)
03:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller [1002:ab28]
04:00.0 Network controller [0280]: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E 80MHz [14c3:0608]
05:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 15)
06:00.0 Non-Volatile memory controller [0108]: Kingston Technology Company, Inc. KC3000/FURY Renegade NVMe SSD [E18] [2646:5013] (rev 01)
07:00.0 Non-Volatile memory controller [0108]: Micron/Crucial Technology P1 NVMe PCIe SSD[Frampton] [c0a9:2263] (rev 03)
08:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] [1002:1638] (rev c5)
08:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Renoir Radeon High Definition Audio Controller [1002:1637]
08:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) Platform Security Processor [1022:15df]
08:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne USB 3.1 [1022:1639]
08:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne USB 3.1 [1022:1639]
08:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] ACP/ACP3X/ACP6x Audio Coprocessor [1022:15e2] (rev 01)
08:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family 17h/19h/1ah HD Audio Controller [1022:15e3]
08:00.7 Signal processing controller [1180]: Advanced Micro Devices, Inc. [AMD] Sensor Fusion Hub [1022:15e4]

Bert Karwatzki

