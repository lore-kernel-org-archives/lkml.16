Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FC1156C6F;
	Sun,  4 May 2025 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746356102; cv=none; b=d8uEi+oNGPQavDR7eeV+onQ/axEuI2eVZWCnFTJ9HH9uWagBTixuneB7mY7NH8Z6Z1jT8AtzG+gE0qPwrcaSq/C3oES1pZqZwq3DNTFHpjl+xp3XRjdjJdxdK8T6gPZOOMV0yNuvAoqfAQqGkTwOyUoLHJ5sxFOuJ9t44/EAmZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746356102; c=relaxed/simple;
	bh=lFawDT3TyRUPwBOj1cNHy7xrga4+P0K6HQ6xQ8bs5Aw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kOkFzhiVV+TgTENAoDLxucf/RTaZhOBb+fta1fnQEB5CXdPGSEWHKqET4beiG9OHcUKsA6VVgx7XmxeS255e4HGDBuWxOlGv0nZmY7AZAumn8NMluV5j41hMGQgJPto/h5vZOyK6FXEMO5FONUZ4llHxz5oyX6VcAksjCikn9SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLNRBM88; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLNRBM88"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ace333d5f7bso653595466b.3;
        Sun, 04 May 2025 03:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746356099; x=1746960899; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X/Gw8AZoyqt4Qe9tKx7GhjTg65Csx1ptC6GhiSTdPJA=;
        b=cLNRBM88iHkyLUEGw8iNMtqcIux0aHIpNglJ7jVhUiXyYLBMt0K1ywdZffJM+jFADz
         9Se4bRY8CWpNW48PkHWXewxsoIPmyR2o5HGwog4NiSxM+C3ja4r6Gb4PB9MLzdk/bbXm
         rjSQwxvlWqShpp4pD5xxc7Q0vtIMhfi2GMsUv0SZGUBnMu8/TG1+G69AOA9mN1367Bsm
         QQjS9g23NOUBkA2PeG4FjrvrHERuJgYpgkDdRQKZjvt5rU/8qF59EvHzJrYHTljaA0I3
         e/uPPFneqC6UvspJjYasKgzCqftVTNmJd7XiqdmffG2mdMFjw83MBzQIdnpd/2dneAET
         iseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746356099; x=1746960899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/Gw8AZoyqt4Qe9tKx7GhjTg65Csx1ptC6GhiSTdPJA=;
        b=lO/Ff373+JQhBQSeL3m3FqT8BVTwLanBcS2Z9yLRBQNN9J5yfnjZGb1q0W8dMu2oGY
         ++o8BA3fxPw+YpCDwKAsEfgMoO4gADAonNOsbLtd2blohAqlyyW8MNanZ7jUsbYclHiR
         2/F4jiz7D9SJlISI3zsKGRqBhF5narvEzvxKDUwjtz0NzWBibSwAcTSFz6gJUsDZBf+a
         nKc+IjUHZ85NofbMW+NjwDSHpHHtggMXHTSVf5RgzvRrCgV/V9tQvv1S699QBO/8o+Xw
         H859mUAZut/BHN7MmYOFVEx1FUMKZdS2XcNNIDMt3M9auCPZZAIajR6fs+wDjt9meGav
         ebnA==
X-Forwarded-Encrypted: i=1; AJvYcCWzbbhUphl/02GZEfQ/k0C9ORKB5/K0lmWG6dZGNDMIFtCeIZ6m4Xtu96VQLTZnSjIt8tl7l6qnzG6W@vger.kernel.org, AJvYcCXjjGmst0TC6a1bxMbIfSoinOjtAhtv/P14lanxShPLiskbmCjr2BBXX3gof9yWyzUEIGq/af9l0ZXA+tPc@vger.kernel.org
X-Gm-Message-State: AOJu0YzLfBUDRdvfWC7sk/woL1jRFcVWtTXeDwObdJvf6M70QMI9Fy6S
	jajA33/ZI/8gDZeePhtl9vpVg6gNfMKRtJF6KeEQgVY9xtDLX0M1rjPjYv13
X-Gm-Gg: ASbGncumD/b6lNuq+f0all4nIFo3UONd6Dz+zCDsFT79N3oqAUvk26U4dVyNyKoH4zX
	XL6McUHqMXPH8yLazZ+p0fdEyqGT4vt0Pgt0ooinwbIQfb/JufI4PRLluQeNDV8Kp04LDAz0yMC
	xhCydZ6LnBx6HrF80CNpMMKQqYugWV/VgV3qilXdScMCs0WaKUaLsxhTxCi8GA630gkQZfLUWMo
	UDTZt3sxP9B3O0Ec9w2KOCf8RtWqyXqp8vSKdlpBndl+Z201Qq8PNnVHwmbUr0XUbx3t52Q/hjn
	XHfhvR5t1db/N0yOS/XVwNAcBbom7zrr50gRWaxMgLpegeKNgynNesNalVC0
X-Google-Smtp-Source: AGHT+IHtsqO7K3CdDxe3EOvKh/0HWmtCN5k0hmjmOgHDHjsnagKK75fxLjlAZX2eQdzhQSh6GTz2vA==
X-Received: by 2002:a17:907:3e05:b0:acb:33c6:5c71 with SMTP id a640c23a62f3a-ad1a49c3349mr354017666b.29.1746356098387;
        Sun, 04 May 2025 03:54:58 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b2bsm3858937a12.32.2025.05.04.03.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:54:57 -0700 (PDT)
Message-ID: <959c4537754ad014727e356c4b068bcf5a9b6a48.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] clk: sophgo: Add support for newly added precise
 compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Sun, 04 May 2025 12:55:01 +0200
In-Reply-To: <20250504104553.1447819-3-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
	 <20250504104553.1447819-3-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-05-04 at 18:45 +0800, Inochi Amaoto wrote:
> Add of device id definition for newly added precise compatible.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/sophgo/clk-cv1800.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1=
800.c
> index e0c4dc347579..a4116ac1adcb 100644
> --- a/drivers/clk/sophgo/clk-cv1800.c
> +++ b/drivers/clk/sophgo/clk-cv1800.c
> @@ -1519,7 +1519,9 @@ static int cv1800_clk_probe(struct platform_device =
*pdev)
> =C2=A0
> =C2=A0static const struct of_device_id cv1800_clk_ids[] =3D {
> =C2=A0	{ .compatible =3D "sophgo,cv1800-clk", .data =3D &cv1800_desc },
> +	{ .compatible =3D "sophgo,cv1800b-clk", .data =3D &cv1800_desc },
> =C2=A0	{ .compatible =3D "sophgo,cv1810-clk", .data =3D &cv1810_desc },
> +	{ .compatible =3D "sophgo,cv1812h-clk", .data =3D &cv1810_desc },
> =C2=A0	{ .compatible =3D "sophgo,sg2000-clk", .data =3D &sg2000_desc },
> =C2=A0	{ }
> =C2=A0};

--=20
Alexander Sverdlin.
