Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1129221D93
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104185; cv=none; b=hyJoLqe+51LziY38g62PCuECXzokghkIETbzeXVMafipAnBaD/6qxnFoiPmxeTM9MuR0tEUWFHJvoBq30B1PsPkYUho/rKx9hyCa1A/sA2RtWCqCYKpoYue80kRHhh1Cc9NztcFuOIpxFvLc9+31jMtr3RuAWQwErX+0SjfcF8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104185; c=relaxed/simple;
	bh=9uaw/3nWEEI8fpgn1mvfhY/n4by+EQ3cBzz4yrA1qGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XxDZUbJo8uP264pLqqrRvqWKPapNhQedSgVQhlykgM/WTCujJkod392iQqw3OpH5f2/joWOWVEfBFzWMQCK6OIWkymb4KZtLuYOnRtV1XgKWJULnvMYB+Lo/0ECttEXfTI46cqscqkR4Y/zdcYnE+PfFRNBPYHEuchjtM2vEo8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yTEHu07m; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yTEHu07m"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-301302a328bso2433387a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104183; x=1743708983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ywNrrIlqtPHHPtOnGWyS/tkdlFoi23/SobZTYSCzB4=;
        b=yTEHu07mGxawXyUUfyU6yCA6LPlzcf+P0c91+7E44jz2lA0Q21Jg+PPP4/DkznQEUF
         hBlBp8c1daOJtE71F0lZ1yQfg4MAqXZlifZDmOyuljRGiVNc8egME619go329vBjaTGY
         Sok9FM5xOGH8GtoSrgS1lVwCyR8fhn/xUDo5sLbtnDW72dmskNWxzSa1whjVnjLiqZAJ
         Jp0rgEKBTTTdNbIrG/qL28ttvPX5DnUW2Zve/hK6ZDcBZ1DJgow51cx2aMum9SsJkyPt
         RR9JySJlRKe0WFn8amGmOhqPLstDPFUjdaPb7idFE4dU4VhnOlr72Fx71Zohqehzp5Ws
         K7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104183; x=1743708983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ywNrrIlqtPHHPtOnGWyS/tkdlFoi23/SobZTYSCzB4=;
        b=CxIs1Z5vd4C1jJkoDMHUcxVPppeyOmOQu8ct2YQHvGVXG+FoZD6S72gWIZ/td99ybs
         xqAR2y+8vEUwBu4qW1b9cMGT+MntaT2qB5cI9R+XdB4D4hkLpkYmaEJ3jY8A4PCRiaXw
         gTDjsxVqu/juduzBvI78Hry5Jd3kb6IBMveGZ0An/al5Zw+8vIFgiF2Pk6rg/4YWvUcQ
         Obta2wQpXG0qwcPQ4ekfLmmlu5joCdV+rRB1XV2jqSDJagyb7+EJSbDtEeMm7Dn+dqui
         paW8sndWlkAtIvknKnkZ2KgWen8aTvt2rCTPWmt4MxoHckuy52DagxJx2NLw8a+SgXgt
         48ig==
X-Forwarded-Encrypted: i=1; AJvYcCX8YYT+7uk09dH/ZNxBKKc8lMZFmPoGPKqr69PTGBr2ziyBFyyiBHAG0wIDOwqmIXGwEolDoD0NBgxS5dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2eFR4BL9/ETPPzYIqpMphdYrOt/lASYKFMYrsc2j4NyuI5RN
	03vhbwG6y+JXf/koDpHRXrRNnlNfnvTG3kWD1smBYSvX8xOEJsVsFcYQ7AuQ68s=
X-Gm-Gg: ASbGncuGTHiFBuHtFvj7UMhABAMTL4Y7/NybXHzn2z1cABo30ODlq9+FrV6guJfI1WJ
	8S+NDDO4iLfSkjDVLvCHeS8wG6BH2s2akZ2cCTlmIgfeskK5//CfAXzuxDM19tAVFHJ+s5tJyUw
	kQLuOfFlEJPw0ue+eSjasTGEwg7LlOD9E8HPfRLquLk7kx2R8IoieytvgUiYw1aCefoqCnx/Tz0
	0cArAp6WA8bKuAkKoMkwv97yq/vlNjq8NhpfEVd4q1eKiTtnvo16Wo9c/Y/SCdfhtKW41J4bEDO
	dh+9D39EZzuUUURG0VDS8hjduQhB6eeCuMIcgOs4HxzT/pJqAMjGx57tmA==
X-Google-Smtp-Source: AGHT+IELdinWh4rp6i4iXWGA5H/t+4IAyyZGzK+iwJMmKFoXazqziiKFSDj1cayIDmLBdm814eH0Qg==
X-Received: by 2002:a17:90b:5686:b0:2fe:a545:4c85 with SMTP id 98e67ed59e1d1-303a906c678mr7028440a91.27.1743104183029;
        Thu, 27 Mar 2025 12:36:23 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:22 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:48 -0700
Subject: [PATCH v5 07/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-7-1ee538468d1b@rivosinc.com>
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

Add the description for Smcntrpmf ISA extension

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 0520a9d8b1cd..c2025949295f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -136,6 +136,12 @@ properties:
             mechanism in M-mode as ratified in the 20240326 version of the
             privileged ISA specification.
 
+        - const: smcntrpmf
+          description: |
+            The standard Smcntrpmf supervisor-level extension for the machine mode
+            to enable privilege mode filtering for cycle and instret counters as
+            ratified in the 20240326 version of the privileged ISA specification.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as

-- 
2.43.0

