Received: from lichtman.org (lichtman.org [149.28.33.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703FE1B21B8;
	Thu, 30 Jan 2025 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.33.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227587; cv=none; b=cuFS4waqSk8vZ+nB1vAY8zeg23ICU9G8sSbpdKnf+ad99YwYWvG31fPx0HRmck/H5TWXfTD5pSYCALWgt61MLmwp19/bCxqt0+qyfrafG/W3z48/TIsYH4yFqcrQkYooS9+gwCv9Fxccece2Hq4oD5jS/0pCTnEH20RjlrTvzSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227587; c=relaxed/simple;
	bh=fe89As24UTHXOJ8+TpUHOCJwA7sS3Uoo/FIqxuY3Xow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KENYEI82vIyjr5adHj+onephmmGUowcy48DoVR/tzxuhwyLg51Rp4bBeWr74q5jL6QFTvY40vP0/Gu8xdmPBhOMuUcHxZhYlKKJzB7XsYH1PfZVJza75I/ELp7L0SzbkCfeqtvsRqsMouLpQe4Uca51wF7GhGBQQuIPgF5Z9rzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org; spf=pass smtp.mailfrom=lichtman.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=O69xAuRS; arc=none smtp.client-ip=149.28.33.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="O69xAuRS"
Received: from nirslaptop (unknown [85.130.135.138])
	by lichtman.org (Postfix) with ESMTPSA id B6AEB1771BE;
	Thu, 30 Jan 2025 08:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1738227577; bh=fe89As24UTHXOJ8+TpUHOCJwA7sS3Uoo/FIqxuY3Xow=;
	h=From:To:Cc:Subject:Date:From;
	b=O69xAuRSZpQv81p6I9iBF1a5CP9eH198sDbadWyrZUaEcFsmRerzFKcrsCyjoBr+v
	 Q0MeMy6nS4nuVH4o8O4hrQuZsqxeds/hLz9KChsGcBEQZuQQE/CPRPMpO37Ur3y521
	 YDjDB3hNJCzrf82gs93w41kobfmWHxBgtR8FUDuT/Rut3D/mAhQzeCf7nlAFoYkoW9
	 JfZMkz87ZdfPakTv5E4wgjLMbLsG5W4CNzltT/AvKkuHMWlyv6F+MQqVpnf5EAbBim
	 fKKuKjT7PhjJZ/aHbEdJOBePs/R2PZunEyGdd5WzvNY3hIyqik9uDmePxGzkuMCnXa
	 dqnQqZLZAQAXg==
From: "Nir Lichtman" <nir@lichtman.org>
To: <corbet@lwn.net>,
	<paulmck@kernel.org>,
	<akpm@linux-foundation.org>,
	<rostedt@goodmis.org>,
	<Neeraj.Upadhyay@amd.com>,
	<mcanal@igalia.com>,
	<thuth@redhat.com>,
	<ardb@kernel.org>,
	<gregkh@linuxfoundation.org>,
	<bp@alien8.de>,
	<linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: <rob@landley.net>
Subject: [PATCH] docs: clarify rdinit precedence and correct ramdisk to initramfs
Date: Thu, 30 Jan 2025 10:59:33 +0200
Message-ID: <000201db72f5$49b11e60$dd135b20$@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adty8/StsQsnRXVtRbWdiiQII3bvxw==
Content-Language: en-us

Problem: Current documentation regarding the init and rdinit params is
confusing,
The description of rdinit claims that it is related to ramdisks, even though
in practice
It only controls the init executable of the initramfs
(the deprecated ramdisk mechanism is initialized only after attempting to
load rdinit
or its default "/init")
Rob Landley's document from 2005 "Ramfs, rootfs and initramfs"
clarifies the distinction between initramfs and ramdisk.
Another confusing point is that the init param is ignored, in case rdinit or
"/init"
exist and are executable in the initramfs; the source code gives priority to
rdinit.

Solution: Add more clarification to the kernel params documentation, and fix
From ramdisk to initramfs in the rdinit doc.

Signed-off-by: Nir Lichtman <nir@lichtman.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt
b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec8..246cb73f71a8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2182,6 +2182,8 @@
 			Format: <full_path>
 			Run specified binary instead of /sbin/init as init
 			process.
+			Note that rdinit= or /init if rdinit= is not set
will take
+			precedence in case they are found in the initramfs.
 
 	initcall_debug	[KNL] Trace initcalls as they are executed.  Useful
 			for working out where the kernel is dying during
@@ -5933,8 +5935,8 @@
 
 	rdinit=		[KNL]
 			Format: <full_path>
-			Run specified binary instead of /init from the
ramdisk,
-			used for early userspace startup. See initrd.
+			Run specified binary instead of /init from the
initramfs,
+			used for early userspace startup.
 
 	rdrand=		[X86,EARLY]
 			force - Override the decision by the kernel to hide
the
-- 
2.39.5


