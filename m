Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDA11DEFC6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826078; cv=none; b=d0G7aWqpfAqH8a75CGjIcLhmGcPm84Av3W/Psmcn7lPX+LcGeYUHiETFOTDdTzjeuRiFEDWoKpAWCZe/SK0fp8rrXo9MDRZ0GZKaQMueRZ1xCK8rxV3KZDWvRuKiLqhEK1fmRBvCp3KBlce9lUG3XRJ+zsVr7slAjfO6wHpMSNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826078; c=relaxed/simple;
	bh=2ur59+1ubAVC1jOBmnnt5jTjvdpj5sgc0TtVhaeTRJY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=faI/0Zdm0R20MyMcx0Z3aZ+/Q1ev12HfJC7pviTuY5bAObCo1+zjjD/Ip/mPDdEVmzZBKw5g7AUEv2RJjXaDRk7hkDgFv6KWE7F+Ak/Rl+fO5PWe4pMdU3z9TAbPKawwT/BoG52cUa9NpFN9KsTVJWJlOX56IvjnUOEtkDGHEY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lSnwrpxw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lSnwrpxw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so42168555e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745826073; x=1746430873; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sn84KksoLA1XCM8eFqMm/ZJrcGihzBHVRs4q9bxH1gc=;
        b=lSnwrpxwjy2NBzimuYQPFOZGww1ajOJ9WiCeGo1prTQzG5rqlWrCKN7YEHMc/PUPN5
         9BoOyHoun4tWk6ipO+lc30w+j62Z9+rvUYtAZ0prpvDs111a1bRBvr98vKRvWY+egljL
         Oqb5V29FbrVuLklL8YFQ5nfYXOhaa3v9lcX5mz+fC2/XBwDeqa5CfkjghFzqhe6rbNoU
         dNisSD3Py9wiN1JVwFrUwpIF1F1iqZloJWMKtCJ7uy9SEZIF1Ocw9M4CfUc5Ux1TLKcO
         7qHxfqaJ5G7egKvPRzsNBCrqiw1LQL4Qoj1Iy1hCDMzF/ZSesWupW/jMvmcDWySOa9KD
         AWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826073; x=1746430873;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sn84KksoLA1XCM8eFqMm/ZJrcGihzBHVRs4q9bxH1gc=;
        b=jSAQrWrwq6tCZRVWkh8144xS9PFRme/A9+WovajplBqHTphrh4kcO3J9xhPhOkm06t
         oewXdW90eqc3EBZdhxdl4+fRYq1nS8RtrP68rOUeCkhY7AQmoMMpnEHhdQcAyT9vBpqg
         WTrtQIbwhQOr3qWWccxScxaWeYYLmfnm5wI9rpDKWGMbEw9ZVGLb6RwoLcFlM+aJByhm
         ZhZ0AAdPcX1S+Ra0eFJGmlWtvewstsVlPkjP7aPwBzC2qgBLREeelKoW+Hug6YUtZj9G
         oTICwnY+L7o5R+KL1AUOEcSbxWVbbUtU9y+Q0O8uEurPdkFr7dTb7hmOisE1P1PkazeC
         MO8A==
X-Forwarded-Encrypted: i=1; AJvYcCVlN6oH5xwI25eq2fO/Fx0FIG3ABRSenY9smARzYsyghzcwQ4nfKypWG6E9YCxoeCnqzsxmZz6/I2B0TQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUhcgEmNJ96X7J0qsPdtW9m8yg9vgxhq95XQkqc2Ek1lG1y8l5
	xiQyrnEB3se1yeYUHsoj1zdTn4jUvGZcymc5/YRNB4TL+0p7KQKG7bqN5bz9Z4U=
X-Gm-Gg: ASbGnctfQ/AisdK27gRJjnTtHvNuB+9n/h6hJHge9PLevK5lY/oQH0IyC4GzxFJnXc6
	pXBYeKPff/nxV7ohYelJpkKobaKSeQNrbBKsvblSP4l0HHuO8srBCol++yJ7TPWUX6kkRoVOxHa
	SWYahf0ugbUZfLkGStEnZalmSJ9A2SaEcoIlLxFvJfIiTNDCL0+FC27X38ZEH94r+Y/Ap5YVcXZ
	6expVMVVb3NPVmhFEZRI50cuVZlCwvMSqhVrH8ZHnUqpGnsSjFxkB1sMSQW3DUSWg1C/F8If68F
	f1uuwA5ywyZWytGeB7QaAltO5zbzdJrPY0xEHm0=
X-Google-Smtp-Source: AGHT+IGL44vW5/A++LXsZvrcU+Vla8hGWRBCR3n4mujmGHag6lTr8K8jbX9VXFTAyePxtqUQY98O/g==
X-Received: by 2002:a05:600c:3b0d:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-440a669994dmr78600255e9.21.1745826073423;
        Mon, 28 Apr 2025 00:41:13 -0700 (PDT)
Received: from localhost ([41.66.99.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8d495sm10072538f8f.2.2025.04.28.00.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Apr 2025 09:41:10 +0200
Message-Id: <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Felipe Balbi" <balbi@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Wesley Cheng" <quic_wcheng@quicinc.com>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
 <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>
In-Reply-To: <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>

On Fri Apr 25, 2025 at 11:06 PM CEST, Konrad Dybcio wrote:
> On 4/25/25 12:44 PM, Luca Weiss wrote:
>> Enable USB audio offloading which allows to play audio via a USB-C
>> headset with lower power consumption and enabling some other features.
>>=20
>> This can be used like the following:
>>=20
>>   $ amixer -c0 cset name=3D'USB_RX Audio Mixer MultiMedia1' On
>>   $ aplay --device=3Dplughw:0,0 test.wav
>>=20
>> Compared to regular playback to the USB sound card no interrupts should
>> appear on the xhci-hcd interrupts during playback, instead the ADSP will
>> be handling the playback.
>
> "should" isn't very optimistic - I assume this works for you? >=20

Yes it does!

With 'should' I meant to describe the expected behavior from using this
since most people are probably not familiar with how this works.

>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
> [...]
>
>> +&sound {
>> +	compatible =3D "fairphone,fp4-sndcard";
>> +	model =3D "Fairphone 4";
>> +
>> +	mm1-dai-link {
>> +		link-name =3D "MultiMedia1";
>> +
>> +		cpu {
>> +			sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
>> +		};
>> +	};
>> +
>> +	usb-dai-link {
>> +		link-name =3D "USB Playback";
>> +
>> +		cpu {
>> +			sound-dai =3D <&q6afedai USB_RX>;
>> +		};
>> +
>> +		codec {
>> +			sound-dai =3D <&q6usbdai USB_RX>;
>> +		};
>
> 'co'dec < 'cp'u> +

Aah, I thought I checked for that already. Will fix.

>> +		platform {
>> +			sound-dai =3D <&q6routing>;
>> +		};
>> +	};
>> +};
>> +
>>  &tlmm {
>>  	gpio-reserved-ranges =3D <13 4>, <56 2>;
>> =20
>> @@ -1178,6 +1214,7 @@ &usb_1 {
>>  &usb_1_dwc3 {
>>  	maximum-speed =3D "super-speed";
>>  	dr_mode =3D "otg";
>> +	num-hc-interrupters =3D /bits/ 16 <3>;
> Where does this number come from?

I'm honestly not 100% sure. As far as I understand it, with
'qcom,usb-audio-intr-idx =3D /bits/ 16 <2>;' in the qcom,q6usb node (which
I've checked against downstream) we declare which "XHCI interrupter
number to use". Without the num-hc-interrupters property we get an error
that not enough interrupters are available (I assume only 1 is then), so
this value practically needs to be higher than the <2> from earlier.

Why it's this value and not a higher value e.g. 4 I'm not really sure.
Downstream code looks somewhat different and "max_interrupters" in
drivers/usb/ doesn't come from a dt property. I'd need to check more in
details what this code does - or maybe Wesley can help.

Regards
Luca

>
> Konrad

