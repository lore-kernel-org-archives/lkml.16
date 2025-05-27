Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2D278E40;
	Tue, 27 May 2025 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358614; cv=none; b=Bb5gyGQc5rxuvYUPcz9VG6T//Y+T68HJlMKtoqi9xo1a3/R8q3xByqBtbRqht0k1SE9Ns9KIMDXk75D7c8pNE1mh3N35PNGRFZMC8V0JYBazP1i04DsvH4hudr4KEyamq/k/L/o7QCPNT+ZrqkxNxrpla8t/Tu0eLTM8B+/C6fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358614; c=relaxed/simple;
	bh=H5ma2vOk/zc4ruJ7aeeKCwuDqBKYCA3ttipvxTMf80U=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=GxXuD9mywMArVbsF8pFnEByTaGSIl1lGypPUVNGmBHhnzBC2COFZKXeSc9+gs35fbyM1yfGq/bbLn6oROdVTCmVyev9DzPxvI8sSRqK/RLsr43rNEwm1iPcJwtvjjRI+Tze+i2cMnVWxswmBfBWIk+GZedTHy+SQx/Xe0/jwI2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwxEAXvg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwxEAXvg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c9563fd9so2357541b3a.3;
        Tue, 27 May 2025 08:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748358612; x=1748963412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqD0/od9qaSOr72rB1opXGkuaDPzcvzJRRaU7EuNDzw=;
        b=YwxEAXvgTa9WPFR602Y5x+0W2579xaRWVc8JQ6VJJ2cYSlmYHq9Ke5B6tK13TdJ0eo
         rnMJAlgAuSSapFmkHN6/sQGBqpgCOk5pX/kpmbBEPdH18v9TL6e92UyZpzWZBd26A1DE
         F3FIcImeqYYtO/HElB/hn72MsQr0DJqJ6FhxA/C0pCO8f5s3PiD2Iq5HaSElpQtchPlM
         kIgePhDmfLe3MsmSQX0XzD1JOvr5gXhLnq7+j6iDq6ifq72VR6AYoLfbCLTeKsBwO51/
         C3qUAMvgdvOc/mu8wOP88dkqLWwxECz4aDx7JmWB9XgBXpPVCaAbCZaAH6dYTGij9HyX
         /2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358612; x=1748963412;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gqD0/od9qaSOr72rB1opXGkuaDPzcvzJRRaU7EuNDzw=;
        b=ZlLJ71JgezX40YnESx5T99977cZD+CSEoHp35oaZ4fWWNbf/GwW67IF6zq2Ljl1Uw6
         A4/1CRToDf7qXaw3+qinI5CvylmTW+as38h9DpfWM0X8vCjW6ZdnyDtyH/49ZikCYUlk
         uxKVDWxKOtHeRlr6XXnn3i9hALDTF1j/xz6HbKKRWuyH4QRNJd44XzuTEbumpHJWHecu
         AZ2x9TpE8eLwXEZN2uNO2aSBgVvnz2iLccuT6RJLfeFVO1OhXcAY0JUKZeZAT1GgK9r+
         wiW1RNLS/NU/vys3WsXO6JsyOcaaFcy9UwMs8Rp3KAI9Ak8k0ri9RJWY6H4n3MMp9qQ6
         qKWg==
X-Forwarded-Encrypted: i=1; AJvYcCWBua3Oy0FcY8iN8d/XZtZYQUePJTti8IvXRtYAq+EqBKk1LYmrm0DQX8bSMPVTSVQqqJHjd1IqDpzVw8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDMNqQ6zQ99t3IXjgaEGB5E6AkaPf43NcW7JynK/XeHUwhWJpJ
	R53yOgYhyhHB5TbWlVlAqm5SAoQs3cRHDatO3RKQsS2x31orLe0VVjAIzreUBQ==
X-Gm-Gg: ASbGncsFtq8iwC6imWtJwqGD0+TFZLfG71ngZSCowBRkRx3imWQLFI2Eu/CfSX4qepn
	OlsIUcO6k+lZjTz9+wju2M1d8q97BZXYEqvYqlBl6n+oha3UsiltlATTf7pgd0MkD5Ti979Pqxb
	Esqi4osTDvR/6oHgmzNQMCEpAVNgTvEOKhDnCLSyzHAKNjPxJ6Kbl9eBUzOITzVuiflQk+UFTVu
	pW/5NyKSBmom8Egxgty1d+jGc9HLpd4WcqtS1KlsKRoiApxjwuk5v03+8FyjvFfpCB9fiGSaHHA
	YNfT7PyAROjv0Y9QeWRRgSz10OAimWQQTpW0gqrTq8ju/KshUn93aM7ct8ZYqLiCF1rZQ22/
X-Google-Smtp-Source: AGHT+IHKy3vWfh1PGy1ku+o9RNhskr/quenhtttfB2tDE91aGVAU8V526XbxdfEk89gY9R6EfOonTw==
X-Received: by 2002:a05:6a00:14c6:b0:736:5438:ccc with SMTP id d2e1a72fcca58-745fde87a75mr18828988b3a.9.1748358612384;
        Tue, 27 May 2025 08:10:12 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de11csm18869987b3a.31.2025.05.27.08.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:10:12 -0700 (PDT)
Message-ID: <6835d5d4.050a0220.14ffd7.0e10@mx.google.com>
X-Google-Original-Message-ID: <20250527150946.2815348-1-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com
Subject: [PATCH v4 0/2] Add Meta(Facebook) Clemente BMC(AST2600)
Date: Tue, 27 May 2025 23:08:47 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f168126c-e0e2-40d3-9b9b-2a5002a75474@kernel.org>
References: <f168126c-e0e2-40d3-9b9b-2a5002a75474@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Add Linux device tree entry related to Meta(Facebook) Clemente specific
devices connected to BMC(AST2600) SoC.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
Changes in v3:
- Dropped blank line as requested by reviewer.

Changes in v2:
- Fixed all dt-schema warnings/errors reported by checkpatch.

Changes in v2:
- Added 'Acked-by: Conor Dooley <conor.dooley@microchip.com>' tag.

Leo Wang (2):
  dt-bindings: arm: aspeed: add Meta Clemente board
  ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-clemente.dts   | 1195 +++++++++++++++++
 3 files changed, 1197 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts

-- 
2.43.0

