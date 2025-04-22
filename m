Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38C1376;
	Tue, 22 Apr 2025 00:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745280478; cv=none; b=IXShSihH9ps/fnzf5anN0e2NJziLAdg+G92+MeBCNUzNabbuJdgGfSrFSC7NGAr2PhfaWwHRlHB3KHtiPAkOPtB9TBHCoJQw25TMxHJbQihyMwhIvv/P5O4ecth+q9clWqcC1hCqW+gcvc4MU0VkuTQMehDCPa7OPqYZ/Xy4I+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745280478; c=relaxed/simple;
	bh=2BLvXagvYikmLi9CDsCGDuJ7fhv0pFHO/AxxIdaKngo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AiJ5DgCXeoRWJTm2zPhnf7ydywGa1C9leHAn0uL9kF1U95HZYs6AaxKCbMMXkHSQnthuXHeTvoHqU+dnll0JLf9CoOe1AbdhlArmrcf52x0EudWL/hIJPmzeJ5PztKtt9V94XY45ZRbmvnKqg9TosTIxxwn5yhihvuKbD0DCXVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzG50OGr; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzG50OGr"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so55457436d6.0;
        Mon, 21 Apr 2025 17:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745280475; x=1745885275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8wLDV1hb56J4g1qGTPdYS2+5saoEpO4u3c0/B+uqvk=;
        b=VzG50OGrHS0O/tcICe9o0HHIaOJXQn2xKirIYeWPdU4mcWu7ml6kvGznuxp8YuiUKT
         Y5OjKnQdPDNSq7YXOD6ofwC00iLhVmF9nka5q43Ca1tNshLdBBMkoPjD2ZuVhP5mobAS
         k2+tYFX2oOzvCK96gRsMgbglr/FoPYqZbmL/vgxJv3HHtAlPuW7bulchTATmFCAcZWzq
         NXDqNNUSirSYTyUPRp4u3ydZb5tw/Ad0nL9XrVRMM2B1BQqi9GR+ggqGSeZjLVJat5i7
         M4uWkOZgXLqWp/a5ftFWIq1KzeRXvvtl6IE7O3FYTNzXrtHrc3xhiq43NX9AOHe4o50x
         cuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745280475; x=1745885275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8wLDV1hb56J4g1qGTPdYS2+5saoEpO4u3c0/B+uqvk=;
        b=EU6Pc6dsLN/2SmsXU1K0ALTVDQ2ypf5kTcz0SQM1ZhwtxK1bRM+sfsSzpodVORi769
         6kMyynMdqlLqvuuhvOEPYfouLV03BhURhP+REog5aXDYslWbUwNTqSzAJk7dhXoJtiTK
         XyyyPSsCl6IHVP/bB+c86BKoDJxkW7hbZDr+NvdzwduY593MiuRnYvPnfA0S0iQqHbeT
         7MjAjWeqdl26/bXccLzs0D9OM8aGS+VPXD3Tw6YfSTbeYwfJSiSgB0xelfLJmWuzrMjQ
         3sWZjFUrsDZJndoa2rmTJ4Utc2svYu7L503XGvFHG7y+iNx4Sifhpu59jBJcjMA+7cfW
         /4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjIa43PugOxDDDiwebBXx9v6rMqOeMM/Q4W9j0tDeGe/e34Q3u+vn+FIOotRl8OJ42A+q/NFODXpKpQ7c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpy3jdM04tJWqjBl/e4XsITASc2r7HBOV3KAXYyot3+ZpbN41h
	NJRPk2QNovMKuBK+5aTeesXiTOK99/OENd4YCyUe00TgUx2w8xZV
X-Gm-Gg: ASbGncunMc+ucW32qvNEIzI6SBs9RhwZJJ1lN/m1hF1OUrrWbFis9/TPjC1uChx12z1
	pY/gBnFC2Iml6CBuSuekefcDg4sTGqr55/ILLBCNBElXF8k8TFLma50s+gc5+L8bV3IddBEH/eL
	0UCsje+OmwfP+NbIaKz8ITPwBtShd9Y8t/+5K38sIsX02vpn1PltWU2nhHpVan1n1ETVyAl3SQP
	3XJZSmfUYNzvE9SvcHou+qspPhFTlJ9BwypK5TkgZlo4gBhWHd6aXGePsnNXoAG3N5NpJcr3Npr
	TQDTqqj4z6/Bzh4pjdATOa4eEGdcz9ZKTk/Axlh6et8C0U+Gs6a+
X-Google-Smtp-Source: AGHT+IFfDWwvneQduY1xpp0BmYEQ8b2EqMecuS/b3VvGJHRaIDr0uNIu9yTru25IprQs8WvetVgDkQ==
X-Received: by 2002:a05:6214:1c84:b0:6e2:383f:4acd with SMTP id 6a1803df08f44-6f2c4d8b11emr226098736d6.7.1745280475490;
        Mon, 21 Apr 2025 17:07:55 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0f11fsm50085206d6.39.2025.04.21.17.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 17:07:55 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: sigmaris@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	mjuszkiewicz@redhat.com,
	sebastian.reichel@collabora.com,
	jonas@kwiboo.se,
	John Clark <inindev@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: rk3588-nanopc-t6: fix usb-c port functionality
Date: Mon, 21 Apr 2025 20:07:48 -0400
Message-Id: <20250422000748.59664-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <bda07179-1ff4-46e4-9dda-ece9c63fd613@gmail.com>
References: <20250419023715.16811-1-inindev@gmail.com> <bda07179-1ff4-46e4-9dda-ece9c63fd613@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Apr 22, 2025 at 00:12:02 +0100, Hugh Cole-Baker <sigmaris@gmail.com> wrote:
> Hi John,
>
> On 19/04/2025 03:37, John Clark wrote:
>> The USB-C port on the NanoPC-T6 was not providing VBUS (vbus5v0_typec
>> regulator disabled, gpio-58 out lo) due to misconfiguration. The
>> original setup with regulator-always-on and regulator-boot-on forced
>> the port on, masking the issue, but removing these properties revealed
>> that the fusb302 driver was not enabling the regulator dynamically.
>>
>> Signed-off-by: John Clark <inindev@gmail.com>
>> ---
>>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 21 ++++++++++---------
>>  1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> index cecfb788bf9e..8f2bd30786d9 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> @@ -174,8 +174,6 @@ vbus5v0_typec: regulator-vbus5v0-typec {
>>  		gpio = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
>>  		pinctrl-names = "default";
>>  		pinctrl-0 = <&typec5v_pwren>;
>> -		regulator-always-on;
>> -		regulator-boot-on;
>>  		regulator-name = "vbus5v0_typec";
>> @@ -465,24 +461,30 @@ regulator-state-mem {
>>  &i2c6 {
>> -	clock-frequency = <200000>;
>>  	status = "okay";
>>
>> -	fusb302: typec-portc@22 {
>> +	usbc0: usb-typec@22 {
>>  		compatible = "fcs,fusb302";
>>  		connector {
>>  			compatible = "usb-c-connector";
>>  			data-role = "dual";
>>  			label = "USB-C";
>> -			power-role = "source";
>> +			/* fusb302 supports PD Rev 2.0 Ver 1.2 */
>> +			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>;
>> +			power-role = "dual";
>> +			op-sink-microwatt = <1000000>;
>> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
>>  			source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
>> +			try-power-role = "source";
>> +			typec-power-opmode = "3.0A";
>
> According to the manufacturer wiki [1] "Power Output Capacity" table, the USB-C
> port maximum output is 5V/2A. So I think "1.5A" would be a better value here.
>
> [1]: https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6

Hi Hugh,

Thank you for your feedback and for referencing the manufacturer’s wiki. To clarify, the line in question:

source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;

was not modified in my patch. This value, which sets the USB-C port’s source capability to 5V/2A, is unchanged from the existing device tree.

Furthermore, the schematic for the NanoPC-T6 and the vendor’s upstream Linux device tree (e.g., FriendlyARM’s kernel at https://github.com/friendlyarm/kernel-rockchip/blob/nanopi6-v6.1.y/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev01.dts#L346) also specify the source capability as 5V/2A. Given this consistency across the schematic and vendor sources, I believe 2A is an appropriate value for this configuration.

Please let me know if you have further concerns or suggestions!

Best regards,
John Clark
