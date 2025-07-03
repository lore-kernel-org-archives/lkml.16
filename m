Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CA428D831
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530161; cv=none; b=pjBFhEan8jHHcEW9W2cQK2qCge35OoBrxTz3cXSqZxqQ+F5Ynm6MVGhssihSJ41FhxaCIpWFXBivGTqroHq1BoyxVZrI3z+5qtcie7po5eTgNU/vuZbTTUaD93sOxUqk+TKpjBCAVH9mj0vkY8W8MKMcp0gZmYD+NzKN519XUpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530161; c=relaxed/simple;
	bh=7kz1c5fC3mHz1dZtPrhNH2p83FJzOTiGUYT474GRFgc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KdXLeiPo5LtqnvEzh8fQvq315caEMVc4uR807HxT/PVUNAMU9Up0kl/DOQ6N4/R/NDrM7ghNmZZYDT8CtizjjdfJzFrWl1ll7kPZXln3sm4e5lw19UjR1KROcjwBjL/eXC60B0s0+33Lpuu+VxFrgOU250GIoPbpi2QnrcG1F88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86cfe68a8bbso536870839f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751530159; x=1752134959;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx9zjGFwIojlUcXS+V08u1moDL+cncesvv7SbhTJizY=;
        b=bXFKpi6AuK/LFxcrPZBoM0cZ18b1B3GthIIQ/ZChCiJHM0yS0a8cbyFQQdPF9utpHQ
         HoGpz76huLiMg2xTUPaJRFifGxlh2CTXG+dWBu1yV4fhjQ64g9x6idfSyMSvw1ugOymp
         TD3OqkNl3jMTxj4dVyHCrf1ZHBP6tx9C1Ga9pm/i54+tl+o1XRsutg6ixMqT8pOIjscr
         CE4SpDq14Hm3+L2ECXYrlTuKTNcm5lv53BH2SE9z6+M2WF6hyIIOmZ8pvAlK3w5vwj+b
         B+HJpHy4MRoaz0xNQEYYwa9sTtKpEm5UzXhVyJf4G2wVCqiz8LjjlxW7dVn8CRLVSkQY
         4wzw==
X-Gm-Message-State: AOJu0YxsZUITo9kggxU/c9OYERZaJLhIFACTDySndm9mSFMhz0ydsad5
	/OddRIovO1YSYuhdybhw9zYCq6+GRXXk53V6Epv3o4D0U8nDcpsThL/PxCha8a9/nqTLEeEVdG9
	ztIkCcdqaiAO8MENzQcY576lRMZWTvx6U2zOB0wT7EXAMZd0oPfqcYQXlUr8=
X-Google-Smtp-Source: AGHT+IFsg74VqoRFfrj3MvpD0qBfa3/E2ZBKDtRDAmUHULPvIBla6FRZZ/qxOPaHW9q3oeKjZnQhjDktR3HYx3oMUMJlUpfJ4Oer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2cca:b0:874:e108:8e3a with SMTP id
 ca18e2360f4ac-876d2136dfemr402567739f.12.1751530159228; Thu, 03 Jul 2025
 01:09:19 -0700 (PDT)
Date: Thu, 03 Jul 2025 01:09:19 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68663aaf.a70a0220.2b31f5.0015.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in
 vmci_host_unlocked_ioctl (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl (3)
Author: lizhi.xu@windriver.com

#syz test

diff --git a/drivers/misc/vmw_vmci/vmci_context.c b/drivers/misc/vmw_vmci/vmci_context.c
index f22b44827e92..c4fcc62761a7 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -251,6 +251,7 @@ static int ctx_fire_notification(u32 context_id, u32 priv_flags)
 		ev.msg.hdr.src = vmci_make_handle(VMCI_HYPERVISOR_CONTEXT_ID,
 						  VMCI_CONTEXT_RESOURCE_ID);
 		ev.msg.hdr.payload_size = sizeof(ev) - sizeof(ev.msg.hdr);
+		memset((char*)&ev + sizeof(ev.msg.hdr), 0, ev.msg.hdr.payload_size);
 		ev.msg.event_data.event = VMCI_EVENT_CTX_REMOVED;
 		ev.payload.context_id = context_id;
 
