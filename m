Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A808D241116
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 22:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750457922; cv=none; b=MD0FXPXR7FJsgZfu27FbZ5N5H40jOgOqh8aDlo/OpYgHzFyU2TVMSOGZl4VPjYTKIsw+m8TM/8YDr+kltk4toTGdHTrACk5cDzPe1YlC21szaUtb7lcDhSx4Ktoh4LtvdC4BZYd6Ih0fHD0BQJNq4QszjFQjCh1RVvNozQ2c65k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750457922; c=relaxed/simple;
	bh=hEI+Ws5Ed4T0XYMyDeyGmT0ZhHqtHUDKeUxZmkH++E0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AY/YFlDzIqOBhd+l/DYG9wVLJ/ANCL3IOLCbIvZxOmPyuz07UQxrYeOfljvjhWNRHSfJzpXta5P99UfvGA+4y+feT8MpE3CifPAKOZggeUwiyOVOF057cLHIVgE2rd71p1+Xmwe2eh2glbUXcoFgmnum15+BhS0fWdK8N4iEdEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BJpAyO/B; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BJpAyO/B"
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3ddc1af1e5bso53318595ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457919; x=1751062719; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzpL3Ld7f3Wg7N4Mr5qllGNQ06XKr05fHXYYgZEl88s=;
        b=BJpAyO/BtidrS4k3gtcxF0or8fzizr8Vz9hZeEeiJYHA55yAh419X4bhab/XKH/5mB
         nUB83IBqajn29noD1PY/k3oLa2fORyHziD2wlBBQjAM8ob9lrGdGjIYoSUQlI23gDJj1
         wDY16PKaPpH7PQYTUikCzVi8Wl6JcqON+9frJ6AOtNZMkDbg4Ll30xG1kelIWdOWwXiK
         +dNDtVVuWJaf3vPQkPKv7bwLEmB+TxlPew538h06TuxYXDZo8BdFI8YFOenanmnGbZJB
         1NGElBTA2caOAkGifvt/qQQFeR5NIL+pa6FlXBLLTwKuz1iOXN2PNGRufnKY8SuB88jy
         pFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457919; x=1751062719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzpL3Ld7f3Wg7N4Mr5qllGNQ06XKr05fHXYYgZEl88s=;
        b=K6yHZPyzwdIA02LvNSojgERpaADEDvD7S16Nk1y09P7hwwY0fbxe5MwpQLMxywbrWK
         oJIryBYQqmqObSzu2O0/oJXmHW/gpDWIzzBtG6DovmBbvH5DywKj2OrJrxKXwGjdwQS5
         1hfwZ4HpF2wAO+luTItPy0KWoQyNs6/YM5g5LC9TTQ4heKYvEJxmD98Rkk+465jaAtxp
         ok3y6+Wgbgix0bg/EsPKX2M1s3elU+JF2rFkmmeV6xdLz9Otounzu9/kwW7ywnVjcsDy
         hLb+fkoYBGPeeQcpzgv80zP1WzBvZzKCKUhSeU44dcUXnhIZ9PxxMY3FPUWdoo03Ce/K
         8HDg==
X-Forwarded-Encrypted: i=1; AJvYcCW8sfnEdUHljXZMRTWsNuWMExxug4dg+q6PwSVMvbSM6nw7AQFt3oz4JKqP5KmqDfh/UBYmX2U0qikF0dE=@vger.kernel.org
X-Gm-Message-State: AOJu0YygNJvHCrhx6vn74VEGAdIf0zIMJf0TrWJXwn4ZYORgkgZRzsBs
	qnNBcF57i+o/f7gOyMLE0kTodjiX3IWSuIl2TxjgUK1STGuB77DQPxan5bqSe6a8vfnLF0YOn7j
	OaKt2OhxAXgMgP+k2uN/Nq8MzFg==
X-Google-Smtp-Source: AGHT+IGe+i459NmOZi236cX8Bur8HwnWegO6n5YG8V2oQ3pdTXQJfj8y4MrKY8v3FuSI+vF/XixyV2nwOspzfQufmQ==
X-Received: from ilbea3.prod.google.com ([2002:a05:6e02:4503:b0:3dd:d24f:26bc])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a92:cd83:0:b0:3dd:cdea:8f85 with SMTP id e9e14a558f8ab-3de38cc7adbmr52345645ab.20.1750457919574;
 Fri, 20 Jun 2025 15:18:39 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:04 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-5-coltonlewis@google.com>
Subject: [PATCH v2 04/23] arm64: Define PMI{CNTR,FILTR}_EL0 as undef_access
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Because KVM isn't fully prepared to support these yet even though the
host PMUv3 driver does, define them as undef_access for now.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 76c2f0da821f..99fdbe174202 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3092,6 +3092,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility  },
 	{ SYS_DESC(SYS_FPMR), undef_access, reset_val, FPMR, 0, .visibility = fp8_visibility },
 
+	{ SYS_DESC(SYS_PMICNTR_EL0), undef_access },
+	{ SYS_DESC(SYS_PMICFILTR_EL0), undef_access },
+
 	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
 	  .reg = PMCR_EL0, .get_user = get_pmcr, .set_user = set_pmcr },
 	{ PMU_SYS_REG(PMCNTENSET_EL0),
-- 
2.50.0.714.g196bf9f422-goog

