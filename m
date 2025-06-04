Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285F3224CC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749018032; cv=none; b=bWB4v5BDQeFIGBhZOc/WfOtxFe6uoNv3R5yIuHBtTpTMAyR94jMCFp/Kk4NT3GcEXGHe3l+dNRyOWngR/odmcyOb9ycVzUpig2LwXy9YmQ8ceZIw6r5Y6O4vk5ojALeccAvTn3z/X2fsQaCLB3OOEG/Mhtwgr7xAUyYPhUL7u08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749018032; c=relaxed/simple;
	bh=e6LRXPzVnZKxhokbErVSL+nBUVOIm4OpJ5RuyYHMRDE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Euvk1Yen+6p8gr/97vDDJtIy4dOSn8Bri8OIs+jv6AgTjRkxVZN979kzobjYcg6KmNpNZG31aEMnTwkJhPYrkBNZ2rBzz3P+dwYXfIo0h+44OsAfYWbXVDBpAGjoNvgDuXH4qtH+jCiUqs9jWAoWrrf1aVb2JzOj/78kRZ8gJd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zbTxBWMv; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zbTxBWMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1749018019; bh=zQIsrgUtvlLHAumH6tieacrSr4REa7famVdfO3OkDO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zbTxBWMvlG6uVLr+ps+8MwoBInmhFo2UcfsgNp70Ys6d4xFxS3+S8U2ximLbDmek2
	 F3ZIp//autZT5uHUwmQ1FGWDeg+JRz0EuwnCsUzVx1EIhZ9o8BqTccmrD8f5HxQ6W2
	 l7KEmK32CvouSJLHs3NMPjhxzEOvcneHaQ5Ng8U8=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 387B4A72; Wed, 04 Jun 2025 14:14:07 +0800
X-QQ-mid: xmsmtpt1749017647tjffighuc
Message-ID: <tencent_F2697FA3B36447577E176326C65365E37905@qq.com>
X-QQ-XMAILINFO: NDgMZBR9sMmaueLbjxtaREh2e3GrbWkXGX7iut/Hh3QZTqEVC0P9tGbTVF6ktG
	 pNkpC8jv4vRknXrALgvEI8vN4U15ufGFbQmptoWvNgadSH9UfbDwpA3+yKXmG4O0uJoOp879GZDV
	 rMjULesbwfGVbm3swvvueao7pNBorRwMNVxk5/k0OifwF4GdWsTEVPV1xsnST4bSsaT6EtYm8UUe
	 UlWwnNv20Il0qQCMvnfE4QFnosNVCE9e7vlVYkjD1+OjhonX2Qy8OePk7Oi/O7I+gKTBnbimOaQG
	 pKST/A/8O1J+bA6lqNszBAQr8Uz4LhOgF4EybR/o3zOM8TjHiXMuWq6+DUA7qHcFPl/Tl70GBImG
	 +cfvxs+Jc0r5tMuvGUN0gKHcbC/e9bGj3y5Vasr/8QfkzJJD9ccBS0YsCPDquTs+62Sndcc9zPMz
	 i1vh1TB2z/wc04ErT65wIdaxD+ggwIv76+05/Qj034ZlBQwzkSX76a+aH7eClI/xUdHO0BuRbeW5
	 LiUD3W9EVARvDY6Zf2BYL8L4owWujGZmk18yR71JlTMldEX8gpjtLGRC/eBnj2RnZlXtbs34XsVq
	 Z4NbGRvD0C3gz+D+l7NrhxLtz+A1/660rr1d58Kdzkb5n0SFXqXXQamT58BwUi71w5cCvmjfg9c3
	 9frKENqHlcrZaEI4CBIL3FNLnaYfqLB+XN8+oXyL+8WYfS0ytZOm3qAElibVeB8TkxLjh+b+JxDO
	 RGpVkIomfo/KjlnClkOwf/XC37tu0RwysZgujE7STWwiWCEi1svX5k1mIdu1o2fk5SjbeQLo1JTC
	 4B/1n+vc8DLTDeCZztWtWPQ4rQrT/rtlspr+haeWD50Q2eGiJAGnBOw9uzIlDBQmbgIxR9s0/77A
	 7AiwcQz9fCar984HOKZnqlRqa+gRcTQi0CAqIVFqPwi9u2nM46uqFxy8DbR2z47hGxL9cnw9k+
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [jfs?] kernel BUG in jfs_truncate_nolock
Date: Wed,  4 Jun 2025 14:13:47 +0800
X-OQ-MSGID: <20250604061346.3099258-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <683eb35e.a00a0220.d8eae.0062.GAE@google.com>
References: <683eb35e.a00a0220.d8eae.0062.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/jfs/file.c b/fs/jfs/file.c
index 01b6912e60f8..742cadd1f37e 100644
--- a/fs/jfs/file.c
+++ b/fs/jfs/file.c
@@ -44,6 +44,9 @@ static int jfs_open(struct inode *inode, struct file *file)
 {
 	int rc;
 
+	if (S_ISREG(inode->i_mode) && inode->i_size < 0)
+		return -EIO;
+
 	if ((rc = dquot_file_open(inode, file)))
 		return rc;
 

