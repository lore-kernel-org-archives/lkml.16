Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7368489
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 01:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738547964; cv=none; b=iBp4xMlwOBdvCmTa5XB/NnTwwaLBi9nimkNq2GeJlcMMhcOiLZfeL8wvdR5hHzVsN5TLzBpU+o/osnIbdNjfc6dItb6C1j6NeUBcu2GJ9cC08tZkzcb+MjKTl3oHq3BdVQPSCV9jDz8ayK+bWCSEs4rHE5BwGesYfQlFJQIYejA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738547964; c=relaxed/simple;
	bh=6zz/jaIm/bxbFPinbqZGklT3DECEhARP4QY/gC6WmHM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ifaAvf+y95SeFWBkSmNkBn+/v5DFY3yQhu4U2FapolZh0ebTtuwA5TRoY867RQO9nVTAtYpufW5aoM3OUVPGDQPycEIaODiEBwuEDuARZbiM6ugaXqw92xrWkZr0IjOUSsy6H01TbexSMlyRHt6RWDVRgrds9lkZ4vNmTZzIGQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=E5PQjorb; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="E5PQjorb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738547649; bh=SCnXB8xy49EeeCkZxk1unpJhTUDD8rXUuNzsT6N9L1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E5PQjorbOJ8JK91fpTq6zUtjVmjZ72Kq8KsK8J5GPmhTqxRF9drtVXShw/nhl1v4k
	 VYplisK+zJfjhjfSWKDqk8G/Nv8hFC/pzZtPcHElDK7GZQ486tRkaz776NfBoCFmxb
	 kYQHoHdV1HVJvzUGmW7EC75t9O3Pf6UUPrNNUa3k=
Received: from pek-lxu-l1.wrs.com ([2408:8435:9910:167a:8cb3:3b5b:faa2:1ccb])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id D858A8F6; Mon, 03 Feb 2025 09:54:05 +0800
X-QQ-mid: xmsmtpt1738547645tgf9rlycj
Message-ID: <tencent_2D66063C753604966437E44B8A7423769B09@qq.com>
X-QQ-XMAILINFO: NyTsQ4JOu2J2NZ6rDN4Pd1GRE2O45VRis1eXytMFo3WEoAYKTzdl9NKDWqxYe6
	 HAaOcrfULl00CaQD+uTwEvy/ld4XFxU7/hfkOorrmgYMDvhE/4lgV7QI4ZKwPzT+x2O2ZlTFjlAt
	 8GR627CRjuCla8hATcGVnebZFPc1xVYgXVijo2AEXHaQbboZes0B8VM8/G9IK7HzyCMI5I5EW4we
	 FlZNb31kusLSbE6hOTsvCk6slA0M2aNNUWQXb0EfAx2IIam4WU+Iy+aOUB2OHy9DxlOEPTVAzchB
	 HKvkkj1Thcc2v28JGFpcf8o48dfKR/Ht2p9tH3rdgx66zFA54wIAAph8G8/kCHvCn4fnYBxQ7uBR
	 ATiSYRwK0Rc4c1lVOErda8ROq5VyvuQWGXvi7hUueSFKTCaAxi0aa6CihblLPOMztG7AxpDdiEiL
	 iFwfksNa7LQLBxrfbpQef0su9Mj7uDEHYF3vj/vC2lV2QHe8zkcMi9U3IXffxUP5Ivg7wdN9nPss
	 ZcqbG/sHo72cA4gE29XX4w68/KRA+xCw0Mq+3joPH6Eoz2F9pReN+w5Q8Y38zNLCNOH+nfT0Fi7Q
	 3D6W2A9ntWkgefvZvjE465Jo0ScxsaaJBEDxnEyZKI+BpujvnKGMkHp0prawYr3Q5e1ooysoEOtK
	 iXZzExqVJIeDf606vZiiVsswvBd7lCTuBi0C3hmFT5hY+gs1VQGRQxCS4U8XMV4MWPmgP2pn//FN
	 mM7n/LA7FGaZEtld8FZj+b7QqBB2KArgeZB2o+5E5osENo9fXYTnwaUcZamk6AMZOFAX2oCcTkpX
	 6nnE33/gWCMh2gcwr9gse/pzdYif1Sj0CHqX52q4wlUlcci83Id1Tsk5yRTH8V5j6o2aNNGL3VqL
	 yJeldpPhfME64w2MMCEIIDRs7lQIYINQ==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+8928e473a91452caca2f@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [fs?] KMSAN: uninit-value in full_proxy_unlocked_ioctl
Date: Mon,  3 Feb 2025 09:54:06 +0800
X-OQ-MSGID: <20250203015405.1347291-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <679f72f6.050a0220.48cbc.000d.GAE@google.com>
References: <679f72f6.050a0220.48cbc.000d.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index e33cc77699cd..5fbefce2b372 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -102,6 +102,7 @@ static int __debugfs_file_get(struct dentry *dentry, enum dbgfs_get_mode mode)
 		if (!fsd)
 			return -ENOMEM;
 
+		fsd->methods = 0;
 		if (mode == DBGFS_GET_SHORT) {
 			const struct debugfs_short_fops *ops;
 			ops = fsd->short_fops = DEBUGFS_I(inode)->short_fops;

