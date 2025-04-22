Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8296296167
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339065; cv=none; b=awWisMq4sn16XI7iuPBvIeOYcQy5tZ8/LBaVr0b9T1hvLeGb348Z5UZi9q03MxaxnaqIzRmu+yYVrqTrV0hD1Hk55gMqYpnpAaV5J8uh+Br0Z2022X38eVuVcyIemld2ePGdukG4h99HTTDaF3lHE2Nb+g7laKdwsUAby9NU9c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339065; c=relaxed/simple;
	bh=cnNngG1SEA++0p1pjRKLRhcZbXg8zfVDDmR8Yj1S+C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ftHmunY02nn4kzU6Voin8wgLMAwEzDG4HUg8cmxxKRhRAzh1smVtqDTMXtII+l85qLU+CSMaDYw1m1igsZJOeZWIL42/WbC14AncIMJCs11w0LPcgyO8z/ODKqmi40CAkUO7EwY7aZH/vaCwQ99UBO4iqCpogzXw7aYaMhMNsRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=clDG/FZG; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="clDG/FZG"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso6532197b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339063; x=1745943863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbKVfcaTHYuJWKRcGFqU1yco7PJvUrfVpm2zvqDMXhg=;
        b=clDG/FZGPs5IxQovqixh7N43uaBkd0ltXi8+M7KTm2m+qWMjwU3NLva/oArFvnXvbH
         TZwaGpM6QchTWK5BAqFxkZ9eCYq8WXTkmhxAGgtnLiYZuzF3GXuL+cbGAoG726iv3eFQ
         MS/vFD5E7kTISyXPZ9gUq2bXNwa7W8i88m6M/af60OGgPhG5Zs9Xca4n35DXbfNeTXEv
         TmlGzvoMFlubCQTY+CDlGAwFJP762na3VB/msexZ/XSfVhPfS7jP5171l77ntT/UtPhN
         Nn2bnMN0SBnTiyXID28m5oowZ32iEgcDUq974uGvUfWPbKVRKYjlhepP+yeOi1QDAYts
         O7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339063; x=1745943863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbKVfcaTHYuJWKRcGFqU1yco7PJvUrfVpm2zvqDMXhg=;
        b=bG44d1l4Nlwa6VFiqnPdlv8SRMimOfsQoJztNxJGBa3aihCk9MKSTCK1XNmeA8pDDM
         K3tHBmYFpO+37EllHmT0hj60od4qozaIg5Mr1pZARjREuRCAcYzIs2xe4DqcAz1Zq/Pm
         SlRr9FmCr/I4LOlvRluQ9uvlD/+iJFLnf7WmMkHRhAs3+83k1xvSnG9bYqyYwNGtauTK
         zawBteDcuZ/6NiC0BJ1as+yyQvYo0aDBbp8PFPR6OSnW9onfc5COOOJalbHEIHXktrCC
         tM/ZibzeTl5qT0+2ZlHqEt5EPUgNiW1qXVZpBAk0P/f58E63quDQQUOv4IuazMXGFxW1
         iEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxyac4Mc+8mcTUHprBfHVdNLKVfLRfc8ItccbkG1Lw+05qwtKHqFLcsEUDnCel+sI7OwDy447Vxi+oP2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdMwpeh9+aQYLN2eVM8RA1tTvb7zS2qzVoBSVp/GiIDqZU2gB2
	AUAE+/TMouEj6rOJo/ybh66s1Unz1N15dj/vOPUXJpfVvdlfzW39x45JQ4rVOxw=
X-Gm-Gg: ASbGncv/f+aTA9sdiKluAwY2uHIuytrzCuDgznvYTHqvlEMqEHbhGlWJ4wmVWCjnBit
	TRToulqYt369NHzMjNB/m0CShh3ZCKMe+rNjjhEl9IvLl21tpp1wWv+gGCGpT/aDhl/ICagHQEn
	II7J6TNcmI97Ti8L1p/SgBjnV/uEEQTm+tG6VG5O64d70pO1A4GL05wbhtWiQkhMdA5pHxkHDli
	qDTAOHkvdUterNXfc1Nd4g1XsjHkRS9AGKVV6SpMO+WdUjEFCx1j8l5aMDAwP6zObCJ8OtziUNc
	gOz0G/UyBaUAWkeNsVYX27Eyn2jxH7Ce+SgCJOOf+g==
X-Google-Smtp-Source: AGHT+IEFf0tssnpfmlIbhqMb84KZUlhUCNzB5IiKyJZf9ulfPIE7IN7Goopu3beJAt1h94MrpDZmZg==
X-Received: by 2002:a05:6a00:27a9:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-73dc159de28mr23833026b3a.18.1745339063142;
        Tue, 22 Apr 2025 09:24:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:24:22 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 4/5] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Tue, 22 Apr 2025 18:23:11 +0200
Message-ID: <20250422162324.956065-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162324.956065-1-cleger@rivosinc.com>
References: <20250422162324.956065-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

riscv supports the "unaligned-trap" sysctl variable, add it to the list
of supported architectures.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index dd49a89a62d3..a38e91c4d92c 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1595,8 +1595,8 @@ unaligned-trap
 
 On architectures where unaligned accesses cause traps, and where this
 feature is supported (``CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW``; currently,
-``arc``, ``parisc`` and ``loongarch``), controls whether unaligned traps
-are caught and emulated (instead of failing).
+``arc``, ``parisc``, ``loongarch`` and ``riscv``), controls whether unaligned
+traps are caught and emulated (instead of failing).
 
 = ========================================================
 0 Do not emulate unaligned accesses.
-- 
2.49.0

