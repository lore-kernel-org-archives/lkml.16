Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF39266565
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972246; cv=none; b=Cx8ev8sy3LoHz5mEMwEHTzBg5VhlTbCn3laiUtTgZSqI5Pu8CfWbvnp5fzaoo1GxBWUUWSExhJ0SPqCca402xhmriJIPliKkGHt+J+ncdI7xLmoZcn5BLCtK+UXvsny0ilt7Ui+4TE3XvU6HakPuj/SwWKoNiWWfhPq20oF1pIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972246; c=relaxed/simple;
	bh=HSj61/DKHbscjrSxiKNrJbrvkTbOzS+iDBZfj2iqRRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2HdMZN7Qawbx5dG8huhrpRY6MTwW4cI6RMqDoxQhTgo7Pz2dXMdnlW8A6o537GlK1l9hsDsqBiQLys4UA3eVpWzybeqMJKpoG+VjwUgRjXiJZdQImjy2CDFI/eyqEbtBP2RpxyvbIjAdBMAvkwTr/zJXnbJQu4zhFllYNjPO9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=KKpx11LF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KKpx11LF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225df540edcso4467365ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972243; x=1746577043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=KKpx11LFOKRylmi0Sd1rLW2w/J/8/DK+hsEHQDesR/vv+ipwiSlwnO4SOM1DI6dQMM
         lpvaGipyeB5DeWLEwZzCxPxumaY8I49nMKpTkcPXtaYtsaouqiBtFr+FlN4nTyr2f1ds
         bUjDQZhZgMfr4kt0NNELjSjPQdHO2VgfDSkwVQ+tq7OzxlPk97yckLpEOW6vgryiJsOt
         oHjI1/jhSlJk3FsIReakJmBbwWVaWIwXwCDywEj9OdvfKikovaY38npSNVrUI63lOVT7
         ICjtHlVLyoYDMRCEmoYSqOQf1ihIM7Mf/6ZFiUdyEWnw10Lsax114voGqK50yDYf45hT
         ntkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972243; x=1746577043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=stRMX1O/8djH/kVzfwTRqLd0xst2DDmRuAFwaQPsHP7JAdcS8vN1Vb0QhXhmDsRXIR
         +KiaHA/tTjsuzxfHhVqHNU6lgGrny+/7pz/eoiAvO3APB+PgmkLzWkWywxkBhMEEPNVg
         Mt84Hb5+a4gBs3rYkXZngvtXVaiHxVNYvPD9w3Ls8h+vyO1Dyrm6hRNZBMTq9DnyvGCw
         GeOhZpX3R8SP8I+9S8pfsYVXb8OiExQhk47V1jX9faE5LuKSfh/4pU6jo/6n4xvuHQ1s
         oecodz/WEbvVkRrpruXetjfmK3VirBRWjN7w/RBfx6b5ymYoLNX97RVsXEzq7lCqQa9n
         5r6A==
X-Gm-Message-State: AOJu0YxJ+b0IUF1HtGDRF/ry6hCkE8ETn/mdufym7cYTx/yWKD0f5m36
	3FIy5DXxdtJNVRTFfcld50PC4KKIEng1gq6MOeTwUN9t9sOE+E9VmileajrzAdM=
X-Gm-Gg: ASbGnctcbc2DN0PFTBq5AC4b5uIscWUL4x0BOcgKksDcrGh4OGNODcSIGmw1SY5Rjgn
	9g/t2owg5B5DpCC/KKAjwYBwlDHhW1BTe1yelpPlUzWRWc1nZd623LnptoIXTninzijQXDx+Xwp
	BicP15XLuVOYrPUHDQc7DmV1QLjTjFEgGgFM+L1mV7SEkNf1wZYwDhtDqrQVjjsaT9hRI6MXn0v
	E7RZXWjxKXxHgHOSQH6vmxFUbH/4egf7mMkbs5wP0iUI8/XDWYuDKI5NJShQcNKjv/ExCcHkQ+O
	R325EXeGmKziY7CQ2ZMJ7l1sQeVlvMGBzSj0YkC6A/USO/OyycE=
X-Google-Smtp-Source: AGHT+IFjstEHD8QIZfy3Vcgu0xcBZf8foHmRSjeb/erLHfisACTJBjUsL08PsHqNuutlSch24CFTEg==
X-Received: by 2002:a17:902:f70d:b0:220:fe36:650c with SMTP id d9443c01a7336-22df4815c21mr14342955ad.23.1745972243456;
        Tue, 29 Apr 2025 17:17:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:17:23 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:35 -0700
Subject: [PATCH v14 18/27] riscv/kernel: update __show_regs to print shadow
 stack register
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-v5_user_cfi_series-v14-18-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 4587201dd81d..6bb53ce72ed5 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -90,8 +90,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.43.0

