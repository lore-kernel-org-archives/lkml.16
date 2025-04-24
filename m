Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D782284666
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513431; cv=none; b=urWU72a5Ud0aj6wojVGQJjxz8+8GrSYy06iFFcA8qWYesVK9rrzzSvLxLXjTX5hTS7d4EfNH7djSBzJaoD3ecxQqfbdhMA2OuxWJVI1oAVI8gd2yfwqe0e2iEgYa6lzWt8jSuDvBaOsAeO4MiuCeDRUP9vaGW77Pqp/P2LF6Ijc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513431; c=relaxed/simple;
	bh=iRQ+tCNzTUzFjP3Q4w00NQLj2m8U6lvE3Ij0XsGhtg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzxrdbTEBIai1IMkvnqJSYt5z/qnMF5+vDfaNFh3+v6i5DqFvk8jWQ2i47KhPv0i+bkpkp1TibJvGHa0KKMK3j8J9iUGinuBsMcjVrKuJWSYG9yJSTrw4OyoPBgduceEcizbIAXeZIB3EotgjKF7divnCELfZgxjCU9OH91ogjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=o83uobAZ; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="o83uobAZ"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72ecb4d9a10so915647a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513429; x=1746118229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zwio3ISUto8LUTujsv8QXqK82cuXiEJf2BXkC619czg=;
        b=o83uobAZg32ukEuqNqmjmBkLvOMfa+6cW0v80YCN6cMnOhJGBQT2rpSZxNmkTv0jyt
         YOvrpu/t9We2fTUFKNwTgBOIOrrlzp2xAWjguLEDfxcPIv570BXNoDX2GmbuoIEMXtkx
         w8dUjpWv2MEkk1p8lwGUo4T6nWVpZ+ij7rT9Wn8CoN3p6Ki+JZs26pPRLeRt4FPIUWW9
         npQkSv8qsGXpTt9daNoRcHWmCGVbZky9YpEpXwD4JWX6la4D8tyKLNCbl+PxH8Ti9PFG
         TV5ayfwM6XcAU8whgJtCKP5xsyAfEv+LOfo743HH1A95g4owXeA50rvTpxE1x2P8hE09
         8GRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513429; x=1746118229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zwio3ISUto8LUTujsv8QXqK82cuXiEJf2BXkC619czg=;
        b=coFp7g+6rhXiuav6s5cBcL4hkfNxI6pD7dn8J5LsJr3ugJL9HNN6qs7KF7hqy/Sj+N
         wjUBqNUVj651uVpNlqVA49jG5D9WDIZ1Yx6WrpL+J4Sl9GnH8oAgqZrutP35qMNOWqH5
         uiekvbXQ8PxuVrmuOvK6yYsJaE5JAdPCT0c7AyRcr6RbWwJLqqnKoH9e7zIpmM+TgB9t
         c8uQMTUl/2pmcsoPVg4Adk6k0N4GsqPPopCTvALWWl9+LakMEaOGOjsbfnJGjpBrDPci
         5iLgbJRBXT0YqWTq/TWrvpP/5v6l0ioNoBrgJ3l4h08Q/Tt+YRqOXGXAsxdRJOco1JTJ
         3XDg==
X-Gm-Message-State: AOJu0Yy01z5vRIsjVR4xx0AtDEza564wl54QqBypo/aNO6U1TZtZXRic
	wzI04qpBigENuG8/VzYIRHF+w6hFnpnVo2PQX6Wmz46DuSRcHlslJOUR7fWXe4DikBR1zhwJeXq
	0
X-Gm-Gg: ASbGncsR5tLZAgY73XdUfeYJg43EOU3vBf2HyUQWB9th6eIxcoLwg7dhlHlRI88yjyl
	mZZlDuQxhKGdyBfzGQOh0Sef8BBcvVkrW+1oFAEyzy8/T84/QLu05YAvs46MNxM5AXsOgMv2lmW
	+m8r/fwNmuRTh343mByA0PT4Cr0QVUox5GLhwNA/t5SEy2fS+UZuKjFGkZfvwaT0KHUhi5Opjvb
	8ge7Oq6cf9gsFAg6wRz5kbrqoDEmhzEbo+1AxjuXm9+/G0zlcQXCpbVCDk/3/Hq7riWx7XLm9aX
	/9gXT7lTb3jNQRrVUF+8VfJ2e8PR8knji0c=
X-Google-Smtp-Source: AGHT+IGy7CZalF5Miu4rlUrqy24erWiGVBihUFSHTQCWfAbTX6kMHsZPYJdkMwwydQR7vrtwIl+ZPQ==
X-Received: by 2002:a05:6830:3c08:b0:72b:a175:2f1d with SMTP id 46e09a7af769-7304dbd8709mr2441810a34.23.1745513428769;
        Thu, 24 Apr 2025 09:50:28 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7304f188d01sm296180a34.14.2025.04.24.09.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:27 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 01/23] ipmi:msghandler: Use READ_ONCE on run_to_completion
Date: Thu, 24 Apr 2025 11:49:38 -0500
Message-ID: <20250424165020.627193-2-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424165020.627193-1-corey@minyard.net>
References: <20250424165020.627193-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It needs to be read only once because it's used in lock/unlock
scenarios.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 1e5313748f8b..77f0f41f2e3d 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -1882,13 +1882,12 @@ static void smi_send(struct ipmi_smi *intf,
 		     const struct ipmi_smi_handlers *handlers,
 		     struct ipmi_smi_msg *smi_msg, int priority)
 {
-	int run_to_completion = intf->run_to_completion;
+	int run_to_completion = READ_ONCE(intf->run_to_completion);
 	unsigned long flags = 0;
 
 	if (!run_to_completion)
 		spin_lock_irqsave(&intf->xmit_msgs_lock, flags);
 	smi_msg = smi_add_send_msg(intf, smi_msg, priority);
-
 	if (!run_to_completion)
 		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
 
@@ -4753,10 +4752,10 @@ static int handle_one_recv_msg(struct ipmi_smi *intf,
  */
 static void handle_new_recv_msgs(struct ipmi_smi *intf)
 {
-	struct ipmi_smi_msg  *smi_msg;
-	unsigned long        flags = 0;
-	int                  rv;
-	int                  run_to_completion = intf->run_to_completion;
+	struct ipmi_smi_msg *smi_msg;
+	unsigned long flags = 0;
+	int rv;
+	int run_to_completion = READ_ONCE(intf->run_to_completion);
 
 	/* See if any waiting messages need to be processed. */
 	if (!run_to_completion)
@@ -4813,7 +4812,7 @@ static void smi_recv_work(struct work_struct *t)
 {
 	unsigned long flags = 0; /* keep us warning-free. */
 	struct ipmi_smi *intf = from_work(intf, t, recv_work);
-	int run_to_completion = intf->run_to_completion;
+	int run_to_completion = READ_ONCE(intf->run_to_completion);
 	struct ipmi_smi_msg *newmsg = NULL;
 
 	/*
@@ -4843,9 +4842,9 @@ static void smi_recv_work(struct work_struct *t)
 			intf->curr_msg = newmsg;
 		}
 	}
-
 	if (!run_to_completion)
 		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
+
 	if (newmsg)
 		intf->handlers->sender(intf->send_info, newmsg);
 
@@ -4859,7 +4858,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
 			   struct ipmi_smi_msg *msg)
 {
 	unsigned long flags = 0; /* keep us warning-free. */
-	int run_to_completion = intf->run_to_completion;
+	int run_to_completion = READ_ONCE(intf->run_to_completion);
 
 	/*
 	 * To preserve message order, we keep a queue and deliver from
-- 
2.43.0

