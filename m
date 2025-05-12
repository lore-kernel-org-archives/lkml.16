Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058F228D837
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050891; cv=none; b=iLJR9QYei7q3NT8TMVW94i1ruCiPS2I3xvzAeqwQhqCxRXXkNie37BD3hc1z2u7OpyRHD/S/dbpw+q8LsRT9Rik+Jgere0Du5ORcn+oyTHV7jUtldPSKVMEuVrap1TweUvhACBzD2qcW0MPMTKoAq/uM1uWQh3E33gcB9tvtf0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050891; c=relaxed/simple;
	bh=1FFzBQnFeOZIUJzz8/wDGrTvsea7fEZOK8Kl5euk03k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZX0XiEpeow9bgommNeTj8GNQVmBfdemiLNOtwToAFCBh+PIH1cMr9hie0P4qOtlSDdqb6KE2yWC0wun6MfUcChWZR0cu/c/jqtwmVB/nRUS3D7z3XpvFVd85RgE+5elgzQ2ZlpgjVvYR0cS3DHTprE8d3ROTa3glltP7HpMY5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2QSduM3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2QSduM3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808B6C4CEED;
	Mon, 12 May 2025 11:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747050890;
	bh=1FFzBQnFeOZIUJzz8/wDGrTvsea7fEZOK8Kl5euk03k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X2QSduM3JLHXmhCTO/td/ErbcOLhXOymr/zMqpkSEqJbRLux22A9O6+C2RC7EUhsU
	 5H8M91C0X2jxpYwpJXRbUzvVYtfsejxUkLPKTvlbWDB79Zr0OCmKKWNDDYmgRjTnSM
	 wLeog9nb84NgusxQT1fkC/nsDiLKjfp6UIXS+AUL/ABODB9PxvHFc6woxrZa5hGI+Y
	 ze505nECNvyQW2PvlgeqRWEnV5T5/kT+yfRdZnswSh7+MCOlF2JzBD+aMUjHIG/XI3
	 zYC/4MBoLdGJdujZEpKOfIPNn9riFiv8qV49dNhcCtIZxfVyGm/rUejB89R3TPEidf
	 w/fTvdDpZRGTw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 2/2] f2fs: add f2fs_bug_on() in f2fs_quota_read()
Date: Mon, 12 May 2025 19:54:42 +0800
Message-ID: <20250512115442.2640895-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
In-Reply-To: <20250512115442.2640895-1-chao@kernel.org>
References: <20250512115442.2640895-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mapping_read_folio_gfp() will return a folio, it should always be
uptodate, let's check folio uptodate status to detect any potenial
bug.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0ee783224953..ea207a9edc10 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2973,6 +2973,17 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 			goto repeat;
 		}
 
+		/*
+		 * should never happen, just leave f2fs_bug_on() here to catch
+		 * any potential bug.
+		 */
+		if (unlikely(!folio_test_uptodate(folio))) {
+			f2fs_folio_put(folio, true);
+			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
+			f2fs_bug_on(F2FS_SB(sb), 1);
+			return -EIO;
+		}
+
 		memcpy_from_folio(data, folio, offset, tocopy);
 		f2fs_folio_put(folio, true);
 
-- 
2.49.0

