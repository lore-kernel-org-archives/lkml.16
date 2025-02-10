Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A81253F35
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223380; cv=none; b=ACEjb0crqQFFc20X/NuwcAziKelgSwtDMgCTlzn5YwZMswvcz2FK1TdtyhooEt/cS2nUFDjMjl6SbZL8HCWUB3Mxbg5PIpxcxZrQOkLGDZMxVzPZGg8FXCbrmSdud5mAWPO+MSh449VUHTg/IjOSSMWCSrTs1MCcvyvSzslcHr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223380; c=relaxed/simple;
	bh=4ctq2Y9j6Ai2zXepSDGwSaGD5sKanUbwQl6UjhiXbqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TXYnVFApfSD/A2zD0REqEF1mUZBRYqciK+zhXqvzXq/cnw5gnLjpgEj8YkMvq60sHL48Nw9qf9ktxLkRYcMjhTZcN/T1CYTtbkzhEN7qLK9SSNkW3degEPalElu0w/jdNA5y2cy7mFl0uPSysA2vFRO9Akbqsd3ooqol+Ic44+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PykHF26c; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PykHF26c"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso2314053f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223377; x=1739828177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=PykHF26cv3dxm50JtjZvR6yxL7H5oS6vfyB8XOhLjysmwUVIsRLzHTZ1rgptLHbZxf
         bT8VxzOyxsXbPY5u8p65ziRVFCaz1BZWmhD+tMBBxYQ7pnqBDCalQw58YBM7AxVueWhb
         ckvct4AEGU1S8m/gPBHE9mfof6v2ntrBwHW3MMEXdyIW2TrNZb90cLbVV05GCtjtnnyl
         IE7u8CykhORtCY7MLZDOuJu/EmPxRYTTxvZTSfyFrOjX8M7bgGHBUZIExuQmOGOmFFMj
         uzzJO9gDWyj+zoGqZ4FCBol/VPUhU0oE4W7ZE6CNIthsKhSkFeBp/f/QJxyHsGbT8YdX
         1ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223377; x=1739828177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=i101CBdEcEXMBXN/Eyfr8cHZHW4Tr8diWuBz916H7IUk9l2jUqYzXJpKQv19kKITlZ
         RS+svoBQ4XFvdMjEQKDY3Ya83Epl6IQqSONBD/efLW21zX383I62RkzVNO1EM/mYd+Cd
         bJxaM/Vl6UctLdk+wZQVQKTzGoOGX6BW80COtwV6BaVs45AnWrrB9Y7Vrd/nH74r4ZyR
         hCpV41tUwoy82+BHPH6kS7//ZcCqcUjQnux1Kj4NzjijUUJc4V8h3CsAKqwrqSQWppVc
         ihgZhPpp7OG4Iaa7Gp8SDdK/JYpdisjGqrhqjsj7khxW9jx5s2i737Mddw64b+UoZqTw
         jW3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWSHM7JAFsmPAyKdl0FJS2czNpUbj4osl+WgR/BTiB5YvwdWPQnBqk3yM+R6OUimeUCddOM7TjmsNUyKg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4f9Zfp6RXm9CkD6FD1dBTYGE2fo7+O5IxtJT+eU4kGXkJx/Z7
	uUjlaMoxqmKhn+EoQfja/esy72olZe6kXrv3S51GN/O0jE6562c+//fm1zRRd7o=
X-Gm-Gg: ASbGnct3fKlxKWxju5Bc0XsPV5+6iCOZBsVE5r3c94hnakRkT9T/c3f7oNEUfRTY00l
	fPUvagUg+Rl13/ZVhk9RmVQSOM0csFJhfDyRZxcTnuFoAa2V4ePLUjP84JVFpG/xPWP2M50kqcS
	ObcTgqkaCOz1vLaBG5BKVq/NuTFDytqWEFL3ZizH82nKYxnyBs0U/uvrmvuLig12532dyJF3Rez
	HRTvnr7lx6fecmNYKi0CVCFxIp44fkzG7vA7I1HWorGA9Ga0bEzXB1Ujrj9MmHQ3rqx7k8pcCHY
	f110YDMvLlP2WpnH
X-Google-Smtp-Source: AGHT+IHl9RCIMbw69DzrfNCBQKqxgwJyioxKnKZwfd1pCQSELzIBzuIUeEudhJAZ8urQjlYc1+XZZg==
X-Received: by 2002:a5d:64c4:0:b0:38d:c0c0:b3da with SMTP id ffacd0b85a97d-38de438e603mr681026f8f.2.1739223376894;
        Mon, 10 Feb 2025 13:36:16 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:16 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 10/15] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 10 Feb 2025 22:35:43 +0100
Message-ID: <20250210213549.1867704-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
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
---
 Documentation/admin-guide/sysctl/kernel.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index a43b78b4b646..ce3f0dd3666e 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1584,8 +1584,8 @@ unaligned-trap
 
 On architectures where unaligned accesses cause traps, and where this
 feature is supported (``CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW``; currently,
-``arc``, ``parisc`` and ``loongarch``), controls whether unaligned traps
-are caught and emulated (instead of failing).
+``arc``, ``parisc``, ``loongarch`` and ``riscv``), controls whether unaligned
+traps are caught and emulated (instead of failing).
 
 = ========================================================
 0 Do not emulate unaligned accesses.
-- 
2.47.2

