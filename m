Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1628920C016;
	Mon, 21 Apr 2025 23:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745277137; cv=none; b=EgpUhhtJm/22IbYEhGyeeYVBZ+dmbzgu+kh+qGPmPTu4wVB/IlWs0GOctiS9JrsdZuv3N5BsevZorg2Vv+7pC3ur1gOaLx9eUfvVacxcY9z8YstJy4UREqU2Z4RD+x3njZrMjT7A6CtIe1yDapEQgnfxi3vDGVC9vlnPfby6h0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745277137; c=relaxed/simple;
	bh=4Q9QOck4LEaT8mQGUHQrpRn2qWlOd028X/Rn3doSDD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeRQig+yhceb9SrVqviBjXoVFCd/9qUbRNB2EegyM/nt+URGsQBykVM3h29KnaKVUm1DunrnGORdtqDYXnWZtTWgaXYet+0CXKBqUoa/altDyBqdMNIsPiQIsXwe/Zc8vgUiG6cxXhTPFiPuvVh3pxYBPw2IuH7ug6ShCai1AK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faEGl61t; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faEGl61t"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22423adf751so45129575ad.2;
        Mon, 21 Apr 2025 16:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745277134; x=1745881934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7uD5qXzvc6aMulN+BeaNa7iatoiX4T3pgrjFm94VSk=;
        b=faEGl61t6YR+8dxQ6ZpO2NB8r0pkO4aYvSS/5iHfFOYg76yyOPJNwd5STJd0We9f4O
         ieXuipxRLJxUAMeU3/yY7F9TjOgFe1Dt2bo9Ina0Bky5CAps2wGLYJ2pXfOoNk9qLNw6
         O+VP2hHkzV2iT4Dn59FCeMrs4sFgWCZkT72v8R+MhlF5ktHpfzPGjtrUejVIvrJQ3ax/
         xhjnfyvpZm0e7dB+138johGyST5ZEv9IB7JFToyh93r4KG2GuAw0tXTXfWrnPku+lE1q
         e3bOxIVFPB+buTU3Q5nTo3+GcLail4cmVMvRWBP2VgKz9HUnZHdRFe34KZGL0qImj9PY
         X8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745277134; x=1745881934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7uD5qXzvc6aMulN+BeaNa7iatoiX4T3pgrjFm94VSk=;
        b=a8qrQYFY9+3+ZJpie7qkTgOWkasuV8WbkAVpuaRcyZWDS8DE8FdLx45Pjo6NsH/3m1
         DznE1fuWh9XsXwrjtiAP8vl/IlxSFsEgUX1v2wltzB6yP+rU3iZcUB7kQvc76khWSElV
         SiAPfdd0Us/Kkvwald2wVeR/WJbN/WWAfXDk7dsmEZs4K/0BDiPQK75d/AeOElTHIQ6G
         2BNiR+LwYP222P9xbM4OrBQ4LsszRgWw5VCezIjuSzjnzoHCmPaASpxb37UdqGBPA6cR
         IWhpU0YrLATU7P64Do1WolksC7LBzt9EFeGNQytnXAQEP7YX8iTFbb6dmPba7oj/90L8
         mqug==
X-Forwarded-Encrypted: i=1; AJvYcCVGY5b38zYKG73PM6pxJfrZPlWh8k6ND0TTlfO3E0BMVMO4cF4Y3myp87dws0DBO6ng+Q0KOKOq7Zbp8Xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaDMThqS8OKeJqhDKUwGg+a+XwER3a4btUzhWblPpQ0YiUKSvd
	8wfAihdFGK3Xmq1o4GndE/mZ27TquRWS6unVDhnW9vb3y449jFzj
X-Gm-Gg: ASbGncvP8kB2Sed002uLqppoMTxbZI/bkUpQ0Ohv7fEu0GWXPs8BPylSimNeNyvcI7n
	YD2J3jcXMLS9FFL3YUqhCNW4ElZ1gV86/DS87GFQ+myltD9sfAfRS6O2D152SGJ7V2uI5Lih8tB
	OInLVhyaV6oW2nj6uGNbXV8S2L/gvStTS7zT5ctPzZoTSXN78oz9j3v2SE1CBNrQ0eQWpDG+hjX
	SQEitnXSiT5P+fJh9AAHRn+lCBLk5bhOB8skrO3QbMcn1HN0WTeUy5gueoqXxHrVMdIEo9f06Nc
	Qye3xLF+nmnNysES6QKt2BwhKwAC75DnwyzpSCB7Bf146XJ11C3pbA==
X-Google-Smtp-Source: AGHT+IHT5fKKS1SMCd+Tj+8NxbOpVvUcbxkPakCnNVQ1oPl2cEDp8mNkaefvPYVXcT9AzKeGfB9Oyg==
X-Received: by 2002:a17:902:f706:b0:224:1c41:a4cd with SMTP id d9443c01a7336-22c5356dfbbmr179816285ad.3.1745277134121;
        Mon, 21 Apr 2025 16:12:14 -0700 (PDT)
Received: from ?IPV6:2a02:8010:6606:0:4561:1890:fe60:cec1? ([2a02:8010:6606:0:4561:1890:fe60:cec1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eceb74sm70766835ad.166.2025.04.21.16.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 16:12:13 -0700 (PDT)
Message-ID: <bda07179-1ff4-46e4-9dda-ece9c63fd613@gmail.com>
Date: Tue, 22 Apr 2025 00:12:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: rk3588-nanopc-t6: fix usb-c port
 functionality
Content-Language: en-GB
To: John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Marcin Juszkiewicz <mjuszkiewicz@redhat.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>
References: <20250419023715.16811-1-inindev@gmail.com>
From: Hugh Cole-Baker <sigmaris@gmail.com>
In-Reply-To: <20250419023715.16811-1-inindev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi John,

On 19/04/2025 03:37, John Clark wrote:
> The USB-C port on the NanoPC-T6 was not providing VBUS (vbus5v0_typec
> regulator disabled, gpio-58 out lo) due to misconfiguration. The
> original setup with regulator-always-on and regulator-boot-on forced
> the port on, masking the issue, but removing these properties revealed
> that the fusb302 driver was not enabling the regulator dynamically.
> 
> Changes:
> - Removed regulator-always-on and regulator-boot-on from vbus5v0_typec
>   and vbus5v0_usb to allow driver control.
> - Changed power-role from "source" to "dual" in the usb-c-connector
>   to support OTG functionality.
> - Add pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>; to the FUSB302MPX node
>   to specify USB Power Delivery (PD) Revision 2.0, Version 1.2,
>   ensuring the driver correctly advertises PD capabilities and
>   negotiates power roles (source/sink) per the FUSB302MPX’s supported
>   PD protocol.
> - Added op-sink-microwatt and sink-pdos for proper sink mode
>   configuration (1w min, 15w max).
> - Add typec-power-opmode = "3.0A"; to enable 3.0A (15W) fallback for
>   non-PD USB-C devices with the FUSB302MPX.
> - Set try-power-role to "source" to prioritize VBUS enablement.
> - Adjusted usb_host0_xhci dr_mode from "host" to "otg" and added
>   usb-role-switch for dual-role support.
> 
> Testing:
> - Verified VBUS (5V) delivery to a sink device (USB thumb drive).
> - Confirmed USB host mode with lsusb detecting connected devices.
> - Validated USB device mode with adb devices when connected to a PC.
> - Tested dual-role (OTG) functionality with try-power-role set to
>   "source" and "sink"; "source" prioritizes faster VBUS activation.
> - Validated functionality with a mobile device, including USB Power
>   Delivery, file transfer, USB tethering, MIDI, and image transfer.
> - Tested USB-C Ethernet adapter compatibility, ensuring proper
>   operation in host mode.
> - Tested USB-C hub compatibility, ensuring proper operation in host mode.
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 21 ++++++++++---------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> index cecfb788bf9e..8f2bd30786d9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> @@ -174,8 +174,6 @@ vbus5v0_typec: regulator-vbus5v0-typec {
>  		gpio = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&typec5v_pwren>;
> -		regulator-always-on;
> -		regulator-boot-on;
>  		regulator-name = "vbus5v0_typec";
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
> @@ -188,8 +186,6 @@ vbus5v0_usb: regulator-vbus5v0-usb {
>  		gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&usb5v_pwren>;
> -		regulator-always-on;
> -		regulator-boot-on;
>  		regulator-name = "vbus5v0_usb";
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
> @@ -465,24 +461,30 @@ regulator-state-mem {
>  };
>  
>  &i2c6 {
> -	clock-frequency = <200000>;
>  	status = "okay";
>  
> -	fusb302: typec-portc@22 {
> +	usbc0: usb-typec@22 {
>  		compatible = "fcs,fusb302";
>  		reg = <0x22>;
>  		interrupt-parent = <&gpio0>;
>  		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> -		pinctrl-0 = <&usbc0_int>;
>  		pinctrl-names = "default";
> +		pinctrl-0 = <&usbc0_int>;
>  		vbus-supply = <&vbus5v0_typec>;
> +		status = "okay";
>  
>  		connector {
>  			compatible = "usb-c-connector";
>  			data-role = "dual";
>  			label = "USB-C";
> -			power-role = "source";
> +			/* fusb302 supports PD Rev 2.0 Ver 1.2 */
> +			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>;
> +			power-role = "dual";
> +			op-sink-microwatt = <1000000>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
>  			source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
> +			try-power-role = "source";
> +			typec-power-opmode = "3.0A";

According to the manufacturer wiki [1] "Power Output Capacity" table, the USB-C
port maximum output is 5V/2A. So I think "1.5A" would be a better value here.

[1]: https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6

>  
>  			ports {
>  				#address-cells = <1>;
> @@ -1135,9 +1137,8 @@ &usb_host0_ohci {
>  };
>  
>  &usb_host0_xhci {
> -	dr_mode = "host";
> -	status = "okay";
>  	usb-role-switch;
> +	status = "okay";
>  
>  	port {
>  		usb_host0_xhci_drd_sw: endpoint {

br, Hugh
