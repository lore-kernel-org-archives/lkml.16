Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7373C25F970;
	Thu, 19 Jun 2025 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340647; cv=none; b=efQAOrdC1HD/Qj5mTipxMY447lx0Fq+K9lRKIZMaRnb7yQFRH9TNebcYCfUGUOIkqkUt/GAKoPIwVvM+VIIo6Pqw48WyueV34P7h6nRCSyrmnb1fbFHMwggR2/Q4PwEFGXP11c1UQJ7SRl6UrOUyu1N9gzVqm7JzBBU9zm285nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340647; c=relaxed/simple;
	bh=z/u0HFmeNKeBe1bPs3ygL8EGqjlpxKz4bhnkD3Ur7jg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=jK6Od2/VZ/bj/ufb15mDu4Zl6n+yTRtL/4Izi/ORLZI7WYwS7BMbAKC8UpXWP2KoxTWIv26EQ0qAovqeKfjNl+sDhzAsh+/zwyeagJkymIVvgGhrAvYFrSdIDrd80XL63gbljjEV1CIznR36Yl8bZGZ6kI9BGaXzihc5B2oE7AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=kucIh8Ir; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="kucIh8Ir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750340635; bh=j+yemY7T3ZzYFfiK5EhYYUxtRB8Upapi9Jgb0k4z9RY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kucIh8IrPzQEbzVHe72Q++AOItMezFB4ZBHdovFK4LknmS7RylNtTG8FfdDbf11uy
	 ICyrCM6rIGVgLl/a8HG7Z2duQ3d2SGC/DDbfcjANwoRP4BPKw7diss3lxqRBZU1Ijv
	 X7eBwa+KtZ3PczAXYRps7Pd4Jq5imrSfYXHgXnRc=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 96C05EBC; Thu, 19 Jun 2025 21:37:44 +0800
X-QQ-mid: xmsmtpt1750340264tpjkanzun
Message-ID: <tencent_5F7E6FB82C0D6CF49454E862ED32CFDC780A@qq.com>
X-QQ-XMAILINFO: OOPJ7pYMv25tBdY0UahIQDJggQZEttqz1YAXKzhowTZOpigoYf5M/Uj0XztRJm
	 44JmKpn2KOGGrnfyjWckVBKBKBmipt599LdFGvwDM4J3yVyQhZSmRsdGMRntaSVQrmXUjMUe89Rx
	 q2REz8TugXuEQAtoAFbmww9YMkhgrBEmTwb67gvuShs/O/gybjkhJlqTNCOIe/a1q7E+doGwPC28
	 qGy+1JTG7NiznNkgUHpKnes0EbGwUKgtIoBxNCirRRfuzw6Qt4ZQaP+BZ0Y5n8/v7tRDfXPnOBmJ
	 64OXdCq3qpmdpyEVntLGxjgzb54NSna8XnRmuPw3Zkj7k7s7d2EFe7qV5H6CVIwAZPFeDwlM9HCc
	 TacMovyFUCbBkReBhwLy8ePjS/hAH8tdJ1LoOHu8zEsptLefGOgpL3ReWFO1ql4ZVg4qiURI0MEd
	 O7zpoHkAOXe4RIRvNXomUD3oYsJvSyhEP/GnvRXDNdfCUahkn8YWaN+X1mAQtgmHCAnXrn+mJmNk
	 fY+dnEGUJ+b6OxL2LZReujpoXVtzZBMm0Q7T5t7yECFHoTGkD2uxSwc2BJprrEusuEVW2/mWZ7xb
	 PQ19LMmjrIku44XvQLzufXs12jHSP2LyFhJWCJkKcjnWlfhAVzg8hS59n8CK23/aaHsj0zZsZD6Z
	 sFmlcd3NZqg3ZzeAoT7eVVbzphxTzE79KVLSJVAu421s+t0dZpyiQ2MB8inQRNuq+H9XxRYNLGUJ
	 UUmGXlf6rFrWLNsdN0LN8oAvu5GB1Irdz50gSIDH9pYnanpuCYcTrpgIZDVng88BmnZqCHIwMXXR
	 fuFHOxisuoWoC3ehFr8Ova5+QqSZ/ZcrKIlKFSCU0xQEVErsOYl/X1FR10eALdoZhcPPRQKmKl31
	 3z5L653/xgMvlbefFIL5Hmb0mqD1+3UXBtSg4RfJX0cDl6uUXMBQ9cnO8IFgAJEsHVXj+mJIkOFf
	 SMWgmWMnRyJV7HO8MrNe6UywMEhMnx
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com
Cc: jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	mail@mariuszachmann.de,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] hwmon: fill it with 0 when data size is insufficient
Date: Thu, 19 Jun 2025 21:37:43 +0800
X-OQ-MSGID: <20250619133742.1768346-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <685392a0.050a0220.216029.0168.GAE@google.com>
References: <685392a0.050a0220.216029.0168.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the data size returned by the sensor is less than IN_BUFFER_SIZE,
it is padded with 0.

Reported-by: syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3bbbade4e1a7ab45ca3b
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/hwmon/corsair-cpro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index e1a7f7aa7f80..274864e8a8e7 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -157,6 +157,8 @@ static int ccp_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 	spin_lock(&ccp->wait_input_report_lock);
 	if (!completion_done(&ccp->wait_input_report)) {
 		memcpy(ccp->buffer, data, min(IN_BUFFER_SIZE, size));
+		if (size < IN_BUFFER_SIZE)
+			memset(ccp->buffer + size, 0, IN_BUFFER_SIZE - size);
 		complete_all(&ccp->wait_input_report);
 	}
 	spin_unlock(&ccp->wait_input_report_lock);
-- 
2.43.0

