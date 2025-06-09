Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F8819F41C;
	Mon,  9 Jun 2025 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487163; cv=none; b=HvnSAUmzSqtiICx4wkfbZ6UQ7BaKW3DACQVMkNwSg8HTpE0LWq42p9sBkN8QvmmYfnBv28Xq2y1kuDA86Qc84VOwGOo/iS6eDFFZ31r/Puz9uPfY3ciPm8YT7of3tjZe+knB9KWD2UuBbXsoWInJSIw/3N2qlEwuWzV1LZpI2O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487163; c=relaxed/simple;
	bh=tzexrrjny5IMXPQ9VvFMvoukaPiMY2y2N9iypoi2Qh4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QctonU6c6UbFtAUoNI2iwAWJpcpF7Y81044uxYFWl8a0dOmzciEpCFukfihYrfSNMADUksWiNYttH8UVLxL/t3E1LciKLLp8TRSGB/EQjRivo11aB9rMflWG+jxKiOEXbfXwM+Wy7CcLQneQeDj4lMlTRVHExSQi0/EpfvRqYtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JG7RaWRY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JG7RaWRY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so3676106f8f.2;
        Mon, 09 Jun 2025 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749487160; x=1750091960; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MdlA7FTprXZiicVKK7E8JIBJj3nSquxMjsmIoLs6jMg=;
        b=JG7RaWRYaw4iZzzUGI4RVTe8BeVPKbV0Z9Bl22yXD+v9OLlGKoDzMaRDGxM4Q7btcF
         mFnJ0e9teAbRutgjFoCjbhXAfPhR23ZdU7Z+hoSqPJE4Wvvrx6Z4/cAHrTE1w7hpsVtM
         yRn8OBUo7LJybmkfrWypCYPsyMe6V7qLwSseFsFxvUPmA25n2hZ7tgrk2rldqz4+T8bk
         vyogAzcek7XTNE8Tr1RXmPKOCXYNWdZoTqg5PbdqjulfIY7b1aQnbYg8fIsCkE2Ir49m
         1wISYQXak0csogqoWttG4+6aVvrED8wI9So8hcmHIk5vWhOFIAEg8unalmNtslfrXQaV
         7LHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487160; x=1750091960;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MdlA7FTprXZiicVKK7E8JIBJj3nSquxMjsmIoLs6jMg=;
        b=e6vPSyb5y9r99ksoHdSv+gcIm5SQs8D4bvQGwYFHBJjXcHDikW6Se3dR4IXLAGnmJ/
         s+ky5o68bSWeYtknE71bvKcbRcIGTtxVoOYNIJe2erV5+f/bfO+1nj0vd7Ikde54g6zU
         voQNquXEVF5bg88yb9Z82524JQrUirCPUeUAxn9pb4NPVw9x6WIrfvtkMkGHvT3G/Peg
         8kTHrKXNrpa3/4/vveKvW30yHtNZw9mKgz8tj07WW/DMZNpN252NwjF79zEtuzUVlbL2
         YWWoPONv8idHgxWm3i8tczVpGxnqefckoxKy9+l0mq/Y70ZZ46B0yT9T+aFne6xs8WwL
         1wdA==
X-Forwarded-Encrypted: i=1; AJvYcCUmRyeyvVEw8IL/9gTWSyayqESmmequMGsNu2FXvzubzoxyy3ZGxuKVd/eOXREjIESJTCl1HdKKlbhF@vger.kernel.org, AJvYcCWMZfpK/qQk8fH/n61JUeQNyhW76R/Lke5QBuEZUr60mb+nol8cfBjD9KGrz7q4v9ORum9Rqm8QS8mtHMl9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1qlSxlZXOAEV6P90No3m7eiPRGS0Ew5X+6tYUolgE8vtXFeS5
	EgK701ckOYEp7g8ZV965A6vFo65NwAK/YWx++eKH27P05nMAs6jwG/yK
X-Gm-Gg: ASbGncvIP1I7o4q1xU6VRG+FXoouuywuTIyLp3EAncy+DzlbXibIwR1BdHX+YmLnr98
	ZFdKBzVN/S8pMAh2C9vUwmruKDjqm+SVW6xp/pwO1Bdg3QxE0eMzlTJ0Y4rTwJH5I9fjGBC6Qgq
	rvIeMMSAZYnanWBQTF3pmx9qOFQoHFVffmeE6G5FdDcBFkVS6fSYMdDUD/kMIWYu5f6VfF5WKNH
	27rKq2gl26j2Dfx/ligqLq4OTjBQg++xmzI/tjbVw/3vnKxG3ago7EjN4YMjrAff/KBkXFev2w3
	+tc7agYApk20TwC7qqp9PsU/jJKe9Mwemlhxy+vj/rl6xCpvAmdx4Y5syAdcGVKI258w/hXLiHn
	DBRCnjA==
X-Google-Smtp-Source: AGHT+IE641WVTYCKGJ9CW2nJENZhWmhnjIJAkzfQD2E1jYnnkEDfEBr76CpBPCzz77Yns7HmTZCRfA==
X-Received: by 2002:a05:6000:188f:b0:3a4:fe9d:1b10 with SMTP id ffacd0b85a97d-3a531caff2dmr10438461f8f.45.1749487160286;
        Mon, 09 Jun 2025 09:39:20 -0700 (PDT)
Received: from giga-mm-5.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464f20sm9972251f8f.98.2025.06.09.09.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:39:19 -0700 (PDT)
Message-ID: <13f0f876de57d2a96f4786bcd3622772bd478d69.camel@gmail.com>
Subject: Re: [PATCH v2 2/4] reset: simple: add support for Sophgo CV1800B
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, Thomas
 Bonnefille	 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Date: Mon, 09 Jun 2025 18:39:20 +0200
In-Reply-To: <20250608232214.771855-3-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
	 <20250608232214.771855-3-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-06-09 at 07:22 +0800, Inochi Amaoto wrote:
> Reuse reset-simple driver for the Sophgo CV1800B reset generator.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/reset/reset-simple.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 276067839830..79e94ecfe4f5 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[=
] =3D {
> =C2=A0	{ .compatible =3D "snps,dw-high-reset" },
> =C2=A0	{ .compatible =3D "snps,dw-low-reset",
> =C2=A0		.data =3D &reset_simple_active_low },
> +	{ .compatible =3D "sophgo,cv1800b-reset",
> +		.data =3D &reset_simple_active_low },
> =C2=A0	{ .compatible =3D "sophgo,sg2042-reset",
> =C2=A0		.data =3D &reset_simple_active_low },
> =C2=A0	{ /* sentinel */ },

--=20
Alexander Sverdlin.
