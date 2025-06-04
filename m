Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB7623958A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023584; cv=none; b=ErKJ6IEBFN9blig39MHH42FXNK6VBTj3dW023BHPxkHQEoQ3GjHyYqnK0Lk8Tg8ajdoqcCrOrxKkLfoaF1xqsid9ofDQOTqB6uNaxDktbImKtWoN68IN+RvQcdLO67KBzJCJniu0A/+10NXQc0dQGIctBO8uXtoW/7lfM8yiC6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023584; c=relaxed/simple;
	bh=l/Ro4mZ8dDIKFbrOGvx80He/T2LpzxUhaJa9FI86v6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/E7z6LGKKyyHU1yfG4ckHfZWtuwCihJNqcXYzZrLWeOIBdpICIRuoK5rTnPNS95j51+McyBEkH1Z8322nq8LGFCXV7KMSGR/gT8MWynoq9GKO8LDk6LjZxs2UaEiKdw3wRWNfuxB7a2rODM0ENm2y7hM52cMfK9N8AqvB2Joo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=jKbRq4YW; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="jKbRq4YW"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e8175f45e26so1073372276.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 00:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1749023579; x=1749628379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbLBkbI9xD1tF8dYtnQkUOxiQTgT1jXbV49JvFHG5rY=;
        b=jKbRq4YWafpuMbmbW3ut7YmuKAno5soFkNQq0h72zVOgUTpQzaZXW72WLjd00C68dk
         F7zrccRBY2Y0LEKqQV02hIMilDVG69rzjfyA8Vd+G/WPXQJb9ZgsBG/GHIX3LwKL7dyp
         yoTGvHmMA2YclvMglfOmggxM8nqeH7f730EvZpkSmnLz/kVxM0LYMRxzsHv4Ht5N3Eev
         rhOdVYeCnE0lqd4ugMs5DsNp4vm3255Dsm3EjkOGSvnxZMPTgbMqpXZjAIilGmkpBc+E
         Q9UwShK2iSOU5yl5guMuzLbsqgyUjSqYGjUlEIElXXN7hGt2fxS4xQC+ZsH/8sRAi43n
         a5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023579; x=1749628379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbLBkbI9xD1tF8dYtnQkUOxiQTgT1jXbV49JvFHG5rY=;
        b=W/B7HoST6MN1DnNTwW1Ru/pOo/qtnmRJ2cYIaOOMapPmnfqEL4Ozb6OSLOWd2njUhm
         pqBkCDoyDuMl+7Z/qUSTfZYv9iQJ7CdoRCky5wLsdKt9jDiXm3ligqqPQUiQ5rzMlApp
         1eFdTubFDP7YcWx6b9ZSWlfVTFUMMj2RO0y+ELewVHbaMTz7eA4S3VTn3+Bdx9ZRGW7F
         bMiAk4IYXGY4weZpA9MkSq+XJY7lWsqPuMZY2FE5tUQjksYsVor43CBd/s7OdDoHJgmx
         ynCjmj88oj1h0khAevBs1EB8BNTiPcb3DX4NNEHMq5azZdE1h8iy+bjeKp1U7DOfFRSY
         w7Ww==
X-Gm-Message-State: AOJu0YxBmhwQZ0gSgwVa3jV41SB+LM60UKxFU2005wG+7yI/VB4ChD3K
	X/6FRrphXXsP/jPtK1QWOmjGYbopFpUpd4uXqUjew6gyN4n3kigkxjO6DsvD98iUv7bcsmA943H
	sRKB9F2rTmd/hmZmoK47+dGfNEF2O+ORNKXQWVu+g8wZ2yJFUQDkr9NgqVek=
X-Gm-Gg: ASbGnctOCH744u/t6tH+rR4/gUYDqz72oTX9HhN6ZCGVgYSlewozkzLOREhduDCkoFF
	6fcEY3vTLGM0mcOeRX1m77FuGH8mONuAow7mABFEIkh+2jvFQeL085EfYX6XYRXPCGOBgkTkkU0
	Js8v94AwaHDW3FUw9ON+kRhDRPrCImikliZQ==
X-Google-Smtp-Source: AGHT+IF3An6q3gAiKoPc6XLAMlvASTm5moux+wih2fPYgkRv/0M86k0dfWN0bMZRucqZKqAP7SRIMiyiC6+bpFcLe8g=
X-Received: by 2002:a05:6902:1083:b0:e81:7690:247f with SMTP id
 3f1490d57ef6-e8179c0e6b8mr2385819276.15.1749023578950; Wed, 04 Jun 2025
 00:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f6e465fee5a824a67be1ae7c3bc1b72adcf9471f.1746558529.git.nabijaczleweli@nabijaczleweli.xyz>
In-Reply-To: <f6e465fee5a824a67be1ae7c3bc1b72adcf9471f.1746558529.git.nabijaczleweli@nabijaczleweli.xyz>
From: Michal Simek <monstr@monstr.eu>
Date: Wed, 4 Jun 2025 09:52:47 +0200
X-Gm-Features: AX0GCFs0LWDHTJlf0a_TzGhXKhh6cse2vHenR0alQKIUrDuEUB1MBd_nYmqvpLI
Message-ID: <CAHTX3d+o5wOhDFa_yom_KGB+nyMDDvxcfdUCn-1cRyvkUR1B6w@mail.gmail.com>
Subject: Re: [PATCH 1/2] microblaze: optimalize -> optimize
To: =?UTF-8?Q?Ahelenia_Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

=C3=BAt 6. 5. 2025 v 21:10 odes=C3=ADlatel Ahelenia Ziemia=C5=84ska
<nabijaczleweli@nabijaczleweli.xyz> napsal:
>
> Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xy=
z>
> ---
>  arch/microblaze/Kconfig.platform | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/microblaze/Kconfig.platform b/arch/microblaze/Kconfig.p=
latform
> index 7795f90dad86..2d18edde4823 100644
> --- a/arch/microblaze/Kconfig.platform
> +++ b/arch/microblaze/Kconfig.platform
> @@ -11,7 +11,7 @@ config OPT_LIB_FUNCTION
>         bool "Optimalized lib function"
>         default y
>         help
> -         Allows turn on optimalized library function (memcpy and memmove=
).
> +         Allows turn on optimized library function (memcpy and memmove).

here should be "functions" too

>           They are optimized by using word alignment. This will work
>           fine if both source and destination are aligned on the same
>           boundary. However, if they are aligned on different boundaries
> @@ -24,7 +24,7 @@ config OPT_LIB_ASM
>         depends on CPU_BIG_ENDIAN
>         default n
>         help
> -         Allows turn on optimalized library function (memcpy and memmove=
).
> +         Allows turn on optimized library function (memcpy and memmove).
>           Function are written in asm code.
>
>  # Definitions for MICROBLAZE0
> --
> 2.39.5

As Jonathan said. Send it separately and also the commit message
shouldn't be empty.

Thanks,
Michal



--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
