Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AEA2248AE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402358; cv=none; b=AT45gwGW+Y/uJ7g4gmP1ivzHCgNRP0dmXdr0FRoYBlOUWc96PJtyXxJiCRVqFPsEODmk9FYCc8PKfGNq3BqtHh6F90TQmC/1vwnyu9EfpZrterxoBEO+lxnRIZasy18p8xPeRNavbpPm6CJFc07dUTlvGyGA+YlfEW3oFJs2GEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402358; c=relaxed/simple;
	bh=i3qJPEOZSBMcOOTdTL3n26PwhBqhw+NNisPw06PYWKQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VM60Hc9DK3CqslvZg+i+GgL1iQqYnFMdXu3d+sgI/4fgoTYOiJFeTldag4Q8Cm2q/AFRe2VVrCdRWGFkDMKEnQXAGDa7/Cp/x0zk0SgCD5QKdv3VcCu+ocXEt0kwiqjEmJ1btvGFHz5c+2YGh4Q71Qk5FHyFU1DKubJ+COXY12M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3de0dc57859so14260015ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402355; x=1751007155;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/EH5omuFfkyKrBBvQT4tQ/G4Bs0xRq7JOfAnuQvpOU=;
        b=dR9OIXy1G17Guu1odXoVn2e7/RV3i0SPvO+waEKaoW/SaqHFcdimPLT6cu1Bsl9qsx
         bfZWpQNa7t6p+UAEhP6gsUECZh1C7kEqqk05UkJs8vqn0AVgxq7eVBZ43gQUyH5/mmQ+
         acnLsq+pDt1sNHbrRv2BEoM73l/9wnLnpjDqQu2omO5CJ4chIQh4Vny5iaFg0OOVxbVg
         bNZM3a/8YO91ylZPDovD7IP+KxHxSCxD1lsQ2PIzY5ikZwIQpkagE+pewfP6HI38OJpT
         2Xu9bD8PSjHZQYvg6PDWMZF/zffb4sSvGtHJLg4jxaC0gFwljhvz6vJQMpkeKdn9G5+P
         Ei8Q==
X-Gm-Message-State: AOJu0YziGBt5M2WjUjTF8WfF8svj6V2cAPo9Xhm8XI95frRa72HGAkAG
	vadc1vRuQvw6d/GQwpbFZ6QuN6kof/d62o/ose6elRrRDs2r5tKSuclCoq2/UHdEspYJGR9fo6M
	2t9yNGLdjqm2K+9Y4sPiBWFS2EJlaFSgf6IcyyzUAjw4LYtH0rSrk/nvD3p4=
X-Google-Smtp-Source: AGHT+IFY0ShTF9Q3c5DGKsY/r1ktd7RWg7sN9IF7V49M//EsdPWx84YUzkEQ3kgESS/B5rO8Tf8WbQ/uaPb9/3hJW1X9tOui8SoS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3102:b0:3dc:7c9e:c3aa with SMTP id
 e9e14a558f8ab-3de38cc2b51mr17092785ab.21.1750402355608; Thu, 19 Jun 2025
 23:52:35 -0700 (PDT)
Date: Thu, 19 Jun 2025 23:52:35 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68550533.a00a0220.137b3.0034.GAE@google.com>
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

diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index b64944367ac5..e67e6ae48e83 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -398,6 +398,7 @@ static int vmci_host_do_send_datagram(struct vmci_host_dev *vmci_host_dev,
 		kfree(dg);
 		return -EINVAL;
 	}
+	memset(dg + 27, 0, 4);
 
 	pr_devel("Datagram dst (handle=0x%x:0x%x) src (handle=0x%x:0x%x), payload (size=%llu bytes)\n",
 		 dg->dst.context, dg->dst.resource,
