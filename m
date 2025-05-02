Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA120B812
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 23:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746228646; cv=none; b=WgkpZ4I/gH3IGhKlS+yuJ1ebUSFjdCDTayz1H3p60yrniSaiyCs2RqArWEJdNl/SCq3tIrUs39P9h9w9O/7nmgWmmSxi+fHECLEh0H/uY6Oa0iUYLxqpeO8qMwVM9WHEN4W1rKAcUFUgKbsUkURNssN2t/ixDM6I1znI+Kw0YWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746228646; c=relaxed/simple;
	bh=07JIHRwK+fbY/KS3WXdAQFowggDed4ZKoyBK3fLGucQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVi76gkn9Fm7KOksRtX9KY9+mRHRH26XgkTAXeVW/tG/9uXmX1F4Nr1L2Wg/HnINoeqysjGGB63zlHzerEKTH91gAC0tH6mW5nlymTdbGyvKbA2Vui/F5oeb3FWEZzftL5rhOqYyH6U+73CdcO6DfXpow+m8uQ7q1Wv8P/twBpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=MyVNYd5M; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="MyVNYd5M"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227c7e57da2so24764675ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 16:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228644; x=1746833444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkVK3bviqHN/t8JmfUhzYvFjjtQu0YyYqPmZLVGI/TA=;
        b=MyVNYd5MvdRqDqTLRdj3YkEXMkidA0l9HPQtEauag2kapZx5tf6GuYNy9+utUj4y3v
         0pwR1SzpPtn85ZKOGF65r4qwpKFtdt5cjZJmpVtVc4bzRcCYe65RQ0ukt9ZAqXuDS3Zc
         E8vubB0vS3bbeF+J48Ztcl+ybjOHHcxH/+PFnh81IWwrciPsHm5DG1f6x+6HzGyMsc/H
         ml5+GeELPBqYOK8mEYH6gtICLqQAiHF145slEAOhscn67BaIMynZMsDJvHjdbj+KMaLd
         KyQmkicx70+mJlZY6iq7EOzaaPyPID/tqqeymY2IIhvAsZV0d7e9TRZ3AG2+IFTkuljQ
         nGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228644; x=1746833444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkVK3bviqHN/t8JmfUhzYvFjjtQu0YyYqPmZLVGI/TA=;
        b=vFuDZ8y7n5U8T9DtjzRJXZ8eioUeKfDjUuE37Z98mSKlYWs/frYhr9xUdYLgeRXCav
         VjdsT7K7XafNgPjmNAbCOn91EgHF+KntKKvyb2FsKq1BUuK9NDfKLTk3O0q+cpBca5kD
         uhstfvYljfiCBCng/oi5OsbwduMkooVnwfsfbbLOmaa3p3Qs7ZzJnjgITM5D/KMQw4qj
         0Z5GkcLmFBEm5HRdBi+WU0AucoHO8GD+YJxJOz8I9tQWVKmTFawVqZGCRs+2VdZfM1qJ
         WcshFOKAoB4i03ujKXTtt8BJuSR1wyGszBfGyJeTuj55QOYHjGAuh6XNreI/E3AxrBBN
         8UHg==
X-Gm-Message-State: AOJu0YwVhSS7XNvq6Px+3Q612NkXJHZhi8UAjsEGz2STNrHA4sGM0USA
	JUW2HM7tK9YPJcQVOQXmLfjpJQlxvJInuRXp4NGUfBZvuqXdv8qJCfJbyY8wTFY=
X-Gm-Gg: ASbGncuZd/bzpgRi7/53R+Jcf/GGvTu5ggkyTPR0yh0QV30wHk47BkzSC/DNToXTu+5
	HdnSHb3npwgraNp4XwFJq6pTExR/SyVkoeci+gX7JIxiCgHb7Af7WAMJYDtzPLaij5IYxDE/NLS
	+A8orgQDCnS0YNcggGUWAJDOdwVq/qmYe1JJzSZy0ypqKB5MHBGQTejezJojEBTkAuRc9SSnt9F
	bUXLEuAuvbqK4qxvx0RKYLvqZbemw5Nf9qsssHtWZdZKo6V5Noa/0op3nu3MKnoJRP79daOD8vX
	x1otvbpLejxg4vT7JBPopKCqTwcJNlNZCXUYYlXe3DCeAa0eyXzMOwzt5Cf+QA==
X-Google-Smtp-Source: AGHT+IFdh3sLk6r+rFjqSN7jGE51d34L2PuxOmUSOaSxSjRwNX1uihuOq8DvaZzdvN042MVDHYvDfg==
X-Received: by 2002:a17:903:248:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-22e1031aabbmr69526825ad.12.1746228643932;
        Fri, 02 May 2025 16:30:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:30:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:32 -0700
Subject: [PATCH v15 01/27] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-v5_user_cfi_series-v15-1-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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

