Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2EE22D787
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792959; cv=none; b=IengEReI3uieVhxc/YpsLGUIxelgh2h1kohxYzVfm/25PtnGHEQkD000U2gq7x1J3PZClTCn1uPSr32Dc5tQjs3Rybb4yLzXENeXJaBbZ14T5GzZjKoGUtcc1ZmSdHSJbU2TWXSoIqJ66NT8w1C/UneOyrtcIlp88TwFNW0FAAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792959; c=relaxed/simple;
	bh=emU1ztpEHcPDJ3TesqEI0D74SFuoQkpyh55PmfPn1VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXBo8ICeYFMt/RtCi4wFG1Hyq0+Kdy2tNkGo2ghABtt9OuhuC8UZgtekXwn7uh3tMimxxHf/Se4drg8NPRJxEji1rfvMSw9vPCvG1lDuzUfoRlHeoGYi6b0a283at0nhuQlxHTrMo9u6G8RxhhMZw86HjsjKMFguh0InuK6aap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKL4q0VZ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKL4q0VZ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso65498521fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792955; x=1745397755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emU1ztpEHcPDJ3TesqEI0D74SFuoQkpyh55PmfPn1VE=;
        b=MKL4q0VZ53nnCRoQy5sY1rQ/sGoX3wOMcC4SIYjQEwGCYhhRRDigzzB7GA0e3nMl7C
         Ggx6TT/wK0M4N5c2NWsOMgiDMSz1hgMqqgFYm2GL0kdwvlCjF8VEwzM3x8sDIg4NFfrN
         aUfKYEgrxrtJxKX7MiD+BN4c36ozksBJQ5Xi6FEDYcYdU04WfiTtCKGrvr2zQthTNLcE
         0baL57HICUBnetiwla62FISfOISaj6A96fFvz49GzxGpbI+npweyTrvWqTzrYe9N/JxV
         HGonTmKifn2YdqhdKYtXnqFtk439e6BmuKtz1FVmt2DjQ4ZT5AP9pnE0s8LWYPhZk27d
         vi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792955; x=1745397755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emU1ztpEHcPDJ3TesqEI0D74SFuoQkpyh55PmfPn1VE=;
        b=At6kaS3KAyxxnM/HDJbOa+ixBYK5yZL74qS+85c28ZnDRxAot9mOPMuPQRlZUnASsV
         nU0PfoKtdVeDnuUIbyCVXiliqM2RHir3rMVr1tPNBuTeBUiutX87aEBPrf0/vL0ugrO3
         IYTmlqjI3G9YYmHhXFkKE1bwOaLYuhVg7lTzBe37ot6QSISEpPObJubuwzoHgyRJQ4S9
         w3jrRIp/K/EGpniWS4ZSYooIagOMRpdRlWvNwAMDaL+kOwZdsGs+DZ/9MFCdC6QMjj5e
         GGYjiTwHl30OpqFFlVdGPPW8FaqqcVYFApOArBBBLsbCX9H3QZ+nOE4vjVObRzQCEqPh
         1A2g==
X-Forwarded-Encrypted: i=1; AJvYcCVBvvWj68Q/3gAbrlcIxbR2cwfiNT3ac+6tD2D8mack7Dmfj4klKcNaxC2HJETrYPWwrXx9tFCAC1j588M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkXaqx+5Ftk9+jXofzzlxdSmXBd3zPHfYWLJDVuE1udzCuhKRD
	kCjZWiYVvXStfLZl4/pqcKtPf7v9t3b5G4WuwpfS790A4RTzFSCHNDcuOIITjDiR+QCE1JVFbaY
	968v1GQ059CcULspJGrQepURQVPoAE52YUPzrlw==
X-Gm-Gg: ASbGncspp4kcuKSI+FykxSYQvq4I5KQKrwb1opWOqNHVjQA9FqO4CeCewxRsPgkC6Q2
	eheI8sytDbCAa7zbMxjZXU0u7YXDfqto/kDgSFS7Z4NrYceaxivOoCsvEhUIL1+tdD7hkKmSvfj
	yaL20WT8f5mYZGOzE1pJQFkA==
X-Google-Smtp-Source: AGHT+IG3vfJgDVatBWZn8CTY/EFP1pLWKS59uhKTgG+BQpORL3g5bmdKhrAO9ol2IZnTNVf832lwVZxuCek+mvzQcrs=
X-Received: by 2002:a05:651c:b0b:b0:30d:e104:b592 with SMTP id
 38308e7fff4ca-3107f73a75cmr2464581fa.38.1744792955305; Wed, 16 Apr 2025
 01:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:42:24 +0200
X-Gm-Features: ATxdqUFlkXxMm9jeA4EPLA5TxpwlyriYzwentOxHys1CKD_0gGXtuyJkG1m0nHg
Message-ID: <CACRpkdYBn6v6ou9VpB9hDRcLQ=_-d4T-LU1v+_p96XT4SH2EVQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] gpiolib: Move validate_desc() and Co upper in the code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Move validate_desc() and Co upper in the code to be able to use
> in the further changes.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
