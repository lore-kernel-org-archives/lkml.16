Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B6B2594BD
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 02:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749264847; cv=none; b=Xl7GTAPFiZDXfLHY7kZsqJQAe9upgxoUMDPjuldh278G0spVk3+oCWCLvshBMZbWRdhjv+3t4wf2iHhu/m4+Fe46JIK9Znq+wSE5H4R5a1mc3afGH+G/RTpklGTibuh28aCTox9Z5kY1ZbdDNiHNvX65Ijy+7IIrOAvZr7nINu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749264847; c=relaxed/simple;
	bh=8VuAOHFeqx5UMsNpvlh7ZAQit2VLidP6PcKmMQI0hl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WWFFDvLF2GWJkA22qxR5iaAtG4uoyTxZNbGZPUaDXqhYwc9Q4K8E6/AlO1XcUlRbR8RSxKJRsg2/dwsKMcJr5KMo7YLE8dOWpKnHykwZ2+oXmiFG1D+hqRr3yzAd112qLQdbsG7IgjfvtwR6CAaRoY99b44ELndC8Oydd0Q/qT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C/2/n8az; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C/2/n8az"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cfb79177so14362975e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 19:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749264843; x=1749869643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=079G7lwbZSdbFJvvw8wIKqroIeNsEJYLRsyPP7yIsHs=;
        b=C/2/n8azwKyJCTLNIgy7LVyV3KtP358RJIYCZzmXVpd+zfxPgWb8+6uQX7Qm2NzQ4a
         xA/pXilYEqd8T7TsvpqjWF2z6ij7EnqW0GGqJkK9+aSHj+KAfQ97OnISMuDI2E6ktRh8
         mjhnITT0yT4YGOM2BmqzGSHK5pViWU7zVRcMAUoIgj+33M6UPEJ9zuLAaH1043OA6jS9
         b2lsjGmcFTUci5jWRBy2d4nt5YUVwXj3QIO/0OOx8ceOEACqJVe5JaaV95XSm3lSHKkU
         2PhKtFjI0vvEUoAwwQ4QhnkNwuJVzmHewTQDFp4zDQsUbY9X+DQta4qdKYRtuW607yhn
         N0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749264843; x=1749869643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=079G7lwbZSdbFJvvw8wIKqroIeNsEJYLRsyPP7yIsHs=;
        b=AlzcYonnZVutp0uCakdekuef/fMU+lw5i+HXJhsD9JVaZjUKMR23HhwuGScy8d62Qa
         lUNjOYGwmV3kGM9YarWGG5k/wlC4d/IUx1+uzEFCQuuYrimTE0e9VyffHt8HbmhV3EAv
         2C5Mb9VJdtOo/HZmDpEu/KZ8UvC0WLZgHSdSqBRUc3EXi2uxwWmATiVxNgvwyKM82sdp
         wQ6hUZ9eXgW2KbK2njCysDaX1llM9/O4mDEsSO/ZEzE1ANn+9ACNqPg9BbKqKfesRkEV
         Scp1pkP1sH756LyjifzEKaWedmiAEjStuHqEMneKzkZozfqWCFtRU+pW73yZX1MQ82NM
         6LMQ==
X-Gm-Message-State: AOJu0Yx+Q6RMHt+QWPt0417F+RQdJegJpzqXxZ0sJCLwIyzgcsJfgS1n
	VotoxxjxvPx3YqzCJQFoitEev8P4viqfQn5WU5rxfRzXddfFiKIs0j8iar6to7OLnFc=
X-Gm-Gg: ASbGncvFjrcxD8sTSK7/yBHVv1T1mJETwRtA738t0YbCHuPmlA57TxvMV0fCBC+uF9x
	5G3Xhn/srppN0wZvJRuHfF3b41+JTkRkcOGRwsEvaymQiknRLboRigoZ3PcK0gapmX9buGCGLJ0
	r1rnNZj2VGuLIJXCeUhQBrwuye1rXieX2UjKnZxJiqXOFGoDH+eQLW+iCsUIEpL9ppNFutHlfz2
	R3l7JGgM8Tfu4GF6zUnaXD1ZE+rkqV0ev0rML7dlBysjTjtbAWt7qoh/Vv486CinGpzsOXhiNfl
	BYvx/5rEsqHVgEiwFfwyNIelKajT9ZLlUWCS7hveh7S23Z2eBQskeGj+JlY=
X-Google-Smtp-Source: AGHT+IEFMaOycz8paZH8Dwc7eB8/xeQCEwaltIN87YJjZdoV9BEkV0ZK9L7/PCQxBolImcH3wDz9CQ==
X-Received: by 2002:a05:600c:8b08:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-4520141635bmr68757385e9.10.1749264843376;
        Fri, 06 Jun 2025 19:54:03 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:80f:b600:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e6429475sm2005465e0c.45.2025.06.06.19.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 19:54:02 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 06 Jun 2025 23:53:43 -0300
Subject: [PATCH 1/7] printk: Make console_{suspend,resume} handle
 CON_SUSPENDED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-printk-cleanup-part2-v1-1-f427c743dda0@suse.com>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
In-Reply-To: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <danielt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-um@lists.infradead.org, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749264832; l=1467;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=8VuAOHFeqx5UMsNpvlh7ZAQit2VLidP6PcKmMQI0hl0=;
 b=T3wYMARjrMBrnSS0B53XQkjL8a0KEFURCPDHgsLUslXubhtqe5kSsdH3AVNiC4itsQepzSKEL
 bCiOgTyAtZ1BpRW6LdXAAFDz3h5mWwilxfoY0pptQZniRHvG6Kc9OCL
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Since commit 9e70a5e109a4 ("printk: Add per-console suspended state") the
CON_SUSPENDED flag was introced, and this flag was being checked on
console_is_usable function, which returns false if the console is suspended.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 kernel/printk/printk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 1eea80d0648ed3583375cce3dfe60407894d659c..6d3cf488f4261a3dfd8809a5ab7164b218238c13 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3530,7 +3530,7 @@ void console_suspend(struct console *console)
 {
 	__pr_flush(console, 1000, true);
 	console_list_lock();
-	console_srcu_write_flags(console, console->flags & ~CON_ENABLED);
+	console_srcu_write_flags(console, console->flags | CON_SUSPENDED);
 	console_list_unlock();
 
 	/*
@@ -3543,13 +3543,14 @@ void console_suspend(struct console *console)
 }
 EXPORT_SYMBOL(console_suspend);
 
+/* Unset CON_SUSPENDED flag so the console can start printing again. */
 void console_resume(struct console *console)
 {
 	struct console_flush_type ft;
 	bool is_nbcon;
 
 	console_list_lock();
-	console_srcu_write_flags(console, console->flags | CON_ENABLED);
+	console_srcu_write_flags(console, console->flags & ~CON_SUSPENDED);
 	is_nbcon = console->flags & CON_NBCON;
 	console_list_unlock();
 

-- 
2.49.0

