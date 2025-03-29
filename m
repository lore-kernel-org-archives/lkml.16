Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461F11C5D77;
	Sat, 29 Mar 2025 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743248426; cv=none; b=FhGBiLE3a4JfkGHW70Dmp08JMZo5/FYRvmV0W4+4PWSvXznQsS3jfBmlSdNlL/EiW3udLKTA6EnfA/3oviW+uUUC1B4P5DINryjWxpElxKLs53CqpVf9+gyfLu/Ui5h6YxeU2Eogg0bKimt0D+wZiM6jVRLc+SmOii24QaEf0rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743248426; c=relaxed/simple;
	bh=P7al7clDRS8K/7GFc/corrgfq2NDWLfHg5TRl7eTdkk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lxDnLgSCfw+EKOyksssb7TMUIMNyCTs7QPFRGhcCCygMOJFptnDcT5daUPmuv4ipD20G52Y7P3WhE2boCOzHeJ/VkeI5FMizLdibH4Q1B4TB5ELHqv7Oere/zs2yO9epaPvuvHAecKa0Ndk8KYij4FvrpqO9KKM/6eGy+gDVFJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=UQq1cy8m; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="UQq1cy8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1743248420; x=1743853220; i=deller@gmx.de;
	bh=dztATHFqB+Zrc37/ZMpHqY/ixcWTTRZ34tWefSgFnYM=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=UQq1cy8mxvX/zvGvL4J2YAeifgGgplHrvuxKYNje9BEACK9RJN4yVGxBcyD7Wi79
	 T0wIqMAmr+20Jcjipl5bbGoW3S8kHSvpFiUh0X42n/CjRxb7sPqCYEGSm2pf9LzTW
	 AvcRzxSR0eMjpkdYxlIkkTH299menMePhXS0nE3VUnKUEhCANgPj/g0TMknvfrycm
	 6mauG0R8loVndWynYY15EhlVgH4dYkGUAVZwabw4kKAmGl7HP8DSXCX3sr1s2xaqy
	 IEqqh1zi2oWNCaYjOGMtXPeTTr+4LCq5iu5tnmiOo+LTDb3jBPKNMk0MJWgHBLP4h
	 vxWogg5IjEOom+N2Sw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([109.250.63.121]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8hVB-1u2bHp2BWr-00A4oT; Sat, 29
 Mar 2025 12:40:20 +0100
Date: Sat, 29 Mar 2025 12:40:19 +0100
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: [GIT PULL] parisc architecture fixes and updates for v6.15-rc1
Message-ID: <Z-fcI2QOldcZOi4f@p100>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:dSKHRKYVH0549sDBljevIrVRYux+JiGD3JMaCBrjGBzx3fI5p9m
 buWH5vaTo3yKl392DTLtkVVg6CHdxxfGUV4u8z1iV+ARE3oLKMKyKMN3klqpXJ+okb6/SGy
 tZ7IeNIur7WG4T+M0qoIlQLszQinBODosDDG6Z+ZL4pFKcSIQ8UCNbbEE4yP9wmQu3Q7AD/
 rkfaCLrSfY8zLHyzHLe1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YT2CGzQUA2s=;uEGM9xhjlQRcruVOKcDLZKZi65w
 R0v1+mqx9DNeKc0qMskWWIl4PvGK+SN91/EUyQPgq0EgadCRFDudbpkKNM3rLvU/q54L1+dtq
 xnNKwUuRLsAcMKjNMPlK+SDk6geBPtJtORR4QQZ0AJuLz7MyiWFw/KuRaO1Jbk5oBLpjrUKBc
 R1s6A6ZWXR7humKmTZ0NufZQR/9sOjbFntn4xGpY001aPsrjwAEGly/Tqzsjty5vAWKOorTkE
 roXY53NHyayKvR8drwEbSQZ5mr8rvfG5Fn79McPJGJbzaKQ9cQse6p86HGIOu16LfU+pkLZ9m
 yuu0RRUNlPo62cWJyIT2heoOBnyuXIPzng0a2FQ2PB+I9oJYppPk1PB7NpMo+nkIyPs7DeNBb
 5LI5F6O7EJWFQwXq9irg+2g6W9mee62O2wApUWkMfSdA7Z0j1xf8E43lNKx3ugYtGc5dDfT1W
 fRNtPtNG5cFctFSOgAP61PO/DtV4pljKeK1673RuM031YNIv/vjSC7VMVj5hlmLkF5hGzylCd
 by8thuRMMYbIflwEf+OAZQaNl1Axb9dQutz5RO9oilTM4CgaaMsAbRNTs/Xc1vjke7QKalmps
 h1fQnfp5sMZ0H2b6796H8kCQ7r2UBcP56DB+ygfCUImvfcUABSEx6iAsn4o5AHcaarTlic74d
 suwI9fWPVP9TbEYCH85YQdefF9L+kf3b//R1A60XSvlkGWCSQoMzZ4byuaP6VpZR4Zk45qqr/
 V2hjCovvO99TK0eXB1+KHOAmejOgN5lEOrqGS1ndK/6gCksadlAGQQMNc7HhuuaMrmC+Chpg8
 WtQ5Yn4YB73clGX4ULBqruZ9RrFzfwTzYu276sTcJB6OmR1+U5v4Ww1eZ134TrHVJogiPzAWO
 QdhnfAPJbPIPqGkDbjvWdUBPcjlkxHWcpV/57rEuJg/gIji1JoaZ7lpEwaoAyrdcvZEN986yE
 1RwVyN8XDdxymYfj/wbmEOUb8+F8JI0LoRrnnpYQY6Ipilxd90B8+1p5UPjN/XYaiNJ5rmoUB
 z0T80idB7qlcpji5cdr104JzJEaSc4lKrPZEw+gfmXeetVQXj1M1LxmhRHNc7SHIWYgVG2BNO
 P7HMYc8+brUHTq0Jao6zpAQHH8zXBU+9xSglF0piB8si5SBIkGDOdUPPF8e5TvbU2eTN/6DF7
 wzpx6xVvXvnRSlUAYFnbQfK6kU40tukCmlchQNv/8ELDyZ2X31ONdsHVJZy+tBOr9VEuLKlgk
 gKsqMG3qQVpjuE7DMXhY2H5DHRRtjmHYEQixQAeBJlXq/l6vSTySgEx9IQRvEoW/akMtvGwvE
 hHBbaoEsAsjiw1UaU6JUaYtKKaoOj07ZBpn0pMPaMJCc0umrn69IoA8duGETyXy7rGDipYgaI
 aJPmkswilzxoPDa4Ys3d6o3LI34ic52oXAUJbOskImMy1H7LfDrSDaY5hpfxvzHVfNdJup2et
 hFZDS6Q==

Hi Linus,

Please pull the updates for the parisc architecture for 6.15-rc1:

Drop parisc specific memcpy_fromio() function,
clean up coding style and fix compile warnings.

Thanks!
Helge

----------------------------------------------------------------

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.15-rc1

for you to fetch changes up to e822b8f01b40eb193cf7ebb059ac7c560a562d6f:

  parisc: led: Use scnprintf() to avoid string truncation warning (2025-03-09 22:27:54 +0100)

----------------------------------------------------------------
parisc architecture updates for kernel v6.15-rc1:

Drop parisc specific memcpy_fromio() function,
clean up coding style and fix compile warnings.

----------------------------------------------------------------
Helge Deller (2):
      Input: gscps2 - Describe missing function parameters
      parisc: led: Use scnprintf() to avoid string truncation warning

Julian Vetter (2):
      parisc: Fix formatting errors in io.c
      parisc: Remove memcpy_fromio

Thadeu Lima de Souza Cascardo (1):
      parisc: perf: use named initializers for struct miscdevice

Yu-Chun Lin (1):
      parisc: PDT: Fix missing prototype warning

 arch/parisc/include/asm/io.h      |   3 -
 arch/parisc/kernel/parisc_ksyms.c |   1 -
 arch/parisc/kernel/pdt.c          |   2 +
 arch/parisc/kernel/perf.c         |   6 +-
 arch/parisc/lib/io.c              | 119 ++++++++++----------------------------
 drivers/input/serio/gscps2.c      |   6 ++
 drivers/parisc/led.c              |   4 +-
 7 files changed, 41 insertions(+), 100 deletions(-)
