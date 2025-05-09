Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC920A5E5
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775917; cv=none; b=bepj+QjZwKhepEUrtEgeBNMdL13/iPHoyustOwoOqgm6v1LEr2G/SzbH4jGE6Hbq0AjS2ADGtWYKx0sks5sj3iNa/NNIvj4J6Pt/hLLIcOV+7TkBoCsyYlPTmTDKMYoqM5/NpYVIQ7JTS4a0P327kl+i1mqCV7TKZWEvtqxC7dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775917; c=relaxed/simple;
	bh=IYpWmw9D1wZ91hkZi5sTi8f4M3xDQe0S28DvEhKqlT4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=WYnnhtZYhB23gXN+lrU8udfx7KWbeqrNW32M0uTjCItIgWkZ1lR0vje166jQNSPZs58cpx6tO8DTdbOrBqoBadZTjANmlxwDn2GD7iLAPqSBlL9rc0qhVBAz881AV46kqpkd9tG0IVvTBItmUXFPJLRbA7gKq/GPevRInWul1V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YuEmT79N; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YuEmT79N"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2c663a3daso349434566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746775911; x=1747380711; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tNm4dzYjL0hNtY0TgZJ2Uq8YBkIqeHB8LTvt0QE8KZw=;
        b=YuEmT79Nr2UDQR9mwjKxzHBAa3TVSs3/9Tw/sXtYdwX7FEdLLMIyff3Ov75o/8xYP2
         88oIfmXOr3ok2a/JF6HBdOTWHpT3gVL7Jr2fDyilIjfSy1pLQREkvtxzOMT0i29n5FJN
         B3wkmHCYhxH5ldUdHxRx9rbZG3J7Id1w01Sa1VIPYefEXzXCZI0grmEjsLmzZ5YUh5wH
         yM4uYEosWeIrxYmFANaX+zl7sKq1AmDZI/2mvs1cyk07OAOkHzLuhBjvyaKGnPQ7OgHj
         RLlceDexBFEaMNqn+5JDZ0gTy4xlshaKoVjd5QxcgLuqxiZ7NXkbwwyrubGqHD905mJ7
         QDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746775911; x=1747380711;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNm4dzYjL0hNtY0TgZJ2Uq8YBkIqeHB8LTvt0QE8KZw=;
        b=VKhqWGwEvAXRXw39GKqZf03j/RPwT1oAfu9rf+VraSMVcQTDwO5MPwNS/e45/2LbI3
         e2EbQRAyY1mgSOGGWTFKTq2jIiwOuoQIu19DrF4MHhGQ/54wHuwUrA3h1E1kD/623aAz
         RsDa8HyufQ9zoLPmHP00n/zmD+KHzbU+245hji5Rxgh5LMOCaDAtfNJS75lgDi/dzO83
         wZ+tQKr7SZxNGMdIJOkTWCNRoSy3TSb0GBMgHivhfjSlCg2G4mJn6g3+lttitys85lXr
         x1viTNBPo09I9S9eqgY4ZIWyP/gPnc5LyBuWdqE8RHqjed9GcgaI0Gnx4BVzOLILw3Mz
         7fow==
X-Forwarded-Encrypted: i=1; AJvYcCV6oC6mJh2RQNJCE8ajd+KpTawfustVtS/D3GeNcAsdTwwxlH1ZV0zBKtuEYp+fxfcdzoEc8pux0mEf+6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT1h9pYnT+q+3f/ybdl4YbTqAvpwhr7dZqLlGXWYiHVFXhxKzc
	Xc8pi2vSr1T7HvXF4SkV1CNO0MANWDSCtKwvhkA0BtUSVf49sP7pI1ChmifDRl8=
X-Gm-Gg: ASbGncuQL0+SqlN1xbbZG2I9rfhj+KLJsK7RvRc9iVDr4O3C2ieq8szZ8EdfxQIyWm5
	SHYc1UwrnI1v2m3MvCR5Mt+XDPwvSGt24pW8SuK0Iwjn0FUKpljGjNkzro2togcDgSGeiQsqhe2
	FLyyEjgm+Z8PW6rWPIx8f9nZ2DZpnY5Xt9OqWE10jiN9iDtxg8hearKttUyyU/QQtwq5TLwJFv7
	HjrNxvh5XuunqPR7z0nkKLWyZ46tNQioGYZLAR4G68WVjaXq8Jb8J1dmkffrH88W/z8zqaR55HQ
	b8C2AJN/gQ+vcRnIm2cAfpcVDI+gxy9ioFnObPlNDwitUg==
X-Google-Smtp-Source: AGHT+IEBRTCI9kTr2GaMmpOwf42xSL7WvOji9iBJAETgoGhwFplwSkmVArxI7pFy/yaqzpELkNP5Hg==
X-Received: by 2002:a17:906:4796:b0:ad1:e672:271f with SMTP id a640c23a62f3a-ad218f4ca71mr253684166b.18.1746775911001;
        Fri, 09 May 2025 00:31:51 -0700 (PDT)
Received: from localhost ([2001:4090:a244:802a:8179:d45a:7862:147])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad219855beasm107999666b.171.2025.05.09.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=06cfbbe9f92dcc8b1f71cc9bc0c83b1518c968538f5e87fe30c24b0e071e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 09:31:39 +0200
Message-Id: <D9RGDM0LGOTW.2X74PNAIA5N3F@baylibre.com>
Subject: Re: [PATCH 6/7] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Vishal Mahaveer" <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin
 Francis" <sebin.francis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>
X-Mailer: aerc 0.20.1
References: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com> <20250421-topic-am62-dt-partialio-v6-15-v1-6-6ced30aafddb@baylibre.com> <d4f21cdc-bb0c-4c78-aeea-f6e5c75fa5f1@ti.com>
In-Reply-To: <d4f21cdc-bb0c-4c78-aeea-f6e5c75fa5f1@ti.com>

--06cfbbe9f92dcc8b1f71cc9bc0c83b1518c968538f5e87fe30c24b0e071e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed May 7, 2025 at 6:56 PM CEST, Kendall Willis wrote:
> On 4/21/25 03:14, Markus Schneider-Pargmann wrote:
>> The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
>> powered during Partial-IO and IO+DDR and are capable of waking up the
>> system in these states. Specify the states in which these units can do a
>> wakeup on this board.
>>=20
>> Note that the UARTs are not capable of wakeup in Partial-IO because of
>> of a UART mux on the board not being powered during Partial-IO.
>>=20
>> Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
>> Partial-IO. Add these as wakeup pinctrl entries for both devices.
>>=20
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 76 +++++++++++++++++++++++++=
++++++++
>>   1 file changed, 76 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/d=
ts/ti/k3-am62a7-sk.dts
>> index 1c9d95696c839a51b607839abb9429a8de6fa620..724d9a6f3c575fe35496fdd9=
e17d6d8e33869f92 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -741,3 +741,79 @@ dpi1_out: endpoint {
>>   		};
>>   	};
>>   };
>> +
>> +&mcu_mcan0 {
>> +	pinctrl-names =3D "default", "wakeup";
>> +	pinctrl-0 =3D <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_defaul=
t>;
>> +	pinctrl-1 =3D <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup=
>;
>> +	wakeup-source =3D <&system_partial_io>,
>> +			<&system_io_ddr>,
>> +			<&system_deep_sleep>,
>> +			<&system_mcu_only>,
>> +			<&system_standby>;
>> +	status =3D "okay";
>> +};
>> +
>> +&mcu_mcan1 {
>> +	pinctrl-names =3D "default", "wakeup";
>> +	pinctrl-0 =3D <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_defaul=
t>;
>> +	pinctrl-1 =3D <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup=
>;
>> +	wakeup-source =3D <&system_partial_io>,
>> +			<&system_io_ddr>,
>> +			<&system_deep_sleep>,
>> +			<&system_mcu_only>,
>> +			<&system_standby>;
>> +	status =3D "okay";
>> +};
>> +
>> +&mcu_uart0 {
>> +	wakeup-source =3D <&system_io_ddr>,
>> +			<&system_deep_sleep>,
>> +			<&system_mcu_only>,
>> +			<&system_standby>;
>> +};
>> +
>> +&wkup_uart0 {
>> +	wakeup-source =3D <&system_io_ddr>,
>> +			<&system_deep_sleep>,
>> +			<&system_mcu_only>,
>> +			<&system_standby>;
>> +};
> Hi Markus,
>
> I noticed wkup_uart0 is already referenced earlier in the dts. Could the=
=20
> wakeup-source property be added into the first reference?
>> +
>> +&mcu_pmx0 {
> Same thing with mcu_pmx0. Is there a reason for separating it from when=
=20
> it was referenced originally?
>> +	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x038, PIN_INPUT | WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x040, PIN_INPUT | WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
>> +		>;
>> +	};
>> +};Additionally, this patch does not apply cleanly to linux-next and nee=
ds=20
> to be fixed and rebased.

Thank you, I will fix your points and rebase once the dt-schema
idle-state-name question is resolved.

Best
Markus

--06cfbbe9f92dcc8b1f71cc9bc0c83b1518c968538f5e87fe30c24b0e071e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaB2vXREcbXNwQGJheWxp
YnJlLmNvbQAKCRCFwVZpkBVKU+IQAP4nYmMI1mFLobgy/oXSnCX2D+tGGACd+6+h
bR5vzYUiagD8CelMTAx7Q4zlt086hjOX+Nk+R4ub5YtvyvU/1iO8rAc=
=Do60
-----END PGP SIGNATURE-----

--06cfbbe9f92dcc8b1f71cc9bc0c83b1518c968538f5e87fe30c24b0e071e--
