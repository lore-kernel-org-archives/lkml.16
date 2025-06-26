Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE1013E898
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750906153; cv=none; b=Pyj9bGwBnq9chq9yz3LH1Ajz+waM5zvoX6VpU7sy2kXR2X8BUMo1hBDhKw8Dm+vpLLdQCWBV65VY/kHALSZsiEL+KopsluXK1qfAzFna8pJ8MbNDRT81Bo9JLbDd6kGvf/Lc6LyjyDUJn+WHEw/djTY5Hgk1xYOl1IECHlxCuVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750906153; c=relaxed/simple;
	bh=sAot5RFGE+3bsQ7+ya5wx8AdzVCdPYrxYWRz8ze1kZE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hXXQ47IvjgOEDIsuD5CkgUw4KfpdvWrFfuIu5yuUTRFLJ0J5kjKzSqtDTud1w3pEe8zYLkhwO+fU9a3rb360aaCvh1XGnoTtZjzoyjTjygsIGdh5OWp3DWAqMsFmbTeM/sVkslamc+jl0V1CB2WzFe/GpStSJpoO/ChwJpGSl/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd03db21cso7591885ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750906149; x=1751510949;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMeeKMzugMr6rAfraHsP1/mGrgQjCmrbV88/rg/kWgY=;
        b=dC6OvFZOqZKHqKMfQFOddrhmqIhjmL0k2tgN0N4uJgwXoG0YEf4POcJQ/dq5Vp7RTx
         CV6cjrrmiV/1C/qOUwtH4fsVX9+6WMJqR9F6KfmtcI67+9Um8XKs+VWIZqfFPXgeT1DR
         L5z/01YiPSOiXcFssolGizx9/ytsh3ipPLOI+3p3yJIbhh0B+YO4mQwhdOJbWeMis1E/
         Gx7npvy/ubapG5jQvyA6TgQyW4w5DW2CveedTrqUx/tzuqG5GX691klTl2VS0bB1Ge3R
         eMeoe/Dn2jw5aHP0GUTXj9tWfPjk0IZvpHDYII7MCJ8Gg6ulEF5jptjn7ofN+6rtNH3F
         RzHg==
X-Gm-Message-State: AOJu0YyR4hGMrJbi+3eQ7l/lOPI/mHzPwhGAttIMAbc87RznuBCyxByp
	ZgnkjHUwz1MzHpXusYFS2ZKCQ2HZ9TyOfXHI8jwuSNF5F24VWKcG52mEnDLPcClD6KweR/P3Ap8
	jtAgs9mZEQip3WT4O8Tn+7jbZIpwoz3K4fgkQsVEfyFlxmlWAuE5Z/2H1alU=
X-Google-Smtp-Source: AGHT+IGHRDhY0n97IhOZUCUG7ARaUOHMeL09bUf8UYYbgykpPJYzmS2zRSZ64NezxSWpqtDhUkB3AQU3ajeuCGMloXLjmjWm0ybS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:248a:b0:3dd:ce9b:aa17 with SMTP id
 e9e14a558f8ab-3df3292bebfmr76374115ab.20.1750906149592; Wed, 25 Jun 2025
 19:49:09 -0700 (PDT)
Date: Wed, 25 Jun 2025 19:49:09 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685cb525.050a0220.2303ee.0101.GAE@google.com>
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
index b64944367ac5..2d7a828749d0 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -91,7 +91,7 @@ struct vmci_host_dev {
 static struct vmci_ctx *host_context;
 static bool vmci_host_device_initialized;
 static atomic_t vmci_host_active_users = ATOMIC_INIT(0);
-
+static atomic_t vmci_host_dev_open = ATOMIC_INIT(0);
 /*
  * Determines whether the VMCI host personality is
  * available. Since the core functionality of the host driver is
@@ -120,6 +120,11 @@ static int vmci_host_open(struct inode *inode, struct file *filp)
 {
 	struct vmci_host_dev *vmci_host_dev;
 
+	if (atomic_inc_return(&vmci_host_dev_open) > 1) {
+		atomic_dec(&vmci_host_dev_open);
+		return -EBUSY;
+	}
+
 	vmci_host_dev = kzalloc(sizeof(struct vmci_host_dev), GFP_KERNEL);
 	if (vmci_host_dev == NULL)
 		return -ENOMEM;
@@ -155,6 +160,7 @@ static int vmci_host_close(struct inode *inode, struct file *filp)
 
 	kfree(vmci_host_dev);
 	filp->private_data = NULL;
+	atomic_dec(&vmci_host_dev_open);
 	return 0;
 }
 
