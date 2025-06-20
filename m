Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD21263F5B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421305; cv=none; b=EIDnT/KSIAqI/zNZAlMjLEZTfYcFk/jTEAs+161MimTWPIfUQStB9J0JLh9lQv74Pe5Gwr/WEOB1t4E4EKhrobul0benkVxlY21kg3H3FworaHc+2eaowJVS2C/86GmtE7EJWb5Wb0OcyTaYBIe8YKp8vSYithY7GGMQsTMbS/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421305; c=relaxed/simple;
	bh=NBzdre9NgtizA5cyu5ssuTUFGpGinr6k0RX+SHNCvt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bO8xTXCaFrSxAhapDwmAKshPQXR8ONn6j0yWQVHilgOJyor8/FdVrFoUZtVkWbnOroMWaK9V0+J1RyCiwJyYny54AaO6GbOqGbCt/ptbU1f607/ajOdnnR6Ln+A626SCpD4FJY90v6iXY8BeJ595hLlTPDUV2MC9Tqby6K/q58E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bflz84RN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bflz84RN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235e1d4cba0so14536145ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750421303; x=1751026103; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x1fjBUL2XYvHrykgkOfMnXaOkNrBJXoSMebmbae1qII=;
        b=bflz84RNcxZgSiSwV65UBAaRFy9owsvcxVB9U8+RFNfTr/dTq5v1bIw/R5FuR80vy7
         +lPTIsl16UwsgdyaYROmyGyZoCH4K94EJRxdSkupp2RQhMqqj68TYd6c3v1d07eSTSnP
         uiGWDxtIUEwrHiz6V51Xny4xoURye+hg+t0qCKswpFji5HBypeRxCtg6pEOCWEyXnqn0
         lhnf1AxvARpdol3tz9krp6eANrbeiepVC4ztHZFWIu8HW2kaQP6AqzSmDkdMkYtJ4kMt
         FSBLSJ41DNfpF8vtWPafjwrSPKRdmhkbVWvFlE/sTmKBsLaerw6sA/o53b9D5+D+MARL
         1+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421303; x=1751026103;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1fjBUL2XYvHrykgkOfMnXaOkNrBJXoSMebmbae1qII=;
        b=qbS3cMJOR30wU15tnz2HYHCm81d6LZWOFVWD/TRp7+NPjFCm8V3Dcs3yQvrQrRUSHa
         i8FKDwrqXl5uxnVB12o+5hK12bNz8fA3fEdWq/Ud3ECbbdnLPk0Z+7KHUs9zHjAXbvNa
         BWoAVtcSdiaAC/9JvOmUAhlDWusySuBuxcbZRAFW0+Hehe6QZTzXbnt4amaC5srflgxC
         eCXaUP06ooYV/+uIJnkaZQxqWcv/wo+q08mSu9aYS4wbqmiJZXY9h/Z5Kd2X+rifp84d
         yixa2feLUEstad3frq7yeJ6owe0ZDd41X27qLl2gJFC9w5FmBUjKVY+HvvE97weWpKrU
         Zkkg==
X-Forwarded-Encrypted: i=1; AJvYcCXgL0o+Pd7K/v78DQdNUQTMoJ//4deFPsl8gQRcWqlNGqwctZfCoOj6S6cs9OaQQbvGCuUIB0Redx/MCY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjrlNrHl/LhFjuTsy8n5kcnY0H1x8qoO1apdePGQhlb/ayNeTn
	fPaMloY3JMLRl4Yw7Pix9b/iPDkvXq64Fw2gm4Dln2KgaaoTjOerBQgoSw908SroJbo=
X-Gm-Gg: ASbGncvRkNN6b5I1/m/CCo7NCp2KL9A8dKLyHU31IBUmSI7ErAlHi5JU+inXsxQCgpw
	MXe4BsOSIs+o7vTHwx/scVyrfqloo5HHqqQDRmppUT2ewfJCTSkVd9RIXQwWNfOtpr8vgA5lLCX
	euGcGOnmhnFYjtyKWdxTVL8LPWxLjxuJr7j/5tH5Yt8pZUJF0dHVMio0YQuD7wW/O1bX6g/KIie
	DYXjDIy+rlSbga3F5ngL2XuvJz1AnXbtj+xiAemJaQNI/bch4dB0soFDMwgrdnRCGceC2xTDiZs
	zvCU6OquSEHk3R9SDYvTOGsTZ1oO8KKBFBPSxJ7P1LvjJspnVpTJW+Xx5+4W4DLLkyd18EPLfJZ
	sBO+A1Bmbaqfft34InW+elKMOs7ibP1nvEQ==
X-Google-Smtp-Source: AGHT+IGycHzAhUJJAN9cpgp+5Y+FIXbfgDE2lvPamJQsbOi0tfEHUE8qePJHDEgGxwDJWS+qCgrtVg==
X-Received: by 2002:a17:903:1988:b0:234:f182:a734 with SMTP id d9443c01a7336-237d9954d7dmr41126535ad.31.1750421303295;
        Fri, 20 Jun 2025 05:08:23 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8664731sm17063945ad.155.2025.06.20.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:08:22 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 20 Jun 2025 12:08:11 +0000
Subject: [PATCH] riscv: Fix sparse warning in vendor_extensions/sifive.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIACtPVWgC/x3MWwqDMBBG4a2Eee5ALlrFrZQSQv2tA6IhA0EQ9
 97Qxw8O5yJFEShN5qKCKirH3uAehj5r2r9gmZvJW9/bp7c8o3LacPIiZ9SciiKqLFIRq+MOLlg
 M8GMI1B65oHX//+t93z9FVBIabwAAAA==
X-Change-ID: 20250620-dev-alex-fix_sparse_sifive_v1-4e130e7e2833
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Cyan Yang <cyan.yang@sifive.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=NBzdre9NgtizA5cyu5ssuTUFGpGinr6k0RX+SHNCvt4=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJC/Y3nfbjQHPYnKbowX3HWUfd5d8wWzG3IWWmu+8ZOd
 r2dbSNXRykLgxgHg6yYIouCeUJXi/3Z+tl/Lr2HmcPKBDKEgYtTACbybQojw9PtcupSx3e9LN9Q
 42T8XUS+w+zuzcLfkpOu2JYoVwQpVDAybC8oE3rvUXh55+IT6mp+VX4tU0+wTcoSsvlhISTj8fE
 RAwA=
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3

sparse reports the following warning:

arch/riscv/kernel/vendor_extensions/sifive.c:11:33: sparse: sparse: symbol 'riscv_isa_vendor_ext_sifive' was not declared. Should it be static?

So as this struct is only used in this file, make it static.

Fixes: 2d147d77ae6e ("riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505072100.TZlEp8h1-lkp@intel.com/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vendor_extensions/sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
index 1411337dc1e61aba0b844902f356625048c85abc..8fcf67e8c07facd1bfdbc0e18dd9b43102f22145 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -8,7 +8,7 @@
 #include <linux/types.h>
 
 /* All SiFive vendor extensions supported in Linux */
-const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
+static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
 	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
 	__RISCV_ISA_EXT_DATA(xsfvfwmaccqqq, RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),

---
base-commit: e10a0dc2d21fd742c8d6ba042a98c05815011f9d
change-id: 20250620-dev-alex-fix_sparse_sifive_v1-4e130e7e2833

Best regards,
-- 
Alexandre Ghiti <alexghiti@rivosinc.com>

