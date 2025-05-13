Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF11548C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747106359; cv=none; b=J3O209fjKWKrCUtCL0PFOBBPQ+9JmPsbRveiMetlU8fA8qkxLDBi2BZlj0NfpLVzdng0Eybh8gNWCLlueY8O3ZXzs6UhU3O2kMdvT0UBB45GdpdhaYmDytqQD3QqETCllRctZhHF6R5+l1AsrS30nLaRH35/u4ixyTpgORfl9WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747106359; c=relaxed/simple;
	bh=tXvRfuxcvoFqNhJhmfkkk0vzUQskoB6+LaM/chYV20k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V6Z9DZ9VTCUEWD90g3NatD3a77txLCZGN7TSJ8hA2ZFeZcZwYTClpOVSizrapa/VHsn63UAeCHQE5HvdsHsWR8yXVPhyrwvHXFb1V/gWJpHPpPhZyZxOLWSf35Vm1e5fnznvlm1s4/Y8G4Q5wtImGloTnrstxH7Ki9cpk2sQ3H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjwU735l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjwU735l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2C8C4CEE7;
	Tue, 13 May 2025 03:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747106356;
	bh=tXvRfuxcvoFqNhJhmfkkk0vzUQskoB6+LaM/chYV20k=;
	h=From:To:Cc:Subject:Date:From;
	b=BjwU735l6oL+s2ymAO0Q3Rs+ZTHgfmVUMIcsI9ORcaX+MuPYHuaNiUt+m7qIimq6N
	 l7CWUFQdo3kC8D88DnRy5cUZd9q6t/9PbmU+f1VgzcfJOoTeFDLTx73f0Ln2eSCqkN
	 KTBEuCQ49b6k2X1IKxNcaMdOVC73x75+jbsjmJEAC5szqgFjLr7d9Epv7NlRkcXbNl
	 F4Z0+u8aY2NRWPGtRJlrgI4xU1bL59ixxhopTHHI8PK1M3TcG2rv+rWmddQhd8WYdC
	 S+4c5722wTZHMtHasURtByNd/TBi1VZSbnvHj+UEhZpxnGaJLz9hN7FXvoWKsPw54n
	 jWBlmFQADW2Kg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v2 2/2] f2fs: add f2fs_bug_on() in f2fs_quota_read()
Date: Tue, 13 May 2025 11:19:07 +0800
Message-ID: <20250513031907.2876275-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
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
v2:
- just add f2fs_bug_on(), get rid of error handling.
 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0ee783224953..8c77a625427c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2973,6 +2973,12 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 			goto repeat;
 		}
 
+		/*
+		 * should never happen, just leave f2fs_bug_on() here to catch
+		 * any potential bug.
+		 */
+		f2fs_bug_on(sbi, !folio_test_uptodate(folio));
+
 		memcpy_from_folio(data, folio, offset, tocopy);
 		f2fs_folio_put(folio, true);
 
-- 
2.49.0

