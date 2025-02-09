Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5918214A619
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739098248; cv=none; b=PUYFgfsTQ0XFF9PM4IVEMLivgtFYmpzIgEHkw6LGwgcfS1doithKlfepMtRuhsdkI560neflKD6lGir7gQgEF8yyVD9ik1frZrwL9S+2jMLbAHirOd30NAX5KLyPfwoNJl/QXuL9RLtPth4FyPuLM1TTMz+SlxWfa6d9K2cD/xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739098248; c=relaxed/simple;
	bh=r2fNX8jXTrmClDffUPWS9Nyrk9owTWmYmVsTLUmM6cY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8pWRCnxzOfR8KFZPFMSbW6m7sZDzEmg57p/KFYYQNj49SVCEeg/lrWD34mPjtYTGbe2qQgYla2wLkF1BtmBXN3uf1Bt2YXbqt/AlgwUa9EuAVV8INooGWncyAyqfpptNDHqh2sJ+yEgMnsV4ncJY7NEBpOE5WAg69ZcL01xwvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7a342ef4eso201558366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 02:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739098243; x=1739703043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MH62dPG8Qx2NOdEQyz+qopTma+UfkmuG4FC6VlOsB4M=;
        b=jc8yh5udsBGPxXgQguZ/5PJjB9DEJKlJdhxqr+aCEumAigoWEyk2ycjv2wBUg+3M6O
         4IpmsIRgxZGX9wEIIzKyNoGaa6kPXOL4p6FxPPK8Jujq1drfueJd5kZfxnJir7wGmL5R
         GNE93yaW0dHd6XQKKRctsshRWsIL6DRJ7xwKrdFbS9yodImySHrOdiizgsL1VhVjslVe
         o9Q/3B936qmCXKJwiZoalCyjk3FNcxk6oQbNa1EEm8AshUfkuYx2ECf6JmCAxDes/ulI
         zHvj873MPGsTocfhc6f/huhKSatGdjwXiIN7Mc42HLpkRgYAQkF8eC85CqKtWK4ZI7lh
         kimg==
X-Forwarded-Encrypted: i=1; AJvYcCXboRJ3N/812O44TjxPTQuR8IMmDrYHakh+SQYG3tWoYciD1GEhYXLCIpGrGO54s8gpeEhK5sEkygOTuiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+bA3akhE2iSzhe4HvrcfV4w9RrCFttl7Vo9IvMSVcwh275IMy
	dcRrn49FbhA1iTY55fdb3q18kz490T07ch89ROrw0TDfh512mguiJYzf9wo3vK8=
X-Gm-Gg: ASbGncv/W/nUVO/cAM/jeSlV2EXZeFoqQUp8vaSIpjmQ577Z3hVxGHPR29xNdsWG5j/
	Rq14cUuFY5+AaJUAd9e0wNw0+tMvaD1CBk+/K2m/hsB26e0+ByvZsUkvZyPNQNc9JlWjGKrXzUV
	6fR8LRv367cE4USahdl/YUWFrREeDkaHQefuHmg6RRVRuZzBPAt0aPKETQD8On2QVa66DSGdaJF
	zzD7YfT7OvgqrKRCHUummnX1A/KhM4S7ngSVmmPJxPq2Qwe72gc/9I63SkqBDCjVlD3gJ3Q55ul
	YoJE/0ftIky2ClxxNoPX7BQT1bky70bHoW3KXOZ4Pr7shA==
X-Google-Smtp-Source: AGHT+IFupH2pW4piin54V2Toxvk3OaS4pTh707rNG6p1KxhZe2o6KCYMhORyxHL00rdvV6pJniYfzg==
X-Received: by 2002:a17:907:948a:b0:aac:29a:2817 with SMTP id a640c23a62f3a-ab789b22c1dmr905985666b.26.1739098243133;
        Sun, 09 Feb 2025 02:50:43 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b4aba036sm110116866b.45.2025.02.09.02.50.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 02:50:42 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5de51a735acso3456468a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 02:50:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4jR+lzKgGsX/DWEMLvJftpAs6FwxSoFx0gz2wvUZA5bmidKKIFcbQyXgq2D1lIAR2flek/oV4i63UPLQ=@vger.kernel.org
X-Received: by 2002:a05:6402:a01c:b0:5dc:72e1:63ee with SMTP id
 4fb4d7f45d1cf-5de44feb981mr12484432a12.6.1739098242289; Sun, 09 Feb 2025
 02:50:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
In-Reply-To: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 05:50:05 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9jsvunbpVm9GsQ_wpFUgKyH247AZDmV+p6_=1ZkGvFLQ@mail.gmail.com>
X-Gm-Features: AWEUYZkzBEpN98q4APsDMBtXemAu5dO3ythzUVqUMjRkDuNKl2rdcSvtKwaJNsM
Message-ID: <CAEg-Je9jsvunbpVm9GsQ_wpFUgKyH247AZDmV+p6_=1ZkGvFLQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: arm: apple: Add myself as maintainer
To: Janne Grunau <j@jannau.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	soc@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 4:22=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Sven and I have agreed to share the maintainership for the ARM/APPLE
> platform after Marcan's step down. I'm handling the downstream Asahi
> Linux tree since April 2024 and worked on or wrote several drivers for
> the platform.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2594c2300f9b054a6d57ce069120df0bb451d88..9987cbc4d14b2d2be43f25968=
8c7791ecfd10423 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2210,6 +2210,7 @@ F:        sound/soc/codecs/ssm3515.c
>
>  ARM/APPLE MACHINE SUPPORT
>  M:     Sven Peter <sven@svenpeter.dev>
> +M:     Janne Grunau <j@jannau.net>
>  R:     Alyssa Rosenzweig <alyssa@rosenzweig.io>
>  L:     asahi@lists.linux.dev
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>
> ---
> base-commit: 7635a78a95dc3bff39e9c49b34108f81a9bb62db
> change-id: 20250208-maint-soc-apple-8d2498e75509
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>
>

I've been engaging with Janne regularly for the past year and a half
as part of the Fedora Asahi Remix kernel work with good success, so
I'm happy to see this for the upstream mainline tree.

Acked-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
