Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DB82E7631
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794061; cv=none; b=cgAQFHHlizrGM/Enqe7uDugYGEVEaC+59pI5d74JxvSfXktcaK4wkO3pWeQ1FNcVKlryLKISv7WG+xF2XL1cvdWOLUW93u2SbaSWCdVF9vgO40QyyU/S/diHTcX8JrPUWFWY/JDkrCR63/CKaKzmPwbgHRB24OYedNXJPnBUUXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794061; c=relaxed/simple;
	bh=v3BnJq5LQEaxFgCM6/6sxf7x2jYyXjVWSnRn8QlR/f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOV+N78VdsjIZOmpfsJGAiLU+H8A7LWJNoU4W/+7ir9NiBGiSS2gxE5TuYQNPV2B84Qm9jZxkmAJDL9IGxIWf3mftBRdpld/PzJI81SFc3m4B5LWqLjTAQG/gVcmYH+KHstEijjTltAsHO9b7hqRTf+UeG2XKuDau5oCLos6PVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AFEWb1mq; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AFEWb1mq"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553644b8f56so869463e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794058; x=1751398858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3BnJq5LQEaxFgCM6/6sxf7x2jYyXjVWSnRn8QlR/f4=;
        b=AFEWb1mq5CPJdumumk3sziznQwPhwH6b7yd6Um1kG2joo3xGWQcglTlunBbli40mNe
         Jqa059X0pJONyVSsTZEbeCCnwrDOj//HqycfMmLl2vVX4C0e9RLnj1A/rS6+OmfLcBQD
         b9gvGlcRIWLnjDYKzQxO2lrqKhpY0uiV9l79ZJhLKB9OVCdBIr18VfWHvo8dYqun0CVr
         ZkAah/7oFwFrcWW0JbYolxRKwPp015eozp/m3PYSxxNuNCE6Qgvj/t0Z2m1DFf8Gx1WM
         WZc8zUIG2WgLOsHVoCprukTHPhaxnxorG4p0TmIByh+mzfDVxdI8S9rKDTYOJ0i0ojfF
         Qsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794058; x=1751398858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3BnJq5LQEaxFgCM6/6sxf7x2jYyXjVWSnRn8QlR/f4=;
        b=GVUKzCPCO4rktJYvTV3CGjnKuyzoyzxFyvsyqBO6K9g19fmqk0+owzXUAqC2tTHwYX
         d7qJofku3Q3PEteVU+SwQ2i9j8iIqC4INMK+7CyqFy12BkJkC9+kri5yGZfqek+GaNFt
         JbjxruTIyIQlEBNbsiUSdQPnDbFA6v79FdfIiUXplxYvbtjYEzDw5HbsOfcSzxAWs6Bw
         oSbJLlSq7uElq6VZLV0+NszCdNy6h+ItnOKA90cTp5GwSBSxGPt+5LajL4dcGMqzXrNA
         rX0IfHhdBmJLPZzZrT+5snhC1dapnYBAljkiaL+YFEcvQqaX4kzOUD3Ml/Jjdh6Z8+Ga
         2diw==
X-Forwarded-Encrypted: i=1; AJvYcCULZn/rHepwAYpibO5NueC4jKYXV4kBIaC6oooHq9irxvoS4Huak6L9NUy+96+ysCw5EXE+j/RRDnuGEmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsEBZNqX9VPRy+ujmHAoXdEsddsu3ogdHaie3CjTbqHNeu2QfK
	pxgFY/G3kDfJG+wix40HJTX/2cnoCVUu7W2XKNtvVPvNDs2UEo6jwTB0uWGR92LjymDFf8V4oJB
	fdMGOUjknaMtDlWBHwm/syiTTHjqqHRY8MHPO+2eVUw==
X-Gm-Gg: ASbGnctRvkEdLyH8TmoU9wfCYJPtwdCCECIRpPkDcJ5qCET6o6lk9DUcDYV/YVIZC8/
	f02TDNkc1wn65ve9rZv9z8TPNmPTycqBGh+feFUfYMWIGtCVCGxpsgeM3fgID0tgBVZlEcR4O2t
	jxntfzVkcx6E4Dg5DxcXgvS3YrZup5c0VCQBo/CU+0go4=
X-Google-Smtp-Source: AGHT+IGeXWsd2KZRikpXjgFDmBc/qqqZ9/rCy22guOYB7u6OVOcVFigKyeu0DQMbioQlth4Oki5hGk6T6/TasorD7hM=
X-Received: by 2002:a05:6512:118d:b0:553:af30:1e8b with SMTP id
 2adb3069b0e04-554fdf9676cmr31086e87.38.1750794058182; Tue, 24 Jun 2025
 12:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org> <20250623-gpio-sysfs-chip-export-v2-8-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-8-d592793f8964@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:40:46 +0200
X-Gm-Features: AX0GCFuS6mww0UGvkfja-_98m6Xmqj6RLmLWfp6E97Yy_7h19_QAZkV_Etx9c9c
Message-ID: <CACRpkdaW_Ce16EAXSEUqYTuBB4E1y7NeAkhLLik6qtOm25+pyQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] gpio: sysfs: allow disabling the legacy parts of
 the GPIO sysfs interface
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a Kconfig switch allowing to disable the legacy parts of the GPIO
> sysfs interface. This means that even though we keep the
> /sys/class/gpio/ directory, it no longer contains the global
> export/unexport attribute pair (instead, the user should use the
> per-chip export/unpexport) nor the gpiochip$BASE entries. This option
> default to y if GPIO sysfs is enabled but we'll default it to n at some
> point in the future.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is great.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
