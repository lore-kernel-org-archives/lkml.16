Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86714218596
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319523; cv=none; b=Oe4z1NA6s5nCfgfK5jX6ILMSx/HpG+rGi3Ne3i06QyMqL57EzUBrAXv0vMVy70pkXJBKQ7kChZgFFTjJ+uD2Ul+4EmawIgJfaDEOB45F8EWHe4zZPK5HiKFw5iJ8BaefALbDHu3aIkwBWo0HHrmes0n+kYLcuxSNH6Arkc1BNNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319523; c=relaxed/simple;
	bh=7mQQX0g/RXBoYey7jHVoGxTSFtEhgzlZ2xKLsOSPaOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ReVn0mT0HNpxRXtGm5Mev1TnO8CDNSZmG3TQwSWL8GxTH3HcM0b1VBMneTgzvMU4hkkQqg/+gNdrU9mn88YBmdjhmnxloN24xj6B+8OLdmqB97xn3YJ+P3/A3R56INnAvz3ysvnUuw3Z3yD7JvdEYSN1h783ajrZ5FHZxHtFnVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bnO8TB91; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bnO8TB91"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b6a349ccso457118e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750319519; x=1750924319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mQQX0g/RXBoYey7jHVoGxTSFtEhgzlZ2xKLsOSPaOg=;
        b=bnO8TB91+bqkCFtzVBCIsOhc02OTDTmRRCSBYqU3GSPneYpVvvaff7+B8i9Ez/7W5B
         FnJRV+isIylWBbWVTd5QPuVKbFOK4wIJDsOvwlFaazre+3Gie4lwgooaXNGTae3YfAN7
         6WwrQznORydJrN7fGvAvwFi9ugGvRsyHYhMGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750319519; x=1750924319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mQQX0g/RXBoYey7jHVoGxTSFtEhgzlZ2xKLsOSPaOg=;
        b=ZEoozp3GCs+LfZJ3tggGPuPj1z8YPnAUowOE9u8Llz4ubIyGaFzqkYCphRF37V1ulH
         p6fk7B19Z6VrjSi3WJupvR4WQjuUAaepNN/S3T2jMdTQ0OLc4Oy5ddGgCpv6fOOcO1UK
         pqzqjNgISJ1ph6Uw0qb9aj+xxlB/PGfevL9aIPPtdjGGN+BKhLx36FB0OImGZY8Hudqp
         SOlwpTeBU8bx3zvb+HKfi+Q7W2aE3Fn1FMpkG0T8JpPeAEdyZy8xNqfMnUwKIJWUEgQq
         ErGCAznL0KtP7TRpi2rVPnFsNyN3QSAIzAQqKmorPle20hhISVzryPo5IiuYSeBlyqXD
         1lpg==
X-Forwarded-Encrypted: i=1; AJvYcCWizDxLmyjGj6266UYheT6tZEP361Exc5vmcXCuGQpIxxfT74tg3imG8VVdXlDCXKL9QaQsL7AxUGntjQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBjoJy4HPqk6rd9Tw6ryiVz8wsY0V8bTb73U9DL6msm6xEKoHm
	E1puDCL3G0U7WZiSA4AC9J8pYgYqkG3D02ZL1B5we+Hoi1LjwRtXlR4CUP5XmarOcpyil9WcO7P
	78G3komf+i2rteO5H8H6olNB2y+smC8Uuoiyf0FoC
X-Gm-Gg: ASbGncttArVkQgfLwP5xC0g2WUaoSWnv99wiN6EH29JxkzxOkKMoCoQ02+cloDD2LG4
	lMWnBZ42qsEm50omQLEEgQh5aM7e33Y+EWO3hlOIboQEhbQb0rEGixh9YL8rPZ1gSdubH6thTYg
	7pWuiTDNoP1o/+J1b1rC23WEc+eloYna8oL0zqgGdTTBKd8j/h2obBymxG7lwoaciYdpH4whg=
X-Google-Smtp-Source: AGHT+IGKSw6WMdR9IoIRey67gW5v3Kd28RATCpIk0gj4cgp0HNOfe/nKQSJBKksAip/SsLckx6UbC9sCyZs1uSNHQ90=
X-Received: by 2002:a05:6512:6ca:b0:553:6488:fa56 with SMTP id
 2adb3069b0e04-553b6f42225mr6061529e87.43.1750319519609; Thu, 19 Jun 2025
 00:51:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318102259.189289-1-laura.nao@collabora.com>
 <20250318102259.189289-3-laura.nao@collabora.com> <CAGXv+5E-G0BY5q_EsxOkEEJvqXaX5=Y9PWqNbwysLEFfU-UmAg@mail.gmail.com>
In-Reply-To: <CAGXv+5E-G0BY5q_EsxOkEEJvqXaX5=Y9PWqNbwysLEFfU-UmAg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Jun 2025 15:51:48 +0800
X-Gm-Features: AX0GCFshC_lgMp9vezDeihTD0kDhQFAT31Y9bBRKASrIpMKtnPIy3f3lDgJ-TQs
Message-ID: <CAGXv+5Ff8jFqURizywr7NedprytSoCz9HvaW__v_Q1LcuzMxrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8192-asurada-spherion: Mark
 trackpads as fail-needs-probe
To: angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	nfraprado@collabora.com, kernel@collabora.com, 
	Laura Nao <laura.nao@collabora.com>, matthias.bgg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Wed, Mar 19, 2025 at 12:23=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Tue, Mar 18, 2025 at 6:26=E2=80=AFPM Laura Nao <laura.nao@collabora.co=
m> wrote:
> >
> > Different Spherion variants use different trackpads on the same I2C2
> > bus. Instead of enabling all of them by default, mark them as
> > "fail-needs-probe" and let the implementation determine which one is
> > actually present.
> >
> > Additionally, move the trackpad pinctrl entry back to the individual
> > trackpad nodes.
> >
> > Signed-off-by: Laura Nao <laura.nao@collabora.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

It looks like this patch has fallen through the cracks.
Could you pick it up?


Thanks
ChenYu
