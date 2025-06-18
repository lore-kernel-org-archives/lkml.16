Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DEC2F530F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248675; cv=none; b=SeY2uhT89Q5lSOSuhNDhb2DQI5NHftwleWkJlMhH2gpll7j16BoIOm1Gu5X3xoR6dZEi1RCPJZIZhQHumtWcZ4Ydnq5IUB1AJ5omQkbuT/RuVnChD9VqEdsP4bDltFMaC216nnBCQ3HVP7vus6SrtFRGN0MIDeK0yeV8Tkp/tKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248675; c=relaxed/simple;
	bh=FWYpaVtWFt/wV0NEpD4ub0aYCg9BYIjeEtG50lAMb7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXLER+1LMEd8ZLdysNuB4VMuYlokOpAGKzISA8cXuMOnqwUB0GlK7A7lZBGDuAgq9QLWfttugRxM1YDw2TiM4HQ2jk8Zz5pJVHa43qG4ZayJEYlvAAGLoyQ3Q3MkhjWwPyJUv84q7IkrFMdYdLDrsTsZytTBg7arYgZPZYNxF5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jIZRrFet; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jIZRrFet"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b5165cf5so5788025e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248669; x=1750853469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWYpaVtWFt/wV0NEpD4ub0aYCg9BYIjeEtG50lAMb7s=;
        b=jIZRrFetpuq974/tt4EOn4W+sxEgg8ZIfQS6EqpPaXOGAhcHpQUpb89CwDZA4x7Nww
         WyKgh+9hysXI/CkDoJMXdEFexYw0x7FV7AWNzuSE2BA9f7VZeE2sOIXG8jsLwJJm/w7u
         aSpOIsfTsVs09Ke7NBhxwM74qzH45U1fLpMrThc1+FCp3qSe0MrWUg59y3GVj4Fw3sNF
         2znbJEHL327AlLNQiIXEC13WR2htGcTN3l2iiSBXMiwazeI1mgcHu9XT/XUr6DzdnwyO
         6ZmuaJBlfj8g4E0NxN/jiRHY8om24YyGDZIndUxQOReboGUCtTP+bTePNOOFlXYDDAn5
         Obdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248669; x=1750853469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWYpaVtWFt/wV0NEpD4ub0aYCg9BYIjeEtG50lAMb7s=;
        b=v9qK70IBAhApL3FEHtxllo7stzEGUQBzu/XRgDvOnHw9tmPIIekmxmRg1G8QsPWypU
         b11kfCI9hW3Ek3t1NMQMDnFKbVmDd4pzeyYWX9xPuH3bKZzSYqL/nUrqwr25RJ41YRDe
         Aa59rsQJMvr6/9EAHbKrCp8Uv5ndhbwu1F5K52rxPw1e1z7AVbYiNCK7amolcHKEA7aI
         QfUpwjgXktrYXLfRFsUGr4Hui3ZTudSJ3EPkwccljGHPmHTyaI2syuy9iLjNk0+m92jx
         Fs9ocLYpPwCDmNnJSXU7+Qc+1re3D4F2PtrTojQC4nVa1YBd4pQEmK8cllv6hDKn5JqO
         DX5g==
X-Forwarded-Encrypted: i=1; AJvYcCW/m4a/FiKR2SVqTihFfWDX1CBTarkoMS0h5JpC3AtORBln4SJjvgB525EaiAIDovEgYhCCS8Dx39qPfZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQy9uMxbRJkyFbZJeFopCqhzanpoW4K+W0lrCS+KpChrXEO7bW
	ujN8nNmn3e8oOVu+OmuJzFLXm4NAQvZhhFoO7H3u60e8C+dWCBaoEgKqklcntAMjcKTHlbmi6nf
	HLCgKRXxHizexCs5uD0zU0OMUJnIVRTUpvKUCTeWbBw==
X-Gm-Gg: ASbGnctqRdaVIJWLx4HJyw/57rVi2v/z2rU4xlpHDFIMDR4Be5DWzjMlB9q0kiCgaNR
	ayxm63fiaBTwERv+AEy3ol+S933yYM13kMr1YZuznt6lJnCgvSs/Cvxh+m7VsKVkjdad3GYlUm+
	ESefc8x/h4yVkk41ku6l36Hk43q4JhnvZEk/ge1wZsZsCENqWz+nYEgw==
X-Google-Smtp-Source: AGHT+IHqsFCtGz1gD38G6LZ5IHUVK4whWi9KUJsP4gSMoD7URfEaquUbgGET6oucxiZq/QgbCfiFUxgCyfeo8UdA5Eg=
X-Received: by 2002:a05:6512:3b0f:b0:553:b005:d0e7 with SMTP id
 2adb3069b0e04-553b6f46bc3mr4368865e87.53.1750248668764; Wed, 18 Jun 2025
 05:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612131927.127733-1-brgl@bgdev.pl>
In-Reply-To: <20250612131927.127733-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:10:57 +0200
X-Gm-Features: AX0GCFsm_8tRNBwlHeLFuDjmRbmAAT7xZjeqBj0vWNkAImbXF58tnQYSK1McFCE
Message-ID: <CACRpkdZ2uvw-r3SXHGkf7P+Wc-77itG0Rzn6Yc_2UUif37h3pw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: drop bouncing Lakshmi Sowjanya D
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The address for Lakshmi Sowjanya D: lakshmi.sowjanya.d@intel.com is
> bouncing. Drop it and mark the driver as orphaned.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied for fixes.

Yours,
Linus Walleij
