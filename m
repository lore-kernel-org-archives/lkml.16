Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A539235BF9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104206; cv=none; b=q6B1Wg7lOPf41dB/b+APYPXYGQHvVVo8teSswRfDNnvMGK5eSgz5CrMil7v/CSXMiGCApXEbxomZqeAcPm22dIuVa3J8iG3no+EYUwxhWnKJkm2YlaDXIDx8Dh3RgiCMplyoBjRxuQ+Cy8oFGNLjJRXrujWf5nArX1JuntRhyzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104206; c=relaxed/simple;
	bh=iK7haSZWK6mNvBXPKp2J2MVdETuxnGbhYGKJX0SA/V0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfWlkubFQWDpycv79Dt2XLxIry28uwTFCoBWS2ObmRkkZq3dBsfs0qdRteJ81D7JyYjshHYlI72+lj4LtRjdAbGvT+wmwVPN2eq7BfmeqaFNJKRMBCHvqe8di8AGH7wUnMLyggxUS6IrgRM+W30WcxH4PgB4WankGkSur02+5fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Uukpi7ei; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Uukpi7ei"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3014ae35534so1992303a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104204; x=1743709004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prlp5XqgI/Khif6kUiv5FMK3OMCI6nzVA7nLGH/Y3s4=;
        b=Uukpi7eiuA+9SLNM6oBPZeBGD3pKEp8wTgaoZyVBlZsmyYN+We/kPG1cy5MkS+WEJh
         gQpgSinkqdFHtToCQcIw5ZWarHFPxZu/I3Qin1yP/pY13iaZ5FddMPPViJTl5na9CE1t
         f5+gkS6V8vxFgF3hm5R5SbdMDMe//FA9WijmvHg6P1MttM7Ev9WQqgKTVZlfLgsNH25c
         7Fmvky+3xcrv5baBqhjeQ4tNZ8VCsUtSsup/A5Y28uBYNI3p0JB5cX1kidqo9Ou8mZlb
         fgKODcuaCS9os27mvziErb+1l2iDydXKe//OPc3fs5T+sBii14qMEoO/4en2I5++BtUR
         cFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104204; x=1743709004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prlp5XqgI/Khif6kUiv5FMK3OMCI6nzVA7nLGH/Y3s4=;
        b=sxzYthqFhAeU7gUyErULfezmD9/40HwtLwv+L9QA40xFfe2N6KPmgI158SKwq7cnwr
         2GE8UWDsdYEXomtWDAw5WWz1KUnK6nrcjvz6+lk+ow7gloUrg94tKvMDN3VPJJv76Xxy
         V/XfisdTrFlRRuzSBeaHKk4UEEs7PiMEJgi51h057uKSh+tF8nwl0f5wVaVvOtIMk9Yi
         mAZFDFPW7gNBR5RWCE5YiP1+IZkkptAU/HBFMeWnOUxUMRNvmyDFMSoWp4QASo9F6qRw
         tu5NY+EWFXLPTsc06BRXcA0cq4K0exTzo6nwwsfpL9xhsfqZEjydL1Li61QzuZG8qZwB
         L2IA==
X-Forwarded-Encrypted: i=1; AJvYcCWJnbgjViwPq5apLaeWKbEtS7GZW2v+k1hCg8PYoOnhBjniQpp/8kkjtApLk3173CwKzx7rWAQ3Lw5VR34=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWxN1RI9Lvz9WlHwpIISOGuw3eD8xeM+A0UasDUL8R8Gmrj430
	7jffBYpDCezWJKgeWyCqGiebeN4FQi9eH6cJlfGtQkV40mdxDBa4DWMIhQPK1sM=
X-Gm-Gg: ASbGncvi4y5bZnZ/sNQXP3tMB9EDC9ZADGDMLlT1bispb6+fgVXkQ2yO2YxmiYv2FSn
	ATUF+5hTTE/1yhu9vHVpc0KXuMUUm8AbaNSkMaiX61H87wtAAnx9vhqBPPzKlVaJrIND1ZSHjrS
	q0/0IqNQ7yA0hPeQPKmGMSvMTvlgPoYYZVd1uWvpGkhYZbC17+B9NECByPGRiAp6UrOdfxxrz4i
	F2vWiXK9UDAmQcfDOvVYeQ18i36X4mtrYEhhBLR/nHle8/klCKayPCY8nQKKn0iXbYm14K2Z2Gx
	qjqTAXE7JcDp5L6ZzG0HNpxDcF+uMf5vzrjGq443e3gUJetzxBwIUcJ5bvD3kSUecKsy
X-Google-Smtp-Source: AGHT+IE9RAtJmcVuiq+zzbza3XZnuj5S63rmVXq5BX9kQPkvxkIEVWCCAKOhZGnJte5v86VybNNn7Q==
X-Received: by 2002:a17:90b:2dd2:b0:2f6:d266:f45e with SMTP id 98e67ed59e1d1-303a7d5b6b6mr8384578a91.2.1743104204412;
        Thu, 27 Mar 2025 12:36:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:36:01 -0700
Subject: [PATCH v5 20/21] tools/perf: Pass the Counter constraint values in
 the pmu events
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-20-1ee538468d1b@rivosinc.com>
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

RISC-V doesn't have any standard event to counter mapping discovery
mechanism in the ISA. The ISA defines 29 programmable counters and
platforms can choose to implement any number of them and map any
events to any counters. Thus, the perf tool need to inform the driver
about the counter mapping of each events.

The current perf infrastructure only parses the 'Counter' constraints
in metrics. This patch extends that to pass in the pmu events so that
any driver can retrieve those values via perf attributes if defined
accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/jevents.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index fdb7ddf093d2..f9f274678a32 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -274,6 +274,11 @@ class JsonEvent:
         return fixed[name.lower()]
       return event
 
+    def counter_list_to_bitmask(counterlist):
+      counter_ids = list(map(int, counterlist.split(',')))
+      bitmask = sum(1 << pos for pos in counter_ids)
+      return bitmask
+
     def unit_to_pmu(unit: str) -> Optional[str]:
       """Convert a JSON Unit to Linux PMU name."""
       if not unit or unit == "core":
@@ -427,6 +432,10 @@ class JsonEvent:
       else:
         raise argparse.ArgumentTypeError('Cannot find arch std event:', arch_std)
 
+    if self.counters['list']:
+      bitmask = counter_list_to_bitmask(self.counters['list'])
+      event += f',counterid_mask={bitmask:#x}'
+
     self.event = real_event(self.name, event)
 
   def __repr__(self) -> str:

-- 
2.43.0

