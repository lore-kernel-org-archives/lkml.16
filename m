Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4421E1DFC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750130863; cv=none; b=BBykRoeHtadDr4EsFtwcc2ELOHKIefWtCb8B46hg46nQukoDm0Qr2EXAyv9mmqCyQAD3n55vEcYOY5IqxG8OmwwCaQvyUCkf31Mt0fkaEMXeBHGTPGpVAz5o24Ob6cT/fFvteZ5+cNBeOwBH6LlR2F1SbMfgBKDYvDugej9i2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750130863; c=relaxed/simple;
	bh=jgjxO/7clUSYOJ3hEGHAiq1dZeIebExF4Lno9l04xXw=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=UWWNomyeKkXgQAsFj4TNIsfsH3eDKxrPj6p/3RtpGRfiJG19gi8yqH/uijZzWaLEtGS1jYIvzrv9z+g3UyIyyCyE0Iffr8vyGVWa+G+9kIp/rGgFuME/yquZ27252X8k8BfmhYdi6NsKkkyuoXssxv9lbfmeGXU2SYqx6FyYeCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mYUSlCsT; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mYUSlCsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750130855; bh=EHB/nKe3H6oNehWCjTnKytYQyFXIqU682RBCgDLU448=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mYUSlCsTAaS1RucXKO36k6N8FGmWG9fZygVEd8Jo7XmH2QnVXf9/Iae1yArfgPj+o
	 NM8n8vBDYifCVDI5wL650Bk5hkMn0OfL1HKpfdvUyqXIgLHet5ClEricpxCicUW4JH
	 JUxuyAOukr0r2gzX6Mr0bWv937G0gpkyt1q1qob8=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 4F88BC3D; Tue, 17 Jun 2025 11:19:56 +0800
X-QQ-mid: xmsmtpt1750130396tbcgx4cp5
Message-ID: <tencent_279220DDBEDD93995BCF998D8B25B18D8B07@qq.com>
X-QQ-XMAILINFO: MhK4DKsBP06if8MPSwrVCdWpm74FUszJnySk2ZCmHvLprutXp1AvspMspqJx8Q
	 BFqtuQAseR3kHWNXp91IQKn/r1PDaLoX0Cpd1ui16Prh7LspeaUTMdiKxu4YRSvQ7ra4SMtMmxvT
	 RHGdO7jqB8dRplXxB/POb8aCMz9u871bMovBZT763J6P2yNciuxkzDs3S8dong3wZj0xGvEiRCUJ
	 tg6P9E5tv04cWvAJtv7gYQ9UFqxOpxQZJyVP6XeCCVqzEi7BN7op0Mo4SLfdHHZhmW8yM9wVTDJG
	 4Cg4BLzVIHBJyo0r8zM7d8gq/SEn+Ja1lBSPoFndn7xs8brtIDgfa4Ni6dgRTrHSSqEoxiDKNgpS
	 SkwoOiBeXxga6QyzSlwZI1Aic6RZXJE2KCEX2aLV4FxsP09cZZqowp4wUUNFcQdxQVUY1Gk1EH/7
	 KP/YBaV/OpqyYajBNIMSZN593WOG1ZjD2Ql2zp2aK8Rfc5H6is60ZiWqmegLm6sT56DAGW8BLwus
	 2zHduwdTD7rHb+Iif2iWXsyhKq3coGVosCpzXSBOTqA+l/YmtussyoTBc+TUNiCOg2ZuUyuevxlr
	 ZPZpj+zHFjA7dmPiL6ncdQfwHbXALAtD7nMJSI8Ci2b+aRsia5PV16EirCPrO6Pxby5ve+LA73m4
	 C8HFfG7yek+GYAvqz7noHVWKhUeRJXrSFGrSTwt2DCMvC0PXZzzSjPvdOlK2Haj9WinUI6vD5uuO
	 pdoflCtc9UZIJ/SyR/2c/BySUnp0XhW4Nq4SrtKH4RBxBo2mZly6m/NzURjDBQRUDQ5eSmxDWMXC
	 YVTMh051mctFpzGY6A1JnGUXz2UQDtpxINkZMQBI++QFoJFwz0jpvArlUfK4D6MnNu614oqrVicZ
	 gxLa/OV2Npon3ynDOKZqhO3vqSpsg9sav8xyYO3XXmenckNjpY889UTrCQInol28Ar1lahXVfaUA
	 ssQyD12wSoYbAzTVsu2HkIpOJxxH5mhHZQGz9mfOZ5LR/Ra5GTuyMngQXCI0lmmS5JivO9OZE=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	shaggy@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] jfs: Issue a warning when leafidx is too large
Date: Tue, 17 Jun 2025 11:19:57 +0800
X-OQ-MSGID: <20250617031956.334239-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <6850d37f.a70a0220.395abc.01f9.GAE@google.com>
References: <6850d37f.a70a0220.395abc.01f9.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When it is clear that leafidx is too large, a warn is triggered to
distinguish it from other sizes.

Reported-by: syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=077d9ebda84f426a6a1e
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/jfs/jfs_dmap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index 35e063c9f3a4..7e3c5f6826d8 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -2856,9 +2856,13 @@ static int dbJoin(dmtree_t *tp, int leafno, int newval, bool is_ctl)
 static void dbAdjTree(dmtree_t *tp, int leafno, int newval, bool is_ctl)
 {
 	int lp, pp, k;
-	int max, size;
+	int max, size, max_idx;
 
 	size = is_ctl ? CTLTREESIZE : TREESIZE;
+	max_idx = is_ctl ? LPERCTL : LPERDMAP;
+
+	if (WARN_ON_ONCE(le32_to_cpu(tp->dmt_leafidx) >= max_idx))
+		return;
 
 	/* pick up the index of the leaf for this leafno.
 	 */
-- 
2.43.0

