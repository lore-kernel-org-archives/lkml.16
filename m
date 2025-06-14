Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529C256D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 03:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749870738; cv=none; b=YN2N/OoX0E/Yclghk2NKL5Bz5B3Y4ZGVffnzNbqyczMMn8WYV+NQs1TNyGzZFq8bO2/3M8pgj63u+12YuBoXInK1oqEoS3aSS4N18ihydvoydjoX+jwF5BydcPlPbWPTZJn8rPYx4WgeVHRvShDJNwjprIfOyzYc/rASJ+T+esk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749870738; c=relaxed/simple;
	bh=AO604sKUXT9W23j2cCVV+mLwsTV31RV1LgAcTgYCip4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=C9Br53K6752slyjAEyaKqj91CZrbwQYjuxMBbCuNZ9BhOrKN4lb9v82h6yWf+vhMJHSqGQW6lkHUbaQvQepFFgSJD/hTzWa9k3rynXauYFLuyr8U5H5CDGyCQpldVc5Ugv1Wet09HtrQz47AcOM1wwXhdysJNMPgD4wOnTkEAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=gNbkMRJ1; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="gNbkMRJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1749870422; bh=LYh2yGQubkln7lA07EZ0QWtEyVyFfuuF4akaRUZNfwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gNbkMRJ1jTEIxLHVZJFjSY7BcQgczN96/mGSFoSEVV5P7VjXfgLWE/AfyAYzcIGgf
	 Ho63yf1MDaWfJm96GcSwpm52fkqGg3meXNLiS60nkyjp1ja4soWgC47WrCdK2GRWh4
	 n0dp6X5DGYU/pEsLiXMDn/2KKVIRuN2EAuFENR6E=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 1C019445; Sat, 14 Jun 2025 11:07:00 +0800
X-QQ-mid: xmsmtpt1749870420tc2v3ahv3
Message-ID: <tencent_5164697F63AFA45C5776B771A6C83368C305@qq.com>
X-QQ-XMAILINFO: M0PjjqbLT90wcf+TOeu3MoRogzNpvQBumhElY4jlVKynplMr5YdF63m0t9qqTC
	 Tn9hB4DA+0vgm6tC+lZ/ELusy1vQ9ajlkvSog/JPXB0K8Y7PqqFGbDoWpMc9VC0fRO37smgKHvUI
	 M3xGBuc+ApTPBM83csV0QtWOmtMbqbiyHA6UT6l2Smb1KoZisurSVZ7aCy/Mayaq1eiv28IV1rpd
	 rWOg9kIWVNvgTX078HDMBXhfcTUlg0zblFJchdvUg/MTM3zlp4Sc03KD/djEuMGuhfxS0rODUxwr
	 fAfrD3Ox54q6xAyiu3WTtzymiWJeIhDqk8o+aWNLcWTKnJ928VbdEq+NKU2Ov9fYJFRRQaCcDH3O
	 eYxL1QokUgf1/PohU3xC1P8hXrT7s2vsuPvBGuvA6lhzTvxFD1FtwBqOGFBmZsdNVMHxnxtclzB8
	 J8eTwz7V8CYU6ZOG5PxaTPSqqhobKqL0Hxr1fvyj5j4HRpqV6R+9QSQd/7QdM6glxXiwZo+F/SmM
	 ZWVbqUfErMKGjGyuYtpwR2MJU4EyXO0rXw7zWIYQ3DJwqMBaWZBwP8FN2alALkysIwOslCCuYioK
	 azO9GGzpwvuk9IwPEU2IB53/8rNM/yb+s2pIUzNWFxvKO67zknxKsd/10nlqp7jhwbTpUWfvrcXf
	 3cfJksn8auI/ZKCcHeOFNmR41YaFQ2RlTrXrROAcG931SWKtpt0itruKmjjan0Grhqy+gyr1NxH7
	 exmSqxI+WBx5mj9PqCwp/gwQfZgqw2GcDBjy2PCsIe2+HiD+Lwbl2hPayF8+k0nH3Ip5BuHVn0Lm
	 Xt4E8QRRouCHQk3l0nA/sir1584FWqyAVQDxTOtqCgxunXzvqXz/2vWuphlL2RPkzPUMns7FQem3
	 LXJwdL/rpoZjo/bwIiuA7WSHB+8lvtVpyvA6hfQyyVTF7vO7eunhjufrNN9cz+o7I1XmOMW6kX
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [iomap?] [erofs?] WARNING in iomap_iter (5)
Date: Sat, 14 Jun 2025 11:06:55 +0800
X-OQ-MSGID: <20250614030654.2936126-2-eadavis@qq.com>
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

diff --git a/fs/iomap/iter.c b/fs/iomap/iter.c
index 6ffc6a7b9ba5..e53591538643 100644
--- a/fs/iomap/iter.c
+++ b/fs/iomap/iter.c
@@ -30,7 +30,8 @@ int iomap_iter_advance(struct iomap_iter *iter, u64 *count)
 
 static inline void iomap_iter_done(struct iomap_iter *iter)
 {
-	WARN_ON_ONCE(iter->iomap.offset > iter->pos);
+	WARN_ON_ONCE(iter->iomap.type != IOMAP_HOLE &&
+		     iter->iomap.offset > iter->pos);
 	WARN_ON_ONCE(iter->iomap.length == 0);
 	WARN_ON_ONCE(iter->iomap.offset + iter->iomap.length <= iter->pos);
 	WARN_ON_ONCE(iter->iomap.flags & IOMAP_F_STALE);

