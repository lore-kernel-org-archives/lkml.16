Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E155A2F2E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750381388; cv=none; b=JCDyfaj7+yv8Hup+eILxfrjVB35W7tKcMRTDqtE7PkLUriz0UryXVQx7/EgE4W99DnAhMHbbhODehNBsPYlLXKlccf6FmOXqMf7FpLhEAnR8hpEhs1QCCgvi+oPLJkqDVVSnoGc5kFCfSlQheMfhq1YC+jx/RYB0iLwVzOxJbn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750381388; c=relaxed/simple;
	bh=2c/vJaW+171fgL3caWJoyLPvSgz/ccsa48tvrkMMnp8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kFXTLLVjfXOGgZ+Ttclwg4m3qegvn0wOHy+dA+g+Gg1+xmGf3gx7YEVGX+2OUxjcVwwND2OM+4NsvXXR9mFjro8k5KS7po2nlUdzQq7+VGA7jcmdH3qEX1c8/yamwCn8RVx8TzdJOiTFpe6Cebt0dd6FDt7HcwmOY4YMM8u2bhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86cf306fc68so231113839f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750381385; x=1750986185;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5J7ba5hUuqmYXm8j+n1MWcxRGCM+HuokHSDcxyja/Y=;
        b=bjYPxn6BCIQfcKcOuohJUTjPM6XbcFwl2pnjt+f2Xv9nIpxAlK114PjT2WniqlC8va
         X0qOgqRY4VfQJsHYd96baYvX9aFqRv3njIMRDBIn5PjepWqkponpv7vw5P6ppYEfrB8m
         pg74A4ZQqHOk1D45a5SHvupYq1u8XAqJJu5AEFyMr3a/P37e70inhMzUoMdZu1StUg54
         1K1VxIDR4SJ5WUC5BR+FW3gSWKGyp/SJS4YtrfwDKAag8FoirixPDlUjQtVPs2DnxbKm
         1U4NQVQG6tFYHdM+uI20dP65/UyZvhBQEyWm3psotC/Q0Eo+i/44Lopms+gH7JcepqCh
         2wYw==
X-Gm-Message-State: AOJu0YzU+R1sxvBuedFJT/5tbyVJZTZunUE+cwr+iA59MukdcUAJeUjX
	6Dx9B2m6cTPJ+rsOq0qPBFwf0AoTan+d3C6mQyznllxu7TYvD93MtohUdxC2y3jKlkrOZo8/eWW
	Kx9aPHQeYtAym55nTFnNiL3gaU3ipPdpItfcLSbDyDg5Py8KHLR0ENuD2RiI=
X-Google-Smtp-Source: AGHT+IHarrBpz7y9uocpwIiM/HI9cpo4+GPRjHYg/LWC5CDY4O+2/6rbhwmuwC0q/7DZzqZ0jrTMAwABW/+lZGMc83QYPUT0TUXh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:221e:b0:3dd:d6c0:cccd with SMTP id
 e9e14a558f8ab-3de38ca54bemr9316705ab.13.1750381385093; Thu, 19 Jun 2025
 18:03:05 -0700 (PDT)
Date: Thu, 19 Jun 2025 18:03:05 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6854b349.a00a0220.137b3.0026.GAE@google.com>
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
index f22b44827e92..fe0f18a0fb63 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -314,7 +314,7 @@ int vmci_ctx_enqueue_datagram(u32 cid, struct vmci_datagram *dg)
 	}
 
 	/* Allocate guest call entry and add it to the target VM's queue. */
-	dq_entry = kmalloc(sizeof(*dq_entry), GFP_KERNEL);
+	dq_entry = kzalloc(sizeof(*dq_entry), GFP_KERNEL);
 	if (dq_entry == NULL) {
 		pr_warn("Failed to allocate memory for datagram\n");
 		vmci_ctx_put(context);
