Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8316C2698AF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954470; cv=none; b=O6AifxhlNB/7/efmoWycnY25gZG9ip6jyhc6LMTSrYfLxJminmjCZccnLcpM4ZP4rXqkQOaOcrZhFGuzbZq45veNnN7tlTn6ka50z6ejtzOKXoJJQ6V4hoggro0B/kIJn5SoddpAbGqy5U0mAgZWDlIjiFd1xXJsYt/Q0P/fZ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954470; c=relaxed/simple;
	bh=JlciOvrYWEY6b/YhgnP1Ke7pg3E8uGE4s/5/enfMR1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GTjADOAyqGH4MpTlUKAcFnXe81KcvB9y3tIciA7bNpseEA+4u0YzqHpx79BfCvzvgOOtXQDZcmf4bDT0oMGWxoh/fvamtOi2m58tC/P152GkoMGSQp0MpmxbN2Hdpr/VIA8ikdh9SJ9OCTAgSnibg0afw/xAn47UXDrhTpaXhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=SeHkzRgi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SeHkzRgi"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22928d629faso17684225ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954468; x=1745559268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TI4WLg30HJ0iF2ftd55+vT1VVRqGXHVwe/n9GHUog94=;
        b=SeHkzRgi0rMLMkQOHq/nyRPnwe+nYchfjLnTmbB+wyj4cj9hAcpuGazgdGGNIZMvz4
         Ras2TbmWu4xoAiZb8ctyJ9KtGYp8C67xSdNX7vihI9197AH91fMT/jbIBxJrjDH2dXhe
         jrCAXgrYa/QIhWrWbNKSdzWpdTIAkZzQ8GL6A0b2IvqiTwBA9oRaoRqAvfVK3IndviK9
         22Lo2XuMeHh1xWLjf7dv852r2g/nKg7xud4zYsmUQDTGLWmJfeNHQtedEgX+yy7xM3Ng
         eSdhUBlV66jOTAibpHSh4xolsoWn5ILis5qdwHmHutvuAPEtF9H8ZWw1OuIaC8FnOTzh
         UwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954468; x=1745559268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI4WLg30HJ0iF2ftd55+vT1VVRqGXHVwe/n9GHUog94=;
        b=Ut51YwdxX8uHRgQzw+ziqhpvQZpJ5qdxcWGG9iVHJH/BIQPZAwRsFVnCM1Xl1bsdMV
         Es4X9XoGQdWhfqjh65H13lBbPbS6yx5iYuH7zpD+51C0N4atPDjITuGSKLuNEWDnWVBm
         XYd8JhgK8L7GzdYjI4fvRZxiV1d9cNQ8Pfq6p+ZPfPVOC87m5UtqHEXBraIPUg/oFqOw
         qRoOFDXPH35zlkngaDQIfX86ky2glsT3LCY1qIif7jnQpqCFQiRKqDxHLggzX/1YZLsL
         FkyX997hpTZB/p4zJvpQ400zl4Z/TfVHYL3NjiDkhTz62PedUXw5Mn14ccZIHTY8oWS1
         FWug==
X-Forwarded-Encrypted: i=1; AJvYcCU8Wr5Q1o8nfZrwfX32/mvevJqkZ/0jGMF3J5Q+nSIvUhJATBo51Ao0yvw3Uk9tmHFcO5/1k4HcYERKQnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRpswpU+T9WeqXs2GXsVQXNvdI6GXrlYjno7AWx9NVRDOWeBYE
	WNzx7fUvUWg81xk9MTpUw80Jh3xPqDB7VQX9AlwjWYNgUEeUjqw4YK3MQ+P2ZBM=
X-Gm-Gg: ASbGnctleTz4fZNMn9ms3mMS0wr9y8WoFT6o+2D4KjleyQ9ikg9mXezMAggjuYZLwKY
	Gp7wBXj/aYR/RhPSXIsxlu/RuZwGcJkiVDt23tkn2hE/ez3HopkH+hU8Ao4cLoihlRh6wkP6R1m
	O01XVXOwyJPVJpNDrVdZiQ3qByZzMGYAw5wDPLCfzvOBxwWp3XRTvlZYredkS728PnRNGcEFYzk
	5cnmvOGAufyPPY9HwIymUDSG7xn9A/NKwxRZwxTSTc6pDtEDtZAguvieBAhRdp3eaM8g1FJSCzk
	Zv3nVHMVvNnM5of6ATAooTUioi+0MFXIkwCyV5dN9oJyIe0F+Fvz9ern7PrU4YD/63h4qx5yvXR
	t
X-Google-Smtp-Source: AGHT+IFv1lehPDXJIUVh6U71O3mQnTUUjpaJLVnE2K+fIDs2kQFHDaeWEg6RoPOaNtbqAjKHqbHtow==
X-Received: by 2002:a17:902:ecd1:b0:226:5dbf:373f with SMTP id d9443c01a7336-22c53379f8amr24165215ad.10.1744954467906;
        Thu, 17 Apr 2025 22:34:27 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:27 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 06/12] riscv: Add SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 18 Apr 2025 13:32:33 +0800
Message-Id: <20250418053239.4351-7-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SiFive vendor extension "xsfvfnrclipxfqf" support to the kernel.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/vendor_extensions/sifive.h | 1 +
 arch/riscv/kernel/vendor_extensions/sifive.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
index 608004250e2e..2d05e3e73170 100644
--- a/arch/riscv/include/asm/vendor_extensions/sifive.h
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -8,6 +8,7 @@
 
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
+#define RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF		2
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
 
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
index 990ac83b1f81..077315e5b2d7 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -9,6 +9,7 @@
 
 /* All SiFive vendor extensions supported in Linux */
 const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
+	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
 };
-- 
2.39.5 (Apple Git-154)

