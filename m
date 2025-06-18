Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879A018027;
	Wed, 18 Jun 2025 02:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750212011; cv=none; b=lCBdBOeM/GVP1/sIjYula+K9xcfj4+HcpZCA9KkTPukcPCcFVjsq24tfrnQK1Iq3tdEcBFuXdH9ChTVovdMrV2858WXIEAKucPjFnUiHbE3q1KqTrXbPerkYjWScbvDHflAq52NZIKwYm/9v27WB+ioRwy2Auz4nICTNgPa9nO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750212011; c=relaxed/simple;
	bh=DbIUGT7egbSIgjmzz8mJCssUS5EuZGi8Eo9qvZUKpaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eHJml6ZUhpE+7TFkcPHxNYk0jbpjLHMlQTK0la5DkYx82r4as0Gt57uFxDHARx0Kmnc467LMoNDZ1cXS0MRSeGMYUiw3TRqYdU+MEbOv8WazbbrT/2ZteAVp0uPCkbKOPeibOtQf1kpMKI8t2AcXM0wT5wzgnmOtJ7WHwuy2lmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOxIkfr1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOxIkfr1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2363e973db1so2049765ad.0;
        Tue, 17 Jun 2025 19:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750212009; x=1750816809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Js16QE/l3Azxf6OhqJKpRZgtBkDfap0Xs9MrJpn0tP8=;
        b=fOxIkfr1LEKO+kHAm7WYmzq4QDpaSgIV4yrdtukew75FxjgUokwxYKxAcqxJqivWmk
         KX6lT0dTyityhbROGOQpDx21w4TPwm/cQZX+TGJzxrjWK1Q3V4YzbNLxA69MjNNpR0CI
         4bikPb1FqZAAB7wm+4FyoJI1eNRd9hZEoRvTbadGJLOgmtJLTOTkV/Si6ZMGLO/4BpBw
         zMvDkS2MBC3bGj1WkW1BEHZmBEajSKMsvrPGNpu843OKNPo68AjVPTSOQLFDOWqg6OUL
         1yyftQ+Ls2s6JjXkv+LjSNhFcINMJAhqJauW6Vh720UiLEx9kbUWGVHcfXkYLVXDT/aO
         7z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750212009; x=1750816809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js16QE/l3Azxf6OhqJKpRZgtBkDfap0Xs9MrJpn0tP8=;
        b=G0JtMB2e0s/t2VSJXoCkQP3I6ygM+xp2bLEPsjbUxAa4iOSu6bjvW/8n39Eg0JFJjH
         Rb+GcUlrdV8zgVbqRXvnWX1N/xq+hWse6eR6Hcu7mhk4lux7TGX5E/phB6IB0nqMVACE
         AGKp97//Eqzik8CIZHNH+yaoz7QaAF+r++OhpIE+tFgD2BYlIgs2H3c8HiQ2+P/asW+j
         C7kBUNzdS1lfXo88V6bSnmsdE8opD4yAtBLXHIIb0oW2x3j58Ar6lEKOXMhMLDsKqMSt
         zOVrMMXUkM223Cim+YT6tu8tD5iPZZryEOrKVq8pPjOVyDAgJb+svyFER4ahdnrmlgz6
         mHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG1sANAU5tzui9rMxT9O4nPFhyczeh0psGQengBhsxd29gmgHfOD8Ffp7Ku9QYej8xMiCL7o26fafHwx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YznA55lqLYEVEQg61xpXJoXuhCzCfyx1RT2ZTNndgI9aYsg+Yac
	JI1JlUcsuGhYWVrdSUc6IdV3WdEm6EZz4wEbDKjRX/gzQccSiYQEcjSP
X-Gm-Gg: ASbGncuvtrxn6psQ08XXb8XYY3L7U/eAdt6yZsIao3Dg0i74VQiEdcymN2bdO9ozJk8
	gD6WYhHKjeZRBNj/BgnHaXrGyVHDjHTSrIKMuxfO1zPEMj2+3CkSyBgoQ2o9UE+dGJ41pTJKml0
	bGvNLko9DemySAsa+kHKj2Pb0XJVUYqfqv6XxcczTbAoXwrlJxRLshX6h0RChOAWkHFvs/9ommr
	Iikc0iy2RM1VkllzZLSHP44o8y5wwditT6GzFt6r6wOiWT1oTMmZH8L09DnlDSj9WdHsa61Bl9N
	SXFvYjReb4KltWijeGcJlJp+H526hEGsXZw7myLP2yYmXtBDY/q4xgFxAglTPxS89PInKloE
X-Google-Smtp-Source: AGHT+IGAOQARUloo9z0y3rQubqjj69WyqkCBQjqqpqt5975rY016nm0RO7e1sy0kgIpRtWCQISr0Aw==
X-Received: by 2002:a17:903:228b:b0:234:11e2:f41 with SMTP id d9443c01a7336-237c2046e94mr12186545ad.6.1750212008742;
        Tue, 17 Jun 2025 19:00:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c19d0e36sm11494388a91.15.2025.06.17.19.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 19:00:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] riscv: dts: sophgo: sg2044: add PCIe device node
Date: Wed, 18 Jun 2025 09:58:47 +0800
Message-ID: <20250618015851.272188-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the PCIe driver is merged, add device node of PCIe device and MSI
device for SG2044.

Inochi Amaoto (2):
  riscv: dts: sophgo: sg2044: add MSI device support for SG2044
  riscv: dts: sophgo: sg2044: add PCIe device support for SG2044

 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  34 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 186 ++++++++++++++++++
 2 files changed, 220 insertions(+)

--
2.49.0

