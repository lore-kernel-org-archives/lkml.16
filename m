Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338171494A9;
	Thu, 26 Jun 2025 00:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750899319; cv=none; b=qwWYUWxXGZt4qeQ0WGf/TaOJZsQpkm2NKnhXji9a11ipuDmtd/xmQkG98cMnxJ0oFEXUBGUv+TfuIKDRlJD0aOkXKFo5eNli4+ZvCODbIMiH1mf/2CjFwgwN1a6MoXzvuiZuScoZm65M4FPt/4tUAww8p5Yjx6iiFh8nI2OHffQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750899319; c=relaxed/simple;
	bh=zFqd3/bjLRPp+NI2rL3/KcSshFSOhdj8iHHpRSps3Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eSPCvrSGOQ+eX4cNFYvOqz3MORalSUybmxJSNFh0r8mZXdB6ICmxmqzD8K5c8P7j2sDlMFVcEjlkI9C1L2pWbfVh+QrLVx8MJDQwKVIfUVzRG0HAwpOCTkdyPV9psJc6oBkMESFWsGlhO4+sBjqr50yYM0XkW485PtVVspP/6os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz6UF0D0; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz6UF0D0"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c7a52e97so562893b3a.3;
        Wed, 25 Jun 2025 17:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750899316; x=1751504116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKP9uNgbOA7UG3M4PzocnFVU56S59A2JUS0TA3YuX7c=;
        b=Xz6UF0D0oCb1oO89q5T6Zj52TOGpouq5Bd5vtbJpOKP0DJ5Yv/r/9urp2U6ddwVLKY
         T45b2G8TxLZmJDzbi18gN6JOSXRVt5W4zrt2qBvzgk7ilKqTkzL88bvOOfaN4S7wM+AO
         RtLL6VfDkR/hWlvaK3TWItTKh5U6g+F0FIr7pon2rYOzNfVBojSD6kn2JQPPIppSOF7V
         uKzftlU/iGvOl5raQIG4Geac2HjawAy6KwAP/4ZtieiN1jqF1MrsA2uAAfS75jRmpYz2
         PS3j8FOriBIoBLmV5uvB9zxhPVTkVm7Qc0HpXM7P5FjSV7HAk8nkcQJxtK6lM667EcES
         XyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750899316; x=1751504116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKP9uNgbOA7UG3M4PzocnFVU56S59A2JUS0TA3YuX7c=;
        b=aCHqs/O7IvQAEMay5WZbd05oBPdE+EwqzCctYaLQk1r2GJeahYZb3Axu+YhMDt5YOy
         Qg8dOVHdprADWckD7Q6cYReGtQN/o3LcVI1UAXNkJsW3BZ973cR0/qqDGTGBGRZdiZMU
         3W6sj0uusYMl1oye6WDkKRTBaQOPErSsIgy63yzHwL3SWk/4KIqpikgohoq9jsDtUKay
         UpG0KNoUNaHWkZwwFCJm/frSV0EihclmeGRmNOVZTTVtKnbrnPkTSnhdK0NTy/T2KXNp
         fQ/l8JmC/yxYMn8rrREtDKBVA7KeKylTRu1Us7NgbtADuPcKOA6nUBqTDJUlE/6+DhEy
         lWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEkbksvQF/amLDPIfrKcAx6phpcj7uUlYIX3Z5E9YLGqbPA82omKUHs9EBVDFQ4SNSv6qInGeZiVm3X3Kx@vger.kernel.org, AJvYcCWhdFU2p9FD5Sb8lR8Ma4nGMrmlOltR1qwtsAePvReQYnE13xPPEtjHfA6DiaVFKJkXsya2zLGTFX5O@vger.kernel.org
X-Gm-Message-State: AOJu0YwJJTfmGza3RlWn4bIigdFzKD6/NikE+4589I3dL6T6DN6myMWD
	9KzqshNLMMcM0gd855VQGOiHBoZIgVzYdHcJn9FeEayxW+GpA83SlM7q
X-Gm-Gg: ASbGnctlzy2WrJ2fdy8H5dvF2IYuIbXoKVdKBOpcfsOF4jWU63Qg8d0/rCWbXgWJGOC
	lutMhB54lO7o/CiiU9R6LzGj+aow0HWeBpPJ/lQOg7kqtZiA9MR2dYAgR4na76rTSpXbLSaEyA6
	Z08g35l1VjOiTs+e8V3LGaHB+wTzlDAuyy4bFYDRBhbpQOOIZzOgQ4MklNsvx/cOz9AxvVrWNuf
	lpxUww3DUz1rlZ7/fNqU5zfc7OMt3uq3ZfOXcDz3UbYwRK0z1W0LmicldDg4uGz2NlqMFB+eEU3
	A/Mvu5hZPugsthPyAg0aW+f71ehaDe8HbEm3QJiOj9Dc/Mix7WIK3zSCrOIm/A==
X-Google-Smtp-Source: AGHT+IEQdAUYETW/gFl9/oAcelA7lj1OlgJJckAOnjGK9HyiGax3+ORLzbkl8qg66/CLNj/A5zHCVA==
X-Received: by 2002:a05:6a00:3e23:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-74ad4462133mr7446024b3a.2.1750899316199;
        Wed, 25 Jun 2025 17:55:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749c882cd8fsm5330612b3a.77.2025.06.25.17.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:55:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/6] arm64 support for Milk-V Duo Module 01 EVB
Date: Thu, 26 Jun 2025 08:55:03 +0800
Message-ID: <175089922824.136282.4248920975036123392.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 12 Jun 2025 15:28:08 +0200, Alexander Sverdlin wrote:
> This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
> been chosen because the upstream toolchain can be utilized.
> 
> Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
> peripherals with an addition of ARM64 core. Therefore it would be
> beneficial not to copy-paste the peripherals' device-tree, but rather split
> the most suitable riscv DT into ARCH-specific and peripherals parts and
> just include the latter on the arm64 side.
> 
> [...]

Applied to for-next, thanks!

[1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
      https://github.com/sophgo/linux/commit/f71cc64dde536e1e805e5b38855d8d3a01eec845
[2/6] arm64: dts: sophgo: Add initial SG2000 SoC device tree
      https://github.com/sophgo/linux/commit/7846621ce517375537ae2772e54f033a241fe382
[3/6] arm64: dts: sophgo: Add Duo Module 01
      https://github.com/sophgo/linux/commit/7a2f4a250a1129e9d92ed8c43c02f528181df679
[4/6] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
      https://github.com/sophgo/linux/commit/29f4eab1d97c89a0a72793823db287ea6649baf6
[5/6] arm64: Add SOPHGO SOC family Kconfig support
      https://github.com/sophgo/linux/commit/af00cebfbb31190dd0124c431d1baabae456c313
[6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
      https://github.com/sophgo/linux/commit/1793a187e20257c260f520d42611966d6d249f22

Thanks,
Inochi

