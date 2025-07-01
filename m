Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E35E27702D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383981; cv=none; b=PhmGqUq7HSIey63EMJVRaUzCX69NY8NkDkLWj/JkV3pzZCTNCjgvBQ9cUxY2brVnzQbvQaGMk0t9iER/+HJcI5+1wcCer+WosU56CoQyCICFZ6xU/O7LuyNnZwov9QVv+TcRTc0Fuc/Siym2+Q1pQXWDs9sDH1C/IIUCOWa2Mp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383981; c=relaxed/simple;
	bh=PjPyvNgy9hm7ONMITzr0T6sHroPPo9twpkI/M+XTD8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W1osVQVNftsRN/LmODzhEq2tZHGpLsKuVW18yTZyF6j1ehJa6TmzCKMpvruzpA/IMEYHt2xBlP90BRj08XZRb/bciHeGvXpEEOiIS7DdYA1zCQ/csF2WSr2xcA5ZMg02VWjPyKHYEet4VMzgndNQwivCNudQdL7eJ0ZvXWc9db4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vlJtrpnG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlJtrpnG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d6ade159so24104575e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751383978; x=1751988778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Wjl7TqtpfpT/cVhyOMYZ+YoZwvVH3I5MuberAw7nso=;
        b=vlJtrpnGprK+8FqwiyMFA3wNglLVTPh71rhca3xouR7RStj+Wofo/fTVgO6wdkri7D
         nkFIcAgacqC38vbzFgYqX6823OdYWznW1C4ST0FH4eoRNTZkIMOB1q85Zo746mPJFyOZ
         QLBTPxgTuQ3/WzMIbKkc9f/DijcDJTAbdTTH8JnG7lzGLpG7idGRQYwYfPpQXzkMk+vg
         RG8Uz2sW6EUVYxmlIG+Ju/YeCqRQYVtaaEYUoSNxDR4KW7Qwf+5JauCtomM9BCXoXdKl
         unxu1+X803L4AOyUpJj6b91fLEkxm/Mg0aijCbkLbfJ8VZdw4FyDVY1waWvdYhzSSqhW
         RGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383978; x=1751988778;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Wjl7TqtpfpT/cVhyOMYZ+YoZwvVH3I5MuberAw7nso=;
        b=gN8t373NXzV8XgcaDlOF4bcypnjLdTDSyNlBICIMPKYpJLL9cWQH6GwhBMDkIou4r7
         jJWCYLQSYuUrdPlNWvPC0O6yeinlWVwrS7L67SDjsNlgp6VYn0xWQx7tB+ZxQRniGn6r
         dwyiNSOs8odRc1i0EJCde9tWtU+kd0+29JiOJruXeSjb6e5542nrPenX2uWbqyzYUaf0
         BUDs+RFS7iOKcSLDP5yjl3eThLDHmkzKmPEcU75ewfyIcgWmQoI8r/ZSypihc6btcpwm
         2JRflxDfwoDcnNMyC0sMxqJKYAVU8dzvdcCtFmiK3HVHBSMtzWOSmwDN3L8VJnqbU39S
         P+UA==
X-Forwarded-Encrypted: i=1; AJvYcCU3HP4bWLvA4SzQboow8qL/hJGdnIwr01Idb8KepivAztL7HAn0dtu5A4cxLBByMutMlQ3Cn+9BIAVYTC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6rDqXSqXGj3mkecv5BAAlQo94dI65DmQFszh0ft84dEt8YUK
	GqvPeSx9jN2vV5dgaOr9t4zzrnRHTPuupm5xk3c5BuEqNTckYdaEU8BHhlo6DPp9m+I=
X-Gm-Gg: ASbGnctUdgimOi881T8E2u6oMiapOhCmXZZhlt+6AZo8oyYAOyqtXGXLtEwbD7kktrs
	yz5gAMMiEcTHbE57RcYIeURiugeWNf38TfB3fGoWWncUZNlGaeRk1Sqff2KlMAYGdA4qNvLFzUL
	MJDoTzduFKVIrWD0hn77O0+O5RnW5wlRQeMXxqPe51Tw2wdQZtlqIa7/DEpdoEs3eeftFTtwBZf
	24Bg//55TOQa+9M2oDU9eZlGEdo8GOroQiwINShX8SPFi9wdBq2ZwAwfSXp1xgzguHAWBQkYoU0
	TvlskzFqtlTNBLtxv7wqE0z/ept6kiRR7w8iPCGAw5FFuA3Xmb8qvjk4Ds2FWz31hBEokKgKo8c
	+NVbGsA==
X-Google-Smtp-Source: AGHT+IFfPvs67/UJpu/9kyB3q+XqucTe78Apo5J0t9CmwCnnIvnAeglojVve+6TRV6p2yD+cqIsekg==
X-Received: by 2002:a05:600c:5250:b0:448:e8c0:c778 with SMTP id 5b1f17b1804b1-4538ee61eedmr160326185e9.22.1751383978328;
        Tue, 01 Jul 2025 08:32:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b5a3sm13435002f8f.40.2025.07.01.08.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:32:57 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/3] perf: arm_spe: Add support for SPE VM interface
Date: Tue, 01 Jul 2025 16:31:56 +0100
Message-Id: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGz/Y2gC/x3MQQqDQAxG4atI1g2MsVrtVcTFqL82gqNMRAri3
 Tt0+S3eu8gQFUbv7KKIU023kJA/Mho+PsxgHZNJnJSucg0vfoWx7eBzZQ0H4uQHsPT9M4cUtXs
 JpXiPmPT7H7fdff8ADND5UmgAAAA=
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Alexandru Elisei <Alexandru.Elisei@arm.com>, 
 Anshuman Khandual <Anshuman.Khandual@arm.com>, 
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Robin Murphy <Robin.Murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

SPE can be used from within a guest as long as the driver adheres to the
new VM interface spec [1]. Because the driver should behave correctly
whether it's running in a guest or not, the first patches are marked as
a fix. Furthermore, in future versions of the architecture the PE will
be allowed to behave in the same way.

The last patch adds new behavior to make it easier for guests to be
able to reserve large buffers. It's not strictly necessary, so it's not
marked as a fix.

[1]: https://developer.arm.com/documentation/den0154/latest/

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (3):
      perf: arm_spe: Add barrier before enabling profiling buffer
      perf: arm_spe: Disable buffer before writing to PMBPTR_EL1 or PMBSR_EL1
      perf: arm_spe: Add support for SPE VM interface

 arch/arm64/include/asm/sysreg.h |  1 +
 arch/arm64/tools/sysreg         |  6 ++++-
 drivers/perf/arm_spe_pmu.c      | 60 ++++++++++++++++++++++++++++++++---------
 3 files changed, 54 insertions(+), 13 deletions(-)
---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250609-james-spe-vm-interface-2bb41e238072

Best regards,
-- 
James Clark <james.clark@linaro.org>

