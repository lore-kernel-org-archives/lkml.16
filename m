Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695D02566EC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151830; cv=none; b=B7u/jnRR4WHmTezzOd6oJ6Mx+uYTb+HuVrIdS9dh2QvnbohTG+Ra4wDA2e/3vbNc9cDDy0frEAgKkHJFnLD6lbxXahUrX5UWz5Fvm8YycY0uNuAU4618y1ifZswz65LJQ9JRkJE0O+Bspjwn8i8KeEyP/LxOmV9stIabQ7yIAIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151830; c=relaxed/simple;
	bh=uO0WEOl3NJdo8eeK/l2yzXWRkzHpMAOj27lRaFN0xC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eInzu3tWnKgx7o0UiXzknaUp6grU6bI7osBnmCFXqgoGExQikZlh2XiTHqojxgA7Mk4geu2KNSfBdPYCH9rNAfst/Utl5ff6eWHlkYkh4HHYSm3TFvzmSR4TOYTCNCDFM8das8V679pXovBV6sVIqdDeBPfX3FBBaBrv4euDwRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=FQHIkp4k; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="FQHIkp4k"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7340e6f3ce1so4820943b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151829; x=1744756629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMoJ0GicUz0RLtgfdlS2esbiLZrZHMdlYnOr8+kJvrw=;
        b=FQHIkp4kr1SnWFpkgbSY3r72Zx715HfGaFRAxW2QhiRPhju5b3WpSy+VFRvjdeZmxk
         KzHlE5xRFKP/DMUjFxEYgEz/lJcVaPnOykszqFI/vorcNGIkxQydagw8SqbyqOr4I4kF
         MoCok47ne/K/0LcxF33GFvc/pkP7pK3FhKlA0iav/WgHfWw26HlP6k27ylCEDWN7fS+t
         koUFOFBb6TP62sHpfOFLa0FFnXD+FbO2CJUCFt3UHA7IUd2rqzYgcgIlOn/52/sx7Fu/
         CQx3mNCGhIXUcZpvVS0mV+OFAUrgao6wjtp8ABf+9eqQD6bMzl4jRBlQJsQAUzlXSFYl
         IDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151829; x=1744756629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMoJ0GicUz0RLtgfdlS2esbiLZrZHMdlYnOr8+kJvrw=;
        b=fRopsd8NXmgLZ3Qz6GCsCPnRX9mc4T17BltIa8zPXnfqu8wMa1Vb28avboKA6NfX+i
         8cb5ilV2YfUliasQ9axasCAuDaAh4bXjBbLZMXqwwkw1bG6VGW5lv1IuPgvEjJXttOB4
         SCfsUJg/PrSMz3xRHUt3Iek3yrWiLbv64Dk8WTCtrBxQJfAbvPUXbkYxL1/rEwAAFtIP
         6vONiovZxzyiM9CEpM4/Fa177/9fZ9kbL4qdA2Y0POCtjDpCPs1J/27bdw1CKDgDbG77
         j1fZUt4pvc2TBbrLg9jw4T+g9qGLTohNht/bSnn3KVFgIAAYAYY1swq2Z0zm10Dfp8SM
         G1+g==
X-Forwarded-Encrypted: i=1; AJvYcCUxoWCI6nBzH/BZVtrn/A57someaLZzfLDe6Uz97MtKqFfw3NQo9wDlVmykghAxe/FAbFWnwDyYDu9iVws=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPqtsn4dQjQQBrMcScI83+Fx6idkGkvg0z8hHyxPQ6tc1nGs0u
	YVEEls9KiEZXUBhYwRWP/5bt0hzzZNdyOBlE4kkAzNkpXDVw4EgsyzLo0lfSYQ==
X-Gm-Gg: ASbGncvd8FojR0DmLkkl+ISQ9jXyaH6IXqAQ8Zp6aN0KWhlXawIHlsFUbIAlQcMervg
	jPkD48b1xKJqJRatRKyOjlTbi8E73ZcWTdW8Cl/FMYC6ERohi37nug9rpJ/99+NnhwypGKb/mnS
	KjGeDfpSgcOukAnrMeUQVlWf76wmS7s4q2ifDYdl7lMHnqDLxmkEMPmdLTLAW9SGuZYcHLBQk1H
	/c0JW37QhbkonvEWtZ/fi/KGRpnwJEJmcaMlr+OY/dXMA81X1FTynofMJwdrkLT0k8pJcBox3It
	rYu09gyEDGwyWYPGAItvN1XWN7An8yACs1xJNLROtIEMKujViS/0yJYeRt6IPTkmVkMZyLJdBG5
	2qKVPgDm8GQ==
X-Google-Smtp-Source: AGHT+IEcFqKl2v/rldxmVTFJB42fvEpdpDtJ/GW+jfXpR2xPqh4+7znLLqZf0ROtRe4CiK2GHp+/Xw==
X-Received: by 2002:a05:6a00:4606:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-73bafd708c5mr276174b3a.24.1744151828779;
        Tue, 08 Apr 2025 15:37:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9e9dcc6sm11505636b3a.99.2025.04.08.15.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 05/18] staging: gpib: cec: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:45 +0000
Message-ID: <20250408223659.187109-6-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/cec/cec_gpib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index dfc718de1532..1b02222881b9 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -40,7 +40,7 @@ static irqreturn_t cec_interrupt(int irq, void *arg)
 #define CEC_DEV_ID    0x5cec
 #define CEC_SUBID 0x9050
 
-static int cec_pci_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int cec_pci_attach(struct gpib_board *board, const struct gpib_board_config *config);
 
 static void cec_pci_detach(struct gpib_board *board);
 
@@ -265,7 +265,7 @@ static void cec_init(struct cec_priv *cec_priv, const struct gpib_board *board)
 	nec7210_board_online(nec_priv, board);
 }
 
-static int cec_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int cec_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct cec_priv *cec_priv;
 	struct nec7210_priv *nec_priv;
-- 
2.43.0

