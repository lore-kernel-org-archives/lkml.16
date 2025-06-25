Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5AF17BEBF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863356; cv=none; b=IReM/OwOEo/4uw4MUM0tHTZ5B0C/2+eKg9E5cgbyVwR7chxTacskhKsOJSPTxA5/GmNb9eBqPgEn5AbyJNokJM1BnGESuk4+Ils62+t6Ikcs7SjIKtKAppboFa7KD2CqGt0hVYsm0ha4BZj2kKhD+7IqDemFsxM6JqyQSM97XJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863356; c=relaxed/simple;
	bh=jrBtoywouXF/4yYfXz6f2gT+dZfD6qO0490nSXgTbM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQIEgKsCg5N1MOa/AmczIT1Ps7LYu9DsoX+tQGqKWArUGfFjQTD1S8O35QqT1zS4sefL/Xo5NT+R2FXLj1uysc9AObbgQpOoyCIZqo7CdHzzcKxlHFrdNsA2401/IlObKgAoddzhjH1SNkJlB8DxxULHOSm/phiinkXQ+t1V6s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3USGO9Cx; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3USGO9Cx"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55351af2fc6so6864108e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750863353; x=1751468153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrBtoywouXF/4yYfXz6f2gT+dZfD6qO0490nSXgTbM0=;
        b=3USGO9CxYLwVCIgGOXUk8Xy6OtQJ5adXMT+EBIbjhWERKO2uu1V+R55zS5iP+qFi8+
         NK+nvZHlTHZxr9xYe2LBAIgMXH40zR/8rTUgbLNIWY+AnU6zwvI95ty3yXyXkXQD3VSW
         Pv9ZzPU7uLHKZzU411ISuf7tWJk+3qRSCVDjFAU1GR17T7FRUzcY6DRek7eANiv03KRa
         6KHnVewXrFAXXttVY83h7UiHaazMKQMQs7s/szhSKLjOq+E/4DY59Y9ewQcs296z099M
         BRcgpVE97GNy2bL2bCvuKQtNpoIihJ6fOaVsbxPNp2XY7QVush3pqB6d9R3Cejjl4sjs
         bZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863353; x=1751468153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrBtoywouXF/4yYfXz6f2gT+dZfD6qO0490nSXgTbM0=;
        b=JwxqjmDHQUCt0frfp0OvbxmO7pbuGTmGgodlcL/aY4cJGrqvqvJ8gC1cuOwZSxG4r8
         v4vlKYvMMMh2u5qirG6GYPTrpZg11e0JiUtnkzmoYemWRyyxZRgkhTeCHtr9VW5S8z8a
         +MDU0odcasG3py1MJuN1cml0mCYH1xsbudK4ZUZpuLPmlzFYzuEuoweLOhcgKP9Tj7RN
         umHMA+4eRgqNgXFdDmvDzWd7ZwCGlNQIzCRMK7UHlXaasz2fCp+V5Q/WBaUmiU2MabW8
         yolG7KQ171atTRAGmRJeuF+fqLStPxgmbzLpMtfQ1fXaicWGSme/AG+837i4l4siMkuP
         u15Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcYK48c0pAwEG/XarSVYqjITs/FnsIeheq3bXDZhOYegeB0VdFXLZ7uaItakAh8mfXe9IqdL0XOFsIt9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNixndKqYgXtAdGWYeey3vpCR21le5+vCs3EGRImRk2XFMRbtG
	x6/bob4jLOZOsuQ1k6kOS+MkVuzSiVlGItq4gpZ21aEjxAL/DVk4vLpBg+7rDri0qFXSkKwH5Sw
	NYo9pqP2y2ttDyeJtO3GuorRcS6hOfe7qGSF3zpVVQg==
X-Gm-Gg: ASbGncvVVzl7VOt3sIqBiIqmcsDMjGYiyqlnLLB1clIZ/ClFPULofe9FlvTmFv7f8ie
	lJLezttjxxp2Jsk8IZl01tTWboVFoMdHolFPcPSMrZhKp9ZqSs096QVWOpIR2ZkTue+0FI7Xag8
	jqxjJ0qAxBckFm3cbvFDjea90OOW+XniHAdFOS98ypl5Lk27v5Lnme7bux+Go8TZQCLUtpoDIk1
	ng=
X-Google-Smtp-Source: AGHT+IGAUq5gFTw7qUZjZn3rHuNNjUzgrTHXn3aPE83EdUFWdbkV7VelOsQBi1h7nliNA6yx9WJxaL/S6b9yacsmTDQ=
X-Received: by 2002:a05:6512:1591:b0:553:abe6:e3e7 with SMTP id
 2adb3069b0e04-554fdf5cefbmr1084123e87.47.1750863352960; Wed, 25 Jun 2025
 07:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
 <20250625-qcom-scm-race-v1-3-45601e1f248b@linaro.org> <efbe6c4d-cbf2-4749-8a3f-a69b2e4b726c@oss.qualcomm.com>
In-Reply-To: <efbe6c4d-cbf2-4749-8a3f-a69b2e4b726c@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 16:55:42 +0200
X-Gm-Features: Ac12FXwpw1VlRY373Rr5D8HNLBzbb_Agr5ioNTABVgBeHneEchkZKiZDcld1xlY
Message-ID: <CAMRc=McS2MceSr6OmZc4stVAmKd0=gAYUH4qCzZUDYQEYVFnFw@mail.gmail.com>
Subject: Re: [PATCH 3/4] firmware: qcom: scm: initialize tzmem before marking
 SCM as available
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 4:47=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/25/25 10:14 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Now that qcom_scm_shm_bridge_enable() uses the struct device passed to
> > it as argument to make the QCOM_SCM_MP_SHM_BRIDGE_ENABLE SCM call, we
> > can move the TZMem initialization before the assignment of the __scm
> > pointer in the SCM driver (which marks SCM as ready to users) thus
> > fixing the potential race between consumer calls and the memory pool
> > initialization.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> I'm not sure any user of tzmem ever checks qcom_scm_is_available()
>

Well, they all should, right? At least the ICE and fastrpc drivers do
check this from a quick glance. Also: every call that has more than 4
arguments will be an implicit user of tzmem.

Bartosz
