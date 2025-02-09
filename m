Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555C213D28F;
	Sun,  9 Feb 2025 12:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739104195; cv=none; b=XaoAWqZX7tjOYDlYfI6SziGLV/Ri0H/n72TFBzXSYKfI0W7IUvjUF8o7VKNKdjg4drbJTX3UjvoGBcexSpIhSedEtRQDGXD90V8ixV7wE36L69wp2FpUfJbvM03NXhjj3tUOqr5XVjGpv+lhJhswM4uvgF6HcSJiijD9UtL5fug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739104195; c=relaxed/simple;
	bh=lnw0Y5CuBcSijVCwkqLrcgcB5xdIRwz7UeGBaYIHxlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a8ucSYAlOvshzIrfD0WNjOD3XLYsMLjIXY1NRAPaBr62uXWBBIxu/mUG+kD7aF2deIhPIrweb94KBn3mZFfTgyPI+YYAX+BDV185PzXvrbv6YNdzSoHNnTeC4DT6JSqZgbCwFLHEi+o0P5q6wG+bW8EJtfk9i0i9kZkv7BbQSVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX7FUso0; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX7FUso0"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6f0afda3fso464790885a.2;
        Sun, 09 Feb 2025 04:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739104192; x=1739708992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DwvIvCl35OzqM9bUelpAzn4mC6uYC+wlI6NDs/JDjeY=;
        b=kX7FUso0IbpssZAHlpgd67qCI2yvcvkahXlxuyeVY28NLp4CO9D/6+MdCSmjT371Oe
         dkWpJ3jCmzhnDzGIB8yNDj+s8hUhK3Yeejv7lHYDb895FVGaJnMuhAjnZKYTxD0ujU5f
         BKLhzPcppjHSAzQFcVvphkYfdeyRIpzlACWxZWkAVd30x7G1D4hSVCHAtQaMBGbIM4Wd
         46HtFAOmckaHK8bRarHdno/VHANA5C2ePHfzurByFenlTkvA0R1ZYwzjawQ2A0/3NBpD
         t4ZjJ6vfDTGxQMkEk0GA3kEmntXUDJBliCMq8pZBDLWQQ60m/MJ5c2mDm1vkaPVPTsQv
         atUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104192; x=1739708992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwvIvCl35OzqM9bUelpAzn4mC6uYC+wlI6NDs/JDjeY=;
        b=iUn1LTnmWcEY29CA7KsUpxW66LIKUrHV3O6CmFnFTkBWc8KfKbC2Xp8jeT3UI61vJb
         oeN3b1stz4aRKOMyxbrNNakH1HP+0WPwzuSlXMrVDmq779Mvg/UrFjDJxjx1H9raGkje
         Iz5GpV9+5r7NLZghrU0tDei1WFuoj26gqSxY7NpI3KMWg1UgsPdiw+quoKUVXWon9Ss3
         e3SJyF5wBX09AW7O37oGfTe4GbhmBpC+ZzpmDtlbePIZPvrOIChFfIhD2kXWzCOD/NLE
         3GhJ1baS4KWBu9okUK+4COyzMcFkwgxyGyxlJeEkM0jSrqP6q5iideqtc4xwmQ/5n+M3
         +1ig==
X-Forwarded-Encrypted: i=1; AJvYcCX1LIHAUhsfZqt+zTUI368HX6WubBtZOeQQsT9qQqiAEtAYJ0sKkymRhPfB+VHMWGVQ2tfSurNK/QkORLRV@vger.kernel.org, AJvYcCXW23BduYgjYRuNfbbqjCr/ufNQh3StDO5ZCMUHQv7lw4I5NRfNJrQOHpvwfCq9Dd3w8x1oysF+yNMV@vger.kernel.org
X-Gm-Message-State: AOJu0YxyQx4AiYNVToH2vjguncIiqRvvLvyRhJ8HV1zSY6ST6lSpDNJz
	zvBEXv8M7Hwsxn6Q9VZYd335ppgv7PGaIGFVSR53EngX1dwk0e0I3FHb8g==
X-Gm-Gg: ASbGncu8Qh7H36i+aDnS156gPikKFY+vq+vYcXeK6Pgl1GEBWT039v7DTGCV3+jSOVF
	koP0bIkCoiQmdWnDkLLXrnaf0H6ycbF4XqbVlPD3NrRWruo4AV0wxiAbnPe6hZ+VCF8mDFnfCtX
	mFNBnrQ3Kv7QMG5qkKfjKVryKf6eMELzNkvDMGb1PUWWm/UjUnKRPI2kKflGTawNiKpc0/4I+1O
	dHeO9+5E8T3kmVkq7wW9Hg4bUNAKukM5q18Q5R5QUvCrkf8rF0gY6X8BoPW3xh/vis=
X-Google-Smtp-Source: AGHT+IGSu/HIdJ3jLmPPmmBGA0MsS2lwXSoZr8XmCh5qD2BeF3+nxBxBJt1/7KlwUfp34PmtbC34GQ==
X-Received: by 2002:a05:620a:c43:b0:7bf:fffb:5818 with SMTP id af79cd13be357-7c047ca80f0mr1595418385a.57.1739104192037;
        Sun, 09 Feb 2025 04:29:52 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041debe1asm404950385a.2.2025.02.09.04.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:29:51 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Sun,  9 Feb 2025 20:29:31 +0800
Message-ID: <20250209122936.2338821-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
Add necessary code and bindings for it.

Inochi Amaoto (4):
  dt-bindings: reset: sophgo: Add CV1800B support
  reset: simple: add support for Sophgo CV1800B
  riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
  riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
    SoC

 .../bindings/reset/sophgo,sg2042-reset.yaml   |  4 +-
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 21 ++++
 drivers/reset/reset-simple.c                  |  2 +
 4 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--
2.48.1

