Received: from e240-10.smtp-out.eu-north-1.amazonses.com (e240-10.smtp-out.eu-north-1.amazonses.com [23.251.240.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88513182
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 00:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747354462; cv=none; b=gFz138QpiYanLHMYYQXxysAAknMfi1D35D69bG9RoLBF8HW+HWJIn5vkSA14qsAkoSXl4xMiXgwGsiIMYMUUC5XcoB44BaW5k8TFNNoVdRJZ/MY2kMGIoFRtNSm4J9oeH4mK710/eFv0LuKnVWtRgTbpztp19LNS3Ue/UMbqark=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747354462; c=relaxed/simple;
	bh=40YuEF0BXVSPmUd11buss1IDSQh8b3ZUf+t6aV6WdLQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=EZGob32oZspAZhajW35Ao7tzRXlz7EdzDa0BqWFWNB1G9hqcK+uS4UB/dOTwE834dVYNTmWcoyOMUXFaDzP59LOLQci5nF2DtbSkhtMJdfgT7cHlVkac6ZTpWFw2mfaDg10Tj8gUQsXwkHOHLt3fOPax2yEELHEwbdEgh9Duevw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=AkirRqa7; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=1Saxtj1J; arc=none smtp.client-ip=23.251.240.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="AkirRqa7";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="1Saxtj1J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1747354456;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=40YuEF0BXVSPmUd11buss1IDSQh8b3ZUf+t6aV6WdLQ=;
	b=AkirRqa7ccMcRAJx9C0+UL+9e3OiaIZtCrIbo47wbCqtaVP4MbLZ0X6BpjnHWouB
	i+E1OzBZ/FdTDT5MWWnExhJ63i/b3PfFYPLRE6zmfiu4earK12PEVqPgdWPVNm66FGI
	PRz7B1XRNSGVDFY41EmppEBPDLe93Gsq8BBHQeJaEgl18DUW4lbkwa1WAmTcpBCUtub
	fdHMZaeAuwdQK6Se/jyij0NEtP0Hbf5T00fXc6cFWUej/8z/exr3mk98qDK+797BZac
	FKiRd2gTfWdeGR1eXJ36E36w642VOXZzTW9kWZd634ZfYb7gxndRBlH2t/unWl17CE4
	JnKaKbouEQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1747354456;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type:Feedback-ID;
	bh=40YuEF0BXVSPmUd11buss1IDSQh8b3ZUf+t6aV6WdLQ=;
	b=1Saxtj1J/jo+GY/qYgL64/XJmZoF82wJcyGwsnpVjVy3XTUK3/7fh/3rSRnAHLuO
	cynAnuHaOzont2MW++QsRrkEALDomJYV8L4vTAnEvmlNM6hi6I560Yh7EHzm/emgjEe
	5t+b6mh+JRwCzUWkpuXTwDEptgY/fEkpDMbhj6OA=
X-Gm-Message-State: AOJu0YyIYEbO6bp0u37v064P8Tbhyh4wRDesbSWkb26aVncBYohbCU4W
	f/bArLVS0DZueYGWFVNNsSuxyVlA7tlNwBV/CfPJfCrG3g8wejfPY7SsNsmmlXAQo4Dzj5KlosK
	uRudxYtpL6pUUYMKLWca4cnc77/XIyUE=
X-Google-Smtp-Source: AGHT+IFF/ob0ULM/EFw+7iRbeynl416QjfHtIZ7al6OQcTPIz1M2C/WX6VLM0tOQoGzeZKMQ74F+oHde7UU/YtEiVb8=
X-Received: by 2002:a17:902:ef4e:b0:225:ac99:ae08 with SMTP id
 d9443c01a7336-231de2e6bbfmr6812305ad.5.1747354454200; Thu, 15 May 2025
 17:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ozgur Kara <ozgur@goosey.org>
Date: Fri, 16 May 2025 00:14:16 +0000
X-Gmail-Original-Message-ID: <CADvZ6EoYpsBBcyxPvFu8OY-0kZEthGw3DPVfMaeNSFM3Gn_f5Q@mail.gmail.com>
X-Gm-Features: AX0GCFuaN45udZn3fyuvYm8Wz2FD-L2rxcVY9ixGvetLNxOd2AcGm8OdcWZs1Pc
Message-ID: <01100196d67111b3-13591f7a-0c75-43c1-a45e-5814b193d259-000000@eu-north-1.amazonses.com>
Subject: CREDITS: fix and update for some formats
To: linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.16-23.251.240.10

From: Ozgur Karatas <ozgur@goosey.org>

Hello,

I have corrected some email addresses and website addresses also a
misspelling for Mr. Ian Murdock, which would be nice to have.

Regards

Reported-by: Ozgur Karatas <ozgur@goosey.org>

---
 CREDITS | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/CREDITS b/CREDITS
index f74d230992d6..57118d6e7fa2 100644
--- a/CREDITS
+++ b/CREDITS
@@ -153,7 +153,7 @@ S: Cambridge, Massachusetts 02139
 S: USA

 N: Michel Aubry
-E: giovanni <giovanni@sudfr.com>
+E: giovanni@sudfr.com
 D: Aladdin 1533/1543(C) chipset IDE
 D: VIA MVP-3/TX Pro III chipset IDE

@@ -1025,7 +1025,7 @@ D: Ralink rt2x00 WLAN driver
 S: Haarlem, The Netherlands

 N: John G Dorsey
-E: john+@cs.cmu.edu
+E: jd5q@andrew.cmu.edu
 D: ARM Linux ports to Assabet/Neponset, Spot
 S: Department of Electrical and Computer Engineering
 S: Carnegie Mellon University
@@ -2128,8 +2128,8 @@ E: knaack.h@gmx.de
 D: IIO subsystem and drivers

 N: Thorsten Knabe
-E: Thorsten Knabe <tek@rbg.informatik.tu-darmstadt.de>
-E: Thorsten Knabe <tek01@hrzpub.tu-darmstadt.de>
+E: tek@rbg.informatik.tu-darmstadt.de
+E: tek01@hrzpub.tu-darmstadt.de
 W: http://www.student.informatik.tu-darmstadt.de/~tek
 W: http://www.tu-darmstadt.de/~tek01
 P: 1024/3BC8D885 8C 29 C5 0A C0 D1 D6 F4  20 D4 2D AB 29 F6 D0 60
@@ -2146,9 +2146,9 @@ S: L-1148 Luxembourg-City
 S: Luxembourg

 N: Gerd Knorr
-W: http://bytesex.org
 E: kraxel@bytesex.org
 E: kraxel@suse.de
+W: http://bytesex.org
 D: video4linux, bttv, vesafb, some scsi, misc fixes

 N: Hans J. Koch
@@ -2448,7 +2448,8 @@ S: 75141 Paris Cedex 03
 S: France

 N: Siegfried "Frieder" Loeffler (dg1sek)
-E: floeff@tunix.mathematik.uni-stuttgart.de, fl@LF.net
+E: floeff@tunix.mathematik.uni-stuttgart.de
+E: fl@LF.net
 W: http://www.mathematik.uni-stuttgart.de/~floeff
 D: Busmaster driver for HP 10/100 Mbit Network Adapters
 S: University of Stuttgart, Germany and
@@ -2908,6 +2909,7 @@ D: SuperH maintainer
 N: Ian A. Murdock
 E: imurdock@gnu.ai.mit.edu
 D: Creator of Debian distribution
+D: He passed away in 2015, and will be greatly missed.
 S: 30 White Tail Lane
 S: Lafayette, Indiana 47905
 S: USA
@@ -3602,7 +3604,7 @@ D: added PCI support to the serial driver
 S: Buckenhof, Germany

 N: Michael Schmitz
-E:
+E: schmitzmic@gmail.com
 D: Macintosh IDE Driver

 N: Peter De Schrijver
@@ -3711,7 +3713,7 @@ S: USA

 N: Jaspreet Singh
 E: jaspreet@sangoma.com
-W: www.sangoma.com
+W: http://www.sangoma.com
 D: WANPIPE drivers & API Support for Sangoma S508/FT1 cards
 S: Sangoma Technologies Inc.,
 S: 1001 Denison Street
@@ -3720,7 +3722,7 @@ S: Markham, Ontario L3R 2Z6
 S: Canada

 N: Haavard Skinnemoen
-M: Haavard Skinnemoen <hskinnemoen@gmail.com>
+M: hskinnemoen@gmail.com
 D: AVR32 architecture port to Linux and maintainer.

 N: Rick Sladkey
@@ -3980,7 +3982,7 @@ S: Cambridge, Massachusetts 02139
 S: USA

 N: Luben Tuikov
-E: Luben Tuikov <ltuikov89@gmail.com>
+E: ltuikov89@gmail.com
 D: Maintainer of the DRM GPU Scheduler

 N: Simmule Turner
@@ -4273,7 +4275,7 @@ W: ftp://ftp.uk.linux.org/pub/linux/people/willy/
 D: Linux/PARISC hacker.  Filesystem hacker.  Random other hacking.  Custom
 D: PPC port hacking.

-N: G\"unter Windau
+N: Gunter Windau
 E: gunter@mbfys.kun.nl
 D: Some bug fixes in the polling printer driver (lp.c)
 S: University of Nijmegen
@@ -4455,7 +4457,8 @@ E: tsahee@annapurnalabs.com
 D: Annapurna Labs Alpine Architecture

 N: Richard Zidlicky
-E: rz@linux-m68k.org, rdzidlic@geocities.com
+E: rz@linux-m68k.org
+E: rdzidlic@geocities.com
 W: http://www.geocities.com/rdzidlic
 D: Q40 port - see arch/m68k/q40/README
 D: various m68k hacks
--
2.39.5
