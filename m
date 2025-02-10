Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5D42505A0
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219206; cv=none; b=P/AFDkomdHEErGhZZHVw+68+tA9KyKIv1QRocNf9rKJZ87R50B7K7Rh8bzKwTAFIKGsMeU0X5DjDMfiI697nTOAIA5omFVdW/ZqFZLrIojx80UeyiLILak3llrZbdpvpfa++rGBzGEHvVO4oKsPK/y8zsek+e72cYbETKD3TccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219206; c=relaxed/simple;
	bh=fvZEXse498MAei+juRUqd4/R9FeoMw38NPBzNnBXz58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZPPgR+PtEr8oFSxhBerqZw0NoDnFcBLqoLBC7SOGRsscAbt/yE0WfL1LaFxPsCjAr65cpS8hicr5gY1jOy/pwKGqp0+Y+cyBwM3m9rSIq2E6lfP0bArpZtKrGDQSR82FSnRZjCwjYJ38K2iu0ZjoYhCJ4UOu+xxD+Mx/Vhedq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=iC7pYDk8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="iC7pYDk8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21c2f1b610dso117752765ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219204; x=1739824004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ADFXc53D/cc0VutYfr8tgUjvI5cmEZUhOUtSZhfaHM=;
        b=iC7pYDk8OzVxQx34StINsJPUvclETZ51O3nqxZcnMRSSI0pS8YDMF0tl8RACTkwQG1
         EIIJa2hvUhAVSC+NK6x6cB/zpc5BIggq+ffK/Ym2uhs4ypf0q2MlPhm5MFXn7yA/Gf6F
         VdOjpYaR05YpLdXjNcCB2S9lj2E7PfIhoCe1iV2Y5NiD8xM3gPoCtzDvZUuQNKTqaDam
         5jUhVk6vThDz40Xv0p6Y+HrPqiqmlrwqbV+py7GwueSfLxT16kT77zCvYQ3bOcgXpGbL
         QvNH7BGhaCPklt4xoP9kS/jPJ3JIlgqTeRw9uXFt1GvOJXmOqXtXeDycjD8c4kPaNlhL
         HhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219204; x=1739824004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ADFXc53D/cc0VutYfr8tgUjvI5cmEZUhOUtSZhfaHM=;
        b=XYlNIe0w3cVRM1zSfLsQU9fCKIWfYuA6jHU7APzxf4Y4MeVyu6zQ1irnxj7iltIVgM
         vsxV8Z3OLiBfRII6vFsLMpYpsGum5rF5//twTIE/VQOb4xmZtpbpHKhj+IKzeIyBe/vV
         6aV9KvnPumBgTl2fbWa9/yBPTotz5n8aFrZj0bKJ99SHaQ/sXponO+jVHVPhhcaZsRWU
         cGHwGaQZ1IkapIt/CIRks1D1PsS/pBiN1d08joNhjqta0c2Fy9gLmXhTpIvhuHScRBtj
         VMsyWyvgIkDge2o3rKNBPJ9OcYbKVKiMZ9Q7ARnB3yGCktJlBWoeVawj0Pfwgqxn6h2V
         R1Vw==
X-Gm-Message-State: AOJu0Yzxm5FVZWKUqLY6lnYiAD2KEjRrPHK9Otj3J+YiJKYQlDtrPf/9
	8Sy0LgruTomxQShW5KVOGhi6LvHWyysiBFiiZ/WSdsCqXiozD7X7CxX48hQvn6s=
X-Gm-Gg: ASbGnctaP1d4gNV5WIrILYhMVLe8NelcIYsShlGDkKZ7dMPAIRRiu6y5ZiziCdRgyzQ
	GpFP4ZTutrB5LtVkvwZuyjGZVhkjSgKrQ11YmAMAyiUbWIOCyl4gZziZU14f7YjQr7+DXHfGXAn
	Px0RloZjucQmtR75Y4YAmQHHlTtN/NzB94lrvw0M15Pekx+ApztQusCbCqYnviOHMD9zyk93SlQ
	N+zXqk26E2eHqQ9QWo6r4GuoLFMSZLau/uMLm775svzh0rIFCi6pvbEIAPwetZTCLb7ukG65+Em
	tqRP5hORKtTEih3UwwWAg8/ENQ==
X-Google-Smtp-Source: AGHT+IFznxG4IUsH1vtGUm0FvXVBvTHvmf0eQhdxQZjLsHpvXLSfCmOiU5USFlGIslppLz4th5AW+A==
X-Received: by 2002:a17:902:f114:b0:21f:75c:f7d3 with SMTP id d9443c01a7336-21f4e798104mr179051845ad.38.1739219204274;
        Mon, 10 Feb 2025 12:26:44 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:26:43 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:34 -0800
Subject: [PATCH v10 01/27] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-v5_user_cfi_series-v10-1-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

VM_HIGH_ARCH_5 is used for riscv

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb7..1ef231cbc8fe 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -378,6 +378,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.34.1

