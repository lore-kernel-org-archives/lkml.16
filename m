Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460123741;
	Thu,  5 Jun 2025 23:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749165149; cv=none; b=ZKqq7YT6dWhsR8CP9kuyZ3AX3BqxZC4/h/dabUYL3noBTRC3TfJ/EAYCFBkhBI41eyi9OsUmZ+b2u1MnJ3B13ZldZPrPrvvEXlk9bJ2/5OjaxGgwlC+6NgviVUVM3S5hlx1bqnjB0MX21qUfZsnh5Vu0atch60H9oGUBu8whd+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749165149; c=relaxed/simple;
	bh=DOUpTRPDpmQDH8ars2nmAVcSRBjhUX+m/IXQ62sGvgg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EgzsSB0akxk15VZAGgki9uKPZkyt+LHe06lyLzicFGdzX24FIxEcfZINYQ/kq3Y3+WJNhyLJlznEchW2kHa6KuZHjQVjvRThbT3Bj44lzLBA8umuvkPWbrjS5deZuM/FY8M4uByofWpwbexBAsvITL+NLTagvBGh3aPboOO7fT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0oB7aZf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0oB7aZf"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23508d30142so20973525ad.0;
        Thu, 05 Jun 2025 16:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749165147; x=1749769947; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gH9iE8xUuhmsM++nBGZb1sp3kMQiuQ+pxJGMgIYtR6c=;
        b=T0oB7aZfcxbpw7k3yaOl3r5vQmyFxoylsR7+32f1qpBlON0fHelAODL0mrV4jTk2pu
         LHZXiWDsRCeSmw1P5j1PefyTFE2F1yuY/T+YOVlXZQce5+uAD6OS6ITGhGB9LkrZlWKo
         B4OnvaObS3JHBRKKUJ0lpVyULwoJyNMjABSb3uTFDcbhkgY6YGKn5rILx5PCxyA8Fy7p
         ZqRqT2I7qF4OIv/wbOxeMo546gj7JJqtLcJmaqFZepxKUtlXOoEvQztgmdWOW6eE5T7t
         j/CtWUz7MMW9M1fvIU86KtV8xPD/T6LGlopwVSCNKOq1GpDwTKnWT2rb3bYqtxhh2JrD
         yu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749165147; x=1749769947;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gH9iE8xUuhmsM++nBGZb1sp3kMQiuQ+pxJGMgIYtR6c=;
        b=AbNa7BB9Idj2NQm/69jie2F0G2Gw4naINo2BbnT0HsRBUVKLTlnI0Mh9ItLh0dSGxY
         LGoH7grhUxY3bBnXGCvK9Of4zTs4tsU76s7MCA215OwituxUSGwvOAG7RsporF1IwuE9
         Z0YFtOkLmimdpUj60N3owNByL4mnDCobfX2xGsFkybkc2ges7Zm6+WYBtU4DnyZ0tQwL
         3h0+C4hwRgpXBekRcDWMx+32BX0661F9+gSWQ411KzCuWukQuO9p54G18xTMMtIrp66d
         6AMRpwCOJKx4loWgZH49EQiOxcQid3hi+YxM5YDCDZSgEfepg4B8vAxIVrvzQ9V5uqoU
         g3dA==
X-Forwarded-Encrypted: i=1; AJvYcCVSz+K5RW2pHgLoi+nncuXi9F5UnVPatH83e5uPjFI/OEmIaJc7ulir6XyM1sFAbZuVqAkuGRGLKODOTbw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+C3gXoMPyOqelsJNCtYIHJ2AWhIr4yGcTGwN52DZKLoI8BzTD
	92rpFC9xNORLKwrVT4igU0ACS/Q4id+5mgGmXibkibI0HhBznSG7sOD8D2v74SIu
X-Gm-Gg: ASbGncubRSo9+hPKgmm7IjBI+kwHM/tTHTD9ToMAmqtwamqtOvXsRynBxYFInCNpEIq
	jGmGvS9lCVLD334PmLWaWbykE+k3+6rF4mJsiRaV59GTvAulxnkRa4WN7fZ3PECSK8U7rS0YhO7
	nnryjzXG5PmNMGZFeU3m2iB3qGVeqp+g4PJgz1yLJ96lNUEYZm1ssbNtz8u+5sIixXAKIitdibU
	m1Nod0iN9/bE3SodqisxUHI81T7jpsfwwgaod5PIMZIiTzoogszU8B8FfE5VMMPFQBxscwdxPc5
	HU9u0rws5dXbV7i8IIHcE16IUkgRWsF6L4Bhi+1p7Ryil2VaVYg8HVE4mzphfw==
X-Google-Smtp-Source: AGHT+IEjxScSWalAxjVgNDznTRIAw0FLaD7GhhKVsHmV467GCZwy5/nzrKZqqBA5WDi5Nt+WQhlN5A==
X-Received: by 2002:a17:902:ce05:b0:235:ef67:b595 with SMTP id d9443c01a7336-23601d710bamr18195975ad.35.1749165147195;
        Thu, 05 Jun 2025 16:12:27 -0700 (PDT)
Received: from wash.local ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603097091sm1346175ad.69.2025.06.05.16.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 16:12:26 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH v4 0/3] Add Radxa CM5 module and IO board dts
Date: Thu, 05 Jun 2025 16:11:50 -0700
Message-Id: <20250605-rk3588s-cm5-io-dts-upstream-v4-0-8445db5ca6b0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYkQmgC/x3MSwqDQAwA0KtI1gbGT+roVcSFOJk2FD8ktggyd
 +/Q5du8G4xV2GAoblD+ism+ZbRlActr3p6MErKhdjW5hyPUd0PeGy4roewYTsPPYafyvGJsQ8W
 emr7rGPJwKEe5/vs4pfQDOf6pZG0AAAA=
X-Change-ID: 20250605-rk3588s-cm5-io-dts-upstream-f4d1e853977e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Joseph Kogut <joseph.kogut@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

This patch series adds initial device tree support for the Radxa CM5 SoM
and accompanying IO board.

For the latest revision, we noticed that the USB-C port wasn't working
properly on boot until an external power source was connected. This was
tracked down to try-power-role being incorrectly set to source instead
of sink. Setting it to sink also matches with the vendor kernel
configuration, and fixes USB-C.

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

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
Joseph Kogut (3):
      dt-bindings: arm: rockchip: Add Radxa CM5 IO board
      arm64: dts: rockchip: Add rk3588 based Radxa CM5
      arm64: dts: rockchip: Add support for CM5 IO carrier

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../boot/dts/rockchip/rk3588s-radxa-cm5-io.dts     | 454 +++++++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi | 156 +++++++
 4 files changed, 618 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250605-rk3588s-cm5-io-dts-upstream-f4d1e853977e

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

