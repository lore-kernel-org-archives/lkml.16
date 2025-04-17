Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A8D1B414A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849976; cv=none; b=XeziAma1yepV100PfUAQ4IDTL886rMf7oaSieOU3Km/2n4moBjbwB2CNqkAPKLjlyZBNhm6QaHm6kZL9lKWnt6JbExnw03rzJex5bgEgnbvlkXjT0b6LsX/GwLXN1LBctLNxbSmRyZ7HbAhFCmg35NWDUwOUgQ4iWyJ49ya/gz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849976; c=relaxed/simple;
	bh=QaMlya95zkc4MjQsjQDNT36UA9lQmCeo4nFFSkNr0Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gggBpvTxxEM5U1ORWBwvVuRqXplCbrUpdOxrj+TsMSsaynppsvnEAQDOr3R7iCxCOEtCHwE00VB3yztWu2wqtIhYgiwCSFbN0OC6IQzo/VP0YHAulhFMvpWFOzKoY4FwwRa4/DVlkAzR9ov5dCXGnXs3ysDc9IHEakE5nIeMd0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=MDe7e2jp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="MDe7e2jp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224341bbc1dso2383835ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849974; x=1745454774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAwcN61khauGEX7eRicTPKijk8SHQIgYsxBV6pw5EIA=;
        b=MDe7e2jpOajKBfcsgCRj83QDcCyVSBn1N3gDp7jbeEH844ZprD+cPRR/R0Fwe75G4A
         v2aidd7a29ElXmnrKiHpL30soUHim8vUnD+OT5Gbk4MYXf/l5cku4s+45R3o1U4q34hS
         gQEhxnrfLN6MpffOYyIBRLKE1Hvm4gf9pVLi18QcequB2JD1sWA3HOTg4bPAcDiecLe8
         5NXDIEp0y8XI+6q0/qfN1K279yPDXjFslqFxdHR2TVyZYaOPqxyx6HibHE/FrvLJfaSS
         BkJAwJdHhYBHRejWNz0mi2MAz78Hq53/GC25J9xxQwLkJJsIyA95MyMS0A+yyd8xJ+G5
         IyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849974; x=1745454774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAwcN61khauGEX7eRicTPKijk8SHQIgYsxBV6pw5EIA=;
        b=w751JHudqEvmjJhqMfKFPTJQfAGQPjTcHnIBtRPDtPzPwKR0WhNC2iWTlpDf0ChGpa
         0OMysSjarT+tBwqHao8mwUCH/a4DAXtPQjfVJaKesYPjofwctDyTIT17f5lq8rQWTWy+
         xx9OADBiILzgtyGVfNf6FEQNbiLFbZz2Ct9r/Gt35ABjKK90dkkffYPGAJIsvXdDfZ8b
         F21FP+cPOUa/K6TQJoSt1aDjFJW5x3A4AfWq6C6cFzIuf+LFy5qIahtO1M0dZIuUy2p6
         3z9kYIh32vUMMDEXbppUa2QTs3FQPTcSeHgzWhAG9SRP+eQXETOFFt38guFqWSq+0vO6
         EumQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu9nBPMA5tPo6kvOcoEz+wH7ynhggzkd8nynP/CqqzgSNVMtFbOADyVL+hIlu/s2mggDb/0LzBZLcJgc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUn6AiAX9KHb33yt0OZ1JXenkuRkmOtFyKCYRx5D9k36c7ThRJ
	tg6UvVoBCAiakriuzOgzidw6kqCKT9dugA/JSnlTURXevRb2hNlEa5nB5bsSSWonlyqfSNKZqJM
	=
X-Gm-Gg: ASbGnct4VtqxIA8fW9JRiU8UgF+Ry3NezPFpNwmwRNTvtzVefYUC3fuwBAfoEj4DFlH
	zphwsMRPrHWvI+xMRd7q9RrARA87qLv/66GOcULvsMiV26b327m+6PmYHT9CHylm8ZXQOgNUCou
	c9xC/1AOJQLopG7V5hqS8vzv0tzyiuQQLrjqiTAq6HOmsvvQ+kLskxSeWjvmUhiNTMBcZXYBydo
	BtVv4faoedhWCWuBBD0HKjQv6UW3yeb7gmY3x204cr4hRtrBEWQj2ssbmJFC2z8+DHdBILJo30W
	pXErzFZth9r+bryNdeFMH1XnEmJYMBr0tlAMF1yW1ffbaQXcVllD7Iiy011IB7xmBRVI4/9OX9c
	jScLHzg==
X-Google-Smtp-Source: AGHT+IEvcFXIV6AshDKyBigtNhPkXzrIDw6+YPe/hpr+Z76eAm80FDheS6S3vY4+u1qqd/DLPTNabA==
X-Received: by 2002:a17:902:f684:b0:224:1220:7f40 with SMTP id d9443c01a7336-22c358c2996mr47815755ad.3.1744849974515;
        Wed, 16 Apr 2025 17:32:54 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e310sm11414103b3a.149.2025.04.16.17.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:54 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 05/18] staging: gpib: cec: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:33 +0000
Message-ID: <20250417003246.84445-6-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/cec/cec_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 03d5b6c4fd8c..1b02222881b9 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -188,7 +188,7 @@ static void cec_return_to_local(struct gpib_board *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t cec_pci_interface = {
+static struct gpib_interface cec_pci_interface = {
 	.name = "cec_pci",
 	.attach = cec_pci_attach,
 	.detach = cec_pci_detach,
-- 
2.43.0

