Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B19DDF60
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 02:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738809635; cv=none; b=lMwdoLw9qrjLlR74IXuMdgAx1UmTROhOl/G4fZKipWnFPFY7bBbfxa9sK2A9DqJXGWKKBJ5yRhKr4SZXItG0zNGq0Lf9qwqSiIw6ijpULRH2zF7H4uGL9jzmCFRLmLOPprQAQwfVMnE728rDtA5DJERbeTqpLD1GyHg/TYfPDYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738809635; c=relaxed/simple;
	bh=0PwtMTx95ciNwUbMvTzbpZHokyQ1jBe+K1mdKDU6FoE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=RsgGNB4dtvxl9v/iJX4iGyyKWTEoTPFOV4PYvij/OOxq4s6+9PTtkf520ObAi9j/OLrZDdbLb/YvFyprKeaP0kC3RcQ+jMkitzujDOXTsHbNNDJQRS60F4AZOCh+iTIi+KqDLpukZr16MZT+G8h2CJmSJWKE9zRkJf5rg3D01vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=CykZ4A2L; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="CykZ4A2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738809315; bh=QotvuvipPoMnCUSbbrv5MtAfQ4yU4+XV4UyUuFwjeyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CykZ4A2L2dbCFFJ38RGO2RdZcDuhFxi5E1ypstSuP8iF1CTj0G5w7zjFMc98eeiYK
	 Rd41c6SYi1N70Xe+/O9SshvJZEqDoVY1hYjAuIASkOBhQL1t1WIwydHNkD8nt3qXpT
	 4BBYLaYSkKVHRZ62r7dlh5yDiYAUONv90eRwVrTU=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 8CDA6EA8; Thu, 06 Feb 2025 10:35:13 +0800
X-QQ-mid: xmsmtpt1738809313tl4qbawxz
Message-ID: <tencent_447A36884A8A75C577A166683D2336A09609@qq.com>
X-QQ-XMAILINFO: OCYbvBDBNb9rYo0SFQKYUZvzPK5PMQqnSZJdTWJoT4VznIOnwMWI7aVmg6z4X7
	 yM9DU7LWMxE7VjSOw824L0ngLULV1qUN6eg06i7t6Wep739wRHzTg6CYPwJMhEYDiAs6KWb3Cer5
	 WZz6j0p2fX9gdSief+sZEpLEfx0Iz97sq5C70XjhKRJGSGDH9LVykolKtyHDV1dDR2do1fDFHdRj
	 o80vM3R4feSZHCnjQVthRECc0MfSksdmtVLTi48yID15bNcMsdKvWNEyTyM0z5N3UvnMZ9IWvh+T
	 Jr4y+LKvWIcTHuIAx70rEmjSmMnoSUURQ9xuRITJ8FH/dym5qt28+3W55OurGuwxkjcWg0h/b+wG
	 GSeRNUrLYn9isxkg9j2gVrFWxvAOiSWUMio//MYvJaIGlstchIOzSfEaJ4IvhsRnukgcvDzRX+6F
	 0Mbetsvd9/fGEaISjhwIddbyfpzDKiRu7jvfGnPEPwoIdBVhxFK7xqTNfyBUaPc4ob4Dfh3Yy7yM
	 UTKR53Q+wslznkz7Cu8Mi0ezkF9pydetOGn/98Nfbowla1GIb5TjfjuWfvnld+gqIRGTz3OZek19
	 /T85NWSDCqyUq/97KtiXwnkeeSBOsYnGgFaNPX1es1eJkjCNJ9Lr5q1ds+HW3Wk3pLRaO3mYXoby
	 XfQerf1TUlEzvaiCsWD1liZd/T9nL3dc70HfKGRxAzOicTHLhRd7dZj6JihrE363zWE7TONH23l3
	 Ct6rJ8yKfWP50uBx743QfVnUz3B/3JOR5LB/I0dAg6k8crbs4kclmNGuSE+vCmij/T+vSK1YQHoN
	 cvq546ns65voOdKByg7UNK7zpGXVfZw62L9fAIBcdIWQFyez+DGB0DFJB9xp4nY3HH3jWal+njOf
	 sTEFA/37eUAoaACHbHDy2UnYW3rrfbBw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+90ac8355c8ac84b1b464@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in usbhid_raw_request
Date: Thu,  6 Feb 2025 10:35:14 +0800
X-OQ-MSGID: <20250206023513.92591-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <67a3a3b0.050a0220.19061f.05e8.GAE@google.com>
References: <67a3a3b0.050a0220.19061f.05e8.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
index 6ece56b850fc..83d65fa29a5a 100644
--- a/drivers/hid/hid-corsair-void.c
+++ b/drivers/hid/hid-corsair-void.c
@@ -727,6 +727,7 @@ static void corsair_void_remove(struct hid_device *hid_dev)
 		power_supply_unregister(drvdata->battery);
 
 	cancel_delayed_work_sync(&drvdata->delayed_firmware_work);
+	cancel_delayed_work_sync(&drvdata->delayed_status_work);
 	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
 }
 

