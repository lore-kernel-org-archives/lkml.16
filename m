Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD58D1DE89B;
	Wed, 28 May 2025 22:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470712; cv=none; b=TH+aM9R20rprg34TsFeE8LNZBM2AR1eV1czoWivCazsSikEZPgPmxGAWoJynibVChqStBqcMhSA+UPy2PTd1Xlwv1c5cXHfrqGxbIkAOkD8PvQxbbkQ73w+MD9cINk0Gl67Iu0YIGScftHVxCf3r2YRDUrwBavy4HCJbn15QMUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470712; c=relaxed/simple;
	bh=HshaVPCMZRVwoJHKWd4C9jH+H6J8xydEIjtK1TYOtpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3Vhak34YcSysrrlCTc/x+CT7iJBOEtxsqvHOraVZ3MEX15seX697+elM8rWkD9Uj3CZzzO9mefnS38ZclY/E6Ry4LuP6Z2M7XEMvW+zXDi/amHvyEFhf51eWh+np8KtjEka9NNsNz2Lm+WsU5DeUQGzqzu7M9TOJA9ZQqxX+6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hs8MJug9; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hs8MJug9"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c035f2afso131392b3a.2;
        Wed, 28 May 2025 15:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748470710; x=1749075510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFnbU5QXcdkuEFTVcbp9QzArdDzsF7X3YeB+RC12hro=;
        b=Hs8MJug90YjmAszQUd4170miKgJo6nb5FGZ814rOQGdzA1eCr4S+Atpp1XAfI+Ngy7
         ugX/KH+bw+VspJ0H1C0xvTQOQ/L5kQVjaBdAiZblvlPvHzAhifwg0mtVPZuQP1qMxwhl
         1Qnx6ix6YWpa/qkEYKmtbjaZg4qf3Y1xEpXwABv5N0p1q7zEhLhLEwKwWZF3O85mBfFy
         j3C/z7igZsUpDbCm67RLqlzKoOyaIYKBAcLgvopEFCfQK7IzMCL07E2+qlQ6V+lnL4Y+
         2rPMMHAULcaxWVKrMIYGlJotMKqWyyT2Nw+nIS43pWq/6/eWokV7d+dGruUVSOqEibbK
         FMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748470710; x=1749075510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFnbU5QXcdkuEFTVcbp9QzArdDzsF7X3YeB+RC12hro=;
        b=clhIORO3e2iLghGePUd2EiPie7x+b2gEqDvytQSUbG2snReTZAYqahwdyKOhznjh5U
         kMF9yYCr1/3ga+EnNduMP49ki7ova4Xn/sxALAuP5Jna3/MHyh1TQSc4nMF1uaAfi9rJ
         XHzw6x6CmQ5kmgPvvpNvWpI4gebR3vFygnfL/xj/1kH9bfHMfOrdI5uf+K9MerFmJOhk
         1RFIqyb4LV/WYjmENOiG+FnYAO2gw4/mypiHesxpRLbrhxG0PkrDmgg+GeSAku4HGC7m
         GT7FuHwkqj+n0HJZ3zpb38+7Ho5mebcGPkLEGrzzjNSFjJuyY/tTqSdTxPvm2vi7e2rr
         BPcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0z1Vb3I2lkl3OCVdZDq+WBwt2RNzHaAqxyb3ZnENo/vrAvmj0MKiE6Dws8LH/iceBLVuaNIWXe9Y9@vger.kernel.org, AJvYcCWqjNcEy0TxF8wQNrI9d1PmYxpp3Ul7kjxYrLuoHPweg+FZfbxzJKR78wKyOLaBqTJ9ajHmcUOLqkOpt+IZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwiPg6nV5xx9Jno2qXXdvE7FX2tbjPi8B/meWptZZKOSyjO2R4d
	Ircznvp8rYMQzVgh6d5ONwb85N60egZKB68vVGk9OS3Z+s0Uh3If3eyH
X-Gm-Gg: ASbGncvVM6uO8e4EtuIm30pQRcA2YDd5lOkZNIa76a/QIpk9ZfUEE5UWE/Mwdrpcbug
	7RfU5nmLfV3fSvgPpGtGwKWzabDy+6HC0Nkl7Zb8oXiDlwvkG9PuWvgyD8V2EtvHHMm03UgPouH
	8yGW9KV370/WN6BMDn4+ccOs+tTTwrSo3EACnm6KRbIAAtYg/4zONdxLaigIFfdlRjS2HMRPlui
	FOQWokiHILjoD/eh0h1iF/a2bWEPA/x6BjKvj7Ah988WyT3FkX7s2RcDvpfkPw8nJrK564Sr6Yt
	7rPkR6lqzRmHbn2AdLlnQqPkVRnU24aDMbUxfqu0Jw72BQmNJ0yn7F7xmzQtPYf72A==
X-Google-Smtp-Source: AGHT+IF/QBsGDlB+6OdpCjsobsk71nuMEkAKwOKFrNErsZYH9vawpaENRQkYB19VKbYkltGSxArE+g==
X-Received: by 2002:a05:6a21:6e41:b0:215:efed:acfc with SMTP id adf61e73a8af0-2188c191795mr32428647637.7.1748470709827;
        Wed, 28 May 2025 15:18:29 -0700 (PDT)
Received: from localhost.localdomain ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff71fbsm81015b3a.165.2025.05.28.15.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 15:18:29 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Steve deRosier <derosier@cal-sierra.com>,
	Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH v3 0/3] Add Radxa CM5 module and IO board dts
Date: Wed, 28 May 2025 15:18:20 -0700
Message-ID: <20250528221823.2974653-1-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <174735136138.1544989.11909422896170025756.robh@kernel.org>
References: <174735136138.1544989.11909422896170025756.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds initial device tree support for the Radxa CM5 SoM
and accompanying IO board.

V2 -> V3:
  - Addressed YAML syntax error in dt binding (per Rob)
  - Fixed whitespace issue in dts reported by checkpatch.pl
  - Split base SoM and carrier board into separate patches
  - Added further details about the SoM and carrier to the commit
    messages

V1 -> V2:
  - Added copyright header and data sheet links
  - Removed non-existent property
  - Sorted alphabetically
  - Removed errant whitespace
  - Moved status to the end of each node
  - Removed pinctrl-names property from leds (indicated by CHECK_DTBS)
  - Removed delays from gmac with internal delay

Joseph Kogut (3):
  dt-bindings: arm: rockchip: Add Radxa CM5 IO board
  arm64: dts: rockchip: Add rk3588 based Radxa CM5
  arm64: dts: rockchip: Add support for CM5 IO carrier

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-radxa-cm5-io.dts     | 454 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-radxa-cm5.dtsi  | 156 ++++++
 4 files changed, 618 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi

-- 
2.49.0

