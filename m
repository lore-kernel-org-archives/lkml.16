Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9794F78F4B;
	Fri, 25 Apr 2025 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591650; cv=none; b=EUclromVLZQl4koSEp2YXUbjkSgCq/34Rr6j7iuVspHw8WvEOaMSVNg22CPGob9U613jVWEe9AI78qTLZTaRUJcXtxcgTZmA1DFpbQrH/3NFTq+0Cc+gspOTIVWGawCSzyaB0NoS5bvF3x1rLTRfUrmKAJgfIidyu+DhHRtUzBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591650; c=relaxed/simple;
	bh=cCyWwMZFerO3tMEM7NbWoK6zKcoVgBSQgFmaHGU8n5M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lftPi4yY59Dhl45qVqmmSWoRYsV+tOfFDx3HSZzhJ4dh/owcD1Xmp7OL/OArunbpwqpqIdkqcgMGzXpPGaSnCxYkvFcwOJXn/vAoBzUQUeKurRh+PoW8hQYElaQfA3g54s+OQT87cUO5jSKz9xJdSeOSeRVGA0PgUjZ7Lv8kyGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nwikz9HX; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nwikz9HX"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b1a1930a922so491356a12.3;
        Fri, 25 Apr 2025 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745591648; x=1746196448; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9KepkG9ADF8hlHDnG82SdrNv29y89LUZ0AirKBzFtk=;
        b=Nwikz9HXA1W8MDDBjPF4g2Mb3SD9SQJ62qVx4wKJ1so3odzxqYxJoDDNyEkGWjoYXP
         pzfn2eg2h1NfG4BdXROjDPyolZhHyPpGZhYSNduKCyrC1drodxa04aV+bMBaK0+n7ooc
         vJLchUw+HZLh+7PdACbQBV6cm03xd32j1i2HKhjxQIRJKoPw77vKV3uMisjH5iBdjzYI
         T2MvkbjjZ4TIuqqJpDZoNWIN7DUD9tt3oHJYNCYGhaH2iE46MK9/X7w7OhaUwKkjzF+s
         wu6J/sUEgtBpMiLS2STny8em7RA+agkvfP6zKgp9UtpB7lpp7d70tecxkawA6a8Z4BCa
         r9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591648; x=1746196448;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9KepkG9ADF8hlHDnG82SdrNv29y89LUZ0AirKBzFtk=;
        b=k7dQ/QJuQL0GtOvmlmTxMik7a63zA0XClCC41sArISaxfcWM54kFUi8MElhwMx/HAF
         jIcQ0uJ6jD4Ut9yFAqcWpcObjoVubn9DhKDR++BnkWZSWcpynemf58vkWMkR2b8JzLWW
         dFNf47stYztgoXdNHPvo2bJkdm8lCEswTfrtRFwXGohn5tOQhFzO22K0pdLGPKq3IrmA
         CJSwdYHgzEUdKjmLMSoHuqZrW/E4RFAif1MW5eW49AaJ4gV6O9flDMqwmE+fxqxjH92F
         ZAHNsKkHDtVcVbz8Uao0RgOUF4Sb4/+AH8jSekXp59Dh3axRJergFNGkbLsypQG7GnvH
         GDAw==
X-Forwarded-Encrypted: i=1; AJvYcCWhtSleZHooYNOLrCjSvOq2zlat8ua9rlFJGc7B6HK3K8gRujJfNq87cM8BcgS8lObjzQPZXkqB7hHCJ+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEhksS6Ki7YCcySdMe6DePAYB6hU8oWzxhrvI5V/R0uyGFvpM4
	KjGCv8db3blbkgvYkAeoc3ax/XwB0FmvadznWq8dL/1qdIDRQoE/
X-Gm-Gg: ASbGncuLXLxSsfJ1YbU+q3XKof7qgc/U/j9DYRRbbesbKaWi3Kbxh1aKRQHOrOoyZ+4
	Q/NwFdoGZkbmSzaKOnSW5gEqJqXNa3GTn61mAeaRGZpOMeV5HNUy+Ugfu79CO82ZXM4HIpltSPg
	HWID9fMPyVmABBnfdmkPZ4N/urEEMxiGTlYklpm5LcsytKhdDhO8ALe6ZbwiLjpiRJhk4av2InZ
	OpZRMr5dsQe/Wte9KRq9ZWhkR91OPm7SvjGS3kAom9wyYBcDQPrNlYYA73KqHmA2mb916obVmq6
	J1zTWgzgtKFZdhz1+uGLn3IGhAvP4Y8P5o8pLrxb3U8P8He5lX2I
X-Google-Smtp-Source: AGHT+IEXIMb7CIazyiiisniO4P91K2jYStzyQ95nSmfZDQraAf/H0RTLBmKhNw6lqAWT6hUdXr0eiw==
X-Received: by 2002:a17:902:f605:b0:224:584:6f07 with SMTP id d9443c01a7336-22dbf62c3d3mr35874785ad.37.1745591647822;
        Fri, 25 Apr 2025 07:34:07 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216c35sm32860695ad.233.2025.04.25.07.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:34:07 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v4 0/2] ARM: vt8500: Add VIA APC Rock/Paper board
Date: Fri, 25 Apr 2025 18:34:12 +0400
Message-Id: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGSdC2gC/33NwQqDMAyA4VeRntfRVqvdTnuPMaStUQOzlnaUD
 fHdVz15GDuFP5AvC4kQECK5FgsJkDDi7HJUp4LYUbsBKHa5iWBCsoorqr1tvfYQWoOuQzdQ1YM
 GoeqGMyD5zgfo8b2b90fuEeNrDp/9RRLb9p+WBOWUN/bCRGnyMLdh0vg823kim5bKgyDkL6Gkj
 KqqNkxJWQkGR2Fd1y+KQ5Ct9AAAAA==
X-Change-ID: 20250418-apc_paper_binding-8feae286710e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745591663; l=1668;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=cCyWwMZFerO3tMEM7NbWoK6zKcoVgBSQgFmaHGU8n5M=;
 b=jCuEdMsGFwM92JrEuldfW5WVF4fuh8Rn+o3+y4vBoI3fAB1NFyJvUUhK3z9wvaElEwvvox7Sg
 x35Ce6v3xeKDUl9dvTIwOeZfvaPkDWHOi551+RWe7USRruO27oalXjh
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add binding and DTS for the WM8950 based VIA APC Rock board. Paper
is the same board for all intents and purposes, so reflect it only
in the binding description.

Split the series from v1 into several chunks by topic so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Changes in v2:
- kept single-valued compatibles in a single enum (thanks Rob)
- dropped the empty overall description node
- Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com/

Changes in v3:
- submit DTS changes together with the respective binding change
- Link to v2: https://lore.kernel.org/r/20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com

Changes in v4:
- fix typo in the dts Makefile which went unnoticed due to a previously
  built .dtb file lying around there under just the right name
- Link to v3: https://lore.kernel.org/r/20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (2):
      dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      ARM: dts: vt8500: Add VIA APC Rock/Paper board

 Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++---------
 arch/arm/boot/dts/vt8500/Makefile                 |  3 ++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts      | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi              | 11 +++++++++++
 4 files changed, 48 insertions(+), 10 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-apc_paper_binding-8feae286710e

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

