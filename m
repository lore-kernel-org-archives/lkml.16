Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DAA22E3E9
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738826614; cv=none; b=ZTkqq+ZoenGroNQgllS0q0mcFlmb2nwcE4t0zpweRPokYSv3NscQJGnWkmSHBY57Sj06EyltHUiRupu41BjAzUZB/E46voLardsROe4Kp74sJRFQdPH8ch4NhFRJMCAoWUZj61IcoNcLjVIXhw4SWx0z8EZnaYuQvy5odxpAWUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738826614; c=relaxed/simple;
	bh=SZGcyybVo7K7BymyY7cT9hBPC2J7AQxoReUyWoh5bqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjzrfk3w6rTS9Vw470ERvLgJgVUnBVUQQr35q+FArCJXF91dImgPJUaz+441CPqbUe4ndkvmv0i3uFASks7BTmf38hWSOTdj15MboFPtZSWR8cCFvNUL1E3A05nWXaD/m12O0/peQZiK01jpxtROqwV6ip79Jb+Ivv4Xdw1Emlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=sfuo5oMe; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="sfuo5oMe"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f2cfd821eso10432095ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826612; x=1739431412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxHoYiVqgOBhm1wpVoVRMHPjl115bpEgggXMBP5Q3iA=;
        b=sfuo5oMe2mPuc6Qh0aH6nbYrt0D83ceFgFw1rJllq1fTqZ1AOctcDNf6i9QmBPANPE
         1fS9WQQ3PzNtZsyj8FhNfMdZHzFC5pemZhlm81BE22ha5y0+Y3As1uIK6sfQtumnV2q9
         Xi/c3TFuaEEXOmQKtwmh5ejHrfAyuWutNvEXC/yhCejxFfuW4NqG4C5Xcrg0uYyIB8/W
         oGB0e8u5A57HXyWkUFyDU1OxYo8ceTdyCIA0cZmK5eGlDwSM/1stNO44BVbYQW+gCyzt
         h+YQgpTnT/xl0H9xJHh7O0KLELYYRLiy7Tinotm/HvrBQxCAqsUNP9jVWtSv7liibayY
         zQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826612; x=1739431412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxHoYiVqgOBhm1wpVoVRMHPjl115bpEgggXMBP5Q3iA=;
        b=NCuTjywzoI9SpVduLUUYUICLA3UJi1+vWW/1e+olDrjRvD6rTZtiUHTspk0+iv/OH8
         9p63GtFgVZMcQe3MJ5jXGyHczpunB4QfHDWOTDg5ECyXvxuu3WZK3z+IqhjE/z18Fpiv
         beHoGuCticAz1NGsPJEz1lWDmWfuqlNq5bekrmwKLb3HYXGh+7dTx2ICWfYwf/mkchuO
         m7169fvbnwVZykPUPutvBxu5L52Ri6+GzLhayLjtHrGLK4puRAf1mHcWLy/J+oo8bwgj
         x9Iw7d9RqUxMQd2yvxFWCenpaH08YiknEAys7P5e5+h3RufcQM4oBt2i4HZUS7YY/65A
         S+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWucAyIGZx7+luTtKEh6ZPV2cYOIuMbqa9BKAIlFXjoI2VcM0xrg4iEAg2uIPnMYoxAWQ4KlOscOmSW2hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyPWIsSGq7ZNpyBU17vdlOqrwoRSBSnqgM61Vo5z4TYFul7hc5
	2AhZPUanKdyA7pCQK0B2tLCj7LzGeGNKWRN39xRMFTGh+auKkv6JmGJYdot+rCc=
X-Gm-Gg: ASbGncsRgWl96M/ON4BoKWsK0PQSxGYTouHUu4kQUteGRmLZ06Sxk5r2WViLvCxLBnj
	FiqDLNGWuG8xy/CgRZ0kx1WNzErXSyF3mlXOaR6rRFF36t/UI0PMmXT7PYl68S3uJPgy5dIWXff
	ym7GcUuMsI33b4sSrDTHzvK+i5XaEePRitd+5Gh3Usq2pcuIs8t5pqSGW+b5vcrFuU5q2HAju2g
	BR3ceCx+KAU1Eb6SC4pNqE0SCPlcin/EPsmu9Ypb67SJg9Sf2CIuKAtygmIrsyvWBc+dIOUM4xf
	0Im7//0WmmcJ8NWrUElKAfGu90VB
X-Google-Smtp-Source: AGHT+IHdxb765FF/tuEHMIXniBEbzBGChueSqoBlXVwelYSzs5G+a6kTSb+Hcc24wmC4wtSYLVHKkg==
X-Received: by 2002:a17:902:f64b:b0:216:7c33:8994 with SMTP id d9443c01a7336-21f17f32366mr113621535ad.53.1738826611778;
        Wed, 05 Feb 2025 23:23:31 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:31 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:15 -0800
Subject: [PATCH v4 10/21] dt-bindings: riscv: add Counter delegation ISA
 extensions description
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-10-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
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
X-Mailer: b4 0.15-dev-13183

Add description for the Smcdeleg/Ssccfg extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml      | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index be9ebe927a64..b20dc75457d2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,13 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcdeleg
+          description: |
+            The standard Smcdeleg supervisor-level extension for the machine mode
+            to delegate the hpmcounters to supvervisor mode so that they are
+            directlyi accessible in the supervisor mode as ratified in the
+            20240213 version of the privileged ISA specification.
+
         - const: smcsrind
           description: |
             The standard Smcsrind supervisor-level extension extends the
@@ -175,6 +182,14 @@ properties:
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: ssccfg
+          description: |
+            The standard Ssccfg supervisor-level extension for configuring
+            the delegated hpmcounters to be accessible directly in supervisor
+            mode as ratified in the 20240213 version of the privileged ISA
+            specification. This extension depends on Sscsrind, Smcdeleg, Zihpm,
+            Zicntr extensions.
+
         - const: sscofpmf
           description: |
             The standard Sscofpmf supervisor-level extension for count overflow
@@ -685,6 +700,36 @@ properties:
         then:
           contains:
             const: zca
+      # Smcdeleg depends on Sscsrind, Zihpm, Zicntr
+      - If:
+          contains:
+            const: smcdeleg
+        then:
+          allOf:
+            - contains:
+                const: sscsrind
+            - contains:
+                const: zihpm
+            - contains:
+                const: zicntr
+      # Ssccfg depends on Smcdeleg, Sscsrind, Zihpm, Zicntr, Sscofpmf, Smcntrpmf
+      - If:
+          contains:
+            const: ssccfg
+        then:
+          allOf:
+            - contains:
+                const: smcdeleg
+            - contains:
+                const: sscsrind
+            - contains:
+                const: sscofpmf
+            - contains:
+                const: smcntrpmf
+            - contains:
+                const: zihpm
+            - contains:
+                const: zicntr
 
 allOf:
   # Zcf extension does not exist on rv64

-- 
2.43.0

