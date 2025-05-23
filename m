Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F350A18EAB
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747978279; cv=none; b=HLsX4I/1GqvRe78ZCo3KCxUi9mnc07t/EkF2OJUiJsIPjAB+skpCiL6fHNO3rDo8HaOrZS5o2SigHzTNJQLtt6yKebBYtzGt+fjBJcDY8Efdu0q9JC524ub1A1s7Z9EHrgdYi5mezopVlSkXEUfcTzeDf9O75PzWFb5mwdNnk0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747978279; c=relaxed/simple;
	bh=uG4QPZVjl5gDK86VnIwXxVnXWRkca87HCRZHSL9+/F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqWwKaP2pmkxL2jQ9Tpmp9xjYQWd07HrUQITcaARcCTI/Aq6Ium8uPTZpi5aDpM6EqL8igG1TGljZef4Fk2gM+YCNsW8Y8oWI4QNSfZCBfSNhnoBQY7X9ikqnpXOG5zDmgrmmZt7kHduHNA4b8BxkX3iOJsTNKaj0GKdeAP0t/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0PabruU1; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0PabruU1"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742b614581dso7273094b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978276; x=1748583076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=0PabruU1pEq63JcyrIU/ZBCMwBcbYt8MmoKoYLZphhFPYTPDBk6j4eHxvi3TNKs+yn
         YnqenTl43cPKcTAodEZLwKVoAUvBQDQE8TrOqmgpcpxttghREZV/5+k7wVyOTTrTR+mr
         Hg3Nw59+Crd3t+PV4dpgz49nsyld+axHAhrtwI7CcD4dOahegJzBaeIz+tyv+J+QbwRO
         9qYGjs9lI7Y4Hn02dUP6BpN8UnA0qdk8t3hC/UFWNMdu7LTBhxqoEhazGhc6fI8tyLec
         fE0AKWvc9pGtS1IinSnI7NfNhtOycwg5Nby35IPae1JpBTaN6JZsbJHneu7cdE/+Thm2
         9H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978276; x=1748583076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=TbSPLu4Fx0kte4pWvETBB1G21wB16WdOF8CxoRXsbzaQVNZ3Afqpo1eOPx6FFgfZXo
         25b0oQfLKfAX+cNy4dIplM6xSrq0LAgnCdrO421HNj3By3r7agXiI6F0yWZ1ufPdZUo3
         Z7lwdtPE9UQGt+TRTqsQSeqF2ONJJ+1hYe2zGGXYQ8rY/quK30shprTLhVJ4htw5Syc3
         pdTi9mOEOyHlY2HoLS3Pd6asO6AnCOeR4CwZcgdLdrySwc4cQwexZnDwC5aKMQwy6rRQ
         ubqxjP4oe0xOAIqJYHtKRp1SmfoxrEmlJBmLP3eBpEpkc4eFLRvUPqgeX163E/EsZXch
         7uxg==
X-Gm-Message-State: AOJu0Yxt0I3l5Oqq8laUcRqbOivRhO+vxwbIRwr0QWOFRFF2c6ExjaN/
	7M8QM4kFT2tTaRKQNn9jHcHNfrAcNJKF1MhsELAFTMRt3arGx7Q0JC0CcGWb+BfackA=
X-Gm-Gg: ASbGncsRU/A+TfFaKfVaenTcI89wV9mZ1y7mFj7S1c3JDUnq1GNbq25jPw86RYEtf5M
	xHOvUDs31UHsCZ/IgXU+adq+pI2ffsB/YfqXxoV15q8+SYzN+eicypqUEk7dWY8zMPGepy7fQOy
	uh3JAaxwL0wZRF8PL1IoON+VEbs3AAyAKVCeTE+VTytFBT3fyLhuoarmc0ilZHK3ZksrFcN4Rps
	sb7sWy+rLBY8DuibSs38GQs0t8V3uytLF/PSWnFmuSOM+W0gjtJHwdPfu7njhbu0oC3/GlsdWBj
	yT7/F/x/b1ImcTPhCXodSrv5+P5itinGOFkU5i5SvuGCCBQ1d6xkvArof0c1tw==
X-Google-Smtp-Source: AGHT+IHuvJwexFOpqMWZgmqCHklA7GJFd11ULqc5C7xPX4e1BtVUWPbvc7kB7Fax2t5Kt7WHcMzvcQ==
X-Received: by 2002:a05:6a00:3492:b0:742:9bd3:cd1f with SMTP id d2e1a72fcca58-742acd728eamr36423560b3a.23.1747978276169;
        Thu, 22 May 2025 22:31:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:31:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:04 -0700
Subject: [PATCH v16 01/27] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-v5_user_cfi_series-v16-1-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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

