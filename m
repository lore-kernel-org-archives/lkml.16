Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450A7125DF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 05:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749186979; cv=none; b=n9BXWhdB4f0VKpERwOSq3f78WcIgPauXwLj551w4vhMmoEfwYXx1XY7jHSf7b0zRW3DN+VBMxrcC+RBEXgHmTjqw1Dr7FOCr4Pk39w3OSrmh7dGMLKaE+9zbRekOD/UJebC6+31afQ5xUXCtaq6xNimIsiA62HDKCAhm69pxZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749186979; c=relaxed/simple;
	bh=IxwqCHrACqYgymgSUXeVUNou/uoy837foUaUXgA+0k8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=V9CxZdUvZ19f16ziUdM8KunjwkTZT+DYAFyRfolwQk0MgtR7uvhsj+xN/faojlmGSAPwxjsHWvX8QbMkW7j5Zl4hQ1lznrU0jVjB8HIT8TZIrG/93G/NfqiUmFnQkFhmCWfZkPyvxlwcAkKbwNPQXEOzy3AhM0my1NKyb5ZHP1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd02c8bffso4232405ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 22:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749186977; x=1749791777;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCYACXMzeBDcelPE4ghIGAS5eRuewYDXuoVSiKWHsIc=;
        b=hrfGEdthVz36P5SC43T7h6HaoryZrtb/peJBS2dudFXkPBx+2YF78W+sfsJz1U9+xh
         5WGh7S37/HQq4vF7YjuT+35gNPc8fs5iFxhRUqeLJQpTYsv03qFnxvQ5oCn/A7IkmNVd
         FPlURPR3pPPNsPU9a/rlPXE55ZwGipG+I01TocFnzUHhKxCnNNVx6Lju0vaVVFLo+Og/
         rRBsXgy5wnSmnvvJylef0/SwISXl5CNnD7jb1UkAzjuPjUOJC2zjqHELeAJqtSU6dePU
         HI++DGZqeI5hCoN+nEVg1sPGnnf3ONFODetQdcIrZonPseGYORCQ3PpSqdUxFIk4w+mP
         YjwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOwr76l6nnsLUNuWQCK9xfUOIkL6Yeta1uJfBhdPdOUzEAO9IjN2h1bGCQ7qCBZXGPWNfSQMIlqlgga2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnMFt4mjJVJ8qO8G0bAtgmL7nEZqAom7x71NgV3xTFyJPngMr2
	LA4loJfHM4BH9JIYtJeNEb7u0vZWw8oubuONfZ4/eQPXZChfCwobMwpWl3ua0z7WP+m2mZ1n8Yu
	7A0IF5i/dgAzgKti2u5c1rhTSq90KC5j6CuD98vdLlfAC0+ULIk+R2ax0emM=
X-Google-Smtp-Source: AGHT+IGhuvLpAqQS7I+2m7Z9XzaPSkpAbybNsBDhKs5bekdBoj/OxhLRNHPqegbI4xxKRxzGwDGBXZgJ2CNvGDnzLy8AZrhAqumS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:74a:b0:3dd:cdff:2160 with SMTP id
 e9e14a558f8ab-3ddce505a66mr23928265ab.17.1749186977327; Thu, 05 Jun 2025
 22:16:17 -0700 (PDT)
Date: Thu, 05 Jun 2025 22:16:17 -0700
In-Reply-To: <4a7f4d21-8b1c-4616-82bb-210395215035@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684279a1.050a0220.2461cf.0038.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in raw_event_queue_add
From: syzbot <syzbot+1e3edf922962b5ea40a4@syzkaller.appspotmail.com>
To: ipravdin.official@gmail.com
Cc: ipravdin.official@gmail.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

This crash does not have a reproducer. I cannot test it.

>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> index 20165e1582d9..d7fca01afbf1 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -120,9 +120,13 @@ static struct usb_raw_event *raw_event_queue_fetch(
>  static void raw_event_queue_destroy(struct raw_event_queue *queue)
>  {
>         int i;
> +       unsigned long flags;
>  
> +       spin_lock_irqsave(&queue->lock, flags);
>         for (i = 0; i < queue->size; i++)
>                 kfree(queue->events[i]);
> +       spin_unlock_irqrestore(&queue->lock, flags);
> +
>         queue->size = 0;
>  }
>
> Ivan Pravdin
>
