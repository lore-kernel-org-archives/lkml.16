Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96AEB8831
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738277923; cv=none; b=qyvfa2JbtQrjMZbfOfmFlRiHpgijoj2X07Dq0Zkzu5kAi7oTFNqPCw/o3eFF71ZC2t8BJAFvzVQbOfo+OmZF2VbJoiZywAVgHbmslBl30aas9h7ZJGNIX3ktxUlQ9r+rgcLhqYX/8xGGJPFAfgnzolQDMoN6Dsj7+laJ2DBB+X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738277923; c=relaxed/simple;
	bh=Lno2lN5Lt7jgtykrzuFDJBTQ257aoerI1EUF+64+Jgc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cVBhyMRDmuMmCmUE47J+SFdFGKQ3W5DffQxSKjgp/IJBdz/KMwYuI29I67/5uJEKV+92YKnFzxLls00rxswoc+dOJg1/Yda+lUlq+NPDGQrUxP/lJOKfMk3R+Y+fZTAoE1J3GNiR/Jr3ekGqxqret1QrzcM1SUN0lHpRIdOBOco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=n/7u8rXa; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="n/7u8rXa"
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.120])
	by linux.microsoft.com (Postfix) with ESMTPSA id D4D082109CFE;
	Thu, 30 Jan 2025 14:58:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D4D082109CFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738277921;
	bh=3zyc+5vnD6HAZrw0BgzncJmVsUlMeKixfDLju3gIc50=;
	h=From:To:Cc:Subject:Date:From;
	b=n/7u8rXau5jtAiLY6KGZZcnUkNNwzKiFHu9ND4Ot3ibnFatT3+h52j/RAnkcc6Bar
	 0H6AeSzi59Y6ibgv8vu8UvMD4ty9NeaEhbOK3JGyTXJ9FRWVU6fGVQro6TTUv5kmpN
	 kfy5yo3wki1h/QyEbjCWi+YbDRwBGUjnQ+P14YTQ=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: linux-kernel@vger.kernel.org
Cc: linux@rasmusvillemoes.dk,
	mcgrof@kernel.org,
	code@tyhicks.com,
	okaya@linux.microsoft.com,
	vijayb@linux.microsoft.com
Subject: [RFC] Revert "kernel/params.c: defer most of param_sysfs_init() to late_initcall time"
Date: Thu, 30 Jan 2025 14:58:03 -0800
Message-Id: <20250130225803.321004-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 96a1a2412acba8c057c041833641d9b7dbf52170,
as it breaks the creation of /sys/module/<built-in-module>/drivers.

The reverted commit changed the initcall order for
param_sysfs_builtin() from subsys_initcall() to late_initcall(),
which impacts the module_kset list and its population.

Drivers which are initialized from subsys_initcall() or any other
higher precedence initcall couldn't find the related kobject entry
in the module_kset list because module_kset is not fully populated
at this point due to the reverted change. As a consequence,
module_add_driver() returns early without calling make_driver_name().
Therefore, /sys/module/<built-in-module>/drivers is never created.

This breaks user-space applications for eg: DPDK, which expect
/sys/module/vfio_pci/drivers/pci:vfio-pci/new_id to be present.

This revert restores the initcall order for param_sysfs_builtin()
and fixes the above mentioned issue.

Fixes: 96a1a2412acb ("kernel/params.c: defer most of param_sysfs_init() to late_initcall time")
Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 kernel/params.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/kernel/params.c b/kernel/params.c
index 0074d29c9b80..890b44d36b1e 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -958,11 +958,7 @@ const struct kobj_type module_ktype = {
 };
 
 /*
- * param_sysfs_init - create "module" kset
- *
- * This must be done before the initramfs is unpacked and
- * request_module() thus becomes possible, because otherwise the
- * module load would fail in mod_sysfs_init.
+ * param_sysfs_init - wrapper for built-in params support
  */
 static int __init param_sysfs_init(void)
 {
@@ -973,24 +969,11 @@ static int __init param_sysfs_init(void)
 		return -ENOMEM;
 	}
 
-	return 0;
-}
-subsys_initcall(param_sysfs_init);
-
-/*
- * param_sysfs_builtin_init - add sysfs version and parameter
- * attributes for built-in modules
- */
-static int __init param_sysfs_builtin_init(void)
-{
-	if (!module_kset)
-		return -ENOMEM;
-
 	version_sysfs_builtin();
 	param_sysfs_builtin();
 
 	return 0;
 }
-late_initcall(param_sysfs_builtin_init);
+subsys_initcall(param_sysfs_init);
 
 #endif /* CONFIG_SYSFS */
-- 
2.34.1

