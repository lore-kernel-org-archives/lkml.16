Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91047156C5E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867555; cv=none; b=NolN5o8hghfvZi5bfqNg1haCAEJpJEDR5HeTKfZrX4lmLgwO/fK6FfcEBVrhHXXmftVfC6dGU6/PjgQcVJtRaw8kzxRgymoQw9z3j7OQklQ9MBpgo0pWsyQTPdARYL2pyMDzRQvNdgy0OTeRaQ6Oxo7iHKrfiJpoYXTqT3eeTy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867555; c=relaxed/simple;
	bh=Tjiel0WFtQD9YS5CKTSuxdiX698M0xiSfjn6FPVYi/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xk7tKwEiDVcB4Bi0N3mFqpcbofBKwKbHSY4pquQ/nfv2ZdBO24bd2yPDW3C5wqZ15RnndYxWmwZiO1wq1P8luiKwSbG8gxD9HCjNDhF7CxNUNWIJm60wf0PtEOrK59x/lfwaMYxdScM7xVsQptMynqAsJvQ5iNjtewvFVYa9eDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MNGfUrI2; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MNGfUrI2"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-305d840926fso10585311fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867552; x=1739472352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjiel0WFtQD9YS5CKTSuxdiX698M0xiSfjn6FPVYi/E=;
        b=MNGfUrI2QJjLfNL7FN95W/o+6bCjZO3TuTVKS0f/h7L8vxqPtufMVpe5cVSGAuFeUC
         XrcTHuvPW4sbPuylvaaCr9QxZWqDxEqJJq1yE51tOHtXCAJPyy1AF9MU7CZl5vX651pe
         KIqV8wLK3LpR83E7O8pmn5TBYQNJl1d6P6HFr0s8TYPMo+rLKRXy564CSNigirwGChsJ
         pEAcAXFTaJ8DQY4yND+4wSyAjp6uaL3UycX9G0ay2pVcBoMz+hFzBRFtIE+1u0q5+0yZ
         rIaqF/Ksa5m/oxkUqW80Srol1Z3ODQUfBcCxh+FxRewuVbqhsMf3cMgciSHN4ooCwjtg
         OOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867552; x=1739472352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tjiel0WFtQD9YS5CKTSuxdiX698M0xiSfjn6FPVYi/E=;
        b=AV+luhLufN4Zm1qzxx2DFGn5jsKQkCuje7YUngmPQpVHIjOcTJ/w0u/jiiayqYSb/m
         jy1BXeMbM+iOb5dLZ7EphGDMaqsnA7Dtq6V2VCKt721HlBDfci3JWNIYzg2ucoR/VsyR
         cuxTRs6wgDDrwKN085GdZUuyHSan4o29YSUAlWIYPiB9j8CN0IIuBGjBE2qQQrJcbNWC
         I2gHaZwxqiNopts3HtEJ+vgPy1wbG222CeOBO/xGYzCOVyXaEFITlhyBwq+1VG3uy0L4
         oouDM7ymA006ZkUEVkYuUUEQ8RHR4PRP0mLBWu1xrGT5IL9veNrb32HzHHkIiVXHuWCi
         9bXw==
X-Forwarded-Encrypted: i=1; AJvYcCUq6dxAdd0sdJG2Ej+sJvJ8+rQ197X4Hy5xhMFQUSE51xEirJSif3BQmnfYzT2yoJTj4oGtvS2ded5Tew8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPSDhM440gyMByg/8brX5ji+KQhN5Z8iyswKLlGSznysahBLWY
	qFFtsA6bSZsU+3wUePkaO/TEaefMGvYcH595DE6l9+jozzr8Rj9oWy+d17mvCuVDqZ1x9N9ZxIp
	YNXl0fo+bW+uAbAmpKRQSc7A/xoQBp783+u68eQ==
X-Gm-Gg: ASbGncvWV5sM/QudbBboqbNQPjmU6m/LiYOaCumXzsf7KTuirKcB62EWnESry1w9Afv
	GE2WMj19EKBZjsTOxgti9pKDmhZ4k6HXL+r7MPC9Hp/mWSl1aq4Ct7a4L5Cz0VPKiUuWKHdw=
X-Google-Smtp-Source: AGHT+IGpDLY6SHQ668oUnbFgq2auSN1gE3jhzoMa4jDVlTNizXykYl/yxJFI/SmN6Q4nixNkxOa7mlXWwfcYQBp4TGg=
X-Received: by 2002:a2e:b16f:0:b0:302:3ff6:c8db with SMTP id
 38308e7fff4ca-307e5a7cf4dmr162071fa.24.1738867551683; Thu, 06 Feb 2025
 10:45:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080902.1864382-1-raag.jadav@intel.com> <20250203080902.1864382-6-raag.jadav@intel.com>
In-Reply-To: <20250203080902.1864382-6-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:45:40 +0100
X-Gm-Features: AWEUYZk2YRZtcaKVdDcLea0eYDsFvswTZJTr6Ycy-zr9WIcLxtUKOfzaSSPbXpw
Message-ID: <CACRpkdaWm7Lo125AsgyU3+p=WB3unVZFqvudVD53SSLESsT0=A@mail.gmail.com>
Subject: Re: [PATCH v3 05/20] pinctrl: baytrail: copy communities using devm_kmemdup_array()
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	dmitry.torokhov@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	sre@kernel.org, jic23@kernel.org, przemyslaw.kitszel@intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:09=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> wr=
ote:

> Copy communities using devm_kmemdup_array() instead of doing it manually.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
