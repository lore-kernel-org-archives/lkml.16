Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644EA4B1E4B;
	Tue,  6 May 2025 20:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746562012; cv=none; b=osaMX3tVqNwu43DbRpUkAkVO0qXVapII1hZi4FG8hRJv6hNn7WmRPJR6jkgI+RF5aKNx0Z1wnLKZVSAxlVz2mAtYJqzvmBiVL4JidUQASaEsVoJnFwnXRiLj3trOhfqXFswNtDc6yck1Jjagmxt+uFE0+wEk/uOzqE+g3+avgbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746562012; c=relaxed/simple;
	bh=C/hqTH9fWgjvHIAlcqh9rsEMLpNaQkiA3cjX0v4rFQ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sYj4Q43AvnbLP8Au2aQ2ueUZ5OvXai4vOo7y/AubJkMwJgFzbOxVA9Jg3KpUoEWtCgzFu5lX9zYiuSQRNh9OaEW+ojp8Ys5HoOm0GC9BIQrpgif0BGRWskudmZc/J996AiW/FvshA7XRQZdXS3/XW773SbH59u5Bm0mIHumJWHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJHmqrhx; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJHmqrhx"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e3b069f23so14539355ad.2;
        Tue, 06 May 2025 13:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746562010; x=1747166810; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GzXxf0Hnx2ZuZyJaAghD13+hNIZ5tC1zzw1pZ5Fbdb4=;
        b=nJHmqrhxmbb+C84MqYT/ACL3UhMYizNb4srdiunTEWxhazD7BIDRffFerY5pBMtPN/
         MKXj3k/kWR94Fl93jSdLWppuSjR97NnXb4vttOJ/66VQ1OrIRfDsZEWor6Xl9NZgEGNp
         vb5GEVNn0YXozaL+fn76ahRfvJOJyGcJPQrs3gOOmGskpO8yuA2HTcWHHNNHxA0BU+FW
         Gl1fOgbV9f1P0RoxlonDSjKvYvj1ZMfPhinrOTIuTwajLPChtpkSaE7FzixhejIK3QOk
         F826mIJmQJ6QY2ta0jYokHbtz5tqRuGfudYKfb5QMY/AFC5IOH5aHSFmLyst1HhiYxEv
         K53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746562010; x=1747166810;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzXxf0Hnx2ZuZyJaAghD13+hNIZ5tC1zzw1pZ5Fbdb4=;
        b=F7dmuJ25Wk5N86Y/PMtFHAFQ2bq0QQikIKn1qqhnlK8oUl9JFp6e3ixh3ewOBZeUVT
         vKT9kiV/QXR7IoBM8ay7wHCT6jCCPL7YtjSmRDmvdmWJrN5a+NljQY0iGThogWuLf4GT
         a6XwAl3MlIhWi5C2OLAyiE4cj8MfYKRvwTjd9u4VogciRQu2GXlwOViY227o6mrRIcxs
         GXIwA3OG6MgeBrr0YncUOcdYyAOPhfR9miWA/78Vab4TyVxHhOkpO1kcM8YwrsIseZeW
         nme9tvdOFAVzka+dxw4iFVEW2lPdwqiWWXu6mEcZqI+gy2pxNK92pPQQxHPAoL6ROMJ+
         5bbg==
X-Forwarded-Encrypted: i=1; AJvYcCWcH+yN+3OAl29osgCNe2n6e4D/mi2W176npPxKfaP7HCr9KHaRMGM2mNRKxuS//jZqAgPUA1cJLPWC@vger.kernel.org, AJvYcCXJkUdKbkd0ouFkRlsBa7FoYf5qrNgRf4Vc14+15RXJv9w2tjzPZnvTIUoEVIo+cAb3pqgbo4hrBQsTbI9a@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy8ZkEm/e9+8FwYFrmTTXHVmsAv0L8gT0AnC4tmbdIp5Demnst
	DXUjoZr2lSJOh31zki8L/L3d3ENeu+3Hkv53hrTXC0CCj2iD9BTfs65OIK09AK0=
X-Gm-Gg: ASbGncttrBPh2FI1xKFs6xiHtsz/NmPsR+OyOnwxDTV1lvZWtVt1/LXF84uh9xTkGTi
	jzeiiojfdULfgoU+ZwdTNg++V/C1uca1f+N1DCQeqifCzFncUQcF12x430J1nEcoMJwBIvL6ChS
	5N1+2xYFXq1qpz1CSPibTlwY9S0+pS0UFYw+7l0e/x62qr0mgErIvwyfzoBkDDlyg1FawTXao6h
	WnoSCKa4+reRHnlOh5moUX0Q+AeOGe+bOJ9EPL4+oTS6u4swACrvJ8RrnS7bsv3qsDAgDPXIRX3
	tLR7RCH/6tmkPaN3I1FNGis29kSo4EsFtsP5/tFiMku6YIOhCZsV
X-Google-Smtp-Source: AGHT+IGdwuldVbcmWLN0KkrUf8rKTSXH7NdW0ivuFj9VQtpVoZ4NgUzZQC4g3DwuL7LkRQ99v38W+A==
X-Received: by 2002:a17:902:fc4c:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-22e5ecc2696mr7068435ad.26.1746562010216;
        Tue, 06 May 2025 13:06:50 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm78378635ad.62.2025.05.06.13.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:06:49 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/3] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Wed, 07 May 2025 00:06:11 +0400
Message-Id: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALNrGmgC/x3MPQqAMAxA4atIZgMxtCpeRRyKjZrBH9oqgnh3i
 +M3vPdAlKASoSseCHJp1H3LqMoCxsVts6D6bGBiS5ZqvFJriTDpKgHPw7skEY1x5JlH3zBBTo8
 gk97/th/e9wN7PQX7ZgAAAA==
X-Change-ID: 20250506-vt8500-timer-updates-44a0d22cd720
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746562005; l=1116;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=C/hqTH9fWgjvHIAlcqh9rsEMLpNaQkiA3cjX0v4rFQ4=;
 b=OYx9UAzouM70vpNCQH3qouty7tsRpKFTtpa0JWKuPso00r10WEe4tlx4RQVdoEH34FMnVadUi
 vlkxM9CYfvgBuejsWOwhg7DDo6ck4dKisIh/KF92tMHD0RSHr6KlVgN
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add named defines for all registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (3):
      clocksource/drivers/timer-vt8500: Add defines for magic constants
      clocksource/drivers/timer-vt8500: Add watchdog functionality
      ARM: dts: vt8500: list all four timer interrupts

 arch/arm/boot/dts/vt8500/vt8500.dtsi |   2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi |   2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi |   2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi |   2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi |   2 +-
 drivers/clocksource/Kconfig          |   6 +-
 drivers/clocksource/timer-vt8500.c   | 115 +++++++++++++++++++++++++++--------
 7 files changed, 101 insertions(+), 30 deletions(-)
---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

