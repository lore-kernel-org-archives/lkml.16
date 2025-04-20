Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084401DF256
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132774; cv=none; b=ma45J/iF1mMKwyiZdJRBNFQqw6dSAfpidDufAy+g6ckxhpbSTnmIFfUmpyU/M4nwEBRnDk9HNHMCLCHZuWfRkzcn0PJEsFEtVvM3X6r5Ffodi29vQOwR5fu7/9aDTrKhx4Sg9OCZsChZBbOe0nz2pgnWn9uZu9xYp8ZGrO7A4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132774; c=relaxed/simple;
	bh=iTRDl9eIM1vHDXRz79uJ7GC6Y8TqkdFZFbsYIQKe0dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KuVhLG17HSC30L+fLyBSlIBLpQrDHoOYSgQv3vSVC5O3jn7n/u4wFJfZai5EjlGNsdJupbFeeYsfo0/E2/cUmFBum956r2rNWk3edCbRUpe/vfl8HzeRQbxBUO20Rb2yamYYER8H+bZ5mEaYZQyytrcpO1ytgPAsog6g6pjkzKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=N3ZIWMYT; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="N3ZIWMYT"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736b34a71a1so3438616b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 00:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132771; x=1745737571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fcZq8o5SROXi3wQjym5oYgJNhmITCc4NsmF81Zj+a8=;
        b=N3ZIWMYT7WYg6o2oswnh9mWBD3/lr92fFqSpsSBKkOKYJuHJfFt93PULzu161OwmQy
         P1ZJrohuGcmOFtdLFYUrufCQ7gtZW0A8Dsr+mD0L1LnfRET1JGSbyKAJ82YvLwKwgU1W
         FpCYip81stmLB9nwOHCjxywC6eKF7hjYZeYkGUEIYlHHSX3ZUbFI5j0tTPo5qgc5BuLx
         4wAXTw9JtJ7lO9J9jRHmFtozgkcjmz83nQQDF526VongXKtc4U1L98oFAClDSXcXcDiC
         +FWQntTmrBjW/pQGMUdiUQWiw1SKHVbHnJjoON19h/YuRYrC+Xq8e8ycXR0lt1GRxuL4
         YqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132771; x=1745737571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fcZq8o5SROXi3wQjym5oYgJNhmITCc4NsmF81Zj+a8=;
        b=kYE4YfrlcOHPm3XJQTpQorZA80JzZ3X6OEE2VP2hX3MgTrrH1eQ/8KD+iLI60H3Zrl
         IGQnFccJjS30DYPF5f7bxAuuV8Fi9goPUtS7cCZGhvj2vCqvr0E1t/acRdg+06xIUfyX
         m9Gvs9KwGnQMzjskjmYAbQfw/9BZ6ejV9X56ZBq6j18BPjBAxEmkWMJW2606rNd5llpN
         oOSNqniDFKFuWHD1HldN8+VGm1iScIvE028O0cITBsiQ++MTl0z4knI4jzmnhE94v6za
         2ViMP39ShxJu0Ju1SWsW0pHSGcRRLS1HcBqDktYyZKWBFEUYQFAUnuUfuGGr9876ETTo
         YRtA==
X-Forwarded-Encrypted: i=1; AJvYcCWAbrJ9SaeYkBCI38W7ywI3rPG6HurAGqnX8g/7mXksY6TtZTBDgvDqEe/lgB17iHA11TnOPfzj76OoVAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE8btn4el+87mHIjKlXeoweeEgVGCSkJXOiS53sNEt9wl/YAun
	nhiWB7yxOnMoRGDYpEVKK8lhSZTD1gGlLHSVcxNATR6ESP85kNT2MtOsL6wd84c=
X-Gm-Gg: ASbGnctQnaX6UTnOPVyG6FBE9InRI3UgOcJlJaa5dsIYtkxZ8+oKo6dkniaVq0X90Xk
	QqECEK3fUyTNYR0DDDYuITOZa0rv68VwDG4wrM5JajyIya7pypD/S8sS8ro0k8iLkMCVUNBngdp
	TZRaa8CY4qZ2fWvx3+zBLUDGV1V8SRhdljw7ZapDecPXxdXtzX2hdfGn3ANRnmHY9ogZbFU3oX+
	uhyQiDqXPPSV4ef+UkIgzye0VuzYAVgpA/3aoaj/agD0/5QpjLt5HQvW7/uaJsOVCTEHSS+LQGD
	TK8xhYNjOnzpcoZU3ZYnIRo3SIwZvvx7adltJOXH
X-Google-Smtp-Source: AGHT+IEE+OeQFiCCtU8Ee9YBkXu2dzO/ybh/igItlS4KQN0WO89uCSH/pwRn+/1oKh3T6c5poKcuYg==
X-Received: by 2002:a05:6a00:1305:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-73dc14ccd73mr10174885b3a.11.1745132771298;
        Sun, 20 Apr 2025 00:06:11 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:06:10 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 6/6] riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
Date: Sun, 20 Apr 2025 15:02:51 +0800
Message-ID: <20250420070251.378950-7-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
to support the PWM controller used on the SpacemiT K1 SoC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Changed PWM_PXA from built-in to a loadable module (=m)

arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 4888529df1d8..8a8b77a0ac5a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -259,6 +259,8 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_PWM=y
+CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
-- 
2.43.0

