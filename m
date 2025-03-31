Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45D820E6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743446748; cv=none; b=P1x6zNXNzEySmVGGewXtp4Y/TlZjrsFVeqwYQSjJeCnL7vlILloTWHfdAkdcB+P68j2iGISSaSolusJ+rdeQShb/crfG+YIq6tKONLKBZp8wKTmD5OucfMYFbda0SCDHZCPqrBjF8GgQ05GLDnWu6GkRinAjicGKapTUAa0ZC+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743446748; c=relaxed/simple;
	bh=4LXcETtt3K4/rh+TAivsKHaTWupP4hxrvamLxJXSmt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y6mTR3a587L3MxfX1ltbczC7b3Woy9vj0zy8XgmNqU5wRq1XFEZZAuOHJYjwdF85CW4KpHB4o+8qk3ZTx4fAG81eBfuZaJJY0KzTYW8r/C4YSymM4A0WSgezYj/PfUzz3nTu4a7+Xcj/qOGXB9RKXWH4knf1noma5cFkWguijA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=JlZzf7AY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JlZzf7AY"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227b650504fso95934185ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743446745; x=1744051545; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sHrYmzqXypANsCU2if7f8K10Wh3Cm6dEuo897D8CcJo=;
        b=JlZzf7AYTKuD/oOatueegq4Ysu1VaDvIXRspveWG5aVIw/8NINcR/owXU4eL2RZhok
         9kgCIjfzK6YTyae2Ub0TTglV866/ErGVCGzrAjp1GlPzXtUbteuh8MxmoFhOCWatsGDS
         kDQjaXpNBWGYE7Y0x1FX6G84DDa+cwBtI27RovdIyXuVH5U8ThZeYgIw4WgwAcTjdlpQ
         gE6fN+nnal+mvQRpKqB421UrDlvPSmU8aejxuVdTx3nsu9Lz1OIllI8g8xDS8T/uJr2c
         jFpdSJAUY5/mlrjDbwrjpESRVRgFIhtOMZbXkbrt1yiOUwFIs9+DRETyQ4ii39hXLfFS
         6G5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743446745; x=1744051545;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHrYmzqXypANsCU2if7f8K10Wh3Cm6dEuo897D8CcJo=;
        b=G5pUhqjXZF3rBV/9cvCvOx6UEVo0109b7hkgUIjpHQAEak/m5X5P2yxMxLzHK5coI8
         bzaVZYx3WxfdBOhxJcGIrHw48wD1xASP3Li+PjlOQENDtxtpSHMDseW3QzWwGfbT6HPT
         D12pSSxL0sFXcHeYhXPUWe6n5UbUIgtNt7F1dvlG8g7gXXNfe+SDcLBjwVHBGJ2TY+Fq
         WSJwRALRn59ZiN9jH2P7xyzTagJppFOeTd5NvvVD0R8Tduuxw2dcvxHZk3vcdTD4Utto
         Gc1bGjuz0SJOWwujjjTCY1cLE5TeANb50CXEpty2cRoEs+57zkbh1Lr6ZIvz06c20dxP
         HhvA==
X-Forwarded-Encrypted: i=1; AJvYcCWcTm1cj/zaNO1jsa52vabHQgPm+VDvuPoCoMnevyZIi3KGP42WAqZmhOOLvwwXPAr7PHF2apVp7WqxpVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc9GVU2lyWo+a/8DU8BUR5AZnG68JAAkyANGq7h1fd8UE3JKSY
	queOl86a0v/ccyqrwaSmbOGJytPKewWNzUv1UXewk1Z9uShcvUrsLm+nHMdtWGU=
X-Gm-Gg: ASbGncv6AvGvvLzB9lpwOq6KJYkiEdbPXxbHmB0lsLSXczqW+TgRn53X5h7tcY+nsBR
	q4+R/S/CEMrunQuNkf8HJIrPmyxhoezdzeIySPdJ00yTMTKMe63TwbXxRh4IkZGrMj6fz7E28FT
	9BiEW51kl1TpVHlVDfURNG51g2qvHfzwQaFRDKY20AGxlnWNvPSF6tJtKol9EF2xeDo9LzwehJM
	mfxmhmz0gDq04uWibeD+3srWlI6E0C0vWEjk6t5oAGpWJ3NvVL+YMTCP+GqhDxZXZtDFgOYpeOU
	CxI9Ml5TFmX4usLx+ioG6CgR2PVCR976yMews9KOg4+tCP1zoRWuSyaIGAt2
X-Google-Smtp-Source: AGHT+IED09uEsRGdj2SUZR762IRHLQrYNjp5KLiarmzKwBbsgEsQtwu3RthuNqrzAq2XgSdkiFKgiw==
X-Received: by 2002:a05:6a00:2181:b0:736:a4ca:62e1 with SMTP id d2e1a72fcca58-7398037c626mr13160155b3a.6.1743446744652;
        Mon, 31 Mar 2025 11:45:44 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e1f8c1sm7517353b3a.53.2025.03.31.11.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 11:45:43 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 31 Mar 2025 11:45:24 -0700
Subject: [PATCH FOR-NEXT] riscv: Add norvc after .option arch in runtime
 const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAMPi6mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY2ND3bTMivii0rySzNzU+OT8vOKS+Lz8orJkXRMD88Q0wzQjE1MTQyW
 g7oKiVKBSsMnRSm7+Qbp+rhEhSrG1tQBW8CV2cwAAAA==
X-Change-ID: 20250331-fix_runtime_const_norvc-407af1f24541
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Klara Modin <klarasmodin@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=4LXcETtt3K4/rh+TAivsKHaTWupP4hxrvamLxJXSmt0=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qrRxfy5weE/d3qKX+k9f6hmSf1FRlSbqc/5MtfJinyO
 clv/9WlHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEzkow8jw0bNEq6MrY3zb182
 DtoW5vj7zcydNWt4jCu5P3xXMdnkv53hf9ahw9e/Myfayip9bUoxZI3rmrM+a9n0DXec3ifwf3W
 8xgQA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

.option arch clobbers .option norvc. Prevent gas from emitting
compressed instructions in the runtime const alternative blocks by
setting .option norvc after .option arch. This issue starts appearing on
gcc 15, which adds zca to the march.

Reported by: Klara Modin <klarasmodin@gmail.com>

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: a44fb5722199 ("riscv: Add runtime constant support")
Closes: https://lore.kernel.org/all/cc8f3525-20b7-445b-877b-2add28a160a2@gmail.com/
---
 arch/riscv/include/asm/runtime-const.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index c07d049fdd5d2999c57d8a90e7363829c5462368..451fd76b881152919f22de8f5c56b51171acbf3c 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -56,6 +56,7 @@
 #define RISCV_RUNTIME_CONST_64_ZBA				\
 	".option push\n\t"					\
 	".option arch,+zba\n\t"					\
+	".option norvc\n\t"					\
 	"slli	%[__tmp],%[__tmp],32\n\t"			\
 	"add.uw %[__ret],%[__ret],%[__tmp]\n\t"			\
 	"nop\n\t"						\
@@ -65,6 +66,7 @@
 #define RISCV_RUNTIME_CONST_64_ZBKB				\
 	".option push\n\t"					\
 	".option arch,+zbkb\n\t"				\
+	".option norvc\n\t"					\
 	"pack	%[__ret],%[__ret],%[__tmp]\n\t"			\
 	"nop\n\t"						\
 	"nop\n\t"						\

---
base-commit: b2117b630c48be69d2782ed79fefe35dcd192ce6
change-id: 20250331-fix_runtime_const_norvc-407af1f24541
-- 
- Charlie

