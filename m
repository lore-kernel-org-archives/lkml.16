Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB7E23C51B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447554; cv=none; b=R0+se8c5xLVx/q154ANS1ZlHSka6h2fQaOCzI3b11CWRVmdLyrjSEzeWer70iCoy78OBKjP7uy999bpj0nyZZjnD09M3sS2HOliWmB0X3U5u4oXRVqRqTD1Phks5vnFn61rblb6LRLrM34avGcm++PEVXnjREGYxWnXRrs9fM0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447554; c=relaxed/simple;
	bh=xDQ3r+CVA2MvW2DIbPjmzu6pJqc9zfZSPhLjDhnE9nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhzqJ7G3SRJAPZ7ojRDYiQSNhLwTgtExUhI+chMac1sWvriBUBW1c5bSv90weGpLZhNK6yNioeSHoD+EGmhfBDy+PYa4new5HoFfLsq7d7TeNaRvs4q1JXvdCawc1yI5BGyEwV7jevgLTg85SsaCCXnzhwKYHnCdWBPjpimNqXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0wZpanZ6; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0wZpanZ6"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b43cce9efso34060651fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447551; x=1752052351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDQ3r+CVA2MvW2DIbPjmzu6pJqc9zfZSPhLjDhnE9nU=;
        b=0wZpanZ6q4w5lghJ8+oCTxIPZMMARJc+e8MjWGx1WFpdr+AkdO1wHfGWkSj+88yKnT
         0MBl9PlRd5Vr2dSdEennUL7Eyn75y7pybyK4t1iU6seBt9n7Ga2sVTA+OWN0qrHXkIj9
         rRL6AkZQLbmPh9uJTYMWLvm0ji79TEWGOp0Y98DDp/bRoX3inaY/KUD9Q2j3Q3m7zDA+
         6fN+Je6hxy9LwBnJQXq0ClFrNaYRFLJIWIzMSuJ5WZkpyZsw08v6aF6bJF5Mz+X2LDxT
         nnorS3ZcVBXXBsRA0eoCSujT2QoOFO6as3D9oMVGA3WP8UyxfzxB58okxDI9qSMhM7mc
         Whfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447551; x=1752052351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDQ3r+CVA2MvW2DIbPjmzu6pJqc9zfZSPhLjDhnE9nU=;
        b=k//E15lfD0gxYa/IaI9oC+z2lWsByG8YrWjZgk81le5XEL3regH6U42ZPW0IdbxILE
         OCINrwfj42Dxz4jA3KzsGgwe1Kzy+4Ad2G/oxsA4f8Iam3jK2i0cqtf+OpzeZEXoDMue
         fbKQYrU/YmCTKMjZL228KctEEYO/AUWA7e4iNFPCesHN6oUAzOs4f0cexwXvgp1CN3td
         Kurn9ZTefqUu1Fhki075K4+NaXiPMqRPxyYG+U3xqVeUG4MOTdt6iNpmBA2gowtUu3vo
         p1eIJFAui3kmkdgX3ft+CIKF1p/tjtHf3pfowS0cVbFF1BiccZPj4ZW/HE0YO7tgy4ca
         TM1w==
X-Forwarded-Encrypted: i=1; AJvYcCVUNuTnWJ337plSn/amD+De4luph3kH3cQFp2PTp5zsJQju7C3b5nNjtSZix6SSrIHjCv5B/3FQ64ZQn5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Rj4GOsxM5UFSJyoVsJ3NIQ5SNvvdlIDXR1wkEXQF4OtnbFgZ
	5eWcsnEtPk3pjseHRbd5TQKgcQgc4fPYesgdyctnYEC61ymNgT1tbIC+GTUbcEFULks/6JF05An
	5CC0CINqH7hXooQV3S/7Otx2teKJJqdNPL0EDUGbMsQ==
X-Gm-Gg: ASbGncuXW5t33j65ggXL+9DHjtWoEwjWSxXWdUYq/P1nFMksW/emddSiGd5xSwOCNV0
	tnpNIV1hAPNxhv/F/2UC1U6+owxXagMJtoIwWiToHQSnKjnXQba7Ei0lhs7tQ/F6RDEw4lUSaYY
	wVu8ZAFKnwTm2IbYi8ednXJTzxUKFtQg7apOIMiub5EQqXD6b9r4r21vkoPxoYf7b1PbFX2YnHH
	iDRdJqt5yY=
X-Google-Smtp-Source: AGHT+IGOZzkO1OwG83M5R7T/iwIIt03xBqkgvGbvumPwq6cTDhbG6uhpfE+o6LLXo7iqTTlkfw6EIY/MkRt2Vf2gdSE=
X-Received: by 2002:a05:6512:ad0:b0:553:3332:b661 with SMTP id
 2adb3069b0e04-5562831e686mr655555e87.26.1751447550548; Wed, 02 Jul 2025
 02:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-gpio-palmas-gpio-v3-1-e04633e0bc54@gmail.com>
In-Reply-To: <20250702-gpio-palmas-gpio-v3-1-e04633e0bc54@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Jul 2025 11:12:19 +0200
X-Gm-Features: Ac12FXyhL6sPoysjJZpRI7EGiwwFIYaEf3nOZTpdrJft6HPxNUo3LDKY5pf-H74
Message-ID: <CAMRc=Md4YP6fp5fnFf5p+EkSamg15dDUgxgeY+E1OqteiEPRJQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: palmas: Allow building as a module
To: webgeek1234@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 7:56=E2=80=AFAM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> The driver works fine as a module, so allowing building as such. This
> adds an exit handler to support module unload.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

This doesn't apply on top of linux-next.

Bart
