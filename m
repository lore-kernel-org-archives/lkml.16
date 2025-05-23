Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCC32222CD
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995678; cv=none; b=IG3hgNEkBZxMkvgmDor8tLnp+00zV9Rwpe9HOZqYs6NLrNfykWSifQolxpZR7cQ26kzCa4dVFfUE2Lqg++jP4coNfszN29LuGFnVMeDWzEqYCZ60SmOAoSbTxXJTlTqGDeelQEB9BcU8gGZdv3coDVeUJFYuy22WRUDK8tS8Njc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995678; c=relaxed/simple;
	bh=wAx2RrhJgfovv+Ew3KxgsAkzj9v4q4meKm9RpW51ts8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mE9uxfvC31zM6hzKXE6VTBC0dej+0NdHGSbrfhjzS9+HHJSSmIUz79I6kxOq9eN1LjVHqvrOctWgbtUhmeo1r95In+IVEGDGnkkGgkB0kG/NTxv56Ko9f0ToOsyEHjpHwkX/kSzspPgthikdguf8+IOdFqZCuKe5qgOM4V8CX0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yGDeLiDD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yGDeLiDD"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742c5f3456fso4571986b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995676; x=1748600476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=yGDeLiDDa6wSk1pwwlvkBwE1mZn96F1FIgH4aeYKq8ltXXvdr4RqhaE0zSSmv7DymT
         MV5Pls8HPxvbw7+VhlcX+yohkFW1BJ+7tl368LneIfWCNNpsSp9v++G1sIzP3xnFnsym
         jJ62jIAedWEn9nLclQHqSyVJN/OHm+ahHdsjFh6keODCA8BWGUZTi/UteeoDbMrsLREf
         pJQIoQCgQjw0YNScLMMNfxur8+dDqrueUcK/MSDbR5Vny6MKcTvRXbAA7xB79ztloACm
         e8GwNWcpJqZNYTKGbqUQlq2q7LpVr8QIPBF2QTwknT/u527CTovzOtxRmLvJwC4CL4iP
         ylQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995676; x=1748600476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=wAInaBRVC20YR+VHJDyohJY7Oaial88PjIg7WgcNuRbPqzS5OSQNAuWAE2+tSFVom3
         kK2syjZcMgSX/PDv9dBgCqlc+demK7bC4Lcqc7tU1IfxRrLlENMlvSOt7ypSNtJRxPA4
         QII0/kPsenH9whxr2PU1qUyOjCVFuPzfNGnTSAK/cR7iVwSHJT8sItvkzmmDn8Xm58Xb
         GkM5kRGxdCmr+YVaS40qbPMr3ohBtRY1gQiWIAHmeIuOUFBjbj3Fij/XHP6JJjn3ULXc
         6AW5vpRcQ0YBy0oOq9Aqnbn8sgwX2a7YVevwD2SsoudAyoK8CM3sBOB2pAvjppjptcY4
         i4FA==
X-Forwarded-Encrypted: i=1; AJvYcCVqqPsDf588JTkM1z7eMivZRG4jE+KAzxrHkmMRVHdl3ezTtFQzNEjo5dzUTpRZXZZVv159ZfnL8zq7cJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBglwqq9K9FS+7DthB7W2m/otpUPn53g+YH4U3ierZyxaku8qx
	RzFVSsymBCOJ/DQJDOKUTl/s4G8WR6bYiym/3rRWIXEmWrq2/exJ0vkkqK4ipqglRxo=
X-Gm-Gg: ASbGncv34MLdCg9zGx52iuZ3sThLxrdWIIBBwD8/JGEpTz8LI63b13ghT6IUUQfrlEn
	lx0LrHPrD+jxk7Rns51rSkRYFt6O0QB8HIgNJmzB3jN4D4KhncprzE8DTcR28lIw+roIOCx3sag
	6W3eSFFvvWZPiOMtcE9FX9LImX5nKsmtZk2bTV+lGkJ+r0oDbqqqQ3XwBvbDKxE2d+Pgt5OQ34A
	1RIPCKZS1TrLLHXLO+0Nn1c/FhgGP4A6GnzCZbXIceyOnuu2V5QWx+YgGQvTS/GX9NqognfY9Eo
	NrMyYg/4h/38H9R2jgkZNyuHtqGjWSjcNhd4iPSf4PdocLaTUWZTj+ivse81Bfs=
X-Google-Smtp-Source: AGHT+IHF69bbGfugVW1hk34muZ1UxkEhf/sMPEJ/BrKkaYgUPpqT3QpHbdDEt9j8Gh0ePOgA3f704g==
X-Received: by 2002:a05:6a00:98d:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-745ed8f5d5bmr3378167b3a.15.1747995676226;
        Fri, 23 May 2025 03:21:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:15 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 03/14] riscv: sbi: add new SBI error mappings
Date: Fri, 23 May 2025 12:19:20 +0200
Message-ID: <20250523101932.1594077-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A few new errors have been added with SBI V3.0, maps them as close as
possible to errno values.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index bb077d0c912f..0938f2a8d01b 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -536,11 +536,21 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_SUCCESS:
 		return 0;
 	case SBI_ERR_DENIED:
+	case SBI_ERR_DENIED_LOCKED:
 		return -EPERM;
 	case SBI_ERR_INVALID_PARAM:
+	case SBI_ERR_INVALID_STATE:
 		return -EINVAL;
+	case SBI_ERR_BAD_RANGE:
+		return -ERANGE;
 	case SBI_ERR_INVALID_ADDRESS:
 		return -EFAULT;
+	case SBI_ERR_NO_SHMEM:
+		return -ENOMEM;
+	case SBI_ERR_TIMEOUT:
+		return -ETIMEDOUT;
+	case SBI_ERR_IO:
+		return -EIO;
 	case SBI_ERR_NOT_SUPPORTED:
 	case SBI_ERR_FAILURE:
 	default:
-- 
2.49.0

