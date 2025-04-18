Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0F5268C50
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954476; cv=none; b=RW1CciDDY90+O2EFBqsviptnriOYvmkP7sWZ+2yl1GXRWlGKMw6YLVws5iAd8VR2ZC2zWouSeC/JuBeVEix+ZGhvfv2CPGNql/gLD1G0I3lAkGmlFulREdqiJSRpR7t8hd9fwnXYs5DL66NXOMLEFUMZy85ncrmh+/A7Ez1M3/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954476; c=relaxed/simple;
	bh=76YvIuqiHwshKlnxsI+ssczIVIKtV6Kxq2bsjqhgSno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WrkLVlNVTQQhGo/14arXGqMgcTLULLoIuDqGjlfrtSBclElCJSniRXg7gXWKSX6sRWbrJXCNvYlKXPHZ/anmbmaF9DJe52C99t1o3gP/cN920HlKSLLf+iNwfrQu2n92LxSI2umV2FSaZ0I02Pq31fnWUYPAzewz50oitYPw/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=PLugXLhC; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PLugXLhC"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224191d92e4so18107785ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954474; x=1745559274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uebw5yKXQY4T2EOZNFFsPOSoaV3mkjJcAwfE1uNSZZE=;
        b=PLugXLhCWqcv5WFKUUII22tdScfCHFZ8aZ8tgL0bIO2dlDEvw1pVoFNbdH6fpDAYqe
         Pu4Re0uQLwG4GCk/YYfX3pJs7MmVFlIyuSY31j61KSbs2lEUHlXuQt7AwjHXGMnehI1L
         5B7ccyGkxgX/ytNWAN1v/UZI6vgemrJIUwbjy22O1pVvhMveGejp4rTEpn19jDxg2cL9
         1ZKJrSO1ozXLMMVAiE8gFFyWwlF0YhkFbHbQ2tABtMr/d9IXoyd/5/dyX4V/ewWX9UBk
         7nyILb7VoZLd3GhfZAkhTIG6NzUpuGCXYmQ1noRBUyUno92oUzyjQLCRy4sA8RYgRp/j
         jJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954474; x=1745559274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uebw5yKXQY4T2EOZNFFsPOSoaV3mkjJcAwfE1uNSZZE=;
        b=FgONfKs9rDlqJ2pPZiot0h0lDJ89EvdomyUtf5IixMKC0oeQTkNAEB5Eopj1c8937h
         ld4ABly41VIBnrq0eQKa3UXIkOggLv85jPLjt4G7APqkI3fMH7NQgFxtIZoSGvKajsXy
         bHZ8Yyc3gAY+m3x4HSq6ooErhI1/BlO+gLc8Id/dOxFn9PE6GcnrIf5CfvdkKkGon0q8
         ZA13r2zTKpy+9ijis4YT3K3cdk30maLJkbCmfHsysNvn1H3Te4XkGsd0zFq+C0o7A8S9
         PNjj9rP0n7oRoJFJH8izJlf2+LXOAaFRuiJJrEtzx30xvV9ZGM552oxVtSrgjCNtyrQS
         xH6w==
X-Forwarded-Encrypted: i=1; AJvYcCX/COKvLPGTuaOugQZ6PCJwl3f7npuArIFa5kwkkoNgVml+DVsAL9buQCYWkoYa8wZbUuavUW1NLfTbgHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVyWwi4/XD+SgCF2Uxavt13JMJUHGenNNuisWh2z0IptyYkGm2
	zYDCeO2FEfLQP5UV4LsQPwpfXcgw0Wf1DsT+us3PdqhFF9sXGvZMWMvYM71wnBY=
X-Gm-Gg: ASbGncsbJDY9wjU1BoRqt9T1VRbDms21yEUEWt1lQpOYuBuF7/ZCkFCI9tYtaPzABah
	KgqfknWsBVcsryzS6yRjVCGgBALs2Nk2RPy3v4GHYEmRdYRjJMdPk7BKRf6aTFBgvI4E2gFbbGa
	JaYTnSThmaxL5aDumjgPO3Y+5WS7JgwmUzS5VhxD2Xs+TezS2D3+yuKK2/3Nh2LVqyX+1n3sT7A
	JGET+KfzCrU7/8cnZ/hOLWHivmb6cN2NTpekSOIV4MaN7RZ2vjkjnDtjEen0ZuiQdcybvDIw88Y
	qVaPqdMNrdXbaPmaKc5teN66Ieo5BU1YMTkUwzBtQXuzMhKAzwwKU31iNclzrNiaOW+9uxr0KuT
	/
X-Google-Smtp-Source: AGHT+IG1ezRHzVyZBpVq3R5kPJr8LKzkRPN7mMERAoel5mgKUSBrWvtrR0Lu6kfGSGmyL5o3WU+iOw==
X-Received: by 2002:a17:902:dac9:b0:224:a74:28c2 with SMTP id d9443c01a7336-22c535aa4femr23189265ad.29.1744954474048;
        Thu, 17 Apr 2025 22:34:34 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:33 -0700 (PDT)
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
Subject: [PATCH 08/12] riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 18 Apr 2025 13:32:35 +0800
Message-Id: <20250418053239.4351-9-cyan.yang@sifive.com>
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

Add hwprobe for SiFive "xsfvfnrclipxfqf" vendor extension.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/uapi/asm/vendor/sifive.h          | 1 +
 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/vendor/sifive.h b/arch/riscv/include/uapi/asm/vendor/sifive.h
index f25d8cf110d1..b772d4631284 100644
--- a/arch/riscv/include/uapi/asm/vendor/sifive.h
+++ b/arch/riscv/include/uapi/asm/vendor/sifive.h
@@ -2,3 +2,4 @@
 
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD		(1 << 0)
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ		(1 << 1)
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF		(1 << 2)
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
index 461ce0f305ce..2b9505079a9f 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -16,5 +16,6 @@ void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cp
 				   riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap, {
 		VENDOR_EXT_KEY(XSFVQMACCDOD);
 		VENDOR_EXT_KEY(XSFVQMACCQOQ);
+		VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
 	});
 }
-- 
2.39.5 (Apple Git-154)

