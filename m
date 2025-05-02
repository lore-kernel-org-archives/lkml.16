Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A70220696
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171358; cv=none; b=YKt825dsexCRr5IWih6UepYx/EpbKHG75vIxCR2Fvxpi+/PfIPtszmGecemlwXY6telE3y7QiN45/2iMuUgHtQUd9V3riEMMPX1K8vxIBWIgpq+fl9SnRyHXN54h7AyEKy5IjCywDf1ZGTwJw9bZK2FO57hGYfG1rEp0ABRUkR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171358; c=relaxed/simple;
	bh=KmGocRpSiJT88gK4/4aE964AI3VHoU3XMLeJChFX+k4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rHnSD3+uWr+Ik7uDKpPTkbunHmNqr4BUUHTPuEVvS8K66wTDxSW3js5fVI3DpE247cDWRUmRdSPd98F9yCna7fFdxuJtnXMyraHR7L3G2VuwI1DlUMnGNTcDQaFNcTJgHjs9/FMcvnGnY5XgHdXRS6ooPWFfqHHu+pEFF5qL5sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lr4Ejmog; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lr4Ejmog"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c266c1389so1275453f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746171355; x=1746776155; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2LubcAJDTWQLn3URPYPzCGVV1dIHo48uFqoJHAs17E=;
        b=Lr4EjmogW5WIX69BR0cBhxhqHjzdZX9UwIZ5G3j2KtLgcSPerx1qfDrN+8kYuP+6AU
         NVHRLev6lsJCEwzQ5EKRyrmgZeHrz+w2RKHIXGMeS0TflsyLYSYqq58pg/B+ff2D8YsW
         U82Asz3DwcvQFgj1OGI3id1++yWGBRWuKI6Z37xGNp5KdBSXZrLpI0xFw3sev6kpCif5
         rILONs5NFxIfCx3yfZbOFcZtmZk22IPxZ9PyA387WPZmr3P4GjeCV0LBl9VrZTqLxkrM
         gPuo94nk4M8oRmjZmmtTd3My8/evJsBNZbC9AJ3Pap5pI8dRihLqO8KfG7l5skMkbu/a
         CRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171355; x=1746776155;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2LubcAJDTWQLn3URPYPzCGVV1dIHo48uFqoJHAs17E=;
        b=STbjeWIftAns8UExxIJHwTy8BJtdGJti/0W7DOqIj0xp8P8UrKwF65IkIoWHR8DT4X
         urGJWxlEi6RiB1R9YxZ8KoCTq7Hk/zfEkTHjnTOm8I4RLxtRsnChI5uVtomtg8AT+OF2
         EMiXNLchV51bDOB4JdsOhgYJFEp0IaWAac/+3JSiz9UE40+hGCOevMTNGKUrsmsVXJz+
         KPs0hwuVBS3tfpY67jGcQpeEMdUdM2noZxJ5OxoQrORWWAODHkt4ln0UPXigoxRxEEq8
         faKpvDSa6Qn+VWWv7HqoHJirXqIVRV2prnEwqYmPmcB3EdoPBVgDkrgXcb575qTdlB0x
         llgA==
X-Forwarded-Encrypted: i=1; AJvYcCWWCWipJ091wC7VG7MzW3n0CeLRti46dvyobdTu8mgCccvu+qSBTtl2qlvJc1SwCcUWnuV6h0nJfhzXyhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcUGA3TmMpS+KCz+ueYPCViLT6HodLeIuCIr6q7a3wUoCHiK3g
	gCfX00dszg706NZqxLVWJR6DJKpqEQ3lS7Zg0VVwfF/1t/gLrexX1MXt6Snj
X-Gm-Gg: ASbGncsz3cSkOpPzvKKDpQo4QpznGDsykhcEbZSlzJYylAFlFS6YkgZ5s4Pp3clD3Nn
	sZuCjOoA0irylz/QTLg3a2kt8qajLJErfQuCKk89T0+OtGuGdP8cWem6qL8xVSXTsmEqqGOD6KA
	7xws505k0K290SExita4lilBCZQbrUBvTpupQaMwTJbsnW+g3wlpY3cooOnM91KVSCvpYAMgxF9
	S7DqA5TBSUl7E9F/YqCeoXBpugrPkdPEG6CbwCmp/NOYO1Awfblnx4+uQL2+ctsEtejBF7H7NjM
	NOlQQQFjICqhg5X4nhrZYwBh5xqg0dQlkVFGAZlhIVFuCXTHHxo/qDOPZdpHhjMSuQrND9AeQkG
	nUPqksyZuDvf5
X-Google-Smtp-Source: AGHT+IFSVHq83OJ1lbafr6ZZH3pxVZyyOWa/S+tXdFac0Bwnosit9PBOjEgy21o7n65ewlBiSJwioQ==
X-Received: by 2002:a05:6000:1886:b0:391:2306:5131 with SMTP id ffacd0b85a97d-3a099ae9bdemr1394171f8f.45.1746171355250;
        Fri, 02 May 2025 00:35:55 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0ffbfsm1312046f8f.80.2025.05.02.00.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:35:54 -0700 (PDT)
Message-ID: <f069c82cb8b5f53553738545b8e4e15b54819e35.camel@gmail.com>
Subject: Re: [RESEND PATCH] mux: adgs1408: simplify with
 spi_get_device_match_data()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mircea Caprioru
	 <mircea.caprioru@analog.com>, Peter Rosin <peda@axentia.se>, 
	linux-kernel@vger.kernel.org
Date: Fri, 02 May 2025 08:36:01 +0100
In-Reply-To: <20250501173758.135465-2-krzysztof.kozlowski@linaro.org>
References: <20250501173758.135465-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-05-01 at 19:37 +0200, Krzysztof Kozlowski wrote:
> Use spi_get_device_match_data() helper to simplify a bit the driver.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>=20

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> Resending patch from almost a year ago - there was no response to pings
> either.
>=20
> Is mux subsystem still alive? Shall it be marked as orphaned?
>=20
>=20
> =C2=A0drivers/mux/adgs1408.c | 4 +---
> =C2=A01 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/mux/adgs1408.c b/drivers/mux/adgs1408.c
> index 22ed051eb1a4..5386cfedcb06 100644
> --- a/drivers/mux/adgs1408.c
> +++ b/drivers/mux/adgs1408.c
> @@ -59,9 +59,7 @@ static int adgs1408_probe(struct spi_device *spi)
> =C2=A0	s32 idle_state;
> =C2=A0	int ret;
> =C2=A0
> -	chip_id =3D (enum adgs1408_chip_id)device_get_match_data(dev);
> -	if (!chip_id)
> -		chip_id =3D spi_get_device_id(spi)->driver_data;
> +	chip_id =3D (enum adgs1408_chip_id)spi_get_device_match_data(spi);
> =C2=A0
> =C2=A0	mux_chip =3D devm_mux_chip_alloc(dev, 1, 0);
> =C2=A0	if (IS_ERR(mux_chip))
