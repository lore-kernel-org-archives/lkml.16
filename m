Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE3F22B8AD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744782493; cv=none; b=ZKk/EuxBiRaRr2zSA4UIyin6c5IG8rod2OBCnUxzw6Dq1zphKNscqA6o1sV4Zx0+mk5NMg/yqdHAXN8pcQzLv6qmu4NjTZgkZ3g/E5troebXanifKCJqFcbi2Z0JmzcleGr40tfxE15EI4e5b/9A088V5SVSFgS8992k8TAh8Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744782493; c=relaxed/simple;
	bh=qdCdlu7tKUGA39tkiG/iDETYPNa4obDh5AWDVouR1fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pba7XN21sYYZQgSNqMzADile1hbUacFc5V+9Hmgik46ODb+RTxbJ5Y6fSQ/wgH6QHy5oVEhzOx82HUPf2xBER6Z9Fx3AYMm36IA0Ru5EnDt9n7rbv27v1bkSZDJBTCN7S662DlCH8rq/ti8CajnGb2P1WFQeZbNof3yfK3JQmNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8Js1QaI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8Js1QaI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90054C4CEED;
	Wed, 16 Apr 2025 05:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744782492;
	bh=qdCdlu7tKUGA39tkiG/iDETYPNa4obDh5AWDVouR1fM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J8Js1QaI+Y2c7rNdePKqR8YHFRnZEz6F/tGHq4Es+GfyR/Cis/PaQD/8AK3fRD0XH
	 b/bjZBtD9rM5mB4Yn4H6WUJxi/zaByLYkPTsLwhQM1XwKt0jAe/jbDRGhH7YI9OXH6
	 QLfKnEIyUR8rKOgxZd3Dl0AAfesUF0tLjiw4/9geXdX3/y8i6WMVDxL/P6nR0ta/kQ
	 H3Lvtvkwx72Ae2o8PfhKBNmNKTVaAs3zFjZ+xWejLd+2D47qSBwXlKJyysNvhCOF7e
	 XixC496HXTliP3xnEk611EjQr00c/Uwktnup46zHtkD9fwy/mzQtfZFwLJMVweSxWG
	 Rv8MHYU4GXO5g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 2/2] f2fs: sysfs: export linear_lookup in features directory
Date: Wed, 16 Apr 2025 13:48:05 +0800
Message-ID: <20250416054805.1416834-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416054805.1416834-1-chao@kernel.org>
References: <20250416054805.1416834-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cat /sys/fs/f2fs/features/linear_lookup
supported

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 2 +-
 fs/f2fs/sysfs.c                         | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 0dbe6813b709..c805a48dd3dc 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -270,7 +270,7 @@ Description:	Shows all enabled kernel features.
 		inode_checksum, flexible_inline_xattr, quota_ino,
 		inode_crtime, lost_found, verity, sb_checksum,
 		casefold, readonly, compression, test_dummy_encryption_v2,
-		atomic_write, pin_file, encrypted_casefold.
+		atomic_write, pin_file, encrypted_casefold, linear_lookup.
 
 What:		/sys/fs/f2fs/<disk>/inject_rate
 Date:		May 2016
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index cf98c5cbb98a..75134d69a0bd 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1207,6 +1207,9 @@ F2FS_FEATURE_RO_ATTR(readonly);
 F2FS_FEATURE_RO_ATTR(compression);
 #endif
 F2FS_FEATURE_RO_ATTR(pin_file);
+#ifdef CONFIG_UNICODE
+F2FS_FEATURE_RO_ATTR(linear_lookup);
+#endif
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
@@ -1356,6 +1359,9 @@ static struct attribute *f2fs_feat_attrs[] = {
 	BASE_ATTR_LIST(compression),
 #endif
 	BASE_ATTR_LIST(pin_file),
+#ifdef CONFIG_UNICODE
+	BASE_ATTR_LIST(linear_lookup),
+#endif
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
-- 
2.49.0

