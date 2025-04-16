Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E72221FDC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801843; cv=none; b=G4ljCaIkw/Yo3jOMvQsvwQClbRB5pzqHutrpifPm1ovFvS7/2RciNgf2eJ+o+nKa1NnKUQxnONPd75+qvnrW+ZR9ou8K4WMtpBcPtmA4ww4PuKneQCABg4zXHPjWSC0K/lyP/BIVCM8i7aOEKm2rmEHJBLeVw2N4ezseWlW5M0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801843; c=relaxed/simple;
	bh=aIHTdtXrovcQwqqIHpPrWRuVUu+VYl3tEmr74h/OJDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjkmOrNgG+rOypc7UWut/TSKUHdP/mZX+sgbeZMbXIuYBZWlmHZH4OzZv4Ruz4016uqSDTQeF0UXiNXQ1vqYzk/IG0IhKRCrnC9Ecud6dc3GEHc90zWrmOKt7uOCbM5IfWrzLfj2qg9K6yMmFJ3WPt4W7LiWfBFrM7nALkpRx94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TdtVb3i2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TdtVb3i2"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so7673478e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744801840; x=1745406640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekNF6eeVab4Uo0LrcCIVuatvZVAJ2+LsoOg7fzFPhHA=;
        b=TdtVb3i2kezEQWYm72XkS0pnKxjHHukzDgnNE3yAzEHlefjZ/yxRqpbw1KBWggS8KR
         77ooKGfnEMwy7p+4aAEOObGr7ID+SRsNV+k+OmfrpqWs28mh3O7R9YpT7QBAZsCd7nd2
         PNmuG+7asaXaZxDZ+77jNm9laLuL3H9Y0eCB+wTWkdukGc8XhlbxmfBR1TxVVfqlYjBB
         m3uVsl+M4BKmycoHtEqNaEWLyQ2snCvedBlTWRdJuFSgM696ILxQeBQ2b1/h3EbBj3/g
         QYoRFMgebgNsS3/vGJwFq5kP3nEykWVONlHTqT0fIYJK64Wy+58Zpq1aQ/Ja4LNuaemb
         A6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801840; x=1745406640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekNF6eeVab4Uo0LrcCIVuatvZVAJ2+LsoOg7fzFPhHA=;
        b=EonKgKPwsokUInYG7FuJhU886I2zWVc1IkvIimTLsAA7JMaVJF37NbbIc32UNecpff
         h79LLVyYFmVPm1AAKIjxs6kBc2E64skOAj5yZLSnC4i/HRX3TUJTvHwE8uT0gmiBwAGc
         YLopjlZaK2WSZAryw16tUnJszToxsAUalV/9sqvod8qnQBAo4bep1T+VGrHSSHocsno1
         E8b3pOCiBrtYaPel8BcX4BXw8iyDgrp2ZHdgG8n+9EzMdv0NPcD6p4jzOkLapfHswQGw
         wFyiZ3vdVAURvmdlK7QYn0xIVIeBgei1i+lBEAd4iafYiYU9FqPTIVEa35MykAmxJ7/T
         br+A==
X-Forwarded-Encrypted: i=1; AJvYcCWacEVpaJdAZS/dq1MtVt0w7FKqG4jKozDOfkdohwTJk1XAGxP+prujFSHRLrMYDylgOHQu6y+HCX+fjE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQHMU7Wl2hg4UpOFh8jlDDN3Vxvivutx8OapbGQlNmvk0V3bRs
	qeKs1D93qgeVuM0UDT6jWzlvOlxFtbbVBiJ0AGpQZtvJ5FWcmOCQc4KOdEhzuI3u7yPRgHcaQbb
	sHpGSBVrRmr+kd+Mafy1ocbxgVIDEQLTPjDy+Nw==
X-Gm-Gg: ASbGnctIfkHq9lL3CgwCGLGqIeRHQhdC5p2xa3EKw7+pCqYdpf/0XEZ6ywPhvndsGKc
	eL8XTizl3SZLkuwc1GqOa9OwGAcK+3fYQo1fBvmT45Ge1dcgcJG0S391SSEf8jFY/bWtLDSRiX/
	4SNOqpLnuVF66NhCEbu2FV5g==
X-Google-Smtp-Source: AGHT+IFJxSGtlbphu0zzm/tLIgAsfjlfNPskCyQgArKiIETLbKMVULJO8nK1Awrz+YF4keJ5Rt5CFlu2O1VWaiFfeZ0=
X-Received: by 2002:a05:6512:3b10:b0:549:8cbb:5443 with SMTP id
 2adb3069b0e04-54d64af1131mr475421e87.47.1744801839803; Wed, 16 Apr 2025
 04:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com> <20250408-asoc-gpio-v1-2-c0db9d3fd6e9@nxp.com>
 <5004055.31r3eYUQgx@steina-w>
In-Reply-To: <5004055.31r3eYUQgx@steina-w>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 13:10:28 +0200
X-Gm-Features: ATxdqUGTg2yfx-ZdJ4mEnvtRKlUs-ZPmnmkn-6jlvjsqFPdpAqa_pDHyEOa8HsI
Message-ID: <CACRpkdYvEsxaP=iqXurBz43M_GPKkYRpOp0pOHQqAWx6UPEEiA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
	Peng Fan <peng.fan@nxp.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 3:53=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> > +     /* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIV=
E_LOW */
>
> As stated above this comment shouldn't be necessary, it might be even
> confusing if there is some external inverter to the GPIO.

I have added comments like this to many patches due to spurious comments
from developers who were not aware that gpiolib handles polarity inversion
and are confused when we set the value to "1" to reset an active low reset
line.

At some point I wanted to define something like

#define GPIO_ASSERTED 1
#define GPIO_UNASSERTED 0

And use these defines to make it absolutely clear what is going on...
But I didn't get around to.

Yours,
Linus Walleij
