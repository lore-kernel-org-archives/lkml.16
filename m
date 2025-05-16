Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4E7286424
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364757; cv=none; b=NYk5WmkOa68RdaqsHI1xhlgi3rKPKEHtfkDDupg2I2Pwqc16YRFPTByBXw0JKbZyHLdwJ/B79A0xKHV5FiCb2g7UThls3xnjEuMcZuNHr2YvQnbW/zek7CvAsyFkMS4teS0K3aD0nr3/Rfa2YyRQF/ggPvdl8D1YJYvT6PuwKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364757; c=relaxed/simple;
	bh=jwzybOogsnpwjXZfW60XYhy2TYjkOLviZX+I0L3/c8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fDjb8JnQgOFpLAhXB6RxOBzAbq2MtFHTYXQBS0yr2v9F8HuIYaofQo5eIiSNaaWvFLVhHp6GupiAmq10sR7uyVCY6mnY2hKeY4PLfg1waaZJDLf+M252xiWD3F5TQa8M39eMcDsFpk/fTskDUIdM1oTftj7ZLLsF0EwvvOAgIZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=SwixV3/Z; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SwixV3/Z"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e661313a3so19179775ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364754; x=1747969554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9SYuNTu0FAVFrwp78RXEvkkHj//qONU+zmTxNF3YZI=;
        b=SwixV3/ZbIl+Jer0vLp9EoYWI2T1isFyt7iIoO4YYKa+QLeEaddwfUXAS3JMKGDnUp
         MRykxpF/WPkjVaJjLUM2IkFo5SCfEYSeEeTgkvJvRbWevR+sRa/KS5lLIAqljlTHC7nQ
         FmBc8DBgJEm0ziw7wfTH4k+FIR27qTYampFkQyVutF/79K7s7PwwScme5SGmF4jkgbeQ
         qeuFGovK3PMLgaiTmkGdwCh+sgmBvCLjrUe6OWRsLx/f3lRzMCoUbFhmjYzUt5O6w4+m
         D6rgtK5I4e0lI3AKDkZLoI7zgHbPKTqi4YRd2tVcu/jdh+WU4QkhRxxwGliFX/0QpYVF
         lLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364754; x=1747969554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9SYuNTu0FAVFrwp78RXEvkkHj//qONU+zmTxNF3YZI=;
        b=sdMm3W/PLSYJEMyPb/EBlHx84nezzToSjKUV/0fu4cj/yY3xIjyZ3pYFx+ph2hOjwx
         VY34Z73Evuw7O7CJ7hUCQiIhs/Craz0xNCxETutJKlsfpaBRtv3xYP7dKVPWluJwefw8
         F7Yhb/yAXdA02MNPjykDgbRBOD+7HqlRTmTA7mN/8G8AKYNeSSXR6MoVVsftDlRlwgOJ
         D1lm+g/0cThUEfo+BjWgt3TaYXW3VPahdmXNz8wUekc9XWzm5QJYv4cbrGN+mZ0Kbg3j
         Z6+HPAW0AzpYsiWQRHKKu5qCNC49tgvqrZf9L+H45+iX/ruIEsudIWtX83tM+WxBp6kP
         7WkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzLRExe+AjX1qdS8pHfJt0pzF12kiwLekfawsmYglVFyHCCydLEiLWusnUGhEJilt0HxgxcEonb6EOsH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIfZlixu/P2vjBkjhA+LXszZYVtVNoHrrnBYA3PB8PmA78ATgw
	gO8PohIBdP3tKtGa8BJoNOWTY9asFKwFfmEnudd4xt4++1SZQbXJmihqbeeYxlwtPcY=
X-Gm-Gg: ASbGncsVG+X8WW1VpAHEfKR//ZTYqi0rtVc9VjLTMmkvewnFhhN+1bA8Er9QpujIP+8
	lq6LYBujpeSbubxmvuZsqU5g6z3Vh/305lxGbl3CR47bHcqPRVLJ7noOYvw2tULjZBsL1B1wMgf
	JMs1wEYUlY5dhj/tpBHPVnh1qpyZ+jsxMNL4qu9Ib3WZULsvTEiSIKZ6ihTB/HHRrIErdKyF6DK
	58B55lDvVmhoqt8a9d/Dj0AXPsGcibwKUlt2gIM/Gv03u41xt+GyyDO3K7jPTYiDlu0amKUztqW
	7TaGmTXuttbi2cp9zr8eUUv8wZtVzCOHR69KTs8tE2EAXICP7hueZFhzHnZT2Oc6fWZOYt001G0
	URDSCOHsyuYA=
X-Google-Smtp-Source: AGHT+IEZ2ronJfVBYw0CNofcDTNPNdTruhtwvA5nHbntYV+GYPIfnd+sdXjNknRMWd6vX6/qWCPU7A==
X-Received: by 2002:a17:902:e786:b0:231:d143:746c with SMTP id d9443c01a7336-231de3ada00mr9814335ad.39.1747364754532;
        Thu, 15 May 2025 20:05:54 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:53 -0700 (PDT)
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
Subject: [PATCH v2 06/12] riscv: Add SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 16 May 2025 11:03:04 +0800
Message-Id: <20250516030310.16950-7-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
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
index 6042cc3021de..9376e1ce133a 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -9,6 +9,7 @@
 
 /* All SiFive vendor extensions supported in Linux */
 static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
+	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
 };
-- 
2.39.5 (Apple Git-154)

