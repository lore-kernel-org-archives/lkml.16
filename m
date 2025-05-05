Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1D36DCE1
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746474422; cv=none; b=gbSBkz+Afqx2kq+mbJQr5bAM8ZsG4+cuVbm2xLWqEZ/wiqdlTYIM7dD/NnQ0RyW42LQx8x+PWoQD5me0I12mAgfntS74dbPIxNSO9jTnB9zCTzF8KeszEGuG6ELqAmZ2YBkgEvk43WmAQ/NQHqPWGRzs9/Be5JKkjJKMsILU3HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746474422; c=relaxed/simple;
	bh=gHO9fquV+zDgJiymZ5293Xw5P7vTTrARFXDIotkcy9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FzsKNpXMYktC61PuPhMG0/zd/jr/0JNpLS9HBOuM5YR856ze7b6IQONdQfIF5N9qyiUvqPLlbGDnj7N1+rT+9mRJqVpyKiG1qRZg9BGlpkNQB+c1sHlsvH4MVeHDBlj3bWAtz9eUGczOSOpD9Wc6c6ufFNMEPCbkgKkQPzJ44JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Iqwdar3u; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Iqwdar3u"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso6352224a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746474419; x=1747079219; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Plt6knEw0shoMZnzf8M4P2C9rMIfWDgHR7NQgQL6Uzo=;
        b=Iqwdar3u63rvXa/MpAnbXNYy19YZgJgHnzUCcqqyT/AL1sDLmL2rXYakDMexVBeliY
         VQLE6YPgzO9gmmcnlHxWFCnogLzKTtGcsm4rrB1qWRmVCYuebWSfWHLxbo1XNo05eiB6
         lDFpXXbwoPzTIMQdAYWnIbpGw3zQY3jB2KeUOO61D/dQwv2PkfG5eQVdKnmreFGjFRu3
         6iecEWgFKjfi1tULahqk6Dbov55yRCEYw+kkGS6Df+hyRyNbUswFZ1QPdHY4+vhTZlN6
         FSKclSTSmlbUP1/j9orKZ++7WKnOsGTP30F24JkZoxIMHnWNMN8lM3EE1YIDK9MFMogC
         MccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746474419; x=1747079219;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Plt6knEw0shoMZnzf8M4P2C9rMIfWDgHR7NQgQL6Uzo=;
        b=aZbH+G19W/yrxLys/NA0XMSw894axbJRwFRZpL1XHxyprD464U33eVzaA+EQF03kKf
         wTqEC1vJtYxfVAT/85b0Y64e66HGbTMBvvzzak5Dv1P9og70tJq7jazhpTStCxXc5eDn
         aFVHwgfW/kpPlD6UswupWiMzhf4zz3uKL7T4htsjqV5AiRYI0UpIhscDFjgibznSXpDE
         w6Ra3uJTKtS/REEXNQgkiFZdRkiYYL0ywiOlvdO46Fw1PLajgxwE4BqWgcNa5/Ln6FVx
         xZFm6Ly5EKD0RXcMkZtc5/OZqLWS30c3cCFwFUSlJGGNJQKWS/JjdpFlV7HDA5tjptKT
         giDA==
X-Forwarded-Encrypted: i=1; AJvYcCUREh9rj1GJtYtTKPgVJPcNVn5B15wBQ3s9KqlMtswPXce6gmJRKyVQy6N6J4VcsnSrved7f+/rRVVQ9I8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIfvOzlOHaSp4Og7UUATJpx90GIIiKXIvE+0LQusGIIAVYZNUV
	gOfKS288NB0n531ADSTpP8yz3Qj6rLYjNcZuyFKh8zzT5LMNJQEdgs1BED8+MR0=
X-Gm-Gg: ASbGnctaUbwAYg4/jHoFm/k5PaqRx5X6tBpPJlKVgNma61L+l2UHnut7t23udWu3COq
	6pt6iHS4kvWF/kplxgtaTWgDtDts4llqrqZLj4YkxgbfU/OAUZ6bKY0DJsli+M2LrB5X6scyvel
	sg6KonQ9UN6HPKoVR2Zj3ZPgkoLl1PHRZAtesS47SD5xChXuIBS8XQiyZ3TNVpdtbTmj1KoqxB8
	m3K+7jnFee6DzvxrqhXqp6D6JYSU8GypZOPCCVGumigLhs97RSZJL1IQ5HhSsBOideIuNRvsR5p
	M+iCeFL0+/z482A3t91D9gvcEf5R1HDxvdQ+3fyBd0hZI0wBOgEkGw==
X-Google-Smtp-Source: AGHT+IF9N2TMIjAxtdrrQ2QWC7apsZXf1n2ya4YvkWtGuqNlHbY6PxtJ98wUVfZSK5UimT5DfxWc6Q==
X-Received: by 2002:a17:90b:2744:b0:2fe:b8b9:5aa6 with SMTP id 98e67ed59e1d1-30a800a11cfmr172541a91.31.1746474419573;
        Mon, 05 May 2025 12:46:59 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ce9sm59083085ad.163.2025.05.05.12.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:46:59 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 12:46:53 -0700
Subject: [PATCH] RISC-V: KVM: Remove experimental tag for RISC-V
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-kvm_tag_change-v1-1-6dbf6af240af@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAKwVGWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDINTNLsuNL0lMj4fKpqQmGpkYmxomGpuaKgE1FRSlpmVWgA2Mjq2tBQA
 HM59HYAAAAA==
X-Change-ID: 20250505-kvm_tag_change-dea24351a355
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

RISC-V KVM port is no longer experimental. Let's remove it to avoid
confusion.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 0c3cbb0915ff..704c2899197e 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -18,7 +18,7 @@ menuconfig VIRTUALIZATION
 if VIRTUALIZATION
 
 config KVM
-	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
+	tristate "Kernel-based Virtual Machine (KVM) support"
 	depends on RISCV_SBI && MMU
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQ_ROUTING

---
base-commit: f15d97df5afae16f40ecef942031235d1c6ba14f
change-id: 20250505-kvm_tag_change-dea24351a355
--
Regards,
Atish patra

