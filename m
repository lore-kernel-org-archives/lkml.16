Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CC91BBBF1
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178763; cv=none; b=mRJ8l4PqXZhKKY58KWLoDUvngFnUux+98w1RLG34n5KJ1Z9FaUe01PE4j13zxLFWhPrOkOz8Nd/pUL1NVstbV6VHLkDaN2AXA6OweHchcagNrNocjbmAGMxIuJeDXIlAWXqiAlIlvqLelAK6Kvd0qq8FIDX35Xk52gUfevdpw7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178763; c=relaxed/simple;
	bh=KpP0VauWezlZl9zLEnci186WAPTItH41JwByqjcT1Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQG50BICS1WIBxKD0J9q+kFy4USwvM44091DAj+alqkn2BeWZ6Ki/eBfFF7qyvr/1hSMqJFy1CTOoLizGpfxvpgQ12O2TmbLq8vecjZSSQFsQey9ldIgo4oax3zrJbqmCROapS3dltiiMbpzunKPEyErQl7/LKLLMSSCYFPBSyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hx+P1oTG; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hx+P1oTG"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e46ac799015so2947636276.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739178761; x=1739783561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpP0VauWezlZl9zLEnci186WAPTItH41JwByqjcT1Sg=;
        b=Hx+P1oTGKLCO6v/M+eJ7H3JyeiB1hcsM+tlDK7/oMd2/I/vf+QAxik82pF1PwInqd+
         qNOH4VM9oshPuBCFABBWYuC6GvdK2+TKQvLUbEuSwlo69Xh+RFUoCPousUJE33X2sti/
         0rKI8r83uLQRfw5rwD7X+3c4S7hZJciXIevSrQZqns+gp5xkBwzaVCCGaJN9w2pOr9q1
         63KNDVsd0VM0D8WrOsH3A7BHRY+DxHkGEKMg8FKxPKkNqdZY6zo4+u+wxk2QAWG12bHK
         OhEwyD0cEkKrihn1ULI3L74Nc/AfZgJQsxmPhUuoZ5R2Y3NXf6UiOpHjzriP6cTk/EOg
         0mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739178761; x=1739783561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpP0VauWezlZl9zLEnci186WAPTItH41JwByqjcT1Sg=;
        b=sQf4g+MnMRs6VM02qBcZ/xLHYE6U08YsOhjAScZMyZJz8co1L9KjoBFaWiUaKM3jXy
         hhZ4zTQ646MY598qA8WmbIxt5Ij9B0M4YWMrW56+d0u5zcji8b+ILcots550RiaRqMu3
         MUM29fO3tP5izRGN0J+ea7+Od6kgG4jWP2iCnXZ6LuaIeLBaEam2B1u0r74jzFuxuvhm
         xQ2tiGHiuVTjfpNfyDmVX6I2jBaYgkX/5KZC63inwB9Y3pgq4tlfX+Z2Og4DmdcGM3sK
         XSjJiCSuVewBXS5kHYGXidl8BOPzLWzwmufx5XuecVNPQgjVWA9SyMoEs81RGkkmF4oD
         6tFw==
X-Forwarded-Encrypted: i=1; AJvYcCVmltK/wKUIkL48BtzhlK7oTNnbhq9YqS6ofKiUGxeNgt5A+MFkICVlR6vW3xp9OeatoiPRTYAvQ9BK/KA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdsz+DTV1Y2qBvAtdEWzdNj/xIa+xUOQSWkHJ0jXuKxH/XRsE8
	KMAoPRWXQ+8LzffcPwQ8dpwmvm+izeVUhY2M7cAfKJBF6AbSyUOxqTQDWl+L4NPVJO+VcbjCTMw
	uz7NNCqgucOPpDhT55Nnr4vZ17WkmAtV9yX0aP5Iu3JfzTV6Y
X-Gm-Gg: ASbGncsQSTmQsc3d2mrNx6r039rg36ORI/jm8Eu97TaAEVWnmJKg6MiB4XoLa8SM3Gu
	f9uVfvWgJ3Do9V8xU8T6kGLAykyOptKTMTjgD4Lq53pRvs3qVxVZmLMlBpCROHSY5c0hUFN+y
X-Google-Smtp-Source: AGHT+IFAawMg2Nf7mqa5umT0YKscWEuVFFrDSBesMFIgDCoKmA9MK9WP2lFoyGsa/Z/8TYQ1P+7gsxVF6nzcDCRCG5E=
X-Received: by 2002:a05:690c:6306:b0:6f9:4bb6:eb46 with SMTP id
 00721157ae682-6f9b2a21876mr119497097b3.31.1739178761099; Mon, 10 Feb 2025
 01:12:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com> <20250203121843.3183991-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250203121843.3183991-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 10:12:27 +0100
X-Gm-Features: AWEUYZnXwUXk95Ic6JXWl33Js0Fr1hk4GXmLDnCXzS64aYVBM9dHPxfnvm3rnoc
Message-ID: <CACRpkdbwBB7aS=oRHCkUcZybigXabD6x_z9m_X7iveRakYxLxw@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] gpio: 74x164: Simplify code with cleanup helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use macros defined in linux/cleanup.h to automate resource lifetime
> control in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Clearly this is more readable and less prone to accidental bugs.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
