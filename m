Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E6B1EA6F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 02:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743905762; cv=none; b=VOfQFkKix8BCPgNQsUuwWsN1ogAxr8DFkylgDNu88yQtXG0G5n37xNXAh8QOnovuuqzBpeZLPo+rLAh++mrd0VdIUJ5BtfZ/dftMUM9BmJ595PujOyy7MD0gXr8qCuKQf+KtJgC2YmBA/279dIU/e1U+PUn/aZfKRzH0v3pmMCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743905762; c=relaxed/simple;
	bh=VUfxn+TzdAm3gvZaJHA7LKEcGLsUuhAFZs9CM3SEftI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=sA8i47okIt8FEew6hTh3xN9jhe2tv94axwuA2Ak8ATJkxyTax/HwYnd5YmV4cjeODw9Yql8n2Le+KVDjWtlsacpfelXqOsHF3dmnLraqyNnDNL6PSaA/3G61n7QqPhMR/mv7gms6YtyXBxZfL46kDOOccXe8k2I/NE0sjliNNtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=OKnvBGcI; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="OKnvBGcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743905749; bh=HlYvFglqtg76wzfiXpDpq8n+MZbDVmh5DTNkGzWcQGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OKnvBGcI7IIqmTmTzx/KihX2J5SspkWMjh0ec+ECO9hrOm52krRAJKZUFuBdoAz0B
	 5fCft6KuzYOd7APakaKPYJSFtP7lUEnUZngOaLR3Ju6+WWtTEItjWY8W0yq4J6kKYt
	 MDMeb+MBrExsPI5Abp9hAx0+kdojbH3+cuEw/8i4=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 9A816E5; Sun, 06 Apr 2025 10:02:26 +0800
X-QQ-mid: xmsmtpt1743904946tjhpje6qz
Message-ID: <tencent_58BA62BBDD331C9E981BDB4B611B6725A508@qq.com>
X-QQ-XMAILINFO: N3p64rE3gZ/Ysxs90a9kxEyG1zXiOepzmvvt8SAbnG3ik5j/sxxiQ2NqWQ2jgj
	 8Lc35plIzsIAB+fn6R7/IFshpi3BQEz9D6+iKkX7mPfx1bufLrqFEa7yq2/s93SqtYp3uK5iVE4d
	 UGGNBglXxFR5hQh3ZvqDQ49EnNxRrOHVazKYm04hjDz/2fu+flTlQ/CfbjKehbHVqbOEndGaI0RV
	 eeiobbWnn8Ipuc94/l1IG/4vr+KHuMXoqLkssZJumdUwtmr2B3/RUUoPbQXIXoG/51VVSXXQeFCo
	 T/oHPgtc1qhhoGsRmvAYk7IGkt6QJ8H6Vin5Sk5XvJzKQysgzOV/NC+2qHb4plo1rvvanbE4zRGb
	 y3izc/Z6C/DFH35mRahsfooFANRn0labBcUvq7aJuXMjrbDng6n2KbhuNXCzhvpx5T3I7KbF4a+b
	 zL/qLsFZyR7Gb8aTREQRPPL5tvzPL2H/oQbMBfGegcNx347j0hQtxe1o1sE2H5rVmHNDpmb1BWmz
	 AiA48Mwb5PB3FrZdACHnl5nV7kQqXzdamUvqk6dM+SeKlPSa9nQ/wsBum74s5iJ4m/KkydqDLFpG
	 4XDeflhTEk21aChDufPD7uabISIsQfsQNekhIQZo1iwSC+hM7tTCf0L6DUoZR9sUn5asR7O9Z9Np
	 rX3iYJ1vPICAQcWKtC6aX+zDn8aiGfDQBKPzrDuMwC6OHc9EZwDuemb6B82kwQTiYEgAPQPVcJBE
	 shZENeYH+VtVYZFxGR7ALvaF/1R+A9x1E41Ic8oXELjsqBbjZRcOVrdSngMN/NKgJ9PIi4NhjAVN
	 BGSqT+yCrUD/ftP3UJmAQeLnTY9KKRkyaeE4xqtm+GBL12F74UOYc7/2tjqYJmWkbotsbDAjULhF
	 eCrXEW9oxNYM5iL7yQaZ3yQ5+/hFpv3Q==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] general protection fault in mremap
Date: Sun,  6 Apr 2025 10:02:27 +0800
X-OQ-MSGID: <20250406020226.4109463-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67f1c7df.050a0220.0a13.0256.GAE@google.com>
References: <67f1c7df.050a0220.0a13.0256.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/mm/mremap.c b/mm/mremap.c
index 0865387531ed..7db9da609c84 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -1561,11 +1561,12 @@ static unsigned long expand_vma_in_place(struct vma_remap_struct *vrm)
 	 * adjacent to the expanded vma and otherwise
 	 * compatible.
 	 */
-	vma = vrm->vma = vma_merge_extend(&vmi, vma, vrm->delta);
+	vma = vma_merge_extend(&vmi, vma, vrm->delta);
 	if (!vma) {
 		vrm_uncharge(vrm);
 		return -ENOMEM;
 	}
+	vrm->vma = vma;
 
 	vrm_stat_account(vrm, vrm->delta);
 

