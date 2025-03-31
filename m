Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98B11C2BD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743389670; cv=none; b=KVGYcg7xGHfVU9O5CpkiCSsHpQ8/C34MOVZwsYlXsavDuh5TOjehytjI5mPQfEm0JaOr5Era6LcUx/msICg+ko2Jr8OEHuSl/vaoIxp2VzbZLV5JIKSK9l3mBHrj/Cv0U3Ayu7Riv7iFGHwJdF2fKaHWMrmLKklSaO6FxL0+j34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743389670; c=relaxed/simple;
	bh=7Z2EIHF8x4PJH3op9sBJfYoA1Ntx+xrA64V25jPhWzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RQtig+q555WAH8MZDl+02HR3B2dNm7p31bkKYfXhAIUhtlM/tzLwVMWL6oMd82LcHKRw9BER1I4BuBDmgMvP/b3bkAxJVrLra2r7XyjX8sovfVhpm9ToZtxwkDs1BasMSFXlqhhuXzUVKW504Kwtfd1Lwtvlo1X6PxXTHgKL8oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeVND4Di; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FeVND4Di"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25DDC4CEDD;
	Mon, 31 Mar 2025 02:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743389670;
	bh=7Z2EIHF8x4PJH3op9sBJfYoA1Ntx+xrA64V25jPhWzo=;
	h=From:To:Cc:Subject:Date:From;
	b=FeVND4DiKJWTvEhvuWBhi2UbberU3753Yrpjn7hpD2Pi9+bWMuR3GOvUhheHpc/Yp
	 Yu1i+oN7TEu/5tymgp8f0Lc+xu+5gebCmtmCT5GMc7R3m8OMNUYCWKsfNztZjhwb2k
	 v3ZfS3nBEZPxbpXLQSzm251MfG4BXp2MVI1UYw7UEsV52OByb0PJD8lF9a72u1r8mS
	 TtEipzpPSq2kfYXl55vkowu32pfDIHQ1eBJM39yEwsImTtmZp0hUf496F8eSs/jWNh
	 qlJYVO3Z5AyK4MEpfh6LhV50+SgymcQ7abcwISMPAbuDfhLY+wwn/FHpHLqnvlaCNg
	 Of1+HhezJ1mxQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	Daniel Lee <chullee@google.com>,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH] f2fs: support to disable linear lookup fallback
Date: Mon, 31 Mar 2025 10:54:16 +0800
Message-ID: <20250331025416.478380-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 91b587ba79e1 ("f2fs: Introduce linear search for
dentries"), f2fs forced to use linear lookup whenever a hash-based
lookup fails on casefolded directory, it may affect performance
for scenarios: a) create a new file w/ filename it doesn't exist
in directory, b) lookup a file which may be removed.

This patch supports to disable linear lookup fallback, so, once there
is a solution for commit 5c26d2f1d3f5 ("unicode: Don't special case
ignorable code points") to fix red heart unicode issue, then we can
set an encodeing flag to disable the fallback for performance recovery.

The way is kept in line w/ ext4, refer to commit 9e28059d5664 ("ext4:
introduce linear search for dentries").

Cc: Daniel Lee <chullee@google.com>
Cc: Gabriel Krisman Bertazi <krisman@suse.de>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/dir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 5a63ff0df03b..e12445afb95a 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -366,7 +366,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 
 out:
 #if IS_ENABLED(CONFIG_UNICODE)
-	if (IS_CASEFOLDED(dir) && !de && use_hash) {
+	if (IS_CASEFOLDED(dir) && !de && use_hash &&
+		!sb_no_casefold_compat_fallback(dir->i_sb)) {
 		use_hash = false;
 		goto start_find_entry;
 	}
-- 
2.49.0

