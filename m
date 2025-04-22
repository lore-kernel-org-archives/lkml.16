Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E950813BAF1;
	Tue, 22 Apr 2025 20:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353230; cv=none; b=hB9Cb43sOMQgEnO39+WybS1lcXlq9v6LzHfk/tRHefmP09scueafTR4HlDKIS8Ef3861JghRyh4bhE0n9aJStvLU6Lbc9hUIOjwIQ7HGCXZw4/+Fab7IhbE0+vOeAdKN1M186qBpmoX5VjR1a3nBReLPytsRgiV+p9saDh7T6ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353230; c=relaxed/simple;
	bh=c670OAK8cZdz7MarUyiLHa1dQF3aIkyIzYyzYke6glc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HX/8fLcRm+1ahbIMMUcCQ56LneJSUgEdoRgLpUBreAmLgonzdiMrOM6ezwt+xyQEDtnR+C7rai4JHYZelXd+EUW65SAvZcdDWGsaZNeO90c0MLC34pahsGZw8rr9C3F7k2kQOGIWlJJ1OB9u3jloXMBBS3JXvpNePV/tKsljsLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vdc4dsr2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vdc4dsr2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c14016868so5641883f8f.1;
        Tue, 22 Apr 2025 13:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745353227; x=1745958027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rO7p2Xz1WnscXWSSH5QPauUlR12Dd0rgVnR8sWH1ffU=;
        b=Vdc4dsr2wZF0pou8ZYyLawxMBAyDqoxenZeSEGO2x5tLNIoRVHw3OqzOHGcks1PSc2
         sl6AS33iHhBqSjNbvf5e5BgpfqCRCpCP3XhKuMGLwRBR4rwuN9gtJDK0SksrXPZquQDs
         LJJdP9EJWWD2xpUPQeONbU1+iiXUueyv2qTmLBVRYPlW9NIvRvBmAEIYeIwsDGTmir7p
         yoZgYReA2QOcgA55t1DArCFO8lUVWJpLVrqWupB/TtgYYpB+RAjwoLHLumNuHJdtlGYp
         G/pWC6lVcI9jL+G36XMBmq0sZSW0+nrBEjmi0rON2fLyvjKGoHgENujNv6x04AZY8g21
         12qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745353227; x=1745958027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rO7p2Xz1WnscXWSSH5QPauUlR12Dd0rgVnR8sWH1ffU=;
        b=DpgHkIqya6m8Fwph7pvlVem4SwcR1bWlXWK3E8HoWeh+a3CrLgQgpCyw+nz5AP283S
         hbc7J7L8a4TYJ7/HHv9L0NogRhHkbJjOJDzIfsj11odSiHJpmSwl34jYE5cZGhW2iflx
         e16cXE84la0YDWnnjMsvKTCBActZxqYDskUIKfo0D6fb7Eu7GbSBYAcx71B0lCatOhDA
         Xmeg42iX+zyT6lxxtYFEn/CbZS0aAl8xw4McOkoU1niYR4dxIYf3YPS1mdVGBz8OiMCg
         JQQUCYc576aEMYDWmPYsWcb63yJ7Cbwbar6RyUac+LB6zVHntFVXK2JYwnrYiBSjXB7u
         Ma3A==
X-Forwarded-Encrypted: i=1; AJvYcCUP/K3hq2o9PQ3xL/su2p4W8M00ua298O7veMRV0H37ZX4ppTlwdk3vuFKsB2nbu2HxUdAi1/F2LPr67x8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAuzu/zrzU6FVMKe82Gl4LhJXzm7Az1TAvQWY5OY19kkDdeaM9
	DYbIGXYjDIXLwq8stfU/qoooa1WtM6LLXgJcmpZdduu2QOJyPT5B
X-Gm-Gg: ASbGncvFbxRtsPbrkfI+44fnYkuq8RDP1PSyWEm71LqkdNRNx5Z6F7i+QBuRoEhFK7u
	SO54isBOxr0w01T8Mzu8w7DwMl5Q0TCsc0QyI3KfsFZmHr04TgPrIrZrLaLs9TRAJ7SzPD9WDNp
	DkWgETdNWRzNU70y2kPuY2OeiRehU2MFO8wx52FgL2ztD1/MgkPFJoME80tKXPDV8asY/JzMvgM
	fV2kRMiWMHiKSKKgcgUDcrQQ66/SBm8TVVNHPM3IK4N7BHv6m/gZnHNgcbD82og/GSbICKhvqx+
	OcZB0voDTq8GUFckmO+INfLZkR2/3HleizlIzL7X8W+GqQ8vTEH0cgA8HbPu6EAjRd3htLsqSIx
	hx5eIX9mRqVMIp+FWHpdKDXDrgw==
X-Google-Smtp-Source: AGHT+IGmBmm3C/2jLNoVcpiFNaVQBfRpos13JsgNqrg+d7vr+5IZSCkCD3uFqGqFACXb0v+yv5GQTA==
X-Received: by 2002:a05:6000:4029:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-39efba454demr12515857f8f.24.1745353226923;
        Tue, 22 Apr 2025 13:20:26 -0700 (PDT)
Received: from ?IPV6:2a02:8010:6606:0:c8cf:b8a9:b26:a03f? ([2a02:8010:6606:0:c8cf:b8a9:b26:a03f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bef1sm16008927f8f.49.2025.04.22.13.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 13:20:26 -0700 (PDT)
Message-ID: <1997854d-c501-493b-91d5-c3640137f7a6@gmail.com>
Date: Tue, 22 Apr 2025 21:20:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: rk3588-nanopc-t6: fix usb-c port
 functionality
To: John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 mjuszkiewicz@redhat.com, sebastian.reichel@collabora.com, jonas@kwiboo.se
References: <20250419023715.16811-1-inindev@gmail.com>
 <bda07179-1ff4-46e4-9dda-ece9c63fd613@gmail.com>
 <20250422000748.59664-1-inindev@gmail.com>
Content-Language: en-GB
From: Hugh Cole-Baker <sigmaris@gmail.com>
In-Reply-To: <20250422000748.59664-1-inindev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/04/2025 01:07, John Clark wrote:
> On Tue, Apr 22, 2025 at 00:12:02 +0100, Hugh Cole-Baker <sigmaris@gmail.com> wrote:
>> Hi John,
>>
>> On 19/04/2025 03:37, John Clark wrote:
>>> The USB-C port on the NanoPC-T6 was not providing VBUS (vbus5v0_typec
>>> regulator disabled, gpio-58 out lo) due to misconfiguration. The
>>> original setup with regulator-always-on and regulator-boot-on forced
>>> the port on, masking the issue, but removing these properties revealed
>>> that the fusb302 driver was not enabling the regulator dynamically.
>>>
>>> Signed-off-by: John Clark <inindev@gmail.com>
>>> ---
>>>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 21 ++++++++++---------
>>>  1 file changed, 11 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> index cecfb788bf9e..8f2bd30786d9 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> @@ -174,8 +174,6 @@ vbus5v0_typec: regulator-vbus5v0-typec {
>>>  		gpio = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
>>>  		pinctrl-names = "default";
>>>  		pinctrl-0 = <&typec5v_pwren>;
>>> -		regulator-always-on;
>>> -		regulator-boot-on;
>>>  		regulator-name = "vbus5v0_typec";
>>> @@ -465,24 +461,30 @@ regulator-state-mem {
>>>  &i2c6 {
>>> -	clock-frequency = <200000>;
>>>  	status = "okay";
>>>
>>> -	fusb302: typec-portc@22 {
>>> +	usbc0: usb-typec@22 {
>>>  		compatible = "fcs,fusb302";
>>>  		connector {
>>>  			compatible = "usb-c-connector";
>>>  			data-role = "dual";
>>>  			label = "USB-C";
>>> -			power-role = "source";
>>> +			/* fusb302 supports PD Rev 2.0 Ver 1.2 */
>>> +			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>;
>>> +			power-role = "dual";
>>> +			op-sink-microwatt = <1000000>;
>>> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
>>>  			source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
>>> +			try-power-role = "source";
>>> +			typec-power-opmode = "3.0A";
>>
>> According to the manufacturer wiki [1] "Power Output Capacity" table, the USB-C
>> port maximum output is 5V/2A. So I think "1.5A" would be a better value here.
>>
>> [1]: https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6
> 
> Hi Hugh,
> 
> Thank you for your feedback and for referencing the manufacturer’s wiki. To clarify, the line in question:
> 
> source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
> 
> was not modified in my patch. This value, which sets the USB-C port’s source capability to 5V/2A, is unchanged from the existing device tree.

source-pdos is OK, I was referring to the typec-power-opmode = "3.0A" line just
above where I commented. As I read it, that'd mean the board would advertise
via the CC pins that it could source 5V/3A when USB PD is not in use.
The wiki says it can only source up to 5V/2A.

br, Hugh

> 
> Furthermore, the schematic for the NanoPC-T6 and the vendor’s upstream Linux device tree (e.g., FriendlyARM’s kernel at https://github.com/friendlyarm/kernel-rockchip/blob/nanopi6-v6.1.y/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev01.dts#L346) also specify the source capability as 5V/2A. Given this consistency across the schematic and vendor sources, I believe 2A is an appropriate value for this configuration.
> 
> Please let me know if you have further concerns or suggestions!
> 
> Best regards,
> John Clark

