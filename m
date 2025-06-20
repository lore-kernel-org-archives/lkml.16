Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3F578F39
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750396997; cv=none; b=bK/jUaRRLlhujOJ8vgxhkjkbiHGn2yB/uWEVB8w24QqOM0EPvGuoWhVQW+9r1hgjGT3aNWTo9GPuhm6hwZMX9Qf8kayRYFAvZfcIGMQi1XHhENxqaaVC3/mOQSLP0hIf1uJwPEceeqvqhI1mVirtVKVlMhdeh7qSCPsJ+RhoiwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750396997; c=relaxed/simple;
	bh=Rrvv4GQ1MLHzAoiRCRLnWXO5rNLHExzZp57A8T63Lio=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LQAaWnjOSCJjrkA2yTl4vQP+KHLKzL8ZXIN2Cc0qONs+gb77+mhj/72MNEPHlfp58qBgHASSQuGIoxlwVkG5j3zRc8zjP8PkVPxu5GbLM+Q+WWwWbqnSaB9I626q95LNVCOUlgv1QlJ9OWmBy5L0hyCV01BTzUVQgeEaW3xIkwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3de121edd59so34289085ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 22:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750396994; x=1751001794;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1IRxfS/tPWylb1xh7Jk58VXyiVrsKaiQcTtcbSnAIM=;
        b=n0mZUKvdQIOQ9pDL4Htr9u7+xZDuCdx4xKIhhk01K8n72ZDIuu/47n2gI013+6lOab
         a6RCEb++66UrX1XmnR8qR3vih1Yfu1D6QYN+3MIxn2lo+UozjpbH14sUqHvHuOjIXuA/
         uTDIV1qukwyzFHCC1U31UhMcq+wRghsRinE8lMcYIch7SPO4+I9VYsIyJvvK87mMIJ4X
         +gqe4fpRLICIySbssknJ/Ge17r+cF+D33F4s2STZDF0Sm+R+uFsHmaPWobNXTErocwuY
         Y+NrKPVkPCxHvGisyx+/Ubkrd3t/emCN5dr6UjazuHW8nPotrS2+wsma34sj2Lr2Y4wG
         RM/g==
X-Gm-Message-State: AOJu0Yx5NyOji2HZMjuz908Zp7AGioK+739NjFJVMPFFHXeLpHKxASKc
	z/QwW6gIp81kjmYndiyJrKeTZ7B2EFmxBH6kPJYUbygVGDNwd7aBtHLOtZFzL17cShdlph/Uu4p
	i4zeT9KLBhOv6AUd6cDfDfCO9SBDbGbYtjvj3zGHoNrMX4QaIvLMsVpKqC7U=
X-Google-Smtp-Source: AGHT+IGAY+9WcS8v2YfcbQqEEYILeFGvkgJIOnCnoo2KJvVzCwcCRTznta+yIaPPNRDpD7Q2UXOPka0xSXbuQd+e+FYC7qBMvk/N
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2703:b0:3dd:cb92:f148 with SMTP id
 e9e14a558f8ab-3de38ca2f07mr16357465ab.12.1750396994733; Thu, 19 Jun 2025
 22:23:14 -0700 (PDT)
Date: Thu, 19 Jun 2025 22:23:14 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6854f042.a00a0220.137b3.002d.GAE@google.com>
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
index b64944367ac5..178febf6c561 100644
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
 
+	if (copy_from_user(dg, (void __user *)(uintptr_t)send_info.addr, send_info.len)) {
+		vmci_ioctl_err("copy datagram fails\n");
+		kfree(dg);
+		return -EFAULT;
+	}
+
 	if (VMCI_DG_SIZE(dg) != send_info.len) {
 		vmci_ioctl_err("datagram size mismatch\n");
 		kfree(dg);
