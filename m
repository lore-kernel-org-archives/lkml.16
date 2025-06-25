Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7B22D8DC0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878908; cv=none; b=T1HbnELUGC8l8V+DyuFP3obI2T6WvAzP8BpNs0v6GDwF50P4xUYO/9SQglOQZx9QJoFvuT6FtdGp16V03TPxGWo7zyiBKrcNe8WJmP3h/P7soHs5mW05A68BRwa1lVAdt7wuZ7rNOr6tpvpMwCQA/ojcQtlBKlJ4l5WAKkvtoMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878908; c=relaxed/simple;
	bh=ZovO7nkOrLL9nxNDPkAositSdpf1H/zY80uV73Q8ZrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ru6YbMyQECTX/i5HyKcYLF9CzYgL8ftbz14etGTcvaDjn1w2Ew8bgsSRU9efdEDr86Dsr1Tycr/R4bpcUbWxYIupB5q1tUdfBIdi4fa58pzXn4dbgciR0PsvRxutq6waESPa65+lJsvTP/mZyTEcKqAWTe7C/9/baNKkDVtxSLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fLpnq0jh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fLpnq0jh"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5532a30ac45so277687e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750878904; x=1751483704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+nO7EW7s/VWpRpXMmnbCZRaJqIoHvIZE+sg3t4NDGI=;
        b=fLpnq0jhBTUamh1+q29Gn67BH6xXxBTITB4Nl0+VAeH1Wok6gSKFqJ/pZOmjhnqcch
         vBQb67m9FqdpsMJrpYGsYrxPlSTu2VJ2lCXHuS77uH+oj+icHS5FKI5wDL/P8AJEoG94
         WWhMh50ATqDziJ0L37/cj40nzj9FWgyGn7pUNA0DLSO99VCSezCvgkGOxcr5z5MWRu3L
         RbZFU5SGo5bqyNISRsn4VJBN9hfr5zuWX0hcg4gADRcu76YdEz7QuoNsSIeXY/27SHWn
         FQeLnSSFvR+azacn676//wnbO723oskygb9BpImAQEf97nQx0LG3qMfvmxOg+rGzYoLc
         9Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750878904; x=1751483704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+nO7EW7s/VWpRpXMmnbCZRaJqIoHvIZE+sg3t4NDGI=;
        b=pVdkj2quVh1LimGoP8h0c1me0L1nh25MCx3ILKzImd6Vx8vB1rxsuGqSA0Pf3vqTYW
         dWMQSUejATM4cGKzJrpyefZ0D1wOyiWUH0/crHp/hsf0kX8flr1G173N9TaXJXQEsxEQ
         FJAaTajCs9iVRU3E1wvp6f+l/h/j9sNuh4pi/sON7ETveRsziFvKH0FvhptcCgZ9zwWh
         3KPWKNl2obDWN6J/VOWNWdjVck6R5yUIQmUsyIzgsi5dwav9kU8Sgy/v9LKW3F+UyVzh
         vl/4jxmin6Xo3McEW1/KtE2xk4f9C4ipY6/JBbUL/yrNI6orHRZ88L1mxFJcUWhC4VFT
         namw==
X-Forwarded-Encrypted: i=1; AJvYcCUD7/etR0mJrRes21JkIXZ/21GlXtYdqI/zeD5xaauRBWbQuNAERi9iA1mhcd/gFKdiYwub2XncbaQyIYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZFK+CzG5tKUuotJDWGFgclb5E2+SpSfVE9RMuA6pYXXXjXLWD
	inS6oO4NXRMlIHeZRXrAL1ZWeIq3WU1LiN/bJmweCA5d03TOPhItLrS3RgTW4bYfqzbeHHsDK9H
	uhNIUZmV+1D0Gadj/DMTlsHxwYHcF7VdyVVH6Xe+NbQ==
X-Gm-Gg: ASbGncszcj+5mZu2rGvdR6tsgKgT6udzeNYcOcyKJcTxciXzXzJ4Xa2thAWekzF+Fas
	jnNKD39aUuOI+Sv7wH4+yHDMfBNyGYYMtRc/TpMZoLaq/Hyx9Eqf2IHmkfGpeSp90oqHxqtdoJH
	marceIltk2i1yU7EF3g9k9bI94XBm6FkZaYWENRXY09pVU3ASw2pw0JV+nQaj8CQtKC3lHxvSHT
	mc=
X-Google-Smtp-Source: AGHT+IHiy8uQHEJstlc44iLzXYCv+/voqeXmoVlZJZj8RwfXYP5wtTyCCwGrLUkGxOoxzeeSzpmhiDT6FCJq3MOd9Vs=
X-Received: by 2002:a05:6512:3b97:b0:550:d4fc:a0d with SMTP id
 2adb3069b0e04-55502caae30mr266969e87.24.1750878903790; Wed, 25 Jun 2025
 12:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-topic-wcn6855_pwrseq-v1-1-cfb96d599ff8@oss.qualcomm.com>
In-Reply-To: <20250625-topic-wcn6855_pwrseq-v1-1-cfb96d599ff8@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 21:14:52 +0200
X-Gm-Features: Ac12FXydmvIBgtZ0Bi7QXSKV1DZmvRjRc8QGW87jPOBPQsfn7d_l6wCJbPac4qE
Message-ID: <CAMRc=MeUU842TVDsPNn_Wcy8KtCQ_nz0qYt+muQJEn87g0kS+g@mail.gmail.com>
Subject: Re: [PATCH] power: sequencing: qcom-wcn: Fix bluetooth-wifi copypasta
 for WCN6855
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 5:55=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Prevent a name conflict (which is surprisingly not caught by the
> framework).
>
> Fixes: bd4c8bafcf50 ("power: sequencing: qcom-wcn: improve support for wc=
n6855")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/pwrseq-qcom-wcn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/s=
equencing/pwrseq-qcom-wcn.c
> index e8f5030f2639a69254ad5efe0a313d2f3d10fa1d..7d8d6b3407495c28a780d5bb0=
668b2b35837b48a 100644
> --- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
> +++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
> @@ -155,7 +155,7 @@ static const struct pwrseq_unit_data pwrseq_qcom_wcn_=
bt_unit_data =3D {
>  };
>
>  static const struct pwrseq_unit_data pwrseq_qcom_wcn6855_bt_unit_data =
=3D {
> -       .name =3D "wlan-enable",
> +       .name =3D "bluetooth-enable",
>         .deps =3D pwrseq_qcom_wcn6855_unit_deps,
>         .enable =3D pwrseq_qcom_wcn_bt_enable,
>         .disable =3D pwrseq_qcom_wcn_bt_disable,
>
> ---

Thanks for the catch. Unlike target names, the unit names are mostly
for human convenience. That's why it didn't really break anything. If
you have no objections, I will queue it for v6.17 as I have already a
bunch of changes queued up and there's no point bothering Torvalds
with a one-liner that's not urgent.

Bartosz
