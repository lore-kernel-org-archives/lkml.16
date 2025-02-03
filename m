Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E4D205514
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589760; cv=none; b=ID4hwvB3UFaDk+uOIxZtmUDqYHoG17otl+C2p80DLhQNg2N8dC1f6YKqVOfePuMr6UZt84IHeXrT2r7SNtCp+rCbiwQuV0oczjc3/Fivqinq5KG5qNUfv84bvvW2DX9uHZLSlGXq4Yzwmfn1LppLl3uSXcgBGUysgE5261P/rE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589760; c=relaxed/simple;
	bh=9i+TRd6fMeAucoxvREtTbYzk17wUVO/ofjr8bEz5aBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOw44Tj2edcFFzWfZfK1sZ2I8gcQcNzincVOByrEQSvAjzaDG1mip5PpEvb24y3kGO+1OvwU7eCtajMupRW8u97wpH+HJB2XtdAP3VafP1raTGG/bnL7OeNu9cRcxKmSIHkr/JRRGEcDacm3Tua9jD+DV+zjsmH91n6M9zJAUqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mM6ozxRC; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mM6ozxRC"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30761be8fcfso43770421fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738589757; x=1739194557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i+TRd6fMeAucoxvREtTbYzk17wUVO/ofjr8bEz5aBw=;
        b=mM6ozxRCMCJlI0yPxx6OjfCJSKpoOSEVE8tAXQoUYODJpejLnkvZel/Y3gMZiSzdPk
         LIjQ1GrB6g2hk6I2hgy0daK1cpM1djHI6S+JjVO4ImvLLA/CEOOaUI7MGKojD0PQyWYr
         P8OyDbXdpRbkOVW1/FGRcW4rdwOJ9TUtt+BWO6ZSdP2an3+E0D5q/xOY/D0zVUoOZlIO
         35mA8aTtPPtrUEZrP7z10SPj/7egvHgpRKCEkOzNp+olpZ7fDP1mhC+mtVQdgh15zFgU
         d6PxnS8x9kM7Y9cbFdEzvBdZlNZLVkeHyvFUmyY+K61R1nAWGOJa4LpyaQpQV2qPY46Q
         qPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589757; x=1739194557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i+TRd6fMeAucoxvREtTbYzk17wUVO/ofjr8bEz5aBw=;
        b=bkt/dE7pMbiCNSGxd8RUtdR/WFvhELAtUtJfq6T2JoL5+d0dzA9re13wAAoK1whl5r
         HRgdgPHRV3IuRZIsIqQdUdzXI69fPYIUEY9X9FkyoOA5tvSV3DS+lEK+1eA89QopSCfU
         AJl6inbbEvZ8P/Aga5B9qK8izf2ky1JPQpWY+bjxnY/xLrBvcm+B+/brNKWMejjO2s2H
         HAGTOQ7saMCiYDZstenqyjQdV0s6+NIwSovDKM1aDofyXY/6tW0bFHMCRrPr1nfRvPAS
         +WZ2B3lK0Ht0uCmenSFbD6IUOytglnnCcOJg1LQ7G9soGN4pnGldygwoIaUTN5DfjFUP
         yv1A==
X-Forwarded-Encrypted: i=1; AJvYcCUBU7Dlx9TPHYEuhGY1nZjgjau07nc4Z7AkGde6VBcD4nQIPv351e5iT5FoNMeVDY0wTtPlHMxc7+Seznw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi+VPnyF6+v4u9enE5adBVwQhGxHqOrEMoU4dwXePoKT8X34qP
	BNM9b8xA2xkKyxNgrFK0UJ1rKfdVzHIRV88EFhW07baNv8WyVd9dMFkUnkFvOo6auh2OHal8+jb
	Y5hvNnVwd6U3vnHdQjic8fm2pu3Vb7VJ3/efYIe9r5FC1j1Dm
X-Gm-Gg: ASbGncsYYhbu82G6wQA3Z8P7R+poH2qLAV8PLAU0DRa5Ay6opUCQF12kPuHSJYn0ZQF
	3rHkJb/BTqbB1Ay7H40iV7pS0+zEgnbFKD/RrnvscNTG0md6ZT/cAUkIrRSAxp2Xev3WDsnc=
X-Google-Smtp-Source: AGHT+IF2uQQf2LlzVO/SvvaOzU4QwwvuOQNtQ4y8783YxBD/GETqIfKElvcdVDtRO7eARDp5oQ6LD38X+mTqxoSWN5U=
X-Received: by 2002:a05:651c:1993:b0:2fc:9622:794b with SMTP id
 38308e7fff4ca-30796950f43mr78550631fa.24.1738589757132; Mon, 03 Feb 2025
 05:35:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Feb 2025 14:35:46 +0100
X-Gm-Features: AWEUYZnig5RYlzvUIDF8INcKiw1Mj7TxOB08-QJWBdezeD_KADFV59RnOb9VboA
Message-ID: <CACRpkdYPAa3NYDz4_ch9NG_bno8QfO7g9QTHfDB--XrDRd2NXA@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] pinctrl: cy8c95x0: Bugfixes and cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 2:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This a set of the bugfixes and cleanups I have collected so far while
> testing the driver on Intel Galileo Gen 1 last year.
>
> Patches 1-2 are kinda important fixes, patch 3 is half-half, it helps
> a lot when debugging, patch 4 is semantically a fix, but can wait.
> The rest is number of refactoring and cleaning up changes.

I applied patches 1-4 for fixes since we are early in the rc cycle.

I will probably start devel off -rc2 or so and then I can queue the rest
on top of that.

Thanks for fixing it all up Andy!

Yours,
Linus Walleij
