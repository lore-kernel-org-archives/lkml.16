Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E179270555
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481179; cv=none; b=UwRQ3xRW5k6qrYrEQdycvnd/F1lBjOWT7smKzUWAmiRHgLOngvIqG+/BB2Uee4R8KN9ZUrClxE+EqsYRC/zpf+3uoo+amgtR6L0adZdYGCyYr+6adZi6C2DOKCGRrqMuSkMXzV24TB3WTzfukZuGj8/1nM67b/TKZMG1IPDmWlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481179; c=relaxed/simple;
	bh=JdUrIVH+IGCLd13BCkYc9KzQyFYTnCzlSPf84de/Rhk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qfnEE5rups8J/BfvdeSSR5VPnlvIuj8i6zVc1LtauAkABw4vASUGtbEiUd4jAgE5SXZ8U9ZFvJYEVZ7a1DgF69iKpiobQ+EwbVlOVe9AUknxASpn6AHtzWX6juTURspLZeXIXwNTTwPZzSPth22gzaLerKCJUhFWHXRwr+zbbJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=TwAzgL1t; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="TwAzgL1t"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736b0c68092so4345399b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481176; x=1747085976; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W99fxoPhbzUqm7Gk7SdB4XI9Zg/UKYP4CZESDkaON8c=;
        b=TwAzgL1tc/a1VbIHXARJY69NyqrollMt+3Qtz1mKXgvbZ052I20xKNh7qM0eV56mvM
         b/D3jpKWgHs84ndPT57/U5+JA8X6+lc6K71K+HAEUlJQJowmdwkciAoBUhsRS0FfCox1
         FaPz/lYbkgpQP6LsilDciOr7Pgnemb5xxcWFAiNj8jp3im0t8iqpLymwJ0peHroFXLTF
         wb7T2Ir9/xE+wiK/qDG8UCJXlCtPjQx7DCU0G3KntSEWo6pkHOG57C//6TvpOq5fLP7w
         9GTGJrMi387hp45fzSywChRD8Ug6StAOV6oYZnzOPRmoT/h+yqDpOb2ubEtB5Zh0CzRw
         S5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481176; x=1747085976;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W99fxoPhbzUqm7Gk7SdB4XI9Zg/UKYP4CZESDkaON8c=;
        b=KJ68b32TfY40cE+kdAFdvCvPAnUudhLESGQvsIBC8kU25k21g9rwArChl7itzvpX9v
         YbXu/XOXXm7IlL7j/L92D5uTYskkstOoV1KO/QGnKpR/yAA+yB+vFRKspfo+9D5vNN87
         0oMv9EHMJqz5Vovzl0blc2OaHZXJzNlSCqKTQ4B435UN60eEVAMX020V7kMObtwmg7KG
         T7aVtkV136fZNqac82icIFNX9NGmY6YTqd+5aqZv5Z8gcJLua/Z4f1O3EMW3P2aUG6vK
         gbgHvTPU0n6r6sCjqHJKJQd/8KbF3tc2Cw+nHFZbfIoyqAob4fpkoZxHspxKVAXQSq9z
         bKvg==
X-Forwarded-Encrypted: i=1; AJvYcCXnkKnUFKTcjKDP95HiMVT6rgG9XSrd+ByqTZfPir7QUvC9l7NSRXJeyq2brxyRdAVFDvo/sWjlt3baSyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHdVv4f/uFn+CJxxipCQW0Q2nXXq3a5+m2Uxc8m4maEj/CqJNl
	g/LuaTHOWMS6VEkVWQylz/7Km3vgnHYF+dcWDPhbT2zt2TZNbvUVH3Gk2FX1G8U=
X-Gm-Gg: ASbGnctkzeXYG522ljuoQP/0ujK9zEUQpeqK3hUwN83D8X2wbWRHQF1vuvc4VprFoxA
	SzBGxhKArh++H51aa4irGRUuoArLcDyECh4+MuVhfYRL6UCh+qQP7wEQE6PSDuEPbBaEvK9/2yp
	oSLLAl74NoymLzieMh9dwZF4ufLH+uSr7QaEb7vj8eaQZENENgjgvbPYN+zAQuPmg2l6ADoKg3P
	aqazx5jBVSXXMNZZT96BDiSF/OwRUM+lc6S3RI6uEBcVuqiKgcm0DlApgLjDXnOxba4ehMZSZ9Y
	06hNbH8BY3GWR1Is8jK0lB/bMpPUadzuxorXK0VS7dRW5gykufN5UJMErIsfe3lP
X-Google-Smtp-Source: AGHT+IHJOxFm989TcbBZBaCDwcCJ9ebhtRuxodDiEdghNVUEU6LdMQk0DXZ57fAxwh3qFk8n0Wb3MQ==
X-Received: by 2002:aa7:9a8c:0:b0:736:57cb:f2aa with SMTP id d2e1a72fcca58-74058a56837mr21134021b3a.13.1746481176348;
        Mon, 05 May 2025 14:39:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:36 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 0/5] Enable hstateen bits lazily for the KVM RISC-V Guests
Date: Mon, 05 May 2025 14:39:25 -0700
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA0wGWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE2MD3eyy3PicxKrK+NS8xKSc1PjiksSS1NQ8XWPjZIvERMtEYwNzQyW
 g7oKi1LTMCrDJ0bG1tQD9GuCEaQAAAA==
X-Change-ID: 20250430-kvm_lazy_enable_stateen-33c8aa9a3071
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

This series adds support for enabling hstateen bits lazily at runtime
instead of statically at bootime. The boot time enabling happens for
all the guests if the required extensions are present in the host and/or
guest. That may not be necessary if the guest never exercise that
feature. We can enable the hstateen bits that controls the access lazily
upon first access. This providers KVM more granular control of which
feature is enabled in the guest at runtime.

Currently, the following hstateen bits are supported to control the access
from VS mode.

1. BIT(58): IMSIC     : STOPEI and IMSIC guest interrupt file
2. BIT(59): AIA       : SIPH/SIEH/STOPI
3. BIT(60): AIA_ISEL  : Indirect csr access via siselect/sireg
4. BIT(62): HSENVCFG  : SENVCFG access
5. BIT(63): SSTATEEN0 : SSTATEEN0 access

KVM already support trap/enabling of BIT(58) and BIT(60) in order
to support sw version of the guest interrupt file. This series extends
those to enable to correpsonding hstateen bits in PATCH1. The remaining
patches adds lazy enabling support of the other bits.

I am working on a followup series to add indirect CSR extension and move the
siselect/sireg handlers out of AIA so that other features(e.g CTR) can leverage
it.

Note: This series just updates the hstateen bit in cfg so that any update
would reflect in the correct VM state during the next vcpu load.
Alternatively, we can save the hstateen state in vcpu_put to achieve this.
However, it will incur additional cost on every VM exit while the current
approach just updates the configuration once per VM life time upon first
access.

To: Anup Patel <anup@brainfault.org>
To: Atish Patra <atishp@atishpatra.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org
Cc: kvm-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (5):
      RISC-V: KVM: Lazy enable hstateen IMSIC & ISEL bit
      RISC-V: KVM: Add a hstateen lazy enabler helper function
      RISC-V: KVM: Support lazy enabling of siselect and aia bits
      RISC-V: KVM: Enable envcfg and sstateen bits lazily
      RISC-V: KVM: Remove the boot time enabling of hstateen bits

 arch/riscv/include/asm/kvm_aia.h       | 14 ++++++-
 arch/riscv/include/asm/kvm_vcpu_insn.h |  4 ++
 arch/riscv/kvm/aia.c                   | 77 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/aia_imsic.c             |  8 ++++
 arch/riscv/kvm/vcpu.c                  | 10 -----
 arch/riscv/kvm/vcpu_insn.c             | 52 +++++++++++++++++++++++
 6 files changed, 154 insertions(+), 11 deletions(-)
---
base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
change-id: 20250430-kvm_lazy_enable_stateen-33c8aa9a3071
--
Regards,
Atish patra

