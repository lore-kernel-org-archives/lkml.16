Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3130B259CB1
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 02:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749264883; cv=none; b=aKp+LyeULP7QNR3IJVdV+wD8uFqi8VBN/WB+ftM7LHWqzMcQHygmosfrk4IbEf/cZ69vMUf+9ihcnm8XswrKqlYTWAUGccVfWla+t+sTK44aO3q3tHL/RKP7wpwZDE9kSsA9OJINitdB3oiHpuwkfei2Vc37feseeth6pqfw+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749264883; c=relaxed/simple;
	bh=KOAUnN3mMocWtW+iziCjb9nXWoqfOr6DrzuAgP6VLcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQWsoJCFmHra98TdW/OmZQPg6fb68adM22vjkJYio11wAz4b3wWXHknTwwTtUB5sLQf4/524SxRVjtSSEA0nKsR8D5NGFlu6scLab3kmo5R3CtlTP4137fzcRhb31Al2NzbZ4nBWUBZBQkMrxJyEmKG1Gx8OU2UFdjGkrEVzLJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CJcrzyez; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CJcrzyez"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a36e090102so1641765f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 19:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749264880; x=1749869680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhevvUMxwyVlQTogYhSNRf8D9k2NBoggWts0KZ88AYA=;
        b=CJcrzyez/E1Usfgi01lgUL2c+RqAUQMQSrj1cIzoQrqQIbJOSbTJTBMMLLvOWrEPZQ
         wMLdQFQM0cQgDFfeHy8VfuY4MWMBBPAmkw/QkD97BIrhJR3J6/KAuxsmGdTZNvICkN0V
         zoxInN+bLGbvnZavRPCutHEoEXdvRDYQpH84PoYOGfPQWW3eB0PVtBfyoxQ7xjmF8zPf
         Xq1wosHczSVOmlu6HZvyttS/nEqBiOiBMUWSucrT9XvLPccRDgVSRRukDN5KHH8CYZpR
         rVm2eDrwRhiLKJKEPrATzX+odR7AQiaURMbgQpH1U/e1qmmDbf/NmvHyoesIKHCo1rLr
         uJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749264880; x=1749869680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhevvUMxwyVlQTogYhSNRf8D9k2NBoggWts0KZ88AYA=;
        b=nsFku7zXolK2QaYnWywVRMDLRMOgnSEb5jeeSbYmYklJBAvgTvZ//WQr4InOwpMi3o
         uUjHFrf4exVnxqYlcaFtjvp/9lI3ZPxLh2KLwyK3xtBzWuLHY+VCrAQ3eGGL67CFDpz+
         R24PXP58yH+xphKO6TZiuOmXvHcBl2+y6F8bghLusWps2mbsJ2mbXoIaVC7BTcXSUMMg
         MS67inHuIw+7I97mS9HRckP6xGLoXrMBc0oIb+Xq6sCHSfhejEgKxVDqip7nQ5CBYBLx
         4apLCZnppAfbSsGurBETjGg9W5xesfownWZZOIMQW7w2WXovz3LpLn1InHwI3avOoivJ
         g+Jg==
X-Gm-Message-State: AOJu0Ywt81qfTC83XsZgBlP05lQPp26/NXy5NgDyvl54hs8690XEWHWW
	fBQoqcPBem5Xvwy8AwhQzVhOeoND5x1tSTS0KhstZd8B1AFfXJcWGvJSH6/fbwT/r4k=
X-Gm-Gg: ASbGncu2I6QOeBE9028X3ZjMfrNM/HF1pGuyKCF8svXirgv3DAnxXWkbndZqhJZiKgH
	DZ+qT7WM60J12+RmSDne+a919EhXr14GTKncwS415t8rBxvVv98dz1GRITlMxCDH6Gttr0yW/f8
	LTzYf1eg++Al/lfZ6eELY0wVD+KgJO5x9M2uGvVa21+7CcgOsh2itSilh1XUZAYcovSvEmCQ046
	rLV6T2j2ck8QDS1SUhTpgCTJMJHzngtAF02M458INOme4HhaSSmfl+bQ/mbbuLpPHwDdXef+Zwt
	L7SVvOCLav5pf5PIw/PZ+5MwLTdv0QgEYixHJwkbBTuasgXqq3tH0mfMi5A=
X-Google-Smtp-Source: AGHT+IESa5LLq7OFr0HT18MGGSGcdVKv/63HG++r/KCtTOueAXQ6KBohd01OZ9//J5xOfwZkn5rCSw==
X-Received: by 2002:a05:6000:381:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3a53189bb71mr4901248f8f.23.1749264879655;
        Fri, 06 Jun 2025 19:54:39 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:80f:b600:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e6429475sm2005465e0c.45.2025.06.06.19.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 19:54:38 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 06 Jun 2025 23:53:49 -0300
Subject: [PATCH 7/7] printk: Don't check for CON_ENABLED on console_unblank
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-printk-cleanup-part2-v1-7-f427c743dda0@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749264832; l=938;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=KOAUnN3mMocWtW+iziCjb9nXWoqfOr6DrzuAgP6VLcQ=;
 b=GzfZv5dsvZ/BfI8fHIsSyKjTfbS5OZlYtux/fj2GG7XKCatBH6tyzKUHv0GzkPE/uoQqkVILv
 HIUpyd53iTgDChm4XdkV5M0tDGRMvQF8qArv0LcgKdpzVAZ3g/sR/hJ
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

All consoles found on for_each_console_srcu are registered, meaning that all of
them are already CON_ENABLEDed.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 kernel/printk/printk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 658acf92aa3d2a3d1e294b7e17e5ee96d8169afe..8074a0f73691cfc5f637361048097ace1545c7c0 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3360,7 +3360,7 @@ void console_unblank(void)
 		if (flags & CON_SUSPENDED)
 			continue;
 
-		if ((flags & CON_ENABLED) && c->unblank) {
+		if (c->unblank) {
 			found_unblank = true;
 			break;
 		}
@@ -3402,7 +3402,7 @@ void console_unblank(void)
 		if (flags & CON_SUSPENDED)
 			continue;
 
-		if ((flags & CON_ENABLED) && c->unblank)
+		if (c->unblank)
 			c->unblank();
 	}
 	console_srcu_read_unlock(cookie);

-- 
2.49.0

