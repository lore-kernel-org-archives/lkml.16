Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114071FCCE4;
	Thu,  6 Feb 2025 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833844; cv=none; b=blf0nWPrysKkU8nr4wEWAS7A6SZQZcdfnEEKI2goDxO/GHuk/jCy2OjIQkdcJTssDLpeZ3jivaK8/KUuYrEyXzjEenAE3xee9DMRL4B7VOgSz2CVVuu8/KqGiqbHNG5zCgGzcdYtfozIvn4BRPiV625Ff5S3rGCd0fPCBbDGMF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833844; c=relaxed/simple;
	bh=cBrVqE/Ai4gYO2AtRV7S8oVyTssm0+1D47OVtk82Czc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vGdsXLO03MS0rZHXj6yw94YAK9FV+vqU0SPVQISJoSSwZBbANzzeeXPeafZZdLZkGVrrZme/GoZ3oRI0mqm6y6L0MJ2DyJcopwTvXWVnq+ZcE1ao6LZbjIyRp0HFio8CO/ybYJlSP06N7lZJwCDMRqCfvnxOpDr8QrQquu/jWs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9XOeX5n; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9XOeX5n"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f9bd7c480eso1216507a91.1;
        Thu, 06 Feb 2025 01:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738833842; x=1739438642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBrVqE/Ai4gYO2AtRV7S8oVyTssm0+1D47OVtk82Czc=;
        b=j9XOeX5nUVz7nvls0K/+RlEkmm1AfP9OC7VspUPRAER3b7qMmSmMumnjB/KdcEMB9g
         osMko9MtszGKxR/wlLqLEC3X46IdbHqu5oBcFYPLH1L+RoJWBuCrL045YUY/DWBzBG86
         wTymq4Um+8iWrlZ3P5b1l0W3YCQKx3oxdQrLbh85cpN01JPB7VIwI6SrwtAnarLXQdgM
         +PqFNxm0iijVJK/pjpVVcnEcgAaE5AVPtsGYwnEScy2Jxhs4z9RrttsCuh+5qB4C5HJ+
         V+/EKkQYmI2CysL17hnOZSf9DHm9xra1o+zv62VAAqw4kTQ3ACeUsYL+qnUOY3SoVGRD
         lzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738833842; x=1739438642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBrVqE/Ai4gYO2AtRV7S8oVyTssm0+1D47OVtk82Czc=;
        b=D+57FMiagwS070mC/WCjV2IgXLY/tCLAbbhcH/77IyTYAEwKumfXjgRrQNl6xLJWAk
         JRHvXer6EueYY1TSeCRMri3JsFEnCqEuKZ8W8UyQ8smyePtJehs7eou1evRF/MLfLX3p
         Fjfx70/YrG9JYLVbZ+i0lEN4h/MtblsRJbaAv+aZZmLNOOk/lTz0qqGuhTqhGhg/ZseK
         17YwF120iHDboZJF4XFettpWJusbAf2O+ro3tPMEzdLaIromSb2q7G1VbDAwuSqu3iFX
         HuEGDiM8+qUiuoGqCXWTTp1aO4rcCSq2oVwGYWCHkGvHenVzfJHHxFI/kFGggnzxgRmq
         msZw==
X-Forwarded-Encrypted: i=1; AJvYcCV44Y08T9ZB/PuydJvHGUg26FkBkali4euiEhjVlWH9G7UBITAf7LCfZo5P/Ye3Se+i8ZmtFysMP4b6gbA=@vger.kernel.org, AJvYcCXu9JHbg+2zM4NhJ6AneeMEAoSe/UBWPfZjQ06oRJdgVyaIKjfp+P62RG2cZQ3zfyTHmPXHCJS7gknpraA=@vger.kernel.org
X-Gm-Message-State: AOJu0YymJuwj200MCLhp1Nn0BM7o7MB+E5h10nydoStxnybff2Nsm8uZ
	2YpijIhiDXBXoUhZQ4VW4yo3bjeZVJBjv8o8qsTEwT3UZfKOaqFqH79Ko6nRVyY31OMiCkVr5sX
	IOMROcsr3efLgjBQIjbs3WXryJaA=
X-Gm-Gg: ASbGnctB7bjd8M4KqTNAMJMxjBFIVK6KitzKiMNGJ9HfAaSsAMUvLKt+xp5tSoT+lw4
	BwF9M1zNlZTngGuKhuCb0jzegrwYLARbPkIP7YOGZyl8w3Sn28KdmcQwYZbcXJiXPrdWdWw==
X-Google-Smtp-Source: AGHT+IG1UyaKQAQJbeN4KZGYIOs3VNjrkC3xVxry+u2Wb/QFb/6PDyHk7CdpY+0ZJkhj4OcqqOOJQKsYVX+5bc0fZQ0=
X-Received: by 2002:a17:90b:48cc:b0:2ee:aef4:2c5d with SMTP id
 98e67ed59e1d1-2f9e0810794mr8432938a91.26.1738833842188; Thu, 06 Feb 2025
 01:24:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205062444.1694810-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250205062444.1694810-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 6 Feb 2025 11:25:33 +0200
X-Gm-Features: AWEUYZmDUymm73unsdmbrTmXdaPc_qVh7iTw8Y2NHH7ijEwSdRi_QIcSX6j2Vxs
Message-ID: <CAEnQRZArZK7sbUUPmPb9khfLVk4JSvn5ARwEh0MCPvyU9D=xMA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dmic: Add DSD big endian format support
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 8:27=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> Add DSD big endian format support in this generic dmic driver:
> DSD_U16_BE and DSD_U32_BE.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
