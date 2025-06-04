Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C801FCFF1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749020126; cv=none; b=lq+8g7jIKsY+tcvkKkcZrD5Ek5DGw3D+CtfhG+Jtww81wjcDfj+V/DMjEOZe+pX51LWtFRyWq94OG6reJdk5SzVkWr41Bbh1OV+f7RU2qQPGR1M3jmothzmBssiwOKjKMx2eJ9xfTrAYgbQgM+dBA2NoWu/PFTkUR9S70ou1m08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749020126; c=relaxed/simple;
	bh=Ju08hNn8gHoXOpTMVK4Z8FCTFpXkWRJkIzp0MZh7vGw=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=e1i94eWwWT2W3F2x3nruNESy8mZYq+m5gZ8mg2EIlheOAHSzn7uoR4sr2lZs541UAiAvMSehFvgJyYu1DjBfRJUSQb3CCeZm5mTFsVrJnbx3cWIeRqkyttoC5p0r+kWitM1lGcV3akMiDicVqMUvOyzCD4vcCWaupBVlglCYkeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=n87TDXcu; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="n87TDXcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1749020116; bh=VZ4xNFAFJzzlvtqh/27P/VRB0oLM2LE76YUTjoDpWg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n87TDXcuwS6Qy8+DnX/ISRSdU0zoYihNaE/8BYRFVOu0aONTbFX9IkSjXz8mCgkSG
	 n4bPJ0/VV5CA9wXNqMz0fjpqCgsBseknsvsht+Uhx1+5BludvusM9rfK9/5mF/UEC+
	 aFpsU+Zmn6udLS5FxPGbItGD/68ckbruu8XM9dBM=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id C4406278; Wed, 04 Jun 2025 14:49:04 +0800
X-QQ-mid: xmsmtpt1749019744tojud1zcu
Message-ID: <tencent_35CC9554E896EE32CDD479766DB42D056D0A@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9i1RN+f7HC5UAoqLTSIGdXzpKHLAodfScGmZ1xcAdUZjNdV/TnZ
	 pyzED9jgLibRE5PqSPTBfLVOLu9Y98BQr5g9wTghxNqZHaR3dQrW20sjfl3cb46S4qxGPbNdL1hV
	 JjZyh7Ck2xSiWXRk+EmZBhM6AYMkbhfeUPdcnOuLuyfUlyHSFTEjDQvfqu+KDGpOLmE3OOZbNroH
	 1WfloOsanLVNhKjUYdmvNumc+Yf4DhRDlXQmrZ2DJPRQcYaZSNj6jAuPTheFl6hgA83hNFPPtB11
	 qfTV+fRHZQwo46wPe95wxMsm14JPELWmTcmNmRR1/lssZRcoSlKI/PihGi/ZLfK2s+gDCe90kivG
	 liDiqkzd62l42AcVF/ki4MpsDp+VPXw9PR0g+vZx75bnKJUcGP9n88umsNmzE4bxcHTvtP8Fy6Wz
	 xNLV0L3kbMVsCrfy0OQWrwlr/cVcXrXqpoJ1nzNRl4BTiJGiYDBN66M3CmD6YrjEWv47cPWM/BqX
	 li3Y2IczAC2id6SyVBZxT+foO/VvNmOpu3UoA90d8ekhzVDqBKExgV6ZKYAxAIF3HbeeHxZb2Tn6
	 g+29GYafOsvE9ShLN0FLoKRwCkoccVvlwRf811a8Mphl7Nsr2J/VrhJpWlS4CsvUkRFjVl0UkR0P
	 IuLjS9KkhlHvjRNi9IbrCREG1vJy8pJraK0HopwcdENuRqMtxJwjQYNHlSC8yEjIMC2CmnlCwBwj
	 j3riQVlzSWfEkDz4RCKVzMw8gDlKE3CNveVSLuaWi/GDzzRn/5pTkuSPxqNO2wVw8Wbu3Ilk16VB
	 bSdu1DWCXJJlhiFqJVVNbE1OpjLyueJe3hU8ZlimgH4pfQ3rFSuogSnXbkfmocc1vUb8bAF+jCBC
	 aX/UAUyK8eVwB4YvkOSUCSbs3avpmYOvDr0O7KlzyqxGEmaKL+A6xeTlgiPpnythnurd3FgWj1cE
	 +Kw/0+MMDvRV9UN2VOX5i98Bn4ooqI
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	shaggy@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] jfs: Regular file curruption check
Date: Wed,  4 Jun 2025 14:48:43 +0800
X-OQ-MSGID: <20250604064842.3129343-2-eadavis@qq.com>
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

The reproducer builds a corrupted file on disk with a negative i_size value.
Add a check when opening this file to avoid subsequent operation failures.

Reported-by: syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=630f6d40b3ccabc8e96e
Tested-by: syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/jfs/file.c | 3 +++
 1 file changed, 3 insertions(+)

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
 
-- 
2.43.0

