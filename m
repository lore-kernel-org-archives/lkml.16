Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FD27C171
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531763; cv=none; b=eXFjhISaiXDJuM2KCtbhj6IrnSnm/dxCW7Ww4QHvIq5qbnDZJqw8Cu9BwWORtKGSOiqbCputnmhPC4Eysr48a6H23Exk90xJzYQ+YmfSW9lGy2ZFVcR5YyIlDNnWy4YiX3bPP0l+QlxRZfrVVVKxS9V3w0dFq6EbocT1zw4t0vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531763; c=relaxed/simple;
	bh=f5noS+6MFnNZ5/918HPeH3J2Z+Rlodkc5p0XHS41WVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CieR1D/WSKsoRZhC3FypQXZf5uGNR8OUSgAQ4MMip2kTL1HuUasYMXtyiXtv3JVF0fpPv0WGIHDKqHefe7dz87NWmyCZK3fpA2FxoSgsU6hSZpzHvfj3DQQwbg0lr3yd2z3qZCFX01ZjMcUDjnrdiK3J4AT9VzktK5uNotdT7J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eprj4Yt/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eprj4Yt/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3980760f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531759; x=1747136559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMCZkyRZidUrNwX5Cx9PhWIRQc02z6irI9+xxc34niE=;
        b=Eprj4Yt/Cfv4Ot7IzxplxAPFDJahdZrUbGk4djJOK9s8tWj/hMD5LeZ3hhQJ8JJEeT
         3lKyx83sjEd45LT/kbQRCUt9wjzph3lpfoyqBZS70Y/eti4lbVYaha3jJQFSjyOWbi2y
         LtNYyDu9tZ9UrLNxm8b1aowiMFDeFNRl6XFndRAqN2rh14h3pHQQ9p+A7DoDzAtqYnd+
         Ak+FJuNr2kqSo6VHsrKdDAIRz3W+/vimLJZHy7+avKaa94+EoIJDKEB8k85F6E4SQT0S
         nflqNwjAgn+G9yy+2WMzoeNTSFGWQOi87oD0iKE1nrfmDnaZY8L3oH20QptjhT8xH9J3
         K5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531759; x=1747136559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMCZkyRZidUrNwX5Cx9PhWIRQc02z6irI9+xxc34niE=;
        b=euZQcLxkw2ia/rJIFBiYSgky1GodHcC++tlkEA+3kxMJ8vpOw7/ylK1ObptbwnmZbz
         R0cWbWHKpy1Wc1cQatiOlchpfqE2k7+IYIAxfhM7jMaLmOnqaA8bW4jGbrljM84a383H
         bW98Zy9HwFziMNe2TNk7IW5eLr5AE6g0IHUC3xp47bsLe13WbEyUCAnFm5UKcbFclIYM
         FN7uu44YZU+Hx2DD0enCpEqzKW3Dhibeh5hQFkIAGWrOio3RJ5m2jF0qvEQlER+eK7Dz
         JYvDzRuqVRyXn5mo6A7gmlmBpOlCsQ6gp5Vs9zxUfu4lCx3XFmNYm4BtjcQgSGmMgwjC
         OK7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJg7sppp49DSjEOd0Wqh3CM5mgqk/1UnIHG+dLtt2ljniJYa/jOhwEyjlp8ZliE+fPLuYHtfD/1+s0zWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKMCoAz17lIJNK5Dg30YQjSfL95jHs23v/rWqltD8z/zXOpWgH
	prqpiekyJgTqZwy2qVu0BeqCqMN9oqPQEDniqgUpEdIe1UzPTPA5fof4c3zHGSY=
X-Gm-Gg: ASbGncuQzz7/VQEKbDXbBDLcfVgZyez7CrxOwE7ClOyhH3MuVvY342OeKK/QTBCMwpm
	fcNQAvzWD95kIlTv66N0V/WyEp/liWUuoyXpaxikcEwVVoarSX6qlRqsskBNQQbuVxPAkp1VE6w
	T/s/ax9b2MHypSbTDtchhwsCzNG1Y+7Q0xXDwhRTVzO/pSA8jddxKi3EPvwDpuj2bnw2mNp++M4
	cItUe32yZn0L5LzL4Y3C5QID2I4wxN7AmOdhMW/hjurwwe00Hw+o4gnsYbkacz8YC1eQhxRvWK9
	z2XVlb1X9SKJEhFzNHAQkvjCO0HejP9XXvSHUbgN0JUsSLU=
X-Google-Smtp-Source: AGHT+IEqsmZ/YIUi8UcU8BFnJER1OGJ/WDZQZct9hbwqvalINWwYx3zLaSDOzEHLPrVfQzLWtlkByQ==
X-Received: by 2002:a05:6000:1787:b0:39e:cbe3:881 with SMTP id ffacd0b85a97d-3a0ac0cb3afmr1864442f8f.12.1746531759068;
        Tue, 06 May 2025 04:42:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:37 +0100
Subject: [PATCH 05/10] KVM: arm64: Add trap configs for PMSDSFR_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-5-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0

SPE data source filtering (SPE_FEAT_FDS) adds a new register
PMSDSFR_EL1, add the trap configs for it.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/kvm/emulate-nested.c | 1 +
 arch/arm64/kvm/sys_regs.c       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 0fcfcc0478f9..05d3e6b93ae9 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1169,6 +1169,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 005ad28f7306..bda6195d7586 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2950,6 +2950,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1

