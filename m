Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3708460
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 04:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749960315; cv=none; b=fSkjUko4sZB7SJMiQqR+/c87SQ+GWQE6um3lhTVE65wIKfhlrKh7l99C58zqPHRONV/4+eVoUSo3yqD0JY3TY8iDOi910kYqv/MM+42FnqmN0sVFm18GGQgf01beskEpKDFt+aEH+dIeXnREJC5UH0tIFT9EfEVfzjvyNFskrwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749960315; c=relaxed/simple;
	bh=g91+xGSs2y3BXnr+hvFkKS4a7U41TWjLqzVhaX39URI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=dZHZK90LacaXDmf0TX2ccv6sHPzeHIcXKmuY89IpG1APhyU9FqtZ6Lv1ZhfclunIwefqFbDGj9imS13PX67NWqrkF45qdGun/pPLSLxNS47hTF09mqXgIKEKYcg3LfDC0lS5Njomvcq0ZfiwHPq5NWTeTbN4dnc2FRA3p2iA7QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=FPbfMXa3; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="FPbfMXa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1749960301; bh=qrJLJFV7Q/Oa/aDPJBoKSBOfqrsyIwvhwuDGB5DV2Xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FPbfMXa3kaX1fUok1/zDGP8lIvuZsnumtlSqC5QiEx9rPxFRxoGU2w9xX/E7+8835
	 qgR3NKypv0DbVQKAq1xfIko3j8G7FiU/9cEF45GKaG3iZWSGf7Ngx5HHsRUOOa/Pjn
	 ez7ZF2DlCV7xdpBmBF7TYyOmUzJ/DPgZ0nwggxjU=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id E29316D0; Sun, 15 Jun 2025 11:56:41 +0800
X-QQ-mid: xmsmtpt1749959801tp549q9iz
Message-ID: <tencent_70C092DB0661498AEEF56EC78C90E7CA0606@qq.com>
X-QQ-XMAILINFO: NDz66ktblfzJ1QXUyq4GmO7xLJ0oefUnSn39sPbbmK7qFu56LsEfTOeYA3NZIJ
	 cwqC5hi1Myt4LE+JBXRo1WpcEVmUqzIGTeoZxgBkP5nAFeC0uVWC3ReQ1m6OZaplb/4MoCs0GISu
	 LGikRf+bIN3t+hOrINNyYYSz4UxTGYVOLl19cgeVHJyI7/6k5ka0vaQc74+Scg5uS6e2OrxZLbEJ
	 1gXGgDM1VMPC0t/kb/f40Eh2XcJwEANj6VFWiMoNf58xkSwagfiLKgW+PpXxDOFwAjELuvgKv9PZ
	 PRWMy7l6hDSmFZYel9XBJt1DpWbkck1rW+7CHYEyooWZM+M/iXdEsaFPNAiNJdnR/NcJfAv+lamK
	 XMhs1f93p5W6TrJoPa+TV07Z6AshLOv7MIaVm93Ym2qqodzXSsj6YFGoAXf0M6S2ILJDIVgN7ubh
	 fO/Xv9l63KsmaA8tvraLuyDj7MUgzDBALwSchdhvi1O9dcK0tXCBx0tfXsl82khTdLGHdBm4CnB9
	 BD3E04JoDFI3lbs7cIX/Ddv/RSdosmLNTK4D7yovX/LRq7gRPmCWQp+ubva5IcLEu2IskaO68P4B
	 i92swAv3ORtxGOb0VjBF6EiarbxpEzUMC3WxqwVXZ/xcGFU3WcfT9FSoCMXfR2RhZan/GrdAL8WF
	 5rX/GS6FetyPJsJi4rHD+y7zdRwSVTnI1ktpAvZsmJA0d6/IuUlNSPc5stkiIRpX1NR223k9Lcfg
	 91R2xi2//8ZZtUQLVieLXtatvx1LmVVMnd+fzbwPKFTWhsFVHMfxrcpAUzJhVehvaacvjkY84aD4
	 vJv1hXMS8O/dth72tf7XEronxKwfLpLkXGIM55O1TU35nlgIw3UgfwYjJ2oiQZ6DEEprABpQdE5x
	 TSJsgfEUOrhHtZQ/lEEKxI5zTePVo9v6vf+RAni/2OBDwCWI0donJlD0nkNfEwu8BPjYt7a4AzNc
	 E+2x7DBZDtuaLJAhzHOy2Y/8TKrf6z
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [iomap?] [erofs?] WARNING in iomap_iter (5)
Date: Sun, 15 Jun 2025 11:56:41 +0800
X-OQ-MSGID: <20250615035640.3660441-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <684cb499.a00a0220.c6bd7.0010.GAE@google.com>
References: <684cb499.a00a0220.c6bd7.0010.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
index 14ea47f954f5..664611cca689 100644
--- a/fs/erofs/zmap.c
+++ b/fs/erofs/zmap.c
@@ -686,7 +686,17 @@ static int z_erofs_fill_inode_lazy(struct inode *inode)
 		vi->z_tailextent_headlcn = 0;
 		goto done;
 	}
+
 	vi->z_advise = le16_to_cpu(h->h_advise);
+	if (!erofs_sb_has_big_pcluster(EROFS_SB(sb)) &&
+	    vi->z_advise & (Z_EROFS_ADVISE_BIG_PCLUSTER_1 |
+			    Z_EROFS_ADVISE_BIG_PCLUSTER_2)) {
+		erofs_err(sb, "per-inode big pcluster without sb feature for nid %llu",
+			  vi->nid);
+		err = -EFSCORRUPTED;
+		goto out_put_metabuf;
+	}
+
 	vi->z_lclusterbits = sb->s_blocksize_bits + (h->h_clusterbits & 15);
 	if (vi->datalayout == EROFS_INODE_COMPRESSED_FULL &&
 	    (vi->z_advise & Z_EROFS_ADVISE_EXTENTS)) {
@@ -711,14 +721,6 @@ static int z_erofs_fill_inode_lazy(struct inode *inode)
 		goto out_put_metabuf;
 	}
 
-	if (!erofs_sb_has_big_pcluster(EROFS_SB(sb)) &&
-	    vi->z_advise & (Z_EROFS_ADVISE_BIG_PCLUSTER_1 |
-			    Z_EROFS_ADVISE_BIG_PCLUSTER_2)) {
-		erofs_err(sb, "per-inode big pcluster without sb feature for nid %llu",
-			  vi->nid);
-		err = -EFSCORRUPTED;
-		goto out_put_metabuf;
-	}
 	if (vi->datalayout == EROFS_INODE_COMPRESSED_COMPACT &&
 	    !(vi->z_advise & Z_EROFS_ADVISE_BIG_PCLUSTER_1) ^
 	    !(vi->z_advise & Z_EROFS_ADVISE_BIG_PCLUSTER_2)) {

