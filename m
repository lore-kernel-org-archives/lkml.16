Received: from mail115-118.sinamail.sina.com.cn (mail115-118.sinamail.sina.com.cn [218.30.115.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6656214203
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841064; cv=none; b=bYA9+SLDUCO/D4yfzik7K2L7OQoxoWJruRVQnE8x9G9qF5YyersBvcxP7UqBIMta0XLWqiBIJco/W8mJCj2B9PFcTIdhlhklZRioxlAjAOhoDxxFFfgyo9/cQG0CVttn0LSj1w31nZiw2A5JrcdqIHOEOxQ4kx6pfgYsVnq+OD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841064; c=relaxed/simple;
	bh=WjClwccFUceqf8OyNGoex9z/S6aa9VPU8oHYXKa7CZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9qIlI/Nm29WZ/1AOAnpXC/975PVnJfY47QZ9VE2v9fuYcSarMs5lGZTF/ADh5dnYzozazlSAFS9O3XWS+P9onNyyMu32aiyjzb4ZmCmgjP+3bgzVngcKOUxioWzSsRiTz4V9h2ANQZzM4o0PM93Qdi31bDcJV7nSXrsYXi+y+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([116.24.10.105])
	by sina.com (10.185.250.24) with ESMTP
	id 67A49BDE00002003; Thu, 6 Feb 2025 19:24:16 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 17053010748321
X-SMAIL-UIID: 062A265ABE8F4F29B86D516E34759EF4-20250206-192416-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+3201be560ebfa39bc6bd@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] general protection fault in ip6_pol_route (3)
Date: Thu,  6 Feb 2025 19:24:16 +0800
Message-ID: <20250206112417.1996-1-hdanton@sina.com>
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
@@ -727,6 +727,7 @@ static void corsair_void_remove(struct hid_device *hid_dev)
 		power_supply_unregister(drvdata->battery);

 	cancel_delayed_work_sync(&drvdata->delayed_firmware_work);
+	cancel_delayed_work_sync(&drvdata->delayed_status_work);
 	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
 }

--
