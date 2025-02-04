Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn [202.108.3.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87535948
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738629903; cv=none; b=MaP2UF4JwSfmEKXWmacYx72wOKTujw3TzeMggFXgVPhaWmQUgBR0+rSuOA6SKk8xhjO7a0HLWnqYoDm24MMA/nZzuvbPyy+h4Yz76mcnLbFcGb+eHEdb8tJASy144Cpk/oOjSRoEPSQiOoyM2gz1ZC6pr1Atcji/7/QDcZ9cfIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738629903; c=relaxed/simple;
	bh=xKj1h+EVOB9aJrgyau7IxTBYU+V85ESof7deeIpiP+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXDXPCwiHZGnEHQNgmxp/6mOd7LEdgszlB7KmLHyjTj+4vR57OEgtNxADh0+iDEkqLppZwsTlbPYAZhTWLPnwooUC85MM9PHFnav5HRjE1IzuLYDXHlCPGwl37DqZHsKbF/R057SyoC2RkKm0COH+40JvFZ0JSAn3YfbHlAie0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.56.205])
	by sina.com (10.182.253.24) with ESMTP
	id 67A162FF00005C24; Tue, 4 Feb 2025 08:44:49 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4121001048608
X-SMAIL-UIID: EA067141246E4D818D6FEFC793F663A8-20250204-084449-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+ac826dbeecf212c395a0@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in corsair_void_status_work_handler
Date: Tue,  4 Feb 2025 08:44:34 +0800
Message-ID: <20250204004435.2084-1-hdanton@sina.com>
In-Reply-To: <67a12543.050a0220.d7c5a.00a9.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 03 Feb 2025 12:21:23 -0800
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    2014c95afece Linux 6.14-rc1
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e26eb0580000

#syz test

--- x/drivers/hid/hid-corsair-void.c
+++ y/drivers/hid/hid-corsair-void.c
@@ -726,6 +726,7 @@ static void corsair_void_remove(struct h
 	if (drvdata->battery)
 		power_supply_unregister(drvdata->battery);
 
+	cancel_delayed_work_sync(&drvdata->delayed_status_work);
 	cancel_delayed_work_sync(&drvdata->delayed_firmware_work);
 	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
 }
--
