Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872871547E4
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738362302; cv=none; b=cXRB3lN78ywrswCRQdqT+vkyE4Inljc5vuHUyacWxaGjEOqNp22ZUvvkbCKNBw4s0zbtTjGJ/IAPcCdeMTT4TssS+4gpZpe/Gbn+kxr3ZHDv3MVSt4kdzzZfWDF1ByDbFhdXmu891/R7LmmlPHceplJTVPtBIe2Uo49iJkQNlz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738362302; c=relaxed/simple;
	bh=onDCTihKWJH6F+H8IdhFe7TFdJkEjG+vwnD/wYojOBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jcMszrvgJT8lQ91RuOOVBpLlVwvAaRbI7zhlKi1pyHdQZhxXvuHP74585aX8hqzDSspJ94zSF8vuqVPP0kxc0FXsoWLnsZLfhCZ8feCRGbwjaCobeLDoQNcRsd2axnGtT9XF5WEcCQPEnSMH/zSKXvUwS2QaVOW1aDdoR/p1HuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxVh/1On; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxVh/1On"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9109C4CED1;
	Fri, 31 Jan 2025 22:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738362302;
	bh=onDCTihKWJH6F+H8IdhFe7TFdJkEjG+vwnD/wYojOBQ=;
	h=From:To:Cc:Subject:Date:From;
	b=VxVh/1OnEZtTWaN5CCIGEU4ar79eHlsqhbmSAdxi5H1j6wTDaHACBcaFzfVqHY9x6
	 dSurFgTcM5AbVcoUHpgRH4PGoKxwjmJpVmojwt7umDY4Kxl5tydMyxGCP3DHFZXeOS
	 qyYJVCXjyxQgojV59OTi38LHng2xAMRgpF3oZSgzgS6MxzC3DyzZA+di7z9AdPpzKn
	 g7fiPvCNTA6sJVtwlgMQUOd3oCr/xEKBHgGgvkgK+dwDVNXi5P4UV481nQ2NE+MsSu
	 UoRl29X9bJ+5D2gsuldtf/UCi6DukMeGcdivUClEEy/EgrrkRFFOIju1C1eSZHLO+w
	 ajjRlg8G/2TTw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH 1/2] f2fs: don't kobject_put in the error case
Date: Fri, 31 Jan 2025 22:24:56 +0000
Message-ID: <20250131222457.1634039-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a wrong kobject_put in the error path.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index d15c68b28952..001e97cd0a96 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1605,7 +1605,7 @@ int __init f2fs_init_sysfs(void)
 	ret = kobject_init_and_add(&f2fs_feat, &f2fs_feat_ktype,
 				   NULL, "features");
 	if (ret)
-		goto put_kobject;
+		goto unregister_out;
 
 	f2fs_proc_root = proc_mkdir("fs/f2fs", NULL);
 	if (!f2fs_proc_root) {
@@ -1616,6 +1616,7 @@ int __init f2fs_init_sysfs(void)
 	return 0;
 put_kobject:
 	kobject_put(&f2fs_feat);
+unregister_out:
 	kset_unregister(&f2fs_kset);
 	return ret;
 }
-- 
2.48.1.362.g079036d154-goog

