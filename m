Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E3F1DF26B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940024; cv=none; b=Cw1+iRz4I7t9NEFsFebSDh5jWWBQM6I75BIg/s9sdeNrtJ7hw0APRAAgFOM5R2YS4hU21AhSM9fyhUSNq7PYQiTXMjb17WcnLtGQvQWK+2VT/wnJlUtmkcRo6OH5lpeLqBbIerg4gYHSyIRa/DG2i84OgRUCGAt2KAe5HgkHAAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940024; c=relaxed/simple;
	bh=Eu2HcWA+aiYLO3NyXIZi/n8WZASZoNLIVISYYmVLfhw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DKM9QSJ5mBKaGt//Akl+zAEQRLyBWPzXw5BgM4PM6n0rrkxQYOrw1/rEFoPMdloYnCAS7NS7yUsj7X+/YdeYc4TDt19C3XmoIv34Z3NaXplEDlP0KRzHMotXb2W7aACJNFyLOT+2Hec2nutM/JrQTRFVlgbN1vgjQT+W6AngL28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=BoIzuC8V; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="BoIzuC8V"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c7913bab2cso842781585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747940022; x=1748544822; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EB9YLdrTTEzpsGMLMd/YlkLlxPbz4lYAAaOaN9yn4eU=;
        b=BoIzuC8VKbkfPfldNunMdqJZelkOPxroIPR9hJJfKDJajYFsUyf0BfFufbO046SzGm
         OhP/pE31v0POwA69mG9rmL+Cfql3ZBKKuHbHWuSz7OsVz3j/uNfdQtskxJ4STDq0bYGr
         Tqpp55vKgw3Ha6Uf+AoMJ81WaB4hUrHn1Lc68t9tPUAnrbLeEzWYaoclI9zQT9aqXjuV
         gKUDKdB99+3gb73bgaS3TbD05Qk1Qowcg5KkTXplCTY0sni8M8pHgkqVqwaK71pRAb7v
         UjvQ0rGcI+edJn40RYz3bEkyk7aJhkAcJxeHGmhljTqsoczqhTKUxnChWQAG+m8RyFOm
         IZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940022; x=1748544822;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EB9YLdrTTEzpsGMLMd/YlkLlxPbz4lYAAaOaN9yn4eU=;
        b=QnbNqVXRyCS17XWN7ocrs4rV5CQT8rhORsg9TVSYnHpbG8pRCdffPhJr03spbS/Wvk
         /mosJyoLBqAOJbGU0DxU+RzSjmiPoGtNu7+JqsHiQGVPzPLFIK/RgF6ioVndTZ1Q5ExK
         87i2oHRXXe/UD0ZPpfccfkSx+ihaMVyWLGeiUc8crIOW7x7+NvNe7Avc7cnxiRQBxVft
         6WGNcItQrQYfoXM9KT8falrtfxImw/aAU3Z2jKM7ErXBem4BO31AH4t/f4l8+phSEeZ5
         HrRJewuz5+WxnJRLrqwOwlS4byc/9/9aXtxlNev2DSbnT8FFFmUqROJyNVO70a9Oac2U
         3tTg==
X-Forwarded-Encrypted: i=1; AJvYcCXATKcZ0SMArDzqx+opj+UXOMlFePPmWJUuHVsrbGAGeN0GEVrN6Ip5pgNebGwijWnTOR2SeUvxF/UydkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZLka+7SyUmSccZ0UIEUaC+xgrBNA3Pq5nwsB7hmHd5egVwQ5A
	vDwHcGGhOxwJ8B5PIQbmNsOkCLF8UE+ZHQABjkA2riADfKntGj8V9qYEEc2XRM6GGrs=
X-Gm-Gg: ASbGncsSpXdxhElBfLeRXFEmR8SC9d0vgaPCMixI5sQC5i7wcXahJvF5EnMcyzp7pd+
	t4xUOIxfcfFpuUs4nSIakW1yFo5eEYSiLnBpfDfp++A4jKuak4XJ8pUxiTtKgon9YZbKd7T/gSp
	bYDOUiMKKO9KWs6dqOfHVonX3AQ6mR2tx1QqBUmVbzvnqmGujT3TCnJnWlB67tn80Z2tX6t/sZT
	HMqEzefx9XmbDjV3dHNpJLAqPGPQPFE4rkvt+tJnJDMnHy7Ym0kuQYza8jvmkcbLvyQW7OtMaIG
	tOpX2S+wC7aqgpTGrxVT6KFo68HeFES2rYR6zO50BCKyFR+UKDgL0b0/
X-Google-Smtp-Source: AGHT+IH3qyTjY1nSRxUskWCorD7Lljuzn31tpE7McTqghbYGYZzq4YIUZsnhBxuZNoogCdQBXZTN3A==
X-Received: by 2002:a05:620a:d8c:b0:7ca:ca00:735 with SMTP id af79cd13be357-7cd47fc5846mr4211717985a.41.1747940022040;
        Thu, 22 May 2025 11:53:42 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467bc7aesm1063496685a.24.2025.05.22.11.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:53:41 -0700 (PDT)
Message-ID: <1a182116a2e4a9cc18842426db2c3008b6b4d987.camel@ndufresne.ca>
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: qcs615-ride: enable venus node
 to initialize video codec
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Renjiang Han <quic_renjiang@quicinc.com>, Stanimir Varbanov	
 <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio	 <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 22 May 2025 14:53:40 -0400
In-Reply-To: <20241219-add-venus-for-qcs615-v6-4-e9a74d3b003d@quicinc.com>
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
	 <20241219-add-venus-for-qcs615-v6-4-e9a74d3b003d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

looks like your patch has been forgotten, hopefully this can be resolved. I=
f
it does not get pick in a week or so, feel free to resend.

Le jeudi 19 d=C3=A9cembre 2024 =C3=A0 11:11 +0530, Renjiang Han a =C3=A9cri=
t=C2=A0:
> Enable the venus node to allow the video codec to start working properly
> by setting its status to "okay".
>=20
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

regards,
Nicolas

> ---
> =C2=A0arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/d=
ts/qcom/qcs615-ride.dts
> index a25928933e2b66241258e418c6e5bc36c306101e..de954ede27f0942397d982f9a=
a725e59a8de9657 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -237,6 +237,10 @@ &usb_1_dwc3 {
> =C2=A0	dr_mode =3D "peripheral";
> =C2=A0};
> =C2=A0
> +&venus {
> +	status =3D "okay";
> +};
> +
> =C2=A0&watchdog {
> =C2=A0	clocks =3D <&sleep_clk>;
> =C2=A0};
