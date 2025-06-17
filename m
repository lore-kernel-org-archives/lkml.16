Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA432ED16D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175700; cv=none; b=BWv4NujParju25IG5cTrA3Y6AR3TmTB8EXNv7ryICJ36h1QkxQpSi5HR7jd2zJH/BloVbkjS2zc2/jFW0doOdo+6n2GS5W7AQzt9kQjd1E1UPleqk4BMq1TJOEK25oLTXDSo1nSONdIcOS0Z2J0gOfJ9C0FaINcWWhniO0M0oPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175700; c=relaxed/simple;
	bh=DgmeVtT0WIbCRRv339k+cmX+mpoOuUhSgcVes2asjCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4iFuxl5w61C6z1xCcc0Kx893Q8WzDKOGkwzCvvb2epyND5geB6f85LWP+9EzLvjSh5VAwYSJY92ldLOzXdXq3ZYs94amVDHSgguFoEtKLqR3ti8kmKS341ztT5CzFWU6XuW1iE1wFV697W3Qe++U2WMrVFbA4NWVCS5QIKbKc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=jxQ9Tce+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="jxQ9Tce+"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso3422578e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1750175696; x=1750780496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7491lPqRbW4F9hQ07LYAxQPIWHZ/u23nfZ8i+9TOWv8=;
        b=jxQ9Tce+Jm5wydAE+OuBCHVuQVG+bAH3Sm5XzdurWqbrFXWfIsilRrCao2Lwc7dyYS
         Ye5p2yq90E0uOqclB+pPx7qpWV+ipmC44j9d4uqjVENB7L3bAu3YOGJfQLQ3BDFW/1vb
         gprBw6qNJM67wst981izx5UwScG4SyOmS6R2cavF/D8fe7LstSeJycmOuL7/4krSecPv
         SStSJzkdDHfBWVijZ9y1qoQEEckvbrgc6R+HXLRUtgREqMq0+4GsV5wSb8AbXZLuvaP9
         2uHDmROXWP43FzNivkbRLp6uwvQ3LG63XqIvr+PaaPLM34FAJkq7s2POHcUEbxXSPaL+
         P+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175696; x=1750780496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7491lPqRbW4F9hQ07LYAxQPIWHZ/u23nfZ8i+9TOWv8=;
        b=lm1ihkXFk9EKZLKBVzPs2vWTu5iBmkB+eGHoeWXPm7eh4uy0QethhDzLhhV95bhRft
         RHDbqqvBk2kvlEYskLmYfTOOMuA0/DJhIA0vOP5CbhwRzhYQ5cP1dy6G8kVDNcSJYcJn
         hS2Z/hXTgkKJx92DDeGLZyNAn+of3sdBE09tVTxYu3jQswJmfdFuLU7Hdpc/1xRSMlL/
         2Uj2/UgjO/8XBHn+82gmDaSUCC8wlQpD8DQKxTLQHtnjuES8KXSfyZ00aukNM6xncU/8
         etRuLklpW966i25gOnEYYYppLUxzwdc3lrKlPJIaKiO3g/w5/6DvEcZiePyzceUTW6MW
         fYcw==
X-Forwarded-Encrypted: i=1; AJvYcCWEGi5G94l7xcUs8nvd4hm90stRj2RUEGY8ugQsis4V+0IG650iOgkMcT/lrgwQE5daXB6qX8D1g9ZY6bY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXYPQA0wcwXKEeNpBv+/L6OGq4VoMopRUTeHY4pBZer+QNhHeA
	yq7AIrlno7T2SRhIBSKfDpZXaOjMxyO4mJPBP0DD4ow0F7i84gk+Eg+32ga1TVY+PBuLICPsM1W
	tph3AqUpGYCz2ges3s+mi05mdLYTE9cVTFm6d0rL2
X-Gm-Gg: ASbGncuBhg//maNzP2PfF8TSPZ4vD0NowYHnIkeTxnUCFA6/mDyHFyJdp9Kx3gEzS3R
	y8ZMGNd0l32BMg4PoI8AvollkZnCuKV1UJcmbP0LfUK5N99xm9IOLOypY9wa6G/JKWxeyLEbuyx
	o2S4RCMznHXG6ur+JinzoM2g7e2ybRH9H1MlqUt3Jdxvokb4CeI84k
X-Google-Smtp-Source: AGHT+IHb1aCFJPoJFf9UDRiwIVaRVYSfkm4626qafulBbisD0pCHZaBHpY5By1h92m6KS0F+VPFALhCVjE9/87XOTQY=
X-Received: by 2002:a05:6512:398b:b0:553:3532:5b30 with SMTP id
 2adb3069b0e04-553b6f1377cmr3734810e87.27.1750175696058; Tue, 17 Jun 2025
 08:54:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
 <20250520-linux-stable-tps6594-pwrbutton-v1-2-0cc5c6e0415c@criticallink.com> <20250613140913.GF897353@google.com>
In-Reply-To: <20250613140913.GF897353@google.com>
From: Job Sava <jsava@criticallink.com>
Date: Tue, 17 Jun 2025 11:54:42 -0400
X-Gm-Features: Ac12FXyfNbK2pB7IPkCZD5SA804DLNcmvGU99uvVPgKiMdJy7x-SejG9WptqFuo
Message-ID: <CAKMwjwSuPRZO2Oyy56C-_QCf-gh-jcCmW_Xc8NCQ+yioRTumNA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mfd: tps6594-pwrbutton: Add powerbutton functionality
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Julien Panis <jpanis@baylibre.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	jcormier@criticallink.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:09=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 20 May 2025, Job Sava wrote:
>
> > TPS6594 defines two interrupts for the powerbutton one for push and
> > one for release.
> >
> > This driver is very simple in that it maps the push interrupt to a key
> > input and the release interrupt to a key release.
> >
> > Signed-off-by: Job Sava <jsava@criticallink.com>
> > ---
> >  drivers/input/misc/Kconfig             |  10 +++
> >  drivers/input/misc/Makefile            |   1 +
> >  drivers/input/misc/tps6594-pwrbutton.c | 126 +++++++++++++++++++++++++=
++++++++
> >  drivers/mfd/tps6594-core.c             |  25 ++++++-
>
> This should be a separate patch.

Hello Lee,

Thank you for the response!

Sure thing I will convert this into a separate patch.

Best Regards,
- Job

>
> >  4 files changed, 160 insertions(+), 2 deletions(-)
>
> [...]
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
