Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7938C747F;
	Sun, 27 Apr 2025 05:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745731757; cv=none; b=O1MbmMaUKxgswcszMVUCKuNKo4/r9lT39XHfFIH51FqwrPnh7VXx7xNhucbq2tuXlw1IWLaM5ImTimwjKbqByTCWeBoCp87WcaO9raF7/S7RWZzHHjgnFGPw3hh8N5J1dhUlySHdM8o4DaQ5c8az7/1S0iqn955gGj2pLoXYnTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745731757; c=relaxed/simple;
	bh=1FUe7aXRzxsu+EjRvAhzLXksbJrtabn2nY+5vLDSRVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvcREE4PnWKlO+fL1GKw11v4hXPrlMIV8xe+B/eHQWG7T9FS9h1lZAzTCbXBuyhoC/eFF8Adfm9stzk9iwCv7IO4SBo9zYVQQ4Pa8I+oPbpSSUatUOmER8iz8/LsieQs+SFR5iPhSCUnciv81AcDDCxBs1+zKFEfbE7j2KCN9kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549963b5551so3616562e87.2;
        Sat, 26 Apr 2025 22:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745731750; x=1746336550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDi3xnZL6fsQsXT2rLh2TNElIcjVvgvD9LuKBrnF8Ww=;
        b=W1JUASVF1Cs+wuqtP4fIL+uYnJ1rjfFqG7zA8ORGchCvd0jLJFcw6ihksgU5WyAbjg
         ZZ+5DOpqFwYzkSV85qoRORT4l+JtKH9JO8Mvia2cr+bG35b2Dj8pYhrlLXzuiLro31GF
         Vg/YbLMX9rM/B2JDHJtQxt0FGri36dRngjfOvmr5KqINBADNEqMN/zJL6lmraLJKau3Q
         rJmUXoJRGhWWuWq3GNY1uEfUjLTkEb4fzUMRJ8+Sg6RN/EaW+EJVodC1POlZhPWdCyew
         42DPxEQ3/LFWDODITtqn4AY8BYxPrQ8L+xD1C41BS/73sp+nvcr3TYcyUcXDGkGL3Xne
         7UAw==
X-Forwarded-Encrypted: i=1; AJvYcCVIRQ2NdqCnRvqwJ1s1/G2sc45WTFLZWT7eiU2UI7COEkOJxCSCV1KrmbpPgBIdjPMSY9RtX5hxRkjlw5+G@vger.kernel.org, AJvYcCW3kgZXuxtbGcj0DC6IcZA19soca9Xdv4TbzQdTv8qwmKw+Fq4P/Zdleg6+iWixMOtleGnhjM/lz8dd@vger.kernel.org
X-Gm-Message-State: AOJu0YyGhWncp8DAqI1J+rCe9/9tRNm9JV2/psn/vZZnoWCKSKFsKUmx
	iY4s8k99Dqr30XIun8ky/0xbRbFQCGKjNfjWL3ouTXl/pb5gcesHa5PXeiE551s=
X-Gm-Gg: ASbGncs/8FwcGEEUlN8rdqpRaH1RPCH1RgyoKqvuZ4lXk+mbbyVaUzGwMjGv47rH2Tw
	XcuOj335eJ+sQzsCffrJqnv8VkwwhG0pz8VRYERFvXqxiTozggqPBsbLmItVBequTF7s3UW/ll3
	pl9gpKa6EhRmLMepMWudBlpqQkLljd8ohTEsaTTtXGVyg4FuUy1r2VifLJuruLOgLoxnePVss7Y
	avqhRuv4LAUNoWotVJQWyQqlSAqbDMcWgDXeVvHvOeTIwIh/7aRTrlNGcXbsCJD/IyOXRB61UJs
	W0ihVfQSW+xwLKHrmpAzZB0hp3VFW1/tapBGvsMqEeDcscdEFqLIv6lYFeCPsdPA+8YTQM5Sm0M
	nGXVfhxtH
X-Google-Smtp-Source: AGHT+IEWPDJC3w7cRgMg/ifjyR+rVIpAuSYNEu3glQcvSCJ+kAdzp8jRsmnUhmx8TuQSC69Ve68sqA==
X-Received: by 2002:a05:6512:33d6:b0:549:91bc:67a9 with SMTP id 2adb3069b0e04-54e8cbcddafmr1799242e87.9.1745731750257;
        Sat, 26 Apr 2025 22:29:10 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9f719sm1238209e87.124.2025.04.26.22.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 22:29:10 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30db1bc464dso37994391fa.0;
        Sat, 26 Apr 2025 22:29:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpVt9Gg7R+TJw0dmOPcAwdrJ8WIM4xD0BV79oMM/OCZa0m0A//Ml92LV0x9xchFlmhbpeyZszrIB3z@vger.kernel.org, AJvYcCX8aBVlXelicc+3NaEPTvDkG6QCHTeJPs2nmyz85inVX0sfyGljFPWrGMjz/asu2IExIJKquG4r98h9kD3o@vger.kernel.org
X-Received: by 2002:a2e:ad90:0:b0:30d:e104:b796 with SMTP id
 38308e7fff4ca-319087b0605mr23238281fa.40.1745731749733; Sat, 26 Apr 2025
 22:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
In-Reply-To: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 13:28:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com>
X-Gm-Features: ATxdqUEYYTKOqIRqwitrJwW2PxZXei0_VhgNMizMN4MUT9WfXUWnAmdzTIPf0Jo
Message-ID: <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: allwinner: orangepi-zero: Enable audio codec
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 7:32=E2=80=AFAM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> Line out playback and microphone capture work, after enabling the
> corresponding ALSA controls. Tested with the Orange Pi Zero interface
> board, which is a (mostly) passive adapter from the 13-pin header to
> standard connectors (2x USB A, 1x Audio/Video output, 1x built-in
> microphone).
>
>   https://orangepi.com/index.php?route=3Dproduct/product&product_id=3D871

What about the USB ports?

In any case, we don't enable peripherals on "headers" by default. That's
up to the end user. The description for the whole adapter board could be
an overlay that users can then apply directly.


ChenYu

> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>  arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts =
b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
> index 1b001f2ad0efd2e77218742efe6d8edfdd18a816..d65ede3dd6ed1206248a39c91=
e46065684e7ba29 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
> @@ -112,6 +112,14 @@ wifi_pwrseq: pwrseq {
>         };
>  };
>
> +&codec {
> +       allwinner,audio-routing =3D
> +               "Line Out", "LINEOUT",
> +               "MIC1", "Mic",
> +               "Mic",  "MBIAS";
> +       status =3D "okay";
> +};
> +
>  &cpu0 {
>         cpu-supply =3D <&reg_vdd_cpux>;
>  };
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250417-opz-audio-890849c8bb2e
>
> Best regards,
> --
> J. Neusch=C3=A4fer <j.ne@posteo.net>
>
>
>
