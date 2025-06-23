Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190CF286D46;
	Mon, 23 Jun 2025 16:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695865; cv=none; b=AegNYsjd5Ffc0gYGvxemKdJK8ao7SmR6Yn+Twudr/wk9Ldwd24IGuHzPw5zKfBhcCvy+s2AmPzGJtXNixwBNKaBpXG+f4uLXp3WzuuSphryypS/6Pg6sL9qEew7ajR0bjKLDHLWpHfg9IbA1pr47PCTtyP/5PZGKSDJc7J+tBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695865; c=relaxed/simple;
	bh=cjdASwPYplbNZXNM+F4lhH/s/Q7yqAnn7Wae0U2HTpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEj0mhGAAonMiJxtyNFSuP6JrBBdRD/TTq4BvHR8iwUwkkHzcgtCRyNnkMjph3BxzlttJfWOHSRve1AS22oUB/LKjhgjva+iuLyMOVpAoR6trdSRYTCLFetJSWRcdGUIMku75hnzz2qT5IqvHwdy3vpHqutiAU788plnPMxRUps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+OOPl54; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+OOPl54"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-237d849253fso6835795ad.1;
        Mon, 23 Jun 2025 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750695863; x=1751300663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HXxEgsvpcVOGzEhHDysn3u3lzhqwIm266G2/TbSC1o=;
        b=W+OOPl54v2eK6dqmF7J8kU/acCKGbz7fMW80Dfcoc4zAkoQYSNuoM6UdvdHuofPmaf
         3B24jyF2WqQPceeiWgiVmbIHkOv4jcESgi3h033qzrDGjiIIRKW6OggssQLyXbvAISAJ
         bLZpZ5owBh8LI7BWJ58aZPv/7zcTtTInUN3ImEAPoHddHbLZ9By3kvGgEUFPJOs/5csV
         C7WEiGdb4AJgZcY9WBvyPPNIPos2ENVqRlzCeoJPfthjkZxX7UvfUhAjW5Y/QWdKoX5W
         iCYG6lZjPYDn/603qxoSyV0GWn4Rdhuy6RJfLjUGvhzUpC/4XxF6HTx5y7yLnLaI7RsW
         IWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695863; x=1751300663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HXxEgsvpcVOGzEhHDysn3u3lzhqwIm266G2/TbSC1o=;
        b=VrarXLY+UKIEBum4xsvF66OZYmssE/g5yo2JNI0zSL76GwWSTay2+Bi4tN323NW7E5
         ZQ48OTuE7QWazEFUAa9ig9/lcwzoKJLlYKD8bHbqUblaWh7OUdS+dB2oHmAOAbXsfK/j
         oAy6qGnXTIPaf3yL3KDar0ZBGC+t50nxsDr8tPWOYO0iFq22lAyUVok3zVbGM9F4aUxh
         xeTEIxEXDCLg7Tsr581KZWGL9zfZeE8aM+PzCtitXNbswi+Cae5sKeqYmB2JGB3j+U7M
         TCv0Yg+/P5wLmn8wEU4Oyd2mCw1IO3A6wPgXH9Df5R9PLwPuZ7VGZW+nWiiUdQ22YurH
         37sg==
X-Forwarded-Encrypted: i=1; AJvYcCVO4wexkGdFAk+I/yyGLiBdK77pULXHda90qtuWn5nC+3rSTl1A6mRUuX4VzMd9UcZQiV3Aa9xIX6Mbg9e67Jk=@vger.kernel.org, AJvYcCWMl40vYVCj1ds4t3vKJtbH/owkOidpwtA84ZV6fDe9QIFdDsMTlM9rdWH2Sg0LvRllezd+HdWf25fRfhsy@vger.kernel.org
X-Gm-Message-State: AOJu0YyQFlvUBmc4kxtw22J5r6g6SFTi59E8+/0hYJaX6z/Xv5eUeh3X
	CLWl4CCZMuyy1JY89aB6N5SJCFK830TG9vKuoUz8egr9yFPaHEXHOizpidwlu3EGplk0UZUbJ7Z
	73/Tsb6FvYIDYs6zjB7oWwkSTS5SP+gD53w==
X-Gm-Gg: ASbGncv1YEMDJnmBX/WVM+GAHWR3PyUlgz8fmNn7hk9iPiIi3oNYICrm+k6ORBDKOnI
	3ocBTGgJiKpW9JcCFPgDYCI9i/GIwsVIbJjaNuxy6qV1U05QFfvge1EFmsLbeETuBYBf9i+/VZL
	DVB8dv2n6jr/K2dkWTMurRq1Lrviz4Ly7h9wHfUj6cJWJO
X-Google-Smtp-Source: AGHT+IHRBD5NsjWiDv+77SKSa7pKnaFs1NEZIqgFAICeUK481K54Myl2oxEEp7SX2igzgN7bTePX9jgv/Vq40226rOg=
X-Received: by 2002:a17:90b:6c4:b0:312:e9d:4001 with SMTP id
 98e67ed59e1d1-3159d8f9d84mr7720373a91.8.1750695863302; Mon, 23 Jun 2025
 09:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623084108.29627-1-colin.i.king@gmail.com>
In-Reply-To: <20250623084108.29627-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Jun 2025 12:24:11 -0400
X-Gm-Features: AX0GCFtNfLLS8D_rr8yg1ilZOe8LQ0F3ff5f3iHikmyfb7k5C8NYRXQQOBwEkBc
Message-ID: <CADnq5_Pnxgp92v+gKupG+8985d_NCU7kvO+VpC0b0yqoHoZa8A@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd: Fix spelling mistake "correctalbe" -> "correctable"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mario Limonciello <mario.limonciello@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks.

Alex

On Mon, Jun 23, 2025 at 4:41=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in a pr_info message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 7f8fa69300bf..eaf95ee5148a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2281,7 +2281,7 @@ static void amdgpu_init_debug_options(struct amdgpu=
_device *adev)
>         }
>
>         if (amdgpu_debug_mask & AMDGPU_DEBUG_DISABLE_RAS_CE_LOG) {
> -               pr_info("debug: disable kernel logs of correctalbe errors=
\n");
> +               pr_info("debug: disable kernel logs of correctable errors=
\n");
>                 adev->debug_disable_ce_logs =3D true;
>         }
>  }
> --
> 2.50.0
>
