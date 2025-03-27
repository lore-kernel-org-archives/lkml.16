Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130FF21B1BC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104180; cv=none; b=W8dCgp9siwM/6M6gj11fa4KDJ0N0bSLjMSSuxw/E40kVW5pNf2X6BR2X/Vr9hTMD4gjls6lREiY6cHt8aeIflE5d1nivf0waRtgEyjtzZgQRL9mqK0/EvpR90OOPWklqryDa1l6f876c7kqISyXXRr3bWQhyGIfHnj0Xxl9KI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104180; c=relaxed/simple;
	bh=xjlrrmRpuMjoXE1KshRtMZxjuBhYnjW8AtjVKdZkUuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4y50w8QEy8/IWXTNeXILqCfFTzLYKQQCeVMA1+7wtZYGwd4iNpesUO1uUkEzzeTTyEnulRt9nvf/OUUk0/4vZcDCAVHufXwCYI8d3ZbLwbnjTRCb8em/hUrwDlKk6TcLMkUVrjLpsvQArdEeS4Kpa8Dybik0RGNgxs8L+TS83c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IarHJmdW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IarHJmdW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2260c91576aso25380225ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104178; x=1743708978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6J8uS8Dr+ClMIERwU7Q7iLa9i915e3rRw4ioKbElXo=;
        b=IarHJmdWaMKaVpExaLxjvT5CC85g/Jt3QiNUMgiOTz0hi3YaEpOJNZFi+C3rTQaLt6
         J+ea8yKN4qAX6WrQ6pLYyBSGYP4DIHdYbI/bM2L7t0/gJbHc+/A20WQRmrJNV+mgBTbX
         LldfiOBmWmlTAT9swm/Bj1uPu/JwCjlLJTLkNrfpfgIFRyCpHiP+ALlyuBaCAyFZqqo/
         wkyrOA4V6cpjqgIjrN/zHss7xxcU9pgVrpyOaZsG+qlT9Lgn3D6CcL/riSaQwGu1/cTJ
         E6fnkq7gD9IJSSfHNptqqOW1qLRdhuEt34KkKGm+UTCcXpAdbjUECFp0DwMR7L2zOYHl
         XZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104178; x=1743708978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6J8uS8Dr+ClMIERwU7Q7iLa9i915e3rRw4ioKbElXo=;
        b=ugp6mZq+ut+yDIHGxDSkJmkl/W4wDp5eYyGid/22s0nghzgnX0Twxb3t4UY1HEF9OM
         ffH8QoqB8Yrmzp/jJoNSWW9UiyKioitHXcMLoZpg7Bk7I7pGrofPB21mAhQ98ndh3yl2
         79Zxa3eUelaJmHCIfQ0r3lq6MYsX0XxWbGGrTztod9qAHW2R/7IQk/S07IHW1/fFmJ+I
         EPewwTM836gZWItVSLGxtqZg2MGuQxF/yJh8/HTq6V6qGZBH7EJmbRkKWVI51g2FizOJ
         DRNR3OL6DjmWXUtZe9eiRsy5KVpjgOQ5d9OfkoryOqjbyMsZK/ooz+u4q8v9rAdosXTY
         wGmA==
X-Forwarded-Encrypted: i=1; AJvYcCVs3K9C79/mDVQrCMnA0yln1kSOAksupm/8q2HylZ5Ru5d0+2ds8a9Y/asI/EHV5Cfx7rEHvQdmn89+oQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3DkfkmOG+8c1/iYfbCvsXhqn/gjd/RSVuwinKKzZAPB7vgeR
	K42UKdzbMMxD+EGOPZbaN1mDV8QrFvP/CIsJfhdAv02jj04Vww08lAJoBeZzWAo=
X-Gm-Gg: ASbGncthfvXTRXS0ZSjxMamEtZChkZzDmysd9C2IBZxMq91RF0qoTXSdR7HAbaQ/UUB
	Ae6BU+AejaMH1p3YVw87BskEpM+QCPD6Lh7vMgVYgAx4U0QZhAbRxOJMvo+nHjdJAs84v3NFyPt
	oVaWaPn4fmvSC3rzuodTsL4fLmiLBGnBFH6csV9OF1ICyQJj4GZXTnzGCeFNWN3XPN/sZuW/YNb
	IpP4+RYnJW0QSWBGJ6uqULCpmKQdTVDGdwWZz5J0Fpwy2u/LHKJBgs+qf7R8cZ8TBiuqfD2+LqC
	FUpPtF9YgRVptPKLf8t/8D/bLCTLUYNWMRNEXtN4U0Jo4NfjbysGNFcU/nYGLrIAeX9B
X-Google-Smtp-Source: AGHT+IFOxM4SmbXuuTZ7zfbjNBSt3NF5qSX8XxUdDdxMSJ9Gbp2tgCBb+BZDCQPwqEBKt7x+Gq+pcQ==
X-Received: by 2002:a17:90b:2801:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-303a7d5b724mr6622802a91.5.1743104178125;
        Thu, 27 Mar 2025 12:36:18 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:17 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:45 -0700
Subject: [PATCH v5 04/21] dt-bindings: riscv: add Sxcsrind ISA extension
 description
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-4-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

Add the S[m|s]csrind ISA extension description.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63b994e0763..0520a9d8b1cd 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,14 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcsrind
+          description: |
+            The standard Smcsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Smaia extension. This
+            extension allows other ISA extension to use indirect CSR access
+            mechanism in M-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -146,6 +154,14 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+        - const: sscsrind
+          description: |
+            The standard Sscsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Ssaia extension. This
+            extension allows other ISA extension to use indirect CSR access
+            mechanism in S-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced

-- 
2.43.0

