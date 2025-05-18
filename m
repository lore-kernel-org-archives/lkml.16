Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E271A76BC
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747606215; cv=none; b=ZvHfdPFIdw7MQdBwBQ/4QsUfP0ZxdBuwujt5MRzixcdC2vojHoH1fzujL4AQtMVX8i3uZ2VbD+mf7q8dzH3+136nwuNCTugVwMJsn5LUeHT3Ss9cC1d7Xma2y+zUhjhZTo27lVSM0tcofTWdRReCx4OdDAyjQ70KHucF9Tu815c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747606215; c=relaxed/simple;
	bh=RlfQ7Sl9w5x6XC3rRVXrwDjFJLRI5opWfOuqy5T9x0Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rHLjmnwjTr7SNgIZMctykR6bRjOJOaT4XRgi6hFw3O5MoXo/wy2orn3cXvVKom7JtIf06tKd2VQMvyeZizwvqpqx6uFVt6qg/hzDjdCSzdH6qOEw7w9GQgiCs2CTo0lOe4DCi+A8gQ+njbnUcViGBX5hBUIFLWYV51/SFNWXyzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NK7nCVtV; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NK7nCVtV"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742d077bdfaso427504b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747606212; x=1748211012; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYWWA92r/lnE6mLiwOw7SOEtSivOca0z811KglLj8l4=;
        b=NK7nCVtVMjqrY0OZU395EqIixcQxTT0tAHqChv4BCAHF9LPo7I9yTE148pQsCQS7RS
         Jhm6iMoBlaGdmEZgSMIh6MDPKQZDPlML84QnhrMsdbk/3pJBTIo/mLP0T75luqwR+uie
         vY+75OGxTH9C6ThlfXJfNeZ+rdBZpsUquuu+jouTKcORfP38+Livf2EPq6VYFRbQBHtG
         mNjH7k3vlViMvLDeRabCYwz/WBI2KCstkKjTDILz+/KoZC3xs8XBa71SkolodjBQEqkl
         MpPErt5D16x54Up75DM5FEYWgkYEIkEwuAUN9MPyFwi3kmHnkp48XUkebDl9cLefbq2q
         Yn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747606212; x=1748211012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYWWA92r/lnE6mLiwOw7SOEtSivOca0z811KglLj8l4=;
        b=ZsEOyOT3ibHilMVttTTo28xzwQs55TXVFO9/4Fsi/FZtcscg5PWy/pgLU7jp7yuw3u
         GoaLeNHx8q6QZcEEwaMOaPCiCRoZ72Dr7HlAi7QWDca83/G+JBfxtDeNsXHO0BvmJjUp
         tSua8VJst00ilrNUbjP7S516JkA2TYmAHnAdygrH3FOFRDIphrOpq2FGq3haIZ/Ns2va
         wUgcIcsXyGthwQ99JGEXE6gHmv+QfvsrMQiq3n2AY3EKID4yjzDMbpb3G408U3C0AUvF
         2bkiRSOvwKS+HwGO4PLBzd31M+KicdhUPXPbbIOD45NKrWEjJkkEvJ6ZFkxgfUq/KEsC
         6MVg==
X-Forwarded-Encrypted: i=1; AJvYcCXlndtWWP2UKPQhxO28M7U9pbPRtCJG3rgyjYfsUp0bx4mBNHlNTFhwdl2B2lJfefVuuS2hP2zaIuJA5HU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIEhK6eCfAozWWncBJygbPPCQv44Fcv6L+fy4noCNKojbmYDYI
	jMZVSMtB33bjMOi4PI1ChP07bcxvwR/KLdz2ZAmr7fxdsKnBgUFRj9AYq+GmS3D75MldvQx6Wjh
	a46MdEM3oBUxDjAhbXoSZjg==
X-Google-Smtp-Source: AGHT+IFDEIjm3DAQ9auq4uM8uVG5ZGZ5EZoujr8el53HHhvTwmDVNTZeyCi31Dnb2f99N5E4a/jdjzSSCSIJNaWq
X-Received: from pfqg8.prod.google.com ([2002:aa7:9dc8:0:b0:742:9f9a:bb76])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1790:b0:73e:970:731 with SMTP id d2e1a72fcca58-742a98b2242mr15775081b3a.16.1747606212313;
 Sun, 18 May 2025 15:10:12 -0700 (PDT)
Date: Sun, 18 May 2025 15:09:46 -0700
In-Reply-To: <cover.1747605658.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747605658.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <d4b30e00ca64a233efc2a7dac4bc568186dafc71.1747605658.git.ericflorin@google.com>
Subject: [PATCH 1/2] staging: sm750fb: rename dprBase to dpr_base
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `dprBase` to `dpr_base` to conform with kernel style guidelines
as reported by checkpatch.pl

CHECK: Avoid CamelCase: <dprBase>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.h       | 2 +-
 drivers/staging/sm750fb/sm750_accel.c | 4 ++--
 drivers/staging/sm750fb/sm750_hw.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index aff69661c8e6..a2342c69a65a 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -50,7 +50,7 @@ struct init_status {
 
 struct lynx_accel {
 	/* base virtual address of DPR registers */
-	volatile unsigned char __iomem *dprBase;
+	volatile unsigned char __iomem *dpr_base;
 	/* base virtual address of de data port */
 	volatile unsigned char __iomem *dpPortBase;
 
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 44b9e3fe3a41..97791f1b0123 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -19,12 +19,12 @@
 #include "sm750_accel.h"
 static inline void write_dpr(struct lynx_accel *accel, int offset, u32 regValue)
 {
-	writel(regValue, accel->dprBase + offset);
+	writel(regValue, accel->dpr_base + offset);
 }
 
 static inline u32 read_dpr(struct lynx_accel *accel, int offset)
 {
-	return readl(accel->dprBase + offset);
+	return readl(accel->dpr_base + offset);
 }
 
 static inline void write_dpPort(struct lynx_accel *accel, u32 data)
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 64b199061d14..159a5ad621f2 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -58,7 +58,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
 
-	sm750_dev->accel.dprBase = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
 	sm750_dev->accel.dpPortBase = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
 
 	mmio750 = sm750_dev->pvReg;
-- 
2.49.0.1112.g889b7c5bd8-goog

