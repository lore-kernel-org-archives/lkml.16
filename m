Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA82291880;
	Tue, 17 Jun 2025 22:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750198353; cv=none; b=cRsYhesvlbDGXX+02y3nJcDDjsFXx5Osff1MKJV8DTDnQ/DiQiXRAGYVKeyPHqRnm2/TNAF3ABcazS41dw9VDLQj91FwzmiiB5jrm6/V0LXtRW90SHhF/Uf/wsLkc9PpsKTPZ9/xwpp9hJe1XeYNZYksRnIbg10JIKpO7nnqhdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750198353; c=relaxed/simple;
	bh=EPmLUyNxBvduEf3hivuJ/ziJSJf45XkSAheFAsJmhFI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M7s3C2db7jv2Y4ok42iVpewXOqnjOUtZ6MweO4SDf3iffLeg2B+BA4XgA/zBhjRn4xbB+PtdsZVq0MWdrSje3BtHbGquyB+wFBeAOSpcpvmYxSM3S3OHK4qTaDVdLV2fjMzcodMAZKe08P3VdT62OE3Qh20KulvCXow+WI+MZtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVHPpoS1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVHPpoS1"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so5376484a91.3;
        Tue, 17 Jun 2025 15:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750198349; x=1750803149; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BKH4UrAHhOah9Nma21oGP9V2LUXoZwe3ujsfHTgLwZs=;
        b=iVHPpoS1B0VNU0wDkosUUOfvw0GsYQUWqr0zeAQSe6ruXT5qqOPHGd6UDv2Zy54CVr
         hOa+vANDc1emrS5n4XVEd8UEjdwU1O2g6A59We487IYjMhlRwGPkCdj5ekWryiN2Am0l
         rM9TWpCtZaiTe2Hb0+mWciJDQ4C2TQ7n75K92D2HmOFoG0WeSafCYX8I3Bhy2eMNvvy3
         bew1bvlaV9Dre2GEwcKaT45/0VrOOueu4zmoA9GT36czsRGD62R65OjeqPlHtbZgY0/N
         Om73RvPSDgel5nPUxvuUpSJxQNNj1CrAQ/cg1QQvjUX9zwjuXrhzvvj8UHAViOo3s6fY
         mWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750198349; x=1750803149;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKH4UrAHhOah9Nma21oGP9V2LUXoZwe3ujsfHTgLwZs=;
        b=OTknHWEngC+TsB2ef2e4e1tGxVVOC1fHEUEqseLPUZ2UMvulrbhdE7XnxkQ0wlXWYd
         nCf4CUaeTlc8r5wP/tcylylRTRZACth0afH0MZDOhZnJlrizvVHqtEuQuB2YeLu1JpBE
         F+YcPiJKDWoZ38KdmaGzpRGAaRDFkQtET2bafB6VsrnjLRD9pcpuZIEDJatMnDEV8t1q
         5MNUMaQEjzLPfCUJsNaRPDgkzkgjW+pf1ACo4VYQmO8z/NKXDWxDuvq+S28uzvJQBaRe
         qllWSZcgJXDLc/wb5ZwjLdvyRubIJ6GkaLJXIAX4hIwAkhjaj9LHUga3gsYYvJJCEVWi
         nBcw==
X-Forwarded-Encrypted: i=1; AJvYcCWf4WALjAajTVWCuG///c014Kl/TM1O4JUbAOWSPYwAtc8LqDasiAfOaUpFGupW5Cf8wAa0sBiWCxTGEMBa@vger.kernel.org, AJvYcCX+aqrZsNKN53Iwfvebp8TqW5DY2Q8Dkl1AH8QxubuOC6wnTENwKh9Tg4hG+Poy2wweQcPMCWuujnlb@vger.kernel.org
X-Gm-Message-State: AOJu0YxIWTkVYgms6fNVuQatEVg223FModnK7pYHrloX4YGfzzT84Bgt
	hk9mkiOHBZUZlWSXTA3Tl9HxUFrycQ0PDa0v6OWfju/sguUPyuA+4pCt
X-Gm-Gg: ASbGnct/sxpyTSYhN3zwWgtcDBuJmeHJ6jXC4GiVVrm3VWFJqeygVtHLLaq9kKtrpvy
	Gv8X7IW1XAcqIK4EmmZ25vkH2sxgtuO/d1+1/pzVCkBOQK8cjX1FanQHGqMXuG/5RjJd9UugMsg
	yoy6EvHy1lzFd93FpWye0tuA/2ubrHsLV2/R8DkMcQUBifvkPuMPs/olfGFoG4Ip68ZaDI754kn
	hq+q7mg8Ma+iLIdHqzfR/Iu4p1drq5UYT2QN50C/vg6UAeSIUBOtl5aDqPq5XUx5y+HsKzEh0ZL
	ZqomNBqXm7+QPSXZiwvxbuWwBKk/s1+P16De7ehwTWjImD7k/9cSVIOorTAZLQ==
X-Google-Smtp-Source: AGHT+IHfxEMFqwig695MprualdP+GZmtfO5tuTvZ8Lq8VdsfGlpR2m4blSerjMAnZ+9WZVEN6I2sKg==
X-Received: by 2002:a17:90b:3d0a:b0:312:18e:d930 with SMTP id 98e67ed59e1d1-313f1d4e217mr20021387a91.19.1750198348900;
        Tue, 17 Jun 2025 15:12:28 -0700 (PDT)
Received: from wash.local ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781c7sm85862635ad.128.2025.06.17.15.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:12:28 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH v5 0/3] Add Radxa CM5 module and IO board dts
Date: Tue, 17 Jun 2025 15:11:58 -0700
Message-Id: <20250617-rk3588s-cm5-io-dts-upstream-v5-0-8d96854a5bbd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC7oUWgC/43NQQ6CMBCF4auYrh1ToQPVlfcwLEo7wERLSYtEQ
 7i7lRO4/N7if6tIFJmSuB5WEWnhxGHMwONB2MGMPQG7bFHIAmUlEeKjRK0TWI/AAdyc4DWlOZL
 x0Cl3Jo3lpa5J5MIUqeP3Xr832QOnOcTPfrao3/pfd1EgQSuFrkVrqlbeem/4ebLBi2bbti8cs
 FMoxgAAAA==
X-Change-ID: 20250605-rk3588s-cm5-io-dts-upstream-f4d1e853977e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jimmy Hon <honyuenkwun@gmail.com>
Cc: Steve deRosier <derosier@cal-sierra.com>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

This patch series adds initial device tree support for the Radxa CM5 SoM
and accompanying IO board.

V4 -> V5:
  Patch (2/3), per Jimmy:
  - Alias eMMC to mmc0
  - Remove unused sdio alias
  - Move gmac, hdmi0 nodes to carrier board dts

  Patch (3/3), per Jimmy:
  - Enable hdmi0_sound and i2s5_8ch
  - Remove redundant enablement of sdhci
  - Enable usb_host2_xhci

  - Tested HDMI audio

V3 -> V4:
  - Fixed XHCI initialization bug by changing try-power-role from source
    to sink

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

- Link to v4: https://lore.kernel.org/r/20250605-rk3588s-cm5-io-dts-upstream-v4-0-8445db5ca6b0@gmail.com

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
Joseph Kogut (3):
      dt-bindings: arm: rockchip: Add Radxa CM5 IO board
      arm64: dts: rockchip: Add rk3588 based Radxa CM5
      arm64: dts: rockchip: Add support for CM5 IO carrier

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../boot/dts/rockchip/rk3588s-radxa-cm5-io.dts     | 486 +++++++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi | 135 ++++++
 4 files changed, 629 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250605-rk3588s-cm5-io-dts-upstream-f4d1e853977e

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

