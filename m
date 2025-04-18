Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBB9269CE4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954482; cv=none; b=JHUCHp18Clkk/p/TMMwlzS/ByMltZ36P6YET7XjQxmAnOCWo5t49SHooJDWR65El/Mosf8Po/5cJ53K9ha7UazxWXSIPrsDWFxAoKoEdV+98OOhAcKPdnA4WfHZ82ka4mcuMPCMUnFkdTXN+DsyX0ke+NgQS+7uGQ1r4xgCcPdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954482; c=relaxed/simple;
	bh=0tp3DYKfV6TqzzMeGOt7zRglW3WoNctrJHskr09ur0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XE47wkmHCsv5xS9x8n5S8036flPgM1VHZ2OwHB0g3zI7avsiY4IcLK5iSZbkJn6zVcRERm7RiS10Mo4jzLBlxXSDPD1Ln836jTxTMoCGWTx9+OB030luNDALBzqOWVAvb1qC+65ClWzA8DLmiXURP0wlG6DKJhej4AteVsPVgJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=TTCkN2+q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TTCkN2+q"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso1346505b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954480; x=1745559280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B9Pw4FCv6SInWNpKovsdWyAhm6Z0HhbS+dPaBZ5QxM=;
        b=TTCkN2+qhT7x1W+mPkOAGeGGkyZN2KOLta1ynP1PcJEIp/NCpfUATIYkvPf1u1fAYs
         DclWXgikXTl0riWpASNBH4UUrBsm2y5iAbwbNavHRY7VTNT6dvk1jMHRy7D/8E9uNRdR
         0UcwUX3W9MdrfZMBBNLYvB3ZTH/qRONEdTKuwT7O2jtvP8Vz/2pw2EOedyimTEz3MeDK
         mlEPRV5EHkppnPnDhdgt2KjHAYLMgmO9trIHT2FzLXqu+1o++iSNS9ItTsYM738jFRtT
         cPtT/z/D1Z/QdtILfhIemaeReQkLC5ttpnjLcV4U+ko8/mSQUFaVJDF3Uj2PCcKJjeBp
         g/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954480; x=1745559280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3B9Pw4FCv6SInWNpKovsdWyAhm6Z0HhbS+dPaBZ5QxM=;
        b=r4coT3428aVHR8qw0xE75pTzk6t9DIsvl9B4gT7v+p8DVJ4pxb797kD3TzyiVpkrVE
         Eo3WPcIw5BiPA9Zy7w2X8pV8Y2LenPE8IQHxChb/OXPIaLs0R5LzFko07DC7le2qKzYv
         nFNxFOF96j3C7OeDC9brZwAOd5xcWCWekIvoI6GxWIc9Agc6oUu+50L1CgqYlF9KYcx3
         ErLIWFJVQK8Klk0oyuxOjj6WESNKm0pLuUfqtyAUG5Xg7ABBGj8gaQRaNFMTBQYIvB9G
         /QNO5ddt3LpbKw8ez6jsPfMzA7CplbkEdM28LWZjKC3oVNtJzCO3DG2b7yZJmWqzr6DL
         iZtw==
X-Forwarded-Encrypted: i=1; AJvYcCWuG3/rBsrC8uSN8/HqK/lBYY0kC3tPHksdmcDL4Qq7rFLo8SZEQuIs8t9Jmfk4rt4mlKK+hqtbdNMoIEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz59E743BKq/XjySAH7MB8XllCkbREnzG5r8kEOlc8jPynv1o7A
	0XpeKtXuFzoq9hlpX7KKPFAFIw1tO2L+fS0AlpFoNjDJ2nP4dIZymaLnMZ+vPVA=
X-Gm-Gg: ASbGncsm0INsvlU+aPdqah/Dz1oNDSz4Y21FOXdMajDUra8EjiVXbXFSagSRCsSK4v1
	/fAueOHHwZywGbDmJEbw1lOrfTEoe83pHaSkE4dQPwsgcDDQ7W9zEtI9WeK3pwU3pCLzP+eVG2I
	z3YNkvmgd6uqiQCJwRz484dt935jpn0QKlEB+GHbh+E/XEdT/YOmKLNuR9WGMfz/EsGQ3qo5DvG
	X3zTUdVs0Ke2PlGyjT/K8BhsciXqYlUsBw+7OHNWkwkzqwKpoooO/7SeGDY1hvwiGCtoFQTM/TT
	jUGoTa4B2+sM3gHXg0h2r49Wi+irFS60kf1lA89Q9FMX48hYorpj+1VBiSc2+0TXARcxBWIyFTO
	N
X-Google-Smtp-Source: AGHT+IEuEbIHe/qe/mKunQ55/N9j2n9eXoEPrfFel1LpRV6cO2jrZzwdtlvPw0EFjDejmF7X3JD9pQ==
X-Received: by 2002:a05:6a00:114d:b0:736:3c2f:acdd with SMTP id d2e1a72fcca58-73dc14c80b5mr1878741b3a.14.1744954479883;
        Thu, 17 Apr 2025 22:34:39 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:39 -0700 (PDT)
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
Subject: [PATCH 10/12] riscv: Add SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 18 Apr 2025 13:32:37 +0800
Message-Id: <20250418053239.4351-11-cyan.yang@sifive.com>
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

Add SiFive vendor extension "xsfvfwmaccqqq" support to the kernel.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/vendor_extensions/sifive.h | 1 +
 arch/riscv/kernel/vendor_extensions/sifive.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
index 2d05e3e73170..ac00e500361c 100644
--- a/arch/riscv/include/asm/vendor_extensions/sifive.h
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -9,6 +9,7 @@
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
 #define RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF		2
+#define RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ		3
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
 
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
index 077315e5b2d7..1411337dc1e6 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -10,6 +10,7 @@
 /* All SiFive vendor extensions supported in Linux */
 const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
 	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
+	__RISCV_ISA_EXT_DATA(xsfvfwmaccqqq, RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
 };
-- 
2.39.5 (Apple Git-154)

