Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC01E1754B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246639; cv=none; b=Kon9Ysut86igLhMe536q7vsS9U+mo8u34GdD9vhOyIk6SgrBfLE50xhIp6vA7HPnEP1PhTw5khitMBhV7+7wydrXruKtoGqscwnoA56998wK0k7ppGd9MxgRnwat0oNeUGTLM8e4l9/tRaxEU3oDGNtadcqYOpD7Wshjoa0yTz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246639; c=relaxed/simple;
	bh=Ael0egTScUyvCII95KsAl5QwhPiqhggfFKpDNzaGBkI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JiQjSjM+ScI+2wtG2CyhnPRVWWg43Z/FbIezdZ69tbk/U+pAK6VVYgKx1RFUrcqQiGIGpEfXuOjDPqwgiCIjphnCaNm4omc8NjXWuM8rJVzjovH1zHv8gZE+Kx+KyEHR/EJdgd3tbHB5GAK3/KpEAoX//5Cb8o5i9s/zXO0Q9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d44b221f0dso5829025ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 17:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246637; x=1744851437;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jX6/N6K1QQaY48qcJOak9eX048IDNFLOpWFpEGDXJlc=;
        b=JMgkBLLI/BsXrtoh1oETYQNZME/uEOZsDAMFPzii/j5Db9pDsIfuixG6RMCJh9nul0
         7KdVy6GTOZUxX1hZI2mdvo0GXOCKY4bn7xpfbCExoJy2v/jpucJGG3Mn2OeTEWt12jKG
         y8Mm7kIhl0I5Int9wCN9J915FJUY4krMR3+1AbO/QfQdn+XO8ezt2mJHQ8EcpNTjyKFc
         +QeTGvonqnkFGHzFC+aLMBA+W28a9RyKtXOPdGiF4Q8j0LVozP74cwjwJZqN2mWYhJVz
         nZTi9D7FGqOh9Wvyw2c/X9NELCFCVlfoSQi/k3+EzfHD9pjxDb16Bv89WElS3Kg1MoUt
         ENbw==
X-Gm-Message-State: AOJu0YwU8kzT515IzjQG0+pZVo6MiTzbhTlz65hy2b4MeNvkxC7HMB+6
	J/vp9qiQ47lFReiqfUcQ7sKPXJ8uAu1Y/zR0/2xhF1IjPsNELtyV7CygHRaYjlI64F6flSp0phy
	p2B5RcEYoNRhZ+4JkpRpo0nLBl5TTA15SPJd0xYeT7FvZU1BluBRmrYE=
X-Google-Smtp-Source: AGHT+IEYDrWVVZEvmm8vCBZUGhEWkxdQYJPOTqRfF8h8kMAxDaRY+PXiUy8Zo+QJ9zKL3uJaFKOytQ5qCSpDspn/+cC/8ttzfnBb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b89:b0:3d5:8908:92d0 with SMTP id
 e9e14a558f8ab-3d7e5f4f4eamr3785855ab.3.1744246636984; Wed, 09 Apr 2025
 17:57:16 -0700 (PDT)
Date: Wed, 09 Apr 2025 17:57:16 -0700
In-Reply-To: <67f26778.050a0220.0a13.0265.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f7176c.050a0220.258fea.0026.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [acpi?] KASAN: slab-use-after-free Read in software_node_notify_remove
From: syzbot <syzbot+2ff22910687ee0dfd48e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [acpi?] KASAN: slab-use-after-free Read in software_node_notify_remove
Author: lizhi.xu@windriver.com

no register no remove

#syz test

diff --git a/drivers/base/core.c b/drivers/base/core.c
index d2f9d3a59d6b..a4b9fe99aa28 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2384,7 +2384,8 @@ static void device_platform_notify(struct device *dev)
 
 static void device_platform_notify_remove(struct device *dev)
 {
-	software_node_notify_remove(dev);
+	if (device_is_registered(dev))
+		software_node_notify_remove(dev);
 
 	acpi_device_notify_remove(dev);
 }
