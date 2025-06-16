Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CF91A9B24
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067602; cv=none; b=mnmnHpcomOrWRUflNrNe2gF+1KR0oTvAAsM3ycYeEXRhQWim7jCNSJSl6ctr9MmvQ/SM4tyNnscgMw6HFjisd7y93SAwySl2zFqKMbtLNCSNM8k3Rx4ZuD2NbTl6s3sDgV0NL9Q8zONsZGkvjD657vvDtllErlNS+/iY4qU9N0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067602; c=relaxed/simple;
	bh=GBPmWSyC2MGJtzTz4Yy94riz8tn1NoYwkw1sPPvqSOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1LHySc0k/8UEMibJ+h4yteqI0jd96yIlgHuTNzBPdSEGsXYI7t7yHicBtwbERdlQN3gEFQAw/juqXDtdCeh9UVRnd0RIRNCWXaA8SZ1Q3X+zoRYekidPXjKMb+Eg8Dvwe+Fw8XHeQwQLhbGy2BST5Srne+f/1W0bkyexTQq4Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeCv7lri; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeCv7lri"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4211333f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750067599; x=1750672399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zad0FfuamqmmuSphFVg+e+P3L+V93hWV6g6wgdLC4Z4=;
        b=BeCv7lriBxjB/iLkbeNIhQofFBr2uoUb7xv0bNVDkYvno6S2g0De3yNV0S20M5MCUQ
         4ElIlq54PKFlaR1nMDGiav7jfAJsLV/pNnm8ScKowRVP80+FCcR/602MrV+abZoFgG6P
         qJTaTunmg3ur0BW84+qmO7eEcBLNXsDhK8NOazUkQdEh4vDmg0MgXeO6zYgFvCdZjzr8
         43i3AngZrTmvA4InluHgWV23+/YwQUZhI6U+/i8jLZ2FZy+OHS6NMJFdY5CNA8vV4U3t
         TMVDm5ZXTKVoZP4vRxlYGfC+OMuvH11IEL9a8ZaGjinDXW5UMqHjF9AW8zMsfyHifeq5
         bV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067599; x=1750672399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zad0FfuamqmmuSphFVg+e+P3L+V93hWV6g6wgdLC4Z4=;
        b=phBiehRz8ICnRvbTsZ0bLkW0trif/k0BjjpxbjDvu5p9jktS6tuo5nRiLZgmr4raoG
         p4WlBD+vARKBuCSghU3tXrgcXr6RpAfbNNMV66weiKWJfQZj52oTbXPFWrXBWgG7IfxW
         fCcpit0THSZaqV89UqCrCqn60bEf6TKahhGejdlhNaj8FJb/czaJMMVoiWadQfVhHgVc
         EXn9WrfbapUyP5qF4YxW/HvWG20e6ILSEgpZhyZ8j6AVHihjeHiHinBt/huHIDcSPsCQ
         GBJwDSmEteZQ1trIzChkDZ79VCe6gE5uT6aHvs6rLbFHeWRTvyx/euHPF50kRi4AjRkV
         BNkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFTbGvHUiqkt1Nht1YBhWWCpGQ2wLBlevZoibTK/1insVng9S2KjRL+2OeCrsAwsVGkxrXl3SWwvATTsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO6GLDuw/DbCYRuP0ZcFi4/ramf+ql+x7aFT+VZC1ht2/gelLt
	e0RNzLVozSJQy7HalH9RGSmlAieCVEU/UoCbdLXKeUPV7dJsvgkDFmxM
X-Gm-Gg: ASbGncuhbsFG87DQL7zxV8J9VfCF8Fr2iJUSSwwE5N/FAegZ4hXG4H/BoLcLqaV3vKB
	S4BFoK6xOKLXnhZOM5KL6LahqPXjrm3slQL5i/NKgzTzOJq/wfPSP1nYSuQE6Hrm/2Lzoo0DLqY
	4zd9NKji/yA3TU9c1FB25iF3/bgiBck8s8ZfZRuO6sptR+AsrRjWZ/8qu3Ez/SdItX+8RgJV3Xt
	zaiMNmR/mG7A2tcCWiRpj+C011LEW1Zc2Aj5tSz6w7RK1ecV0qRoLQvoWx4VCu/IYrF7RMcrKva
	CDzgJiPNmvHoUgSe80H9MRcB2sUrRPHn+17nnu5/eSXwe4k7gFsVJQ==
X-Google-Smtp-Source: AGHT+IH3XDdLLCfV/9Gs9WOhxQhoe8qxL4r7Ps7bqp7prNbrIL8GNjbNxIEfTYLYIRVHVNygq387ew==
X-Received: by 2002:a05:6000:288a:b0:3a5:27ba:47d0 with SMTP id ffacd0b85a97d-3a572e5737bmr6909921f8f.56.1750067598973;
        Mon, 16 Jun 2025 02:53:18 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a5407csm10725072f8f.12.2025.06.16.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:53:18 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 2/2] x86/vdso: Use RDPID mnemonic in vdso_red_cpunode()
Date: Mon, 16 Jun 2025 11:52:58 +0200
Message-ID: <20250616095315.230620-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616095315.230620-1-ubizjak@gmail.com>
References: <20250616095315.230620-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current minimum required version of binutils is 2.30,
which supports RDPID instruction mnemonic.

Replace the byte-wise specification of RDPID with
this proper mnemonic.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/segment.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/segment.h b/arch/x86/include/asm/segment.h
index 93fcf0daba01..f59ae7186940 100644
--- a/arch/x86/include/asm/segment.h
+++ b/arch/x86/include/asm/segment.h
@@ -255,9 +255,9 @@ static inline void vdso_read_cpunode(unsigned *cpu, unsigned *node)
 	 * If RDPID is available, use it.
 	 */
 	alternative_io ("lsl %[seg],%k[p]",
-			".byte 0xf3,0x0f,0xc7,0xf8", /* RDPID %eax/rax */
+			"rdpid %[p]",
 			X86_FEATURE_RDPID,
-			[p] "=a" (p), [seg] "r" (__CPUNODE_SEG));
+			[p] "=r" (p), [seg] "r" (__CPUNODE_SEG));
 
 	if (cpu)
 		*cpu = (p & VDSO_CPUNODE_MASK);
-- 
2.49.0

