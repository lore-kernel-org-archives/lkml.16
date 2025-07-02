Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71830221734
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438974; cv=none; b=VwJ/6kZg8tgbB6tU7eRUkMOZt491tM6q6HGjEl6DyvuFKPqH1+io0gBZzJdfykGu42Ya+9j8K6O1PIn2ff2OvLxp1Kt154+/P9V2CpgkGifa26xgZRSz4pZl3UgRyCcXpo75atwQvNyYRPEtIVs3mf8TrC3ynwoI4IP0BdzGfho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438974; c=relaxed/simple;
	bh=BPubFNKGvdKys1olDiBUNYKykKsbgSZ1DEu9K8YU6X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CUwpGkim4rl1NCqn5juYjDxQ1qkMgVOBlbp+uCC6P/VcWMipjT8omipwev/330NNRcc2kZIe0ysuCGfmC22NEcQj3bDjw72L1jIuK/c+CqYivuxcOGcMhMZDVRzIx8sPCh6ymoZIMch5RpQhHqKKUNarV/nAUtlXF8MXuWdzgSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LX296OkA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LX296OkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D290AC4CEEE;
	Wed,  2 Jul 2025 06:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751438974;
	bh=BPubFNKGvdKys1olDiBUNYKykKsbgSZ1DEu9K8YU6X4=;
	h=From:To:Cc:Subject:Date:From;
	b=LX296OkA/i+AuOF/zQQeLMvUCdbVI1qupnMWDLTLzAbxdTSZjW2KKHOMDcnnBJyRC
	 UZjmPD/6jLEwcUx6e/9GxVg1PMoWtWKj9A3fkHo5/Q4lwRRmJYT4MX827sZl2FXq2W
	 zuLIEHr8ghqj17cKWaNAwJYpK4/vD7t3NVf51/uOFZVXofM3zm0stIdfcnWvHNcrKB
	 Vjg6A8B+H0ve5kEnI0L73LM2HntKDBpwhUDJQu+IYepG3sIb5AhzpDC9FyHQiSNdcN
	 gWVRiAca+9U6LtpmNWceR1fKIJzwPSYfM1rHnT1+8TJW7yGmbnO/A4bM8j9bGyDqqa
	 A+3f7qe6za2yg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: doc: fix wrong quota mount option description
Date: Wed,  2 Jul 2025 14:49:25 +0800
Message-ID: <20250702064925.1002176-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should use "{usr,grp,prj}jquota=" to disable journaled quota,
rather than using off{usr,grp,prj}jquota.

Fixes: 4b2414d04e99 ("f2fs: support journalled quota")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/filesystems/f2fs.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 440e4ae74e44..03b1efa6d3b2 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -238,9 +238,9 @@ usrjquota=<file>	 Appoint specified file and type during mount, so that quota
 grpjquota=<file>	 information can be properly updated during recovery flow,
 prjjquota=<file>	 <quota file>: must be in root directory;
 jqfmt=<quota type>	 <quota type>: [vfsold,vfsv0,vfsv1].
-offusrjquota		 Turn off user journalled quota.
-offgrpjquota		 Turn off group journalled quota.
-offprjjquota		 Turn off project journalled quota.
+usrjquota=		 Turn off user journalled quota.
+grpjquota=		 Turn off group journalled quota.
+prjjquota=		 Turn off project journalled quota.
 quota			 Enable plain user disk quota accounting.
 noquota			 Disable all plain disk quota option.
 alloc_mode=%s		 Adjust block allocation policy, which supports "reuse"
-- 
2.49.0

