Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1E17FD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196023; cv=none; b=nJSNn81XPthp8pc0nxbwgcAzKeJUpCXCKtrZi33UWjC5aXKl38GLkZH1Mh+GSsk8eX/yOBD4G8Kd/t5dyjQWujaFQgg3KzY9T05eErYGKE8VTK1NXhnGxFaTqCqvwP8jjD5PJnjtPSt4q7ydQI0mXkA4r6BIs/bmC5Dmp3Xftqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196023; c=relaxed/simple;
	bh=rmZDF+RlSJHKZ5X5l4BkRPSwPdKF+zBwNj9aPY46WH8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Vhx7nH+v6N/IorbxXkTMMN/9I/n+E3Yw+ARyL4yENA+QI/EZ2DCCGyOFG3Sk2rZ8tyTkrwj9vGs/l5oa8mwD/HV435h26j4O2qR9TCU8LmDAID5acba8ONZjTxPUB2r8c7k6ElTdQMVzIaNmlNg5krVtNu0pFG5RJH3aONwzXEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CPjw2ksK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rGu9eUm6; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CPjw2ksK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rGu9eUm6"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 5D4231380180;
	Fri,  6 Jun 2025 03:46:59 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 06 Jun 2025 03:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749196019;
	 x=1749282419; bh=oV21dNIWKZDvuhbCJCLXWIsx7sHMrNMlFT3ve8/dK8M=; b=
	CPjw2ksK74p+JN+7qoA/eq1mdw0TnCGGrvpuZnFpGMhLxgPLu1WWQJL+y5ync9IB
	YbdPyc8bC/eKoKpp4L31WbNFCtT5EPvAdljwpMu2abM3i21EYfT2BPfKBUccdc1M
	KafETaVXQ3kLFr57gT9KmeprxJz05dK8EFi653fUA38eJxESIg060NDS9ZmTyfbI
	fVI1UNv8S+yrL/9BdMmEJCsk4414p4+1l4+cTBywbF5nvQLrfAIU6xTUL/ToFTOy
	28CqOqd0cXcOq8bAElX8laih2DwQXUhtLNFsys3PStqQca4SrVybcyY/RgzredRu
	ja7eysjoCGKWVQGdUST9TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749196019; x=
	1749282419; bh=oV21dNIWKZDvuhbCJCLXWIsx7sHMrNMlFT3ve8/dK8M=; b=r
	Gu9eUm6UZrJqdLBM5sJXbJmiM0FNsudR3qT2IV6jiv20keYaaGDRTjrtqOtX+Uov
	gBxQ38kkZKboT4j5UAYb+vhvy3dLiLFCnVNjyajLb13nmDfnmVkNe/+XZhjiC9n3
	VtyBwz/prPwncZGmnVFW+AUmkLML3gmDZpa+fJOOhcMX6XqVa1daNoN2moiKFCpT
	3K0LQX8ipjl2p4iuFEi2EPVo4mgwfOoMGZ1Y7+52Z0iOAyZXpIyJ2fP78LiVg7Fl
	ZapRC8A4E0Bd/eqx95rPJ9H+UPPbli5nL4ZU5ZaidSeQoUCyML/N0RZ1LG8oZN38
	kKQkgoWcz4EPvm4KQtF2w==
X-ME-Sender: <xms:85xCaCYuUCt7sKFFg5JmRUnh_xZXCxgwRDkl1IbW7fkRQQYVZ29l_A>
    <xme:85xCaFbml0FKesheY2N8Zch09Yu0Z3upBPYZvLpickDx0uWWo3lpur-ak9SC6n818
    R9aA1v2n36blPLtdv8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhohhgrnhhnvghsrdgsvghrghesih
    hnthgvlhdrtghomhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthht
    ohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:85xCaM-uRkkbPwK-_NfAlqL6iX0fKdAH-bDRevGeRYgVUjxUcT8DaQ>
    <xmx:85xCaErU3aH4iuyw9UG6-ZBwYM8OgA6BK4nowk6iTpQluNS6Q45Biw>
    <xmx:85xCaNqjqVT84R9i6mbYC8DZrbrYxvPVRqYAGUwoyE_oGoldJ9vpTg>
    <xmx:85xCaCQ8Tw8IQfONTUBuKuJZfmoX4b-Xvh7JKaIDTL0iBv6YbGK8-A>
    <xmx:85xCaMcJrL5PXr1hw99ti6FJO03UEZjqmjOpInhpqHE0qqxfBi2zrUwz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1F3DB700061; Fri,  6 Jun 2025 03:46:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tdbfdff65f97bd920
Date: Fri, 06 Jun 2025 09:46:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Johannes Berg" <johannes.berg@intel.com>
Message-Id: <78d0987d-4d8c-4c4e-b0ba-1f731e1f9b95@app.fastmail.com>
In-Reply-To: <202506060742.XR3HcxWA-lkp@intel.com>
References: <202506060742.XR3HcxWA-lkp@intel.com>
Subject: Re: include/asm-generic/io.h:542:14: error: call to '_inb' declared with
 attribute error: inb()) requires CONFIG_HAS_IOPORT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jun 6, 2025, at 01:02, kernel test robot wrote:

> commit: b8c9c3b822fe8e033b9802516f6466099d915488 um: stop using PCI 
> port I/O

>    In function 'inb_p',
>        inlined from 'sonypi_irq' at drivers/char/sonypi.c:831:7:
>>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT

It appears that there are some drivers that are only built when
targetting i386 but that now fail to build for UM. I'll send
these three fixups, which should be enough to fix a
'make ARCH=um SUBARCH=i386 allmodconfig' build.

      Arnd

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index f2a68a0a8c93..a20b353ffddf 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -238,6 +238,7 @@ config APPLICOM
 config SONYPI
 	tristate "Sony Vaio Programmable I/O Control Device support"
 	depends on X86_32 && PCI && INPUT
+	depends on HAS_IOPORT
 	depends on ACPI_EC || !ACPI
 	help
 	  This driver enables access to the Sony Programmable I/O Control
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index bec3bffca808..464ed9bf9114 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1531,6 +1531,7 @@ config I2C_XGENE_SLIMPRO
 config SCx200_ACB
 	tristate "Geode ACCESS.bus support"
 	depends on X86_32 && PCI
+	depends on HAS_IOPORT
 	help
 	  Enable the use of the ACCESS.bus controllers on the Geode SCx200 and
 	  SC1100 processors and the CS5535 and CS5536 Geode companion devices.
diff --git a/drivers/video/fbdev/nvidia/nv_local.h b/drivers/video/fbdev/nvidia/nv_local.h
index 68e508daa417..93aff35305a9 100644
--- a/drivers/video/fbdev/nvidia/nv_local.h
+++ b/drivers/video/fbdev/nvidia/nv_local.h
@@ -80,7 +80,7 @@
      (par)->dmaFree -= ((size) + 1);          \
 }
 
-#if defined(__i386__)
+#if defined(__i386__) && !defined(CONFIG_UML)
 #define _NV_FENCE() outb(0, 0x3D0);
 #else
 #define _NV_FENCE() mb();
diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index e00536b49552..329aa9016553 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -650,6 +650,7 @@ config PATA_CS5535
 config PATA_CS5536
 	tristate "CS5536 PATA support"
 	depends on PCI && (X86_32 || MIPS || COMPILE_TEST)
+	depends on HAS_IOPORT
 	help
 	  This option enables support for the AMD CS5536
 	  companion chip used with the Geode LX processor family.
diff --git a/drivers/ata/pata_cs5536.c b/drivers/ata/pata_cs5536.c
index b811efd2cc34..4a9fb4249caf 100644
--- a/drivers/ata/pata_cs5536.c
+++ b/drivers/ata/pata_cs5536.c
@@ -27,7 +27,7 @@
 #include <scsi/scsi_host.h>
 #include <linux/dmi.h>
 
-#ifdef CONFIG_X86_32
+#if defined(CONFIG_X86_32) && !defined(CONFIG_UML)
 #include <asm/msr.h>
 static int use_msr;
 module_param_named(msr, use_msr, int, 0644);
