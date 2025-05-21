Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C69821516E;
	Wed, 21 May 2025 11:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827721; cv=none; b=O5SV17+r5HNnrMr7gslMEHr7mPRtZlaHhu7SmkHQ5PU0+1la6HQcF06dntIxCoZ+dC/zLqbCog4O9bXm2zW3INLSBN6DmpYUZuckhmd9xgiwWVUOrwCao+vZrU8bsAS1kZIkbvCOnVnM1D8FkBQglvJ2s8urn073Bz6bklC4xMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827721; c=relaxed/simple;
	bh=AnIvJC5zV6udTTe7BFOtw+I6KuBjO6JtpR1FV0hUS0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IddBZq/obSXFDhN9QKI7pp5iuW1UauSiYbLwx/OfqgmKeUlBdClFMJIk6DGvMDL7UAHGqhSuJu7K3L+SeSwlx3UAAwBuSy5OcgWdvNJqJQPBtX4VjFuhmyugQ/a1tL3i1dSCnbWD3TGpGM+DtfYopW5VpQeuPbhzLo8CAiyXtVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZKRdLU6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZKRdLU6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-231c86bffc1so68523315ad.0;
        Wed, 21 May 2025 04:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747827719; x=1748432519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1zqkw80WD8KrwlgJGk0dS2pTq4ixxOK5I/FQ75WFcIg=;
        b=SZKRdLU63FtJ+nGl7skul6B7H7ac0gLGJ53nY0sf9qCIupoXSjcGCYt4lAesSK5weK
         oC/tRMJKm2dB8OsHkWvRQ7X70+i1Vw5k6MpolSrsg5HiCkx8nrNZHwTbOrMi1suSCXGR
         tXp3n7vqkqHjH5ECu9nkYiSQ32+MJxgkaPp/dFVp0tC6aY8VnsnyKeNFRQK9ODLFbnFG
         ynDcyCz5QoJZNJueK1HVt5OVLZ50KIUlJQciCf3qNFMgwGky7+/4XX2h3kc/0YWMQd3s
         jOTxGDC7WJrvv89y1LobYG8qMYuJPUTVXKAQj3htUmQy+eJj+1au0bPkFxhYXyj+30gk
         H1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827719; x=1748432519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zqkw80WD8KrwlgJGk0dS2pTq4ixxOK5I/FQ75WFcIg=;
        b=U9aD4pt1GaYjg94mM55WW9J0c3lcfkR/0NtZfbYi7UiwT+CDRAVEfRyqkOGlUEwIdv
         VEV+uUgaJPufDijnwqeTtvgMZkh0khbNOfuhrJkSDJwYL75j6LMfxfe1VOsbFDKizt6n
         vFoZHwZ5Cuj1739OAsmqhyuYDsi0Du47GdMLU7psfqqs9u/WZkucIosQWA6GWyN6ASR9
         vDFGFKXDt7p4nD8PywQYoz85cVIMPAOEdPR1yDREP0XNz0cgr99QGbYTzklaG0yM1f5c
         VeigsW0SyTaduvOjsaGmDFiWpzIS2Mi2QiR2aA2vYCci49mR6e44MYaVZAvqEgxmdyZf
         zSSg==
X-Forwarded-Encrypted: i=1; AJvYcCVTmO521Qy/C2kRO7ZSfV1b4Fs5f8PRJj8aVa51CdIGUPYsL84j9jhhqCSM/rQwQmOju8MzB4THPjQKzoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRH/XLq61u158xAIFOGa+07nEynuebHArNlMoo5LcUyZl0cG4z
	IVre597VKhq3FK/D1jiYoSkUhC1ZXQHrquFRC+nQJXNfplKN8dTGEf+i7D9w5I/a
X-Gm-Gg: ASbGncuOahgWhi1cqC0XmXOfut5E1nUwbMGdNh6ryXtfB3QNxIhgquVfiyRQI2IFGZE
	KrJ1+MGG2JyKtdKSfJmnfeWNGx4YGHWWzhIlW6cdlQ98J1ZexY0ecC1QG3eCITemdLQXYgcgT9s
	5a2ARntpaqSoKsYcJVy5Jz4MGQmmPKUFk4lhvNNenuJz/1+3yta73sCVL/gshIIe3EaU4dxy45c
	2Sb0LDvWWCFenl1x3rqcOCN36eo8vB7Tyki9Q1hNhJ4FkOsN3huUTi+9kxAU7/4pnXq8YRV0THI
	zYek/mp/RHY11FlnMWDJxumRP0DhdtU+Ix2skBaY5zw9UgVYjrvvQ+TkcWqi1hGQNTEl9k0UzgZ
	M1r/VMcMzu5RLNojZQ+eE582lxPBY+JZdFH6Jr7EYz7sl
X-Google-Smtp-Source: AGHT+IEwcFaaI0EPp7BGh4qVy4HDpC91n8Rw7EWMA5J6W2m4rRIaXOs3gnTh9cCoZIekNXV1FdM/iw==
X-Received: by 2002:a17:902:e801:b0:231:7f29:bda0 with SMTP id d9443c01a7336-231de5b0ba7mr262590205ad.52.1747827718964;
        Wed, 21 May 2025 04:41:58 -0700 (PDT)
Received: from localhost.localdomain (123-194-189-72.dynamic.kbronet.com.tw. [123.194.189.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm73208305ad.215.2025.05.21.04.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 04:41:58 -0700 (PDT)
From: Jay Chen <shawn2000100@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jay.chen@siemens.com,
	Jay Chen <shawn2000100@gmail.com>
Subject: [PATCH v5] usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device Command
Date: Wed, 21 May 2025 19:40:25 +0800
Message-ID: <20250521114047.18001-1-shawn2000100@gmail.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a subtle contradiction between sections of the xHCI 1.2 spec
regarding the initialization of Input Endpoint Context fields. Section
4.8.2 ("Endpoint Context Initialization") states that all fields should
be initialized to 0. However, Section 6.2.3 ("Endpoint Context", p.453)
specifies that the Average TRB Length (avg_trb_len) field shall be
greater than 0, and explicitly notes (p.454): "Software shall set
Average TRB Length to '8' for control endpoints."

Strictly setting all fields to 0 during initialization conflicts with
the specific recommendation for control endpoints. In practice, setting
avg_trb_len = 0 is not meaningful for the hardware/firmware, as the
value is used for bandwidth calculation.

Motivation: Our company is developing a custom Virtual xHC hardware
platform that strictly follows the xHCI spec and its recommendations.
During validation, we observed that enumeration fails and a parameter
error (TRB Completion Code = 5) is reported if avg_trb_len for EP0 is
not set to 8 as recommended by Section 6.2.3. This demonstrates the
importance of assigning a meaningful, non-zero value to avg_trb_len,
even in virtualized or emulated environments.

This patch explicitly sets avg_trb_len to 8 for EP0 in
xhci_setup_addressable_virt_dev(), as recommended in Section 6.2.3, to
prevent potential issues with xHCI host controllers that enforce the
spec strictly.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220033
Signed-off-by: Jay Chen <shawn2000100@gmail.com>
---
Change log:

v5:
- Move changelog to below the '---' line as required by kernel patch format.

v4:
- Clarify relevant spec sections and document their conflict.
- Remove language about "ensuring compliance with the spec" per reviewer suggestion.
- Update assignment to use '=' instead of '|='.

v3:
- Corrected author name in commit metadata and added changelog.

v2:
- Fixed malformed patch formatting issue.

---
drivers/usb/host/xhci-mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d698095fc88d..26d0ab37bd5b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1166,6 +1166,8 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	ep0_ctx->deq = cpu_to_le64(dev->eps[0].ring->first_seg->dma |
 				   dev->eps[0].ring->cycle_state);
 
+	ep0_ctx->tx_info = cpu_to_le32(EP_AVG_TRB_LENGTH(8));
+
 	trace_xhci_setup_addressable_virt_device(dev);
 
 	/* Steps 7 and 8 were done in xhci_alloc_virt_device() */
-- 
2.43.5

