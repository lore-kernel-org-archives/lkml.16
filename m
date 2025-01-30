Received: from lichtman.org (lichtman.org [149.28.33.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3605F179BC;
	Thu, 30 Jan 2025 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.33.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738232280; cv=none; b=pFvjCTmfvwhV6DTwZkaZNdK+Rp0XiEacKdodXStmXokISlhRa66JbKnkflX4ig0Xi1xdVTSqjsMUQm/knzJv43a+Gj7Fear/CYhgpa8xyCkhjLydMkoBdrJ4V0knH+p3UbxNN9xi7MtARXqH9SpU7J2xFGYK75XXYbBUzPIgKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738232280; c=relaxed/simple;
	bh=zpLu6ngvomeQ4NtB3yWF6S/v33nlpNaN7nn12lKJ1EU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFWQbUWCXYNtm9WfjMLdO9Wqgz3k01R6AT/XvsMbddASJf5hbW+G4iXJmpIY/a5RGMaE0B9Rf5DcMqpF4LxC7tGjvza4DJoFoLEmt3vRAi+29jujbT9GyDX0FCwsinbVST/E9lM4eZmCsX06eMi4N3mG1wESRMGYbGSZcpDBze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org; spf=pass smtp.mailfrom=lichtman.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=va5N3lHP; arc=none smtp.client-ip=149.28.33.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="va5N3lHP"
Received: by lichtman.org (Postfix, from userid 1000)
	id 32E0C1771FA; Thu, 30 Jan 2025 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1738232278; bh=zpLu6ngvomeQ4NtB3yWF6S/v33nlpNaN7nn12lKJ1EU=;
	h=Date:From:To:Cc:Subject:From;
	b=va5N3lHPB7Oyk2pqSu7IFxS5uab3cz6Z1L8gqjIfZqk3Sub5UhmfQwEvZfkMzex+/
	 neKg5aC11sLgOuIRwzHNPENpcqIqfZFuKxP21uUR0ye7eQTYq8IBTgP7TSe29EdZCn
	 Qjwrlt5LUMsBG4SJSy0ZiFIuLtwAUoG7O8DJ/TcXm31n05cRYnFnCjrFywfWHGsowd
	 HppILw2bHInLWzLHzCzsdDlzocyWj3ouKxYaaRg7+IBZZSXkA0IM6NTxw+ZaKNnRGD
	 2+hXOJ/AUrT182XriJ+typnyO5Uy3d9HW/OcxVSSB6q/MVgRcu4psdYqgdCfMoOKxT
	 AXeKceNtHrZyg==
Date: Thu, 30 Jan 2025 10:17:58 +0000
From: Nir Lichtman <nir@lichtman.org>
To: gregkh@linuxfoundation.org, corbet@lwn.net, paulmck@kernel.org,
	akpm@linux-foundation.org, rostedt@goodmis.org,
	Neeraj.Upadhyay@amd.com, mcanal@igalia.com, thuth@redhat.com,
	ardb@kernel.org, bp@alien8.de, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: rob@landley.net
Subject: [PATCH v2] docs: clarify rdinit precedence and correct ramdisk to
 initramfs
Message-ID: <20250130101758.GA1162582@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Problem: Documentation regarding init and rdinit params is confusing,
The description of rdinit claims it is related to ramdisks, even though
in practice it only controls the init executable of the initramfs
(the deprecated ramdisk mechanism is initialized only after attempting to
load rdinit or its default "/init")
Rob Landley's document from 2005 "Ramfs, rootfs and initramfs"
clarifies the distinction between initramfs and ramdisk.
Another confusing point is that the init param is ignored
in case rdinit or "/init" exist and are executable in the initramfs;
the source code gives priority to rdinit.

Solution:
- Add more clarification to the init= kernel param documentation
- Fix from ramdisk to initramfs in the rdinit= doc.

Signed-off-by: Nir Lichtman <nir@lichtman.org>
---

v2: Fixed faulty line wrapping in patch

 Documentation/admin-guide/kernel-parameters.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec8..246cb73f71a8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2182,6 +2182,8 @@
 			Format: <full_path>
 			Run specified binary instead of /sbin/init as init
 			process.
+			Note that rdinit= or /init if rdinit= is not set will take
+			precedence in case they are found in the initramfs.
 
 	initcall_debug	[KNL] Trace initcalls as they are executed.  Useful
 			for working out where the kernel is dying during
@@ -5933,8 +5935,8 @@
 
 	rdinit=		[KNL]
 			Format: <full_path>
-			Run specified binary instead of /init from the ramdisk,
-			used for early userspace startup. See initrd.
+			Run specified binary instead of /init from the initramfs,
+			used for early userspace startup.
 
 	rdrand=		[X86,EARLY]
 			force - Override the decision by the kernel to hide the
-- 
2.39.5

