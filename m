Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CF924E014
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535593; cv=none; b=spCiIR8ypiIN085yZzKw4t4M5iFVv2TQ9FJKUTX7jiMtxI4mFLb1xa64eoQYy8+o3HjtU4m0TrHmApEXB9zXVRRbXBPR2hM7Y7jSp47NRMi3lHioj5O/RBlRhPGomVlQTg+tEx28uPpEiYmiUBHEezPWdL8cBV0dUx+7kqdWB7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535593; c=relaxed/simple;
	bh=2s8t2ILCxu6QR2p5gIlDfq3bNM/NU7vZWxbvOLL2qcs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G+yYj9op/BW9YT/jUsqA0cEuiRkNLvRzTQd3/u2961Cf0ySv2ENGpyzlY1lrpSOE7nf2MAY5m29zSavyGj5steRwGd6dWJ7TrTiN0OKp9i+YzFxRg58scqYjphpv3B0hJViZUZi4U2ZLKUwTsI2lmywQjRuTvo8vq39Z7q2gVmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+/TeMVG; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+/TeMVG"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so2369588b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535591; x=1747140391; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i7yG9YQOdfvwmvsNm0/fYdECrCTyZGn7Chc0k6oLu8A=;
        b=Q+/TeMVGHPewotERgXhi2+OEHbx2rMnSY3COik9CO8vBYuzWn9VaX86Qj85CO3FQy0
         f60EwPFkqLgxpPGrg+OvDaxo57QC/N6yIR8yMJivJfmkmG6iFsWpDPlFGE1bj2C6O+e7
         vY5haEBIQPbUfdl1PtVQtAVgkkDP74FxLl4UVFwylZjswRgN74XO7LbSHFzr2E++QOzR
         /yPTibX2GlIFfXUWt+vLQ9IcOSDvE+ar3/Y90zNiMoA2UCoaHjuhv25tvCSr0BeIL5qN
         28a0jLgKAKrZteT1rJmlfbmgPDxb6fNX16pO9UEj++BDvvUZzrxSOF7/mh1ZfT0v0Fp+
         qaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535591; x=1747140391;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7yG9YQOdfvwmvsNm0/fYdECrCTyZGn7Chc0k6oLu8A=;
        b=m1mHZOrV9VDvxsnSztuDr62ppJ8upNjG2VCtFXsqq8DEbaH6OpiIuc3bZOgtdVzn7z
         YYn7RUwebMX3v+jZCdcDOLi60Ux3TuUhXCbk1lplfbOfc5mv6uRWfhPbtROmzAJ6O//U
         +vnsOXLAcoVVUR+9Bsg42Hz1IRDRPXrquOxGVoZVTgWgkb9odxwVGJ8TdxrMHPYDnY5a
         Rq7riDT4YUOy0ghkAWdz/W7+ByzMYH0rFr64q4bCWPYD5ktkPL8a2YxnbpeJJwY9Z1ED
         NvyflZCsaJNxOpW465ZR8A+0w3+LyfAw3XwFNVRue6dJo7bocRdq477XVqGDMicCjdkw
         Uwww==
X-Gm-Message-State: AOJu0YxeX84qkxERnVQ2BNkWSynvbcmMevE9cnDbWc6adRaYjd854R+2
	qEjUNolZGmPIweeU1Gx6WxKcZAcyXbP85JxWLcwwkoFUWqJGXcolLrm4PzHzt78=
X-Gm-Gg: ASbGncthFnfaWARmmpwsj7mGWvMEEOIG65X0l8cEhVocYRNGth3jE6pjItJzWRKkQuR
	NnPhHdlobamh03j19FK+MsDMPms4lKIJOT0bPLRUYV403e2ARhNlHYMA6OunOmEQyEQBD5C/yKI
	p50gdKeHd433UA7z+Vcf46bNpVUY9lu3DVEb74BjnWiYR0WMV3qcAXU7gHPFFkZRoCDSTemvaoc
	CiqSZaFDYLJ7qfmu3fM4+r3D/6s1A/kzf5xxv+ufEu9YFVPslKMJOM2mLkXnv7+JzaD4obxtLhd
	hplM2Mr3owb+2oMJYn+TSRt6WKXLSK8hW9H9YJg+MwtnsQSW6fW1
X-Google-Smtp-Source: AGHT+IFCzOhbTau8gJyBHWzmXlS4OTxwPR5Z8ozr6pZ0CIZ/2xU6CL95Bj1nxXD6RsleXXRUFaLGDQ==
X-Received: by 2002:a05:6a00:3908:b0:732:706c:c4ff with SMTP id d2e1a72fcca58-74090f149f9mr4498414b3a.7.1746535591468;
        Tue, 06 May 2025 05:46:31 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:31 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/5] irqchip/irq-vt8500: Cleanups and fixes for the
 irq-vt8500 driver
Date: Tue, 06 May 2025 16:46:13 +0400
Message-Id: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUEGmgC/32NSw6CMBRFt0Le2Gf6BXHkPgyDUiq8RD5pa6Mh3
 buVBTg8J7nn7hCcJxfgWu3gXaJA61JAnCqwk1lGhzQUBsGEZkooTPGiGUNaosXXNpjoAlpZKyO
 5kbVpoSw37x70Pqr3rvBEIa7+c5wk/rP/e4kjQ2X6RrYN17qXt3E29DzbdYYu5/wFZ3yUabYAA
 AA=
X-Change-ID: 20250424-vt8500-intc-updates-c364a31a36a9
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=1359;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=2s8t2ILCxu6QR2p5gIlDfq3bNM/NU7vZWxbvOLL2qcs=;
 b=4MF6eXKej1vozD6Il7vf6VcJVs3Tti9FnagQ4gl/exBCU53jyRCftgDVM7Pl3drK3apBlQ7bW
 LclidR8TPqZD+3WM206rbiyIa7TbY7GgW/dJj+W/zfAvQUW+kXMDtp0
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Fix the logic of ack/mask functions to actually do what their semantics
implies instead of lumping both actions into one. Also rework the chained
interrupts handling using common kernel infrastructure, while getting rid
of a boot-time WARN_ON due to a misplaced call to enable_irq.

Apparently neither edge-triggered interrupts nor chained interrupts had
any users, so nobody complained in 15 years.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Fixed subject prefixes to follow the standard rule for the -tip tree
  (thanks Thomas)
- Link to v1: https://lore.kernel.org/r/20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com

---
Alexey Charkov (5):
      irqchip/irq-vt8500: Split up ack/mask functions
      irqchip/irq-vt8500: Drop redundant copy of the device node pointer
      irqchip/irq-vt8500: Don't require 8 interrupts from a chained controller
      irqchip/irq-vt8500: Use a dedicated chained handler function
      irqchip/irq-vt8500: Use fewer global variables and add error handling

 drivers/irqchip/irq-vt8500.c | 149 +++++++++++++++++++++++--------------------
 1 file changed, 80 insertions(+), 69 deletions(-)
---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250424-vt8500-intc-updates-c364a31a36a9

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

