Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988372356DE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104206; cv=none; b=nlyZo5NmtSdU+N4jZkXqHRIOryrcxUi05r7S0xP3jdAfb0d9nQJdJ83WHo3wi3s6aL6plJqiE5v2lEopYTBMqqFPbNCZjumEUwIwpEufnzmWZSdSPF4tjKSgRBAACh05xvuqpcun/mfkYwGzXlqq5bc9cSE19V4pJM2UH3Tvs5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104206; c=relaxed/simple;
	bh=kRGau/48mTGJ2xTWuPcdi0eoSaf9cQvclbky87zpLn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQEXe29r40uuq7eJklGIuCYR3c+fcDfs1Jvyh8AZFdpow+WFo8757wlaBe9jaLVOzQGMLG16/aelDfvruSVWGjyzo2wOOHmw3gvO3i/1Igb+/fLuc/VUxiOL20m6OiOxeIhC46o8Lcg/Cuq5f8PzVM3GrUTXPYovIETMa3Qie+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aKcPq3io; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aKcPq3io"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301d6cbbd5bso2242374a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104203; x=1743709003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJwNDXXlYjKjGqwwgKGhwlhZINc8dMq3L7uwB92VzFc=;
        b=aKcPq3io0myLMqyKgCWWNP9yJlar9YDkGvBa0uOQjm4sUHv/aptzwVzJSeH7pM01Zb
         NdMgKR6Lu1yBRE8AVe83m1OmwlcqcKxAFTIbhVoNp1PwqJzJHsEjtuhVILUCIs1049Rp
         ohpVcIMAYHCKafBE3BQzN7T676Ohomioza+WuPi5sKD3TYv/8ijFiuKWK7pw/LnoErPP
         jCHzTvT9ydfaXHTXajxqmxY805k6lZNxejOHESIuvY0VZWaYxryqFmNvppUsbko/s6mm
         K5to8GXAExmOdE3eBKoFN6qNnNKhyGzUIKlWzQAoBcj6pM+eR9A4kFZZpGOIk2ZVfIS9
         2LeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104203; x=1743709003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJwNDXXlYjKjGqwwgKGhwlhZINc8dMq3L7uwB92VzFc=;
        b=qWE58iLz5TtxIgT/jOJOUSJsGjDQO/PdiEtuMCjGJcRhyVbQVV/3e5VrNlc4kQeIPN
         TcoZiYpe+vm2iwPxlcRJwbAZ/hqW5bVlrv1R2CoUqeVDzr/r+1riyVjYRDXf+Kwmau5U
         EV1gWPv6SN9DYoL4dOsN9HBBjT5J0QwJ5McHO9vQA15xnPMCOL7Pakql4+YGTgCThIEj
         rJD/DLAklGWiTCusaTYNb/L1agA82Sfi/i3IWQjbryqtJZ7p2McBl1VApXZf+Grwa+Bm
         +9zLIHq6d5iHLX9eAfIRlhUxmMahRaSF0ASMF9X8OWLXIHR3IVnUy6FwWEBSroDy5JM9
         Hhfg==
X-Forwarded-Encrypted: i=1; AJvYcCWrt8HfEGFV5tUXLRY9lK0+wJkjsoYlFGBRqUeR/TPAKuLWz6DbMuOHYMN+n+LkjeVSENRD4ZhBs4PytpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmQSsznwEIVFC0Mj+6zrNE8yJgg/6Q0w/6uqWy/23Q2yVVUuNW
	ZBYtRRE0SSBFd5JsZicurAHbjGoFSqP2BTmfylZEz45pzsBSt9O7vSjYKJSdobA=
X-Gm-Gg: ASbGnctljcYkJn1v2jM6Ksz+7CsOm/FCzaipeDyxbM3A5x+C551Hzzy/lo0uFvg8t2z
	0HvysGDGNBGSdkCwm4mfIMYpOf8y6LtFwfRmSJRAMutOnTz6km7sv65SxwZVKPn/oc6WojYMsK7
	4sFyCH2mNY+s5S9tzlJVCnO7Mc0sdx715eUn880GU243HhjSI/f1pUoYoaOZuZHVbeSKJUcVcLq
	GeESmeloYxJ3vb8FNBTfDqgYIccTEykJYdCBvMbaofqfC3SxehqoHk7s5sOkBL6By9fDkFcn9xK
	1G6xoJWgqAt6/+YmwsD9p53IsoiFunADaeJG+9OD8Jvygb6pNwIvVNLjnw==
X-Google-Smtp-Source: AGHT+IHr9lkacen5G6bNal8x27vd0zlzKk1gXvQpJoZ6ZU4fSbwcKifIx6nJFU8JTt0ZbyyT81dbnQ==
X-Received: by 2002:a17:90b:4d05:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-303a7c5b9eemr7219789a91.2.1743104202835;
        Thu, 27 Mar 2025 12:36:42 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:36:00 -0700
Subject: [PATCH v5 19/21] tools/perf: Support event code for arch standard
 events
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-19-1ee538468d1b@rivosinc.com>
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

RISC-V relies on the event encoding from the json file. That includes
arch standard events. If event code is present, event is already updated
with correct encoding. No need to update it again which results in losing
the event encoding.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/arch/riscv/arch-standard.json | 10 ++++++++++
 tools/perf/pmu-events/jevents.py                    |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/arch/riscv/arch-standard.json b/tools/perf/pmu-events/arch/riscv/arch-standard.json
new file mode 100644
index 000000000000..96e21f088558
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/arch-standard.json
@@ -0,0 +1,10 @@
+[
+  {
+    "EventName": "cycles",
+    "BriefDescription": "cycle executed"
+  },
+  {
+    "EventName": "instructions",
+    "BriefDescription": "instruction retired"
+  }
+]
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index fa7c466a5ef3..fdb7ddf093d2 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -417,7 +417,9 @@ class JsonEvent:
       self.long_desc += extra_desc
     if arch_std:
       if arch_std.lower() in _arch_std_events:
-        event = _arch_std_events[arch_std.lower()].event
+        # No need to replace as evencode would have updated the event before
+        if not eventcode:
+          event = _arch_std_events[arch_std.lower()].event
         # Copy from the architecture standard event to self for undefined fields.
         for attr, value in _arch_std_events[arch_std.lower()].__dict__.items():
           if hasattr(self, attr) and not getattr(self, attr):

-- 
2.43.0

