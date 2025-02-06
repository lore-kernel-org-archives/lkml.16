Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B674226549
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738826609; cv=none; b=lkG63cvbAgCORpfasNmIi0uI8Z8stcG8DDP33xXfjQeY21OpMyceq0iHGNFxck+OVePhgYSHM7uXa8MFhqaJOFluFgiOjTKgZ1LoH1o2L2SdjRZ/HrEHxgya+Pf2iQGt2mkybIRQlt4WEIcGHELP2CyHJCK9/bah7T7Gy0jVcQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738826609; c=relaxed/simple;
	bh=YU98hLOSiq4vVYKNXLYyYXjb/N8ZYLqR11qx50WHeNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAQL+NXeKFsnYM9dRhcUX6wbru7Hy5J99E9aE6WvhNtstPtAASektFFmJ+1/+Q1XdZ++/XJdt8vvQksC+ZCF9TkIzC9DHc5M5VyKCgsv4BY2zHbGiMNNC3fY7RNPGURzrIePJ//nbuTtmfuy3naUI26kywGPxgTVWfPXj+LrI0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=SB2rQw4N; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="SB2rQw4N"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f441791e40so770611a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826607; x=1739431407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d05MBVkD267pj0+O4130zpeTcKFWk4W9qDVXtG5klp0=;
        b=SB2rQw4NVuE78iGw0lPH6MPeT0z2tL1md4Lfy70fAXDPl0GZEKVFTlWDnG7O92nHoB
         6Pt88DOx83fddLI4RymBfClnnbQp+bD4HU+dhmM+/kPtjo+4YvP1s9S6ZSsFnNciArvI
         Ox5nbygNdGYX86dLtP1MZRVDWqWinMrs9S4XryUEJDnqpMrATmIi69wsaVuiIdJ5HRR1
         qQRKflVrGgzvlVsEXPwTkpSlaL1pxSPy9LXhuOVY00ln/0ER3D1rTq13+b+znKAQUkRR
         ARFENvkA3A3n8p9l+Uw5R9lHsiTDzEsdMfvz0V/hzN88BSkMznNBmEng8AHDV5SKZ2uS
         Tjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826607; x=1739431407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d05MBVkD267pj0+O4130zpeTcKFWk4W9qDVXtG5klp0=;
        b=Qr65Xoj/2la6Idx/Ox8h6ShkIhmOg12bTw+Dn8RjVRpHQilQZ9aquCU91mRzOSZJ9s
         yHNfxz+oxbu3mHJZa6sO2nSZUz0R/9ziolVF2qWc4YlMcvnk7M7Mi/rv0F2tJxYGpK8v
         zow+LZ84ajBkfsDWdBDqMra1C/a9ETHwxrWIcLuwwLxC4zXsDdHMWxOQ3NVWesFzhDCR
         mp7VOU9fRuq2L5q2QafB2cIQuAnC4ueV10MM93LGTIUHhBkObxPVyJ7iP7/pe+8BORZY
         tqE4AHVq/n0V+yVhZ+eeLChARL00gMywskR8EF96ObEkxGJm6fRhgWf08/TtxsUfiK2i
         TBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmeoZq2FEcfpLeMgfho/UiThXSbs+kVwxc0pCUq7MjxitVY75ZzWQOnsP0wNdRxxXR+FqwxH/5c8XBgjk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcb/1JJTTkCg9jxoccf97am5oWaZuHMW9W50v2z9KBNewwzxtJ
	FjtYxg35QtUqjzG0WbXNCR4KKJXpFNHnwx+AItMcCKJZzoMwXqBuKqyx9QFWxts=
X-Gm-Gg: ASbGncu6Hh2luCJFKb+XR825lJS1XKQFlFx9piE4hrOrX48mysa66AZDpkApPOg+yb7
	ExMVkeyRbEowJmRb78+8UVKIJFySYTOMbd527v1fnTGtI7BhAjn4w6v26WjskPMOuS9njZ5D3nu
	aOuc/sTFrV7nCnjvvldSzlDUUs/0kkIpd+0V5Qz4BQoD+IjiBE/IE5jlCz69BVtJOdz6OF/215w
	GnaRL3YSRAD+xLvZtJdKPhx1vgrME0MAItChiFsXMQ1CsgXNCf8W5KPZnL+K/OK8PsDNg5aHWFP
	BL4Wpvx7bQC1TbK6+1hxUbpp2RvV
X-Google-Smtp-Source: AGHT+IFKe2kQczxclY80PslHuvYzWPmjNnKAp1q2ypYQZ9arePKPx5YXWSLFOApkuW37i5EznoN6cQ==
X-Received: by 2002:a17:90a:d410:b0:2ee:cd83:8fe7 with SMTP id 98e67ed59e1d1-2f9e08682a8mr9427110a91.35.1738826606814;
        Wed, 05 Feb 2025 23:23:26 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:26 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:12 -0800
Subject: [PATCH v4 07/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-7-835cfa88e3b1@rivosinc.com>
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

Add the description for Smcntrpmf ISA extension

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 42e2494b126d..be9ebe927a64 100644
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

