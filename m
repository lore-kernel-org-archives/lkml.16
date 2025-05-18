Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4120C00E
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747606219; cv=none; b=AnPin4BqbigTj1l8bQN0bqFy1F9IFpEq4NPL4XuFikOwc0APA/c6AeXj1bWOWXhLACXBigRazSYsI+LstmbSm8PvRVvKgz2dpj8HDbJPhPv3G/TpQSgn7PVNgNCocUGSymIu9qWB91gEWuWZ4QLNVxQV/ylFfYmzt3zrkYnGyo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747606219; c=relaxed/simple;
	bh=SWvGIfkhRbWfeovnI48bl+Lss7+3GtniH+IW64+H+po=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eo/wYyZyYdBghFeYers3d4rD82SKKK/Gs9hyhQEMH0h64i3IrddergmYS8jG0faT+L4HR+xzPuWiNqWQPFTd83iVofCqjkhj6GjGA/H852gDh7ceBWZwBhAaZLIMFqgAxzm5gcRLJXP91Pd5CG0oNzZAr3EqV8K4NiHURbr6RnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ry5FHfhN; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ry5FHfhN"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-231e3cfc144so18541825ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747606216; x=1748211016; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7MgIN8qU07WLqB2jI+fLrkDZZnm1G0XlzsKXj9QMd8M=;
        b=Ry5FHfhNoxTE0oGCsVR64tN0mhBh0v6GPVb9TpfKWV24HCE96I5a9zznoVgKZ2I1Es
         218h+mZxGI1Kdpt0mbmzOgt6XtBIgEFL1FBucXBNMQgCJSd3MYTEa3EMEA/ehhlySnqH
         xT7bGcyJLcKzRtjG4JnV7JVuhkl9wCNzvdGc2Qw2o+G6Zq8UqD17YAwe+gyO0ZTG4jrp
         8lstC9kwl2uuhCvEzJDjrRJicRwe7xFXq3F/C8tsOZ3VUsqXM2Kzdr8FL39pQ9MTpl+2
         twT0fn/j4kC7eTPk7wpaAEaxpr2YEiIVBw8TPiJWqzYbt5Jcyomry4m6p1LiSY09znNQ
         vl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747606216; x=1748211016;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MgIN8qU07WLqB2jI+fLrkDZZnm1G0XlzsKXj9QMd8M=;
        b=OzTeKV9p5FxSXuQkVFIsm7TwuMrGfj0pDB2cwCLs+PDDBtZfggyeG27Mxc7vV3NiTq
         QOa4Db+WgPRx000Tz6TzAq2C12yotvxgELubj9sf5JKwWA3Jrk+rZI32CVOndXU/mAHK
         o0m3iL2QQeBiLaDYrvwpVxtbfZSh+qza4eVJFkcdOj1l/moqZpTH2JXBL9VpUS7Dw93t
         lvU2xE/tZCi7L0gZbDxSX7wUbJAzLxTCFIPrI8hItKb5HRjNUtnJ0AVoh2iTgyBn7VqP
         xfRtJQHT5STc7bws1/HM/yzPYFC3tIJ6q1eJ8X+DOSqA2rPFGn21PTXLqgWbGcxVBfZA
         Ooog==
X-Forwarded-Encrypted: i=1; AJvYcCUKcP/jvr0d1CjKGMs36AQ0pB12OZxP/MfilFGYN0K5UPlM3drfrzvDGIzUjDOrJwWE2sHxQdKGw//giuA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy63hLqyWTdpSDxa8VbcNhw5EyEnqkJf83lOcGbJOh9UZC55YV
	impnJW5ivC0RYaYv7b//DlJm+xiC39dVsZSiiaROyJkmTfBRaoDGAqPtjqmZv4g25d0p9MV+PCu
	Q5Owc2udtHquK/xNEcrBSdw==
X-Google-Smtp-Source: AGHT+IGfnAPZYs1RjIQmyMNTBGtrRdET0rahQn+Z7K88kjkMkyG4PvQjlMM8Jb/K6YInMKuOlOjUwZPfuWnIm9Fv
X-Received: from plbmu14.prod.google.com ([2002:a17:903:b4e:b0:231:e2ee:34c9])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d4c9:b0:232:202e:ab18 with SMTP id d9443c01a7336-232202eac80mr53400845ad.26.1747606215822;
 Sun, 18 May 2025 15:10:15 -0700 (PDT)
Date: Sun, 18 May 2025 15:09:47 -0700
In-Reply-To: <cover.1747605658.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747605658.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <97fcc39f3e63f465c49e8725d10f7c43fd35cd85.1747605658.git.ericflorin@google.com>
Subject: [PATCH 2/2] staging: sm750fb: rename dpPortBase in lynx_accel
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `dpPortBase` to `dp_port_base` to conform with kernel style
guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <dpPortBase>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.h       | 2 +-
 drivers/staging/sm750fb/sm750_accel.c | 2 +-
 drivers/staging/sm750fb/sm750_hw.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index a2342c69a65a..0ed1e18611ba 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -52,7 +52,7 @@ struct lynx_accel {
 	/* base virtual address of DPR registers */
 	volatile unsigned char __iomem *dpr_base;
 	/* base virtual address of de data port */
-	volatile unsigned char __iomem *dpPortBase;
+	volatile unsigned char __iomem *dp_port_base;
 
 	/* function pointers */
 	void (*de_init)(struct lynx_accel *accel);
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 97791f1b0123..7ac2e7b6ea0f 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -29,7 +29,7 @@ static inline u32 read_dpr(struct lynx_accel *accel, int offset)
 
 static inline void write_dpPort(struct lynx_accel *accel, u32 data)
 {
-	writel(data, accel->dpPortBase);
+	writel(data, accel->dp_port_base);
 }
 
 void sm750_hw_de_init(struct lynx_accel *accel)
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 159a5ad621f2..75ceb594fcb1 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -59,7 +59,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
 
 	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dpPortBase = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
 
 	mmio750 = sm750_dev->pvReg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
-- 
2.49.0.1112.g889b7c5bd8-goog

