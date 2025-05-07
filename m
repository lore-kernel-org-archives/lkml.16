Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DE51DE3DB
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746650458; cv=none; b=P66bLa0tsEeTMC1sS3yLPBYFCjcy1/3hx3FUvu9pXli/QBCjur1y37v0MsXjmAQFeRORCcXjAUvvdlluhEE8C3S191YYZ5YTZEUy5TM/x9IJ7djVMWxTFmxc53jjVsxuxAjf4j4gIOA78ksVs4AgZIi3/gA9JDYVo/s+toV/yJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746650458; c=relaxed/simple;
	bh=pFUOXHHvrXkhPQiHUuiZOBGAlIl+wM2tlUei87nvFis=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ofc3yPPPNGIbjWZcfkqkxLOSAvM7LJT+Kf9s7ogdZyoIzluF9+17f2hl1I89HO9SgTLQp1JcLmxzRwSBp+e/8WMmSYMy9mgimWBdM6cyG2OxsbjMKMMIXj6O0xp9hFVzWLPiBSG0Vz6pl5Vxj3SR9HLPNf5ipE1Llmzt+z5cLB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQ4hamnD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQ4hamnD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3995ff6b066so175797f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 13:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746650455; x=1747255255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vc93lrG0Hw2SjNwVZqM3dgp0VFSmvwCyoXXVfnOTYQs=;
        b=VQ4hamnDIY9Xw5mUB2y9A/c5G0q9tNQqRiklG4Nd/28ioz45D7euL22wp/riejZd72
         bU0/N1Zk17N/fUP7hB9+IV2T2FTdF+OcpUt4FJto7M8/NKh+sRXuB/bCW+1gkIByg7g7
         B5kqLckSc2mp8Xe1gJrJPmq6y1hX83+Fp1RakjqHbJK3NJhWBQvdxbf7DnppYY+O3xqh
         tUf+hFXqlR96gmEKuVUsuz0bu+UX5cwuUUk4HprEpe1Zqij9g7SsFRMNh67OJY7WROD6
         qXYYy3nA/ypmnREItmdyCEBs6UwQ+0vN+nv78C7j/OEaz1+dCV7qQ8UWDAbnQRkNjzyq
         zreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650455; x=1747255255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vc93lrG0Hw2SjNwVZqM3dgp0VFSmvwCyoXXVfnOTYQs=;
        b=XxJk9eSOFgXy8LNMtOIX8Ug99oHJsBjSQADYbiGTz8ISBTHe4/F+uU8kevWrRXDw+l
         z4ErDWfpkmTk9pQRAbdALpzRAhMnxovXSN2ptGE46KGtECJHNR+3NvddEFlb5v2Trc89
         MtUY6KuICQDpQlcOOAFzGVkRz3MrSSpSUm1GxbRNaFqjUZuFFjfJzmPqW3BDvbEhszAZ
         NZeX8QBbvn9nOqcnYuOPJes3sxz6Rj1q3c8WZc3cDzpeJERjzcsBoTatA8Amdfxb4WU6
         YiwJDLx8o+wlnpOqbvUQwThW/tdcBnJoVNgvnS8DkPtHH2Wh04PRZNRH/o8qm1H6NjLw
         8W6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlhQaf+sMfTmylkhJIJOs+2sbL28GzZMNlcenNGwPbSL7ZaunASxCLRC/ST0Fgt5dTAu6h7pDkky+iTUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTsppjq3kejTrj+UbQYxAvt9L2ElmxUHmveUajxamcAyeeWOhk
	/iHUadvuTGblJW/Uy0gU0mdkbKrk0c8wlH8bnAxOY6jmXUFu4jvFhb3RKA==
X-Gm-Gg: ASbGnctAKvWvrlVmaci2NwtFqxc2mpjI9mdToZZQPd8oBTI8vDWcWih33yGPGShTfnI
	sxLuIqPjzYndMfGjKkHSACYbSjdFVRblC7gBXSZumG36a5lG7uTOvDq2Uf95FvMfWULnBPvWe7u
	Sz70bS7XJNeLzOVWEO37FmoREiH+9Z3R3T7MlZDXzCvQ8mtO3flBAc/hkqIoblwsTGeI6PzzEQL
	274yOj5jOyZViVZhUrtjG65IKLVIsYvHF13O/pCKWUVs1hlymo5QQBrsfxKEyyqWvj7EL97bXzG
	s7uPVyXyLCHhAMttULpg0dTa0iB95ts6OZ+d1N9mGPoJPKq9dUMvh4bJMbCPbfdntBKLn29/M+L
	SbTw=
X-Google-Smtp-Source: AGHT+IF7lnGYz8tX2qUOl403YDquvjWN2znFm05K0wGqllT1vIoVkF8GUXKgNAbIhOBhsKkvnOQoNw==
X-Received: by 2002:a05:6000:402b:b0:38f:4f60:e669 with SMTP id ffacd0b85a97d-3a0b4a244a4mr4112259f8f.29.1746650454667;
        Wed, 07 May 2025 13:40:54 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0cafsm18120171f8f.19.2025.05.07.13.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:40:54 -0700 (PDT)
Date: Wed, 7 May 2025 21:40:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, yuzhao@google.com, stevensd@chromium.org,
 kaleshsingh@google.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2] mm: vmscan: Avoid signedness error for GCC 5.4
Message-ID: <20250507214053.42c90b11@pumpkin>
In-Reply-To: <62726950F697595A+20250507040827.1147510-1-wangyuli@uniontech.com>
References: <62726950F697595A+20250507040827.1147510-1-wangyuli@uniontech.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed,  7 May 2025 12:08:27 +0800
WangYuli <wangyuli@uniontech.com> wrote:

> To the GCC 5.4 compiler, (MAX_NR_TIERS - 1) (i.e., (4U - 1)) is
> unsigned, whereas tier is a signed integer.

That is true for all version of the compiler.
The warning depends on whether the function is inlined or not.

>=20
> Then, the __types_ok check within the __careful_cmp_once macro failed,
> triggered BUILD_BUG_ON.
>=20
> Use min_t instead of min to circumvent this compiler error.

It isn't a compiler error, it is a coding error.

The correct fix is to change tier to be unsigned.
(and probably 'i' at the same time.)

>=20
> Fix follow error with gcc 5.4:
>   mm/vmscan.c: In function =E2=80=98read_ctrl_pos=E2=80=99:
>   mm/vmscan.c:3166:728: error: call to =E2=80=98__compiletime_assert_887=
=E2=80=99 declared with attribute error: min(tier, 4U - 1) signedness error
>=20
> Cc: Matthew Wilcox <willy@infradead.org>
> Fixes: 37a260870f2c ("mm/mglru: rework type selection")
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
> Changelog:
>  *v1->v2:
>     1. Fix commit msg.
>     2. Use min_t instead of min.
> ---
>  mm/vmscan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 3783e45bfc92..8d9a82621c4f 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3163,7 +3163,7 @@ static void read_ctrl_pos(struct lruvec *lruvec, in=
t type, int tier, int gain,
>  	pos->gain =3D gain;
>  	pos->refaulted =3D pos->total =3D 0;
> =20
> -	for (i =3D tier % MAX_NR_TIERS; i <=3D min(tier, MAX_NR_TIERS - 1); i++=
) {
> +	for (i =3D tier % MAX_NR_TIERS; i <=3D min_t(int, tier, MAX_NR_TIERS - =
1); i++) {

That loop is atrocious.
There are two types of call to the function.
Either 'tier' is a constant 0, a variable 1..3 or a constant 4.
You really don't want it not inlined.
When inlined gcc tracks the domain of 'tier' and knows it is positive.
That stops the error from min().
If not inlined you get terrible code and the warning.

For the loop case (and that includes the 0, then 1..3 loop) you probably
want to ensure the [hist] and [type] array indexes are only done once.
I suspect gcc can't do that for you.

	David

>  		pos->refaulted +=3D lrugen->avg_refaulted[type][i] +
>  				  atomic_long_read(&lrugen->refaulted[hist][type][i]);
>  		pos->total +=3D lrugen->avg_total[type][i] +

