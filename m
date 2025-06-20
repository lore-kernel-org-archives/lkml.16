Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFA029B0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 04:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750393263; cv=none; b=s1P4wx4+zOnTvrWV7Dap1HvfC0Ma1rkfvPG9lAaVWCmVXMMIMrAJGcg8GIj2KbMu92i5v5aPc1a6mLRYyQmo0t9zJC2ZDMQpO/chSVe2lHLL8udpCTL2CwYKm5mvfqyUSnVTDvS+HBjamBZOws2sDuH4yR+cGOOW+p3OTq4aoXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750393263; c=relaxed/simple;
	bh=A1GpjTS5DB+uZDUTzSdf1VAwAiSNnfHCQ2bX5v+31as=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZqaNw8VmS/8wCCwevZ5e6A7GZj5hnzQ8Dy1G+LiEEG+FjlkkHkd/l0FkHs6R8Gd846usBfJUcA1PGcS6Ng70YengMm/6Z6JoWa07WBNrE/4gNdbh5LTbKQFqC4pF3WE7xWtibwSf3vRcIujrCXz2Fhj+Q2iugN6YgZ0mK/DUw1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd5311fd3so16945495ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750393261; x=1750998061;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VznbCQacy3m13Q8Ajr0kgsJBCd0p8qXaHBYKP5bk0Ls=;
        b=hSRxNh2oxABGihtk2d5XahntN3R5TNL+ArYE27Jj6lRq4k5tSYp7lXYNzyblH89NAm
         7CMIO989A+m2nicJgwNvfPNfEZ7K9ka3S8tKPZALkKRYy/eO6jZCojEiejeUqByndTkZ
         rqGdtYJzVDL7MGrnUKRcJSsfVEkIIogiALBrlLbXxJl5p/sPE9kyhpjiv8uvuePpMA2s
         TiRIExMsVE53pXkAz+G4DBomp7IlmP94cqm9i24r1MzN8FEocm1FDuDYivAU45g6n1Ms
         sQcQgyOmGe35WpUGDk6uDazYC0HGu1cORGwQLKlgldar1jhqnpJv/ys9XC7jApTIGyOH
         gcGQ==
X-Gm-Message-State: AOJu0Ywv7Jy6prnIqEUU5/dZMJ2/AHnMlH+awIdDo1/J5JQgPdywyG3o
	tkvl0tpLHUN2xVVRf4vNm1nM6bml8EJRPMWG/4GL1iw/5sVm/nNvFzuA64HynvoTaW+z3xuNXB5
	Jwo/Cmu8Y3nPdEuWHJkoqy6sQ9Y4S4n9XhEjA4fiez1UL0BK/YTKRl6FCcf8=
X-Google-Smtp-Source: AGHT+IEOFYGpCZO2GkfkPImiCPtCPyiPZRclqp3C8jwiIDzqJ+JO9EPknzYmtQHhlo0EqXC5mz7rGuXxynbUy1kg/Q/B7yEjUCe5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1905:b0:3dd:ebb5:6382 with SMTP id
 e9e14a558f8ab-3de38c1becemr14820325ab.4.1750393261009; Thu, 19 Jun 2025
 21:21:01 -0700 (PDT)
Date: Thu, 19 Jun 2025 21:21:00 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6854e1ac.a00a0220.137b3.002a.GAE@google.com>
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
index b64944367ac5..fc5b49b05afd 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -385,14 +385,20 @@ static int vmci_host_do_send_datagram(struct vmci_host_dev *vmci_host_dev,
 		return -EINVAL;
 	}
 
-	dg = memdup_user((void __user *)(uintptr_t)send_info.addr,
-			 send_info.len);
-	if (IS_ERR(dg)) {
+	dg = kzalloc(send_info.len, GFP_KERNEL);
+
+	if (IS_ERR_OR_NULL(dg)) {
 		vmci_ioctl_err(
 			"cannot allocate memory to dispatch datagram\n");
 		return PTR_ERR(dg);
 	}
 
+	if (copy_from_user(dg, send_info.addr, send_info.len)) {
+		vmci_ioctl_err("copy datagram fails\n");
+		kfree(dg);
+		return -EFAULT;
+	}
+
 	if (VMCI_DG_SIZE(dg) != send_info.len) {
 		vmci_ioctl_err("datagram size mismatch\n");
 		kfree(dg);
