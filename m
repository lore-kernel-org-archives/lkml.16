Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072311F3B9E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057378; cv=none; b=BEkjkXqt8wEVlp/yjyC/iUpdRB9wceT/BLtUD90XZyvJvDi/a4A/l5bTzgtyuOiqHdDirk2HxfE5xYIC2g1NQnxLv9w7lyfIQDRkYWtWA0FDwD03JaFA2jMahW7mVJqLscE5s+9m2St8uhKhUBOkKT6nGwXO64CIqCqRmff981k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057378; c=relaxed/simple;
	bh=uG4QPZVjl5gDK86VnIwXxVnXWRkca87HCRZHSL9+/F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sen27qreuM0TVi2rSxHPH5Sy5VZ3mOKWaxXkrM5efBBTipDhDhImmVSOuHIiV0mUwOG3yZUJsNPzMwD0RhyADWb/T71tX6JvshzM+jUAjXTeKatv2fIlecx23Qja5Nc1Tgf8tew+xeaLwgUsUucAS8NfoiWDTTpLAauwtnlN/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=O/zuGXmY; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="O/zuGXmY"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so92741a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057376; x=1749662176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=O/zuGXmYL86lTvTOiAnuQF4/gKf0p+Y98HAYr+0xwH199VVC9yyaV2lE62tA+R6Cs8
         bqIwEQJOSE0tg5+W5dWjGqjCkrDgvnRQ/DKHs0zGLlLiSH8gKCTUHEBqY0NFWnWzMMWu
         k11Axp1YFpNsduAZ1/AuTKklZqwhWkOmuVmqaFfOUOnd9fN5NPrDk1EbXglzuecFxr5O
         ZRyuCj9/g5kjhApp9SjHa/B8sb3tZP5SSZt5ZCtf5n4BvOAebZeDzr1rOCStqoj2EsXL
         UjkcT3DAYadd2YUkwU6X2wBKYg2OfJfaR3OlwRQGugSo2BSQqYEuL1J54bzi49xkAFP2
         eerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057376; x=1749662176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=WOTaxB+ZUlgiyGgq3Rh+E51IakNCrHUA6xjZ/Z+LEBU5g8Rv55ZzPNRWhNmztEakn5
         Jsoh2g9jeGxvEGg3/OBoTaBO9NpdOn0bGg+jfbSK6i8xOQY/MlxztkknXgUFUHe8KLz8
         nDooPatC0UYgGqQs4IZU2AquIJ0iNKUJuI7JFPVJkZCQeRoG4j26jvI5QlrP1LL4al5w
         aHfeDGnQ/swbSpCmlPlJwG/rLL6bp+XgEixkS6UpwFzCMtuRHeN0zZ2ZKfkIp+ZjLfuN
         IgOhU2SVWLaD4LKeNzvZp5ecAWWVlYsnD7I6Mlr6fjwiHBb1uP38vfYFUcVlq9LqNmBZ
         5H5w==
X-Gm-Message-State: AOJu0YxMfPYIpkJnhezcWlmXVzwHxxp1tTm0tH51NshNtfPYsTF2Ch8t
	TsO6F5sC62M+P/V7jj65oK/jeX+4/rC6VAN4wO/2/j0lgGtHdFJZ0aBxn6tiLXg73As=
X-Gm-Gg: ASbGncvDPfAkFn6b/Y351dS/tuNgoTv1WUQmnnE85dL90n86J6LTTT6MzuNK/4l5Ies
	npLNFdmm0jkG3onCKiIlNq2VWXxS7rsPblZXhga6e5y5JOugj2Ve9zioHKeP31IadquDhDyepTT
	c1mGj3Dlwo25QS23Wbhv98R2ld++xM7fVm2J/z3DAbixUvSYh/bIRXxyfk7s3VE70c3bjKR39eU
	k1s+1/hsg9Q31GEAn02IVo1FLv34MxAsZ61EWmREexJV/z2loUM/pC5cP/gbc+TAbmtoJhWELw0
	E/83ENfIqh8CgEGvURyFbty9pETBjqz4CCdfBgGpaKdsKzS0Dg6HpsFKCkW6UMNj7Wg7c9wd
X-Google-Smtp-Source: AGHT+IHxPqIk1owtxlyp5LegtYf4MjOLT64nMI3kVgiGthtvO0lFym3JvM1rzmQWvRKFQF65n5vIwg==
X-Received: by 2002:a17:90b:28c7:b0:312:e731:5a6b with SMTP id 98e67ed59e1d1-3130cdfb38dmr4440357a91.32.1749057376016;
        Wed, 04 Jun 2025 10:16:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:16:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:25 -0700
Subject: [PATCH v17 01/27] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-v5_user_cfi_series-v17-1-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b7f13f087954..3487f28fa0bf 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,6 +352,13 @@ extern unsigned int kobjsize(const void *objp);
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
2.43.0

