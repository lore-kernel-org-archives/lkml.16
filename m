Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5181128A1CF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594333; cv=none; b=jPzjNV5pEifY3pp+kQAYzys7QQLbxBoItFXt3tORDtTSG8u1eCVC37pDUZrpPWqKtfKNJysZbm1lUDlZL8w5E8HQglXupKDUeO3A+V+VkU/JzZkhWko0CTccXignZM9Wzit4rD6rm0R4CM+9T5eOqW6qS7KPNSxtkmMWF91UC3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594333; c=relaxed/simple;
	bh=+VP43HO49IhC31BTb9rVuWFjBWT9hUxO1g+j9KnNrtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZkIGkp5nE1yCXxwgEXp2x24q+dpWMKu75Bh8PbW2G+hmhk5r7dOEezkcwaFl1o7QlOQGLnqiMYVXXXAO01/CQ5GCh3yKxlRlIr1kgwxRU12z+215q1wetUUXyTg20dy/s61ZR4n0h4V0etbv78QJAEJcdLuvB2bwRFI8eAzyck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com; spf=pass smtp.mailfrom=thaumatec.com; dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b=zKYjGXSV; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thaumatec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="zKYjGXSV"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso6170684a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1745594329; x=1746199129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow+UI0NPOq4F4k1XRdbs16ucXtgoo6yarOk2Eu1UB88=;
        b=zKYjGXSVsI2NLbQn1nXn3wmdAQwYoEMSMNGAkxao3Ju/Fd4xi26KP7KLhRP1WIqjiP
         Rs7J8UiQ2rC7Sm79meapRNs6ayVZqgaeiHf0mHH058ykIQcvbhEuAHeImZUYiitX3pLm
         x4xShFbUWr2lGFq2fGaJTIalVxMxmHTHHy3EW+I/bID6gUOC9VOfYFnkTjqBIxrU6JVl
         xs9Y1XnJatZg3rT2QwieWHkIGriHSOgeQg+IgjND91hrnuaCUyet0V5OyZORxTMBv/sd
         0AkyDTk18BADictzlragABu8ckNJQjW+fkFYrzj0Mc9zJrPwsj2nuXnqymq0THY9nCBp
         4FeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594329; x=1746199129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ow+UI0NPOq4F4k1XRdbs16ucXtgoo6yarOk2Eu1UB88=;
        b=TWD4fCA0ks9MxmRv5cI6LDEGf9/TYtG1CXnDRhy7mjgacm5evvTcL/RGikqWo5/Bmp
         8y9KnhkxKW6NrjTohNTS+D0cVY5KKrNh2SRe9p0p4DoSgk38b5Fr3z3Y2aIa6dlPbaF1
         tImFfSO+BciKIlMI66naaWzHvK1Q+VB3FeSYYd/DibCJpMAwaKvku1c5yo/j6xEvdqHo
         7977rJ890jqfQN/SDx4C/CNGxr9gbaaEl3Uss7otHbE0QDADNMZjCgVfMmY/vNAeEyrC
         SpuKwSRuS4OPhOh9cKmf/BZwdEdzKt6R6KEJoFS0zWSBQlepcV2KvQBiWVxgzZk82ZUI
         isDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkuOs7hZlwk/UeyQoGH39gUZkb9iZDOQstlYoac34u5QPrlkO2h6N7xPoujOqDa3Mxe9h+tDsP4IUvuLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfYwTrKXuNNaORzBMp2VZKYNE8WEVSyeFUFVpMJXcGOHAIF3mI
	B4fW6pmWBMTj4tAvvU50AOOd/O6l54v1qpjKSunwFHweebxl5KiqKXGjanK/MTE=
X-Gm-Gg: ASbGncvO9P9MvAvflUjgyAAtaSEDTsuAAvpotX3KZxTn4olfzmPHsbhwRHDfM8MJ8mf
	nEhuUuWOPPLKa9crIneqYrglatpKxFUn9VWoKW/w9NT6oxyDiEVZFjn42zdTYqD8Bsb3D/rN8TX
	UIL62gZybvEcnAHXLkm+JjraPgKoaHHr5nRYhwLK4Ns6R2ytNxCfzaFUMGCvECC0yqzSlLNbh52
	IsrbzbKSYNhyF3Wx/QlZa4U84gk4IZK6h26+Y2OHxoFGiyBaqES4lhqoOBMN2WyBN9hqzhH6/Gp
	k4NXKBR6i++lRVi9KQfVfWT6o8X5w9AgWT4bb/7TmfzUrtil6XMCZLrgLQ==
X-Google-Smtp-Source: AGHT+IHLD6XdK+4P1TnWS4a50TCqQBANW7xBQ8lr6hgbyOsYBCK2P26JRQZuJdTwivbVOS6RTnoM6A==
X-Received: by 2002:a17:907:3f0d:b0:ac8:1bbe:1a5b with SMTP id a640c23a62f3a-ace5a27b983mr482588066b.9.1745594329437;
        Fri, 25 Apr 2025 08:18:49 -0700 (PDT)
Received: from [127.0.1.1] ([185.164.142.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm151099766b.85.2025.04.25.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:18:48 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Fri, 25 Apr 2025 17:18:09 +0200
Subject: [PATCH v2 4/5] arm64: dts: rockchip: disable unrouted USB
 controllers and PHY on RK3399 Puma
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-onboard_usb_dev-v2-4-4a76a474a010@thaumatec.com>
References: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
In-Reply-To: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2

From: Quentin Schulz <quentin.schulz@cherry.de>

The u2phy1_host port is the part of the USB PHY1 (namely the
HOST1_DP/DM lanes) which routes directly to the USB2.0 HOST
controller[1]. The other lanes of the PHY are routed to the USB3.0 OTG
controller (dwc3), which we do use.

The HOST1_DP/DM lanes aren't routed on RK3399 Puma so let's simply
disable the USB2.0 controllers and associated part in USB2.0 PHY.

No intended functional change.

[1] https://rockchip.fr/Rockchip%20RK3399%20TRM%20V1.3%20Part2.pdf
    Chapter 2 USB2.0 PHY
Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index dd5a9bca26d1d221607e73071685d5774330d760..5c1162e2f34f9c9786da1f774dffa71adda23dbc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -579,10 +579,6 @@ &u2phy1 {
 	u2phy1_otg: otg-port {
 		status = "okay";
 	};
-
-	u2phy1_host: host-port {
-		status = "okay";
-	};
 };
 
 &usbdrd3_1 {
@@ -616,11 +612,3 @@ hub_3_0: hub@2 {
 		vdd2-supply = <&vcc3v3_sys>;
 	};
 };
-
-&usb_host1_ehci {
-	status = "okay";
-};
-
-&usb_host1_ohci {
-	status = "okay";
-};

-- 
2.43.0

