Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFDF264A93;
	Thu,  3 Apr 2025 19:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707101; cv=none; b=p2+I7IxbpP8eMLGJcccpKSwH47BKUuVDWMut2NZieeTXBYradZaGnYklV5/Hpo5tvMHrdoyjAAbqcGFEQUatglHUfXoKsvXuDhRICYYIJPQdm3Btf+6WTwC9Yn5elmwCVgYWc6MLE6FOLRZigUqxjQcROYEa8Vi6RVnOpAYeoPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707101; c=relaxed/simple;
	bh=DKtMNqkGSl3Jk+kOCm2sYF+Agp8jjR0lL5uamaFFRtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XWi5X7k8MlWF1z5H/WgAGtNkvOvsjlXUKsIkgsZo1HCwrtbjsP2K9G4cbcXbJta9XrQ2oh1xVT/3gB1nEemKpO0pZUWiKJ3HPDchyhZH3kS9SBG4WHiDeXdjb4TEn0gipw5qa2qJ8al2ItFAN7j1L5oPv3GmtBFNyr/b2XWyAKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tiLL+yPS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tiLL+yPS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D9EC4CEE3;
	Thu,  3 Apr 2025 19:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707101;
	bh=DKtMNqkGSl3Jk+kOCm2sYF+Agp8jjR0lL5uamaFFRtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tiLL+yPS/LJfBuhh/BimlqYqd5DmNsxUbAGfgM2P9tFyPrPzlP69b9E2OXlumxTOW
	 Gd8B2mAJmnzwo/qQihomaeFmuV5E6oiSTz6vHoHm81ySf4sX87gcHspW6pgD/ZAk8o
	 CmeeHRSGA1+DlT5vr8lmM6vvCcZG4XIfx7M1aOfAq9YH/8aTmDLQPML5UudV9V3O96
	 l86lWFdWms84zypz1A7fJzWcOWraQ9C0uTo9PaII/sx9MYZt3OuXPhYtR80waOOTv/
	 S1wIMzzhPA7GF/n4qsdxszfd0izRhM31qlHycDjulAcF9HbOPKNnxbqRO5+Y+h7PV1
	 ryXwl8xAwKjNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Edward Adam Davis <eadavis@qq.com>,
	syzbot+7c808908291a569281a9@syzkaller.appspotmail.com,
	Dave Kleikamp <dave.kleikamp@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	shaggy@kernel.org,
	rand.sec96@gmail.com,
	rbrasga@uci.edu,
	niharchaithanya@gmail.com,
	aha310510@gmail.com,
	ghanshyam1898@gmail.com,
	jfs-discussion@lists.sourceforge.net
Subject: [PATCH AUTOSEL 6.13 22/49] jfs: add sanity check for agwidth in dbMount
Date: Thu,  3 Apr 2025 15:03:41 -0400
Message-Id: <20250403190408.2676344-22-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190408.2676344-1-sashal@kernel.org>
References: <20250403190408.2676344-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit

From: Edward Adam Davis <eadavis@qq.com>

[ Upstream commit ddf2846f22e8575d6b4b6a66f2100f168b8cd73d ]

The width in dmapctl of the AG is zero, it trigger a divide error when
calculating the control page level in dbAllocAG.

To avoid this issue, add a check for agwidth in dbAllocAG.

Reported-and-tested-by: syzbot+7c808908291a569281a9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7c808908291a569281a9
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/jfs/jfs_dmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index 9ac1fc2ed05bc..0e1019382cf51 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -204,6 +204,10 @@ int dbMount(struct inode *ipbmap)
 	bmp->db_aglevel = le32_to_cpu(dbmp_le->dn_aglevel);
 	bmp->db_agheight = le32_to_cpu(dbmp_le->dn_agheight);
 	bmp->db_agwidth = le32_to_cpu(dbmp_le->dn_agwidth);
+	if (!bmp->db_agwidth) {
+		err = -EINVAL;
+		goto err_release_metapage;
+	}
 	bmp->db_agstart = le32_to_cpu(dbmp_le->dn_agstart);
 	bmp->db_agl2size = le32_to_cpu(dbmp_le->dn_agl2size);
 	if (bmp->db_agl2size > L2MAXL2SIZE - L2MAXAG ||
-- 
2.39.5

