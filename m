Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6882045B5
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171650; cv=none; b=gM9GVJAWcssXvxNzsy9/C8yZGcWh6pbm5VbIUb8xqdNKUpeZmRbpMAent2RgBeTGMM9o82IFx+QDCuPT/uFxYY4nkmrfCER8LNbOAtePQ5cxcgzwymSflMBCuFJ5PNM4g7e6xS56Egh21sI5rCVkO2bv+qv87GdDT2VZTzbt+ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171650; c=relaxed/simple;
	bh=hwm7FqVBXRdayc2AfONtZN6tmcXNPTJYL7j2zOCKgHA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NlC3zktQWXQ7SAaB9Wsd5dDNNtz2D2wYmtkEqqVT2hW4yxRwp1tNVZv1ufbF66XQhwbozzZNxfAp0zUGsMq4Ysvw73U8fwmLJnmBrG3fbCqzxky4ek/7RFgji8lfHJVPaTLtvjxv5Z6an7OsZtogO4vvN1ZDkbZ9OuT3uHHnW9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8xrgiEW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8xrgiEW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so6476305e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746171647; x=1746776447; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjKYTAejGeAftxln6r6svmFF+Fn1rj7RXHwsS3Pt8Os=;
        b=R8xrgiEW+NaB8/+SPdI/uK/hhojzlvg+ATXpV3ItC5A9MXbkGea6u72T2A8HxkPYDe
         +DZbGkMmvUiWxc/eZBcE+mcthQFSXV4+B5oFYs5HEBjYYXsmqdpQsCdjeGnMqO0MNBBt
         UNQciSVAcvezoD1c0vrw9DYAG3B2HMY1mQAAZ+jn1JJW8cZax/BqVwGZZTmLwcWN0it3
         4NWSgOt143OrjotRjzLIr2rw3f1Z4chSyrDbS8ZBX+3MYtgqjCA3u279OK2K9Pn5W/nr
         njH+P1ni2J7EdDqtY1mAHoR3y3onYK5bDwN4bng0zDAjBMlCS2L74WseCggnlEbHgR+s
         mEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171647; x=1746776447;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MjKYTAejGeAftxln6r6svmFF+Fn1rj7RXHwsS3Pt8Os=;
        b=Of6pNk/HT79RJwrOxIoqiXef3JEAF+Jt5Y09AeAPU6G81fKLeZKDZOj7qaBhiAOHEq
         SZ1TaEqho5xLrlhNL0NidzmbbzmGCjXuMphNi4mHZ63zMMfZOJOtytlfRnGJU9wdqVhT
         +mVy+e1Pt2ykPC3gtkC/sq4lbD6bQW6EqkOREdq0Nog+loTCdvSvh3Or6/n4ebOPe3QV
         HQqNpZKWbmmtDoH5UanYpxd2WZjNAAbebbFTgRqvfZjucO3I0ZAEX2foxLbbFfr9a7v0
         UFj2xkSurZsjin+wmuaFTvdTxHGvaVhUri9powV9M+LWT8FSW3jMcTNQVciss9hf5nWp
         CKsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjFedkdxjTGz/nQ8Na0u5+FwBPx/6JF14+6/eKlMXYKPu1OgzRD1EQdtbVIC9vk8OqDY+MXT6nDSsfJwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7amwPZ+gZL5xODOBT6GOY7tFZzy3hZjIg65ZfV7PFg0CzF+6a
	fYyOEXemrUzuZZNBlRpC3CyLJiXqwSlbYTO11qRlIZSRYLVsehbR
X-Gm-Gg: ASbGncuQj7oLU5tNm+mg/mqqxohw0JgW6vi/MtE8vmTaC4X78JC3QriDgxYkNVe6Khq
	AVtyN+NJYE2NRE/yv0xW51v/FDCM02hnvgupfzEoz5D6aJ0T1vnAneoR0NtVSlL7skBXcGr3+cH
	s57NQ2XSmO9MXm2oFT8hGO1SkDnOx3n+/L105x1BC7IPrI8F/KHIPEkuQBYt3i3rYLansKgf2L2
	sIug259JfcbCjZXH5MpLNM4sxKNarb1oQ06Uyrx+IWsRm+uZP6/1UZPLsh8fQnCxKVThD2ruZXD
	PbCcG1JxVFlMM98rYwmAsO8WMUJMBPeHHY7Ddl1RifDhVEYrvoaFAbLIOA5c+w3I0goWzNodQS2
	xFVPnthO5r+ZN
X-Google-Smtp-Source: AGHT+IFwb68F2BUcZaPCPB4PGb/Y/Ryajby6u038Ol2haSciEKEEtpa0QFaO7ldIbG4D5ki26poKIA==
X-Received: by 2002:a05:600c:a016:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-441bbeb4f74mr14094485e9.14.1746171647014;
        Fri, 02 May 2025 00:40:47 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28082sm80741045e9.34.2025.05.02.00.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:40:46 -0700 (PDT)
Message-ID: <08e6b769888a11bcf9b3faa45d97b1a16a413a0b.camel@gmail.com>
Subject: Re: [PATCH v2] mux: adgs1408: fix Wvoid-pointer-to-enum-cast warning
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mircea Caprioru
	 <mircea.caprioru@analog.com>, Peter Rosin <peda@axentia.se>, 
	linux-kernel@vger.kernel.org
Date: Fri, 02 May 2025 08:40:52 +0100
In-Reply-To: <20250501181819.164207-2-krzysztof.kozlowski@linaro.org>
References: <20250501181819.164207-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-05-01 at 20:18 +0200, Krzysztof Kozlowski wrote:
> 'chip_id' is an enum, thus cast of pointer on 64-bit compile test with
> W=3D1 causes:
>=20
> =C2=A0 adgs1408.c:63:12: error: cast to smaller integer type 'enum
> adgs1408_chip_id' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cas=
t]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> Changes in v2:
> 1. Use kernel_ulong_t instead of uintptr_t
> 2. Rebase
>=20
> Patch from 2023:
> Link:
> https://lore.kernel.org/r/20230810095822.123181-1-krzysztof.kozlowski@lin=
aro.org
> ---
> =C2=A0drivers/mux/adgs1408.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mux/adgs1408.c b/drivers/mux/adgs1408.c
> index 5386cfedcb06..5eaf07d09ac9 100644
> --- a/drivers/mux/adgs1408.c
> +++ b/drivers/mux/adgs1408.c
> @@ -59,7 +59,7 @@ static int adgs1408_probe(struct spi_device *spi)
> =C2=A0	s32 idle_state;
> =C2=A0	int ret;
> =C2=A0
> -	chip_id =3D (enum adgs1408_chip_id)spi_get_device_match_data(spi);
> +	chip_id =3D (kernel_ulong_t)spi_get_device_match_data(spi);
> =C2=A0
> =C2=A0	mux_chip =3D devm_mux_chip_alloc(dev, 1, 0);
> =C2=A0	if (IS_ERR(mux_chip))
