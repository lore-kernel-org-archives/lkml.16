Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EDF2E62B8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 23:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743723134; cv=none; b=neF9tczkB3GywFfozuWX/R6N417DY7EnyW2WY+tB9DaXni6PGF88U2vwPEGl5Dn2KwRBZ+kV4KhRxdV2tF2xqMypyqjQ1GoyUcb/KC+5A9AWBP2S5Lm/twUySG48zbihny6KzFiNc6+4y9FuA5WaRGTAIv3O2JFjBGYjv4MqMXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743723134; c=relaxed/simple;
	bh=ConqJ9yxOfg51AtX2KXDQrRifAARBrdGYo8uEJMersE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRBEYa0j/vA1BNqRmpuCb/kYQrTWvd2KYsa9IN2eGVB7AQ0TEpC1dqnLE/8Zc/icZcQRFovFE7rN8S1ehvgcyVXjz+bcyc+6AIRQIGdVV9gzoUbpG2U3QOczs72vwhORJlHRKbEsjmShJdEj0DMKyNJ6bQnKJsoSbZBLrCB/43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cm9yUWEZ; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm9yUWEZ"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523edc385caso668326e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 16:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743723131; x=1744327931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ConqJ9yxOfg51AtX2KXDQrRifAARBrdGYo8uEJMersE=;
        b=cm9yUWEZKsHsmv6Yw6EPDU+NyLGkXKcF4Lo0yw/4RdIGvHsPANaXmNqGyZbGvyfqk+
         xkLgsxr/467QqG8ebzs/nIrk9v07VXwqKlCW1m3BvAtOlbqvixlM8hGGQfMtwzd8vu4y
         hfmxgu8/80Y9cEnJZralDR6SSGqZ3DQNxMVjiDOUnzZL87sCqggxrbqF2/x/saeNDKnq
         Baj8gNarCNTfOsrzMLK1L+RWsvtOjMM4mVkjwhJDr8aBFqg0q9wwQw7ZxExf1h9ad7vS
         XQLDFsuyqWKka4KFbvwbzBktfBHdgRK9Vit/dMN5/WzG3qfxIaqBwcS+oGQoDcswsK/K
         9Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743723131; x=1744327931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ConqJ9yxOfg51AtX2KXDQrRifAARBrdGYo8uEJMersE=;
        b=qnpAm1JG/O2T9FAavthpdpGe3n16V5D5zldLygKzwkK8c8cIRaNho14fxYGYkrHauK
         JKfcZ72fVnnI99swroaAO0VcchwdmhjmUXyyFguWqEUFE6PxXagxE6RdOYMdsM4f5zRO
         +oCwz7kGA/+u5KqW03DUnlbnWs70gYqcpiYOA7qDV5u0VfbrbMniqMrDGI7d4KYKiD8R
         x0b1L8H9qyk+DhcUt1T5s6sdd+8M3R76/SKahO09xZKapFsucYeweqr7u4OCRbf7LGPI
         WiHwEuzW/FHZgLfdJyOWbHxGC/Ua24oMyJrs9CWjY9DHpvVQjujKdaymwuVIAUXURpwb
         LyaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcw+kMZ2o68RQOH9KX0INnVpQiWB2hghn8SwCs88CJjlVJYuW8N43LGmThBv3OvwKsly3jyJo/nBeve8A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkte4AXj02VQL29+E0kXPqyd4p5kvouq0X203dhWi2fu5Fghjv
	ZlnwBDIaLN8ixOPxTnQ4FRnoJMOz4rGWwsDsWfLMi2BQKyuaAxsvoc0GKbsjmPWT5cSrczhS+tp
	13E/V5HTHm8REY8BV+GyUOe2M4vo=
X-Gm-Gg: ASbGnctLoTs3bbefT9rkVVsybzc6qLQEIa2qoILOOUkllNAkl3mmw4oqs8gj+ApjKb9
	vZa9iSwugKC31Ej+xfHjjGnyldbGfwv4g8715vOaHF3EnrtYWLvg5Q2S9XJcDHdgXH5EIR9WhKi
	hdjDHo5fouZvH/pVXs+UdLkFmed04=
X-Google-Smtp-Source: AGHT+IHG8yvd4/Gvzr9bsPGoHBMSRP7NVpPpyONIrTuFi15RTw1YFf2XgcnaKkTPRoWR1r0MApg+ICHPmv4tFtGyyWI=
X-Received: by 2002:a05:6122:8c01:b0:523:7316:7f31 with SMTP id
 71dfb90a1353d-52764494388mr1303595e0c.5.1743723131626; Thu, 03 Apr 2025
 16:32:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
 <Z-6Nwp5RUdgYt55B@smile.fi.intel.com>
In-Reply-To: <Z-6Nwp5RUdgYt55B@smile.fi.intel.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 4 Apr 2025 00:32:01 +0100
X-Gm-Features: ATxdqUEbWVQJ00lu3HouPrhS-aMc9BZOWnPJCkk8kpjTlk_IjSIFvDUvpW1tCTw
Message-ID: <CADYq+fa4FxmiynHg7BJRCusr3V-GqofEEddzP9Zzg1muPXGdqQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] staging: media: Remove duplicate NULL tests on a
 value in pci
To: Andy Shevchenko <andy@kernel.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 2:31=E2=80=AFPM Andy Shevchenko <andy@kernel.org> wr=
ote:
>
> On Thu, Apr 03, 2025 at 02:26:41PM +0100, Abraham Samuel Adekunle wrote:
> > When a value has been tested for NULL in an expression, a
> > second NULL test on the same value in another expression
> > is unnecessary when the value has not been assigned NULL.
> >
> > Remove unnecessary duplicate NULL tests on the same value that
> > has previously been NULL tested.
> >
> > Found by Coccinelle
>
> Missing period. And Subject should be as simple as
>
> "media: atomisp: Remove ..."
>
> ...
>
> Please, send this patch separately from the others.
>
> --
Thank you very much for your review
Unfortunately I have been told I cannot work on the media driver as an
outreachy applicant.
I do appreciate your apparent reviews.
I will Cc your email when I apply your review to my rtl8723bs driver
patch of the patchset.
Thanks

Adekunle
