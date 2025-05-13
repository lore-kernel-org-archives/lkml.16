Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16AA28DB43
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138129; cv=none; b=o4RMGQ2V1yHMLSPtRdgQ9yVYBLojdm0FbhQ6R2B3elb2VaLpAvxGXY1ryJyrS9nTaVVpzWYYLT8/EiSk3WtCFmXDS5nw/X0FvlmKL6MwZUKHNflCm3RaaV08NDai+7cRHEWaKV7QO+49MO1h58Y2OQpD6s4hEZmD0G5IVFE/wPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138129; c=relaxed/simple;
	bh=wDbpJa9iSiximbNH6KFz8D8xa/lk724XCriEpQnPqtM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=mw+2QzNpRwqoukFFPoNO5wLzkQiVFvjjCXLiYd6i73bU7F1gOP341AA7R4kzJhUSYzZ02fie0hv8FfYM1HMeaYRzkGIke6RDdrafOlZVUaegmgT0JNp4g5YUvRo+TLo2HaRgBAxSOMCRgjL1hVoVDxAYnPCRLwt/B2rhHIiM9+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=gv1M16hP; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="gv1M16hP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1747138117; bh=XMqRWgXZAaaEIweY3qILBqIYGzPcMAdQi9Sxx59YNUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gv1M16hP2u1I5TkylMnGuWIELBPDi8IYVMHqrk5ygoklmbfKODAxZGQIsLFaXDNFc
	 tP1ILST26Bl1NMmxe0jbdXzyW192QolswF/RueVWDllVOU0ZozAUlQAg28SCSbWCpy
	 8UK9pqW/VTofc21GJpsPBj42gouwuVWHhjaP2ZjU=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 1B1DAE6; Tue, 13 May 2025 20:00:27 +0800
X-QQ-mid: xmsmtpt1747137627tn2m7g83x
Message-ID: <tencent_7CCE5C7B1E6DB02E756D609404E99EEEE20A@qq.com>
X-QQ-XMAILINFO: McJfg7Aee/FZVKhqB3lPBCSV45DURZ4xkXHPbomYi5nBpavnt/mJ6swgCRulc5
	 BMMKHCgLqq3Q9gpa2XBhwIyWfABZbzVoglDPmB/rYl26fSq9LKbmTGY6KNgy0KKTPVGdGGpsIWNC
	 51aENhmYDh0xNWdMJ+wjuud0izgQ0dg+r3FKQADeCpDiqSnh1H0yPXfAdZwlRrBYpbI3IGilMh2V
	 /GntUdVcRZD9zBsRHirqx2S9NOmGxA6CuVNLHCcHM6ouUmKvbwHVYyG9yEVLt+ktPnbuNA63rcKB
	 VLv5XexpSzQdegJ4Kk37v2zaotCOfcb7LgBSoACGAOv7e/9K1qMThoDSS50nHMOVqSwnQdNbkHwr
	 RJK81sOxXHkVUTn4yy0W9CQDBVhkhbdJ6/bc+6Piu8eHjkPL1BAbhqXC2vehcQLwNIbWm0pTQAFX
	 an9SxP4FBCHX/2vsmqmxeq2Rc8YRhNaGYsdz10Kmuu7puZGgt2pqJpoyMwtOmKq50hneYgqD+K/1
	 xErh4+JjlhME7sPqu+HgQ/oxiLqsIVFuYbYuGBXdTJW3FG1W685kOXY/bS/sjrmQlfdwyX7GzJsb
	 MKevBuHgLNNA1s02r3pUBtePvrxz77sU82MD6wppSBaqmWIHEHIk/n/HtYCqlcB8YNN8wHvNNf8B
	 4tC2oaoVdIQvaL/CCELpHiGm7tEaNrVFGDbJt4cgIvmsGsE0fT8dW00IQom0m6RoAKJhyBSF0Gng
	 ZhJ+rOaScEtG45BfsOAlG/rDx1aEubIdr1OLxOzs4zC6x/fJ0Cliv+6Quss42RiHUPGshqCX/Nqx
	 POInQkGO82rw+Yn1wYS3YNZzhpRidbZT/WQVZIgqJZ0ej1g4kJ0vRcEvKXyrWCWRmby0VZIydvtb
	 ODbFI80QmRhCaOL03a86KyOoCo39ax20bKsp7stVLZMCwOZbIVNXUcx5blpfCZjaQV8NOU3VpNF/
	 QD7gHPNhE=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+321477fad98ea6dd35b7@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [fs?] INFO: task hung in vfs_rename (2)
Date: Tue, 13 May 2025 20:00:28 +0800
X-OQ-MSGID: <20250513120027.2274731-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <680809f3.050a0220.36a438.0003.GAE@google.com>
References: <680809f3.050a0220.36a438.0003.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/namei.c b/fs/namei.c
index 84a0e0b0111c..ff843007ca94 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -5013,7 +5013,7 @@ int vfs_rename(struct renamedata *rd)
 	struct name_snapshot old_name;
 	bool lock_old_subdir, lock_new_subdir;
 
-	if (source == target)
+	if (source == target || old_dir == target)
 		return 0;
 
 	error = may_delete(rd->old_mnt_idmap, old_dir, old_dentry, is_dir);

