Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E684419D080
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750726582; cv=none; b=aUzn1pDss3sGWHzc+00OiR+s51XXOMoxd+vCJIl+6H4xojmTGsjJMMcZIrqtTQOrEVt96ouFZhqsn/0BNVOcaqFM9gSveHiUPR5bPgyUPOeiXX0ZMLSczJN1XPGdsCM8RugIA8n20CVTKr8qyhIpJEhsWICutNS4mpBO2aVYTyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750726582; c=relaxed/simple;
	bh=d8XgKQJ7qr2RnwskiOrMi8d7wAgSjx85bc40ImJiofc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwIgMjZvkx/32N8OsvbmH31+JSaluBhLL0xP8e0Lpvp4YzljPsHJtYocucE167Pz3UsdqO+oTzbFsmYBfrUSexhZnVtnbmbiDcxnHA8dcyO4FbEM8HWe5c58FPVEHz8Q69m81yeY25blgPjhuywouJtl1pGukeeqXMfDe1dVSV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=61.135.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.31) with ESMTP
	id 6859F7A2000067F0; Tue, 24 Jun 2025 08:56:04 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2591746816433
X-SMAIL-UIID: 60F4765296F14BD9BA872BA94C66FDBB-20250624-085604-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+25317a459958aec47bfa@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [fs?] general protection fault in pidfs_free_pid
Date: Tue, 24 Jun 2025 08:55:51 +0800
Message-ID: <20250624005552.1589-1-hdanton@sina.com>
In-Reply-To: <68599c8e.a00a0220.34b642.000f.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Mon, 23 Jun 2025 11:27:26 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    5d4809e25903 Add linux-next specific files for 20250620
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=150ef30c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=58afc4b78b52b7e3
> dashboard link: https://syzkaller.appspot.com/bug?extid=25317a459958aec47bfa
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10a5330c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c9f6bc580000

#syz test

--- x/fs/pidfs.c
+++ y/fs/pidfs.c
@@ -150,7 +150,7 @@ void pidfs_free_pid(struct pid *pid)
 	 */
 	VFS_WARN_ON_ONCE(pid->stashed);
 
-	if (IS_ERR(attr))
+	if (IS_ERR(attr) || !attr)
 		return;
 
 	/*
--
