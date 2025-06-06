Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B1E2CA6;
	Fri,  6 Jun 2025 05:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749186978; cv=none; b=JAOLfRSob1/TChNPgp+x48KIxsu3q2BCSxt3oykfwiCpQCAg9vvtsVaKif7BUK5A6jEul9S8sPOK9w0cJWeQWYCfevK2kKqeunWwJ+6JeXVCMiwTc9WzExa/7z/A+bEhNGA4JlzhbZouWrXb3ctUs9NFlR6KGXt7aD+/K0na0iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749186978; c=relaxed/simple;
	bh=+irILc+2nYSszpYh9ApL/OLSuszJVYgcIjfeGD+MLQg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=I/lUQx61yd4tHy4hsAceO6UYJG8GeS9ms9XsXnD8XTBuAM0dtqG8TiczUOkVhRpJyQm979BA52axQub3+0pSwp4HD+bMyqFnGtowx5uoUrqy7MBl6bpJ4IeuV64SYX+Kku/F80YtQ/wAadqPj4yMBYf5yhwa1y3BA2U0MozxMcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpvTEYAK; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpvTEYAK"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7482377b086so621585b3a.1;
        Thu, 05 Jun 2025 22:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749186976; x=1749791776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:reply-to:content-language
         :from:subject:references:cc:to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX3xmkUdfFteJ2rivFM2ocYLUJSDoSf3f4y8JQQLdoU=;
        b=mpvTEYAKAzd3TIe5SlJywx5c8tlwCCr/Tk5NqMHWvlhdLs2kDKHl+n4K+dCe2TWGre
         s38/Q2VirGazQBouT//PP6AnuT/lJk8Mu9iogS5SNJ9EosezkCcjhu5GrV2YNxC77u3/
         k2/3IRouioRL3y/QuhNYGdpTtr/cNk3pcCFkok3ZMAyP1sEzPPn7tWNSJVWSCy/xyz9J
         LYTNFAvZbv7QovMQMjsGU5zAKawK4i47fd8Yb3VeOBBALOTelYAPgxNoCbEGGspf9YuS
         LmM1gVWErN5NG25RpSkARNv5cDdYISQeFf3mylKvSCSGMHBpmKj8JL1MoxcQJFLt7q1Q
         qG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749186976; x=1749791776;
        h=content-transfer-encoding:in-reply-to:reply-to:content-language
         :from:subject:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZX3xmkUdfFteJ2rivFM2ocYLUJSDoSf3f4y8JQQLdoU=;
        b=YDWQnAmNhTc+tkMxZ0QNjqpUMf0e28tuysidcCPTDGUm7oOQNYD1fjXYmD7F5GXWp1
         FLMSrVqNop3dIweuwHLkRxONngjixRWf7q9wYzODdYWuGtBA3ncUu9MV/OYIomjTeE2p
         CXAJR9MNtP+h3hNbrlwWo9N5KVaXYelV9lrZMaYBivi9x1Qiy6Fau92r7Cw8+Qnyt3WN
         qJ+IeHGKxN7O8NVy65qOISEL3iX79O4Lnn2m89KsHbr/7pBuikMIXYBUeEj5vm9KQfJz
         poP7n9aX38N93xU7FAfNegJp1o2MG00wVa55BTSWtQfeSe0v3WuuL8uEJSged8XQRcew
         IDyw==
X-Forwarded-Encrypted: i=1; AJvYcCUjAsr4Rui+3hYrTgtr/rh5jYSUbQb06G0wDmsc8fq9SqB+qiQ+5nJ34mo7zATAa0EoiJLZedhfMd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwALSrnlHHftwoS0i1zx/38viDEOZYNCey6OuCYsQJS07Frmess
	KoCXho4Cm2iXyEefIVyPld9olDlFV1AbpSkwZI6Sn2ZUaVqNPaBR2/E6
X-Gm-Gg: ASbGncs+9QbbRAqwGRrYzUZ8bdD6C9Iy032d4a2I/0fG3N2k4bZBzwMTJXHZdHAjbj4
	qHmluNjeey74XeVTiWF9oRzXkTcTL5zotLHx6sW5/vZYhYz1JWQekhsqvReSDTVWx/0FyC90Apj
	BiIVSLhCTmBNBqvo2S38uZyDQ7/ZqbGoLB54sBqt1bljzOJc5UI0btReYd0dZDq/JKfJY5S2ht/
	6ZVAYHM50jfy2mND06x7NedeZEPt4GQg4G6baDtoNQN4lcRMReNn5k1tvt0mjvJqGZQs61fpGNl
	D949IxuUZ9auCKSozY13iSP8JNaAoReVsyBXG7jZw70yhP/iXUzhiA7KT1HEwRHVuKc0pHkKWD7
	TZNeQIDX69jCfRwPHY0Eg3e29YU/F01Oq4Y623oK7rjeO
X-Google-Smtp-Source: AGHT+IGnz0WO7cFkCLeiJ6kzt2oxFldXQhnc1MTHztAzzaY3L8rPspdl4LAHvxH9iI7Szoy09bMGCw==
X-Received: by 2002:a05:6a00:993:b0:73e:23be:11fc with SMTP id d2e1a72fcca58-74827f379b0mr3082030b3a.22.1749186976222;
        Thu, 05 Jun 2025 22:16:16 -0700 (PDT)
Received: from ?IPV6:2601:646:a000:5fc0:7240:3059:4e87:e658? ([2601:646:a000:5fc0:7240:3059:4e87:e658])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af38404sm496834b3a.35.2025.06.05.22.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 22:16:15 -0700 (PDT)
Message-ID: <4a7f4d21-8b1c-4616-82bb-210395215035@gmail.com>
Date: Fri, 6 Jun 2025 01:16:15 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot+1e3edf922962b5ea40a4@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <683ed7e6.a00a0220.d8eae.006b.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in
 raw_event_queue_add
From: Ivan Pravdin <ipravdin.official@gmail.com>
Content-Language: en-US
Reply-To: 683ed7e6.a00a0220.d8eae.006b.GAE@google.com
In-Reply-To: <683ed7e6.a00a0220.d8eae.006b.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 20165e1582d9..d7fca01afbf1 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -120,9 +120,13 @@ static struct usb_raw_event *raw_event_queue_fetch(
 static void raw_event_queue_destroy(struct raw_event_queue *queue)
 {
        int i;
+       unsigned long flags;
 
+       spin_lock_irqsave(&queue->lock, flags);
        for (i = 0; i < queue->size; i++)
                kfree(queue->events[i]);
+       spin_unlock_irqrestore(&queue->lock, flags);
+
        queue->size = 0;
 }

Ivan Pravdin

