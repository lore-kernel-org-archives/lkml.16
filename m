Received: from mail115-118.sinamail.sina.com.cn (mail115-118.sinamail.sina.com.cn [218.30.115.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304CE2417C7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738930222; cv=none; b=WjLsoQ5eyNv9bko5UbFbM2gereOHjqWga4xIV+bi6jdzvjbOBuij1U390SpEX7ntqKySSSXlQDuiTYLkxRki0jJR4D8tF0M7Wws7SjpOi/J2we+KjWyxrCLKoVtJ0PohYBRCPwllsF1zqnnPZaOLm9Lfs8x6xZBWcUjkT/3zUUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738930222; c=relaxed/simple;
	bh=MP3WVOfPMvlT9wYEbM+CWX1aX77PLzB8qM3Jn7JnkW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOFGTTmP3Z1UcpgifrWUapIafZGSZDUqkt7TtCSrMZ1/37g8iFygN5Gl852oPKuh2OHH4HCAGBscizuvyUsys4RrpVcMHNpSoF3fg0309hH5Yg5YumBkH5tMQSLzlsNFIiVTKs8j2SKjdYOR3eMnzanK/aOpvltH3lp/anDshdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([116.24.11.16])
	by sina.com (10.185.250.24) with ESMTP
	id 67A5F817000048F1; Fri, 7 Feb 2025 20:10:04 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 45361010748387
X-SMAIL-UIID: 5483E0C61FF74A2FA1B1BB89A3A6CF33-20250207-201004-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+3201be560ebfa39bc6bd@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] general protection fault in ip6_pol_route (3)
Date: Fri,  7 Feb 2025 20:10:02 +0800
Message-ID: <20250207121003.2030-1-hdanton@sina.com>
In-Reply-To: <67a21f26.050a0220.163cdc.0068.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 04 Feb 2025 06:07:34 -0800
> syzbot found the following issue on:
> 
> HEAD commit:    f1b785f4c787 Merge tag 'for_linus' of git://git.kernel.org..
> git tree:       upstream
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1209e4c0580000

#syz test  upstream  master

--- x/net/ipv6/route.c
+++ y/net/ipv6/route.c
@@ -2258,7 +2258,7 @@ struct rt6_info *ip6_pol_route(struct ne
 
 			return rt;
 		}
-	} else {
+	} else if (res.nh) {
 		/* Get a percpu copy */
 		local_bh_disable();
 		rt = rt6_get_pcpu_route(&res);
--- a/drivers/hid/hid-corsair-void.c
+++ b/drivers/hid/hid-corsair-void.c
@@ -726,6 +726,7 @@ static void corsair_void_remove(struct h
 	if (drvdata->battery)
 		power_supply_unregister(drvdata->battery);
 
+	cancel_delayed_work_sync(&drvdata->delayed_status_work);
 	cancel_delayed_work_sync(&drvdata->delayed_firmware_work);
 	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
 }
--
