Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA25123F410
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704192; cv=none; b=LZ37vGlVB9TVCkYbfGDleixKycDAYOnXXEnxRedu5Ovl7Dzq3J/42UJge/l0fnA0Gwr5Y6FMA2oYyd75/dro8jktu+1t2ZJNErzeTL6bAfxP0r9ZPBZZTzXls5cRaxZzSne8+/qA1xd00/KPGg9vC3ebjLnBby9U0ocQOGETU+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704192; c=relaxed/simple;
	bh=+V55qGdz3nFmdjae2o/u6EmBjC6s05SCXJObXnBOuI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NelSX+Ji93z5NqSIWiqb3tijEundmEz0E9bhJfxZXKbC+lwLQJOVOtACbIy7JZCPrf56G3wcxK7Zr+Cv8bAnIQ5MbefUqhdBl/5Z1ynXLeZoTAlj1X66VMqOsDyEh2ASj8MYjEYoTE/Eo+Suy4PNICh/TuheEwfVjzWuh4of4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WOuuhxXS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WOuuhxXS"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso53810691fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704189; x=1745308989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V55qGdz3nFmdjae2o/u6EmBjC6s05SCXJObXnBOuI0=;
        b=WOuuhxXSM+lfvvdenpheaDc29I8yIZJfYlbZyIp/fTjHaC9Jkxrz8JNGD1CfUvsSWk
         i1MbPL8s6XszMsqVhiMtiDD/ULvbeVY2cqB4qbC69H9QrXLBhFx6/ysOMhn5dDUZBk4Y
         p51kXoCZYEflXvWL+ZlFgsdBTH1/FhbX/fFG7Dcvx1C2O+eQr3YbJIv0heUUBU2q5bPD
         bU7NFvYSy3yt12vG3bxPBSQOglByRYbSD3Q/YDE8vy6j7ot+tszb2PwD3jRKaQNX6Jvs
         sSh7GFP2m0FNg0VqbJpgx8X2jgDR3QHUPgLhEwnpcwD17BqthCzkv6zP+29ShL4Hs70t
         EZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704189; x=1745308989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+V55qGdz3nFmdjae2o/u6EmBjC6s05SCXJObXnBOuI0=;
        b=Iwbexw8nIADHRpbc3DJ367oipF9GSg5P7OgSRoxnJQLx/p4mEpv7wBfH7trQpNYqyo
         nIjwz5/xXAIcPhznnjFDya/c6MuXRPs4fc6U+HO/9yIaxoMD0zzPtwuS1ZGmXNnywRGb
         gGmEzYMap1FhGe0Wb5fwOfnl4sFdrrP6o46Ir3XngshP8zSVCJEJA1FI+wxX2ngX/ssI
         ls9EL4yo7vKeHvuWoW6uPL8OSnKihKDsmqJK3flQcMlJtvDBJhpsLlAoTCfz2cexRbx6
         F8gNKiig7FlUDJU7Can4Qioxh0U5fY6D51ULLsbXUgGq4ZzRsbM2lftaZ+bb/J8Y5+GI
         SzXw==
X-Forwarded-Encrypted: i=1; AJvYcCXQoUUNZfEHaFKK7cmCYaev3TeEPfQWaNNTBZASB+hPJHJNim1BucySl4tdEZ0Pzy+ucjZhqH0gc8YzTHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX5SPuygrkag1cnZPZyvsZsFK1DSwjhriJFrVPBIeWurDV9iML
	pgEBgJ1PHQccewBThImpWoJFtHEeBLhihx9Q6nqjmxgHg8yzFmGr/6Yw+P4Uy5GcEv2NLYHAzYq
	NGW1zZzza0mWRCV9dQjEaPpdub1xSbbVRa3bo+WjhTgGYc/TrVr0=
X-Gm-Gg: ASbGncv4lnJ593GDXoV/roAiFVJM0AjvIlVq9vwNdmP/OTgsT9+PHqpcOaGWoQNMiQy
	lS0UMqMCHQUcgQW+rgpJKb72UWs8mIHq4OtRCUc5vCCy0YRMaW9GJ/xQR4jcf2b+I51Kr2bAsL4
	IQ69CKP+X7hWcUd3QT5zvBhUejaN1H4Gxi
X-Google-Smtp-Source: AGHT+IF8B7muO3z+eK2QnDzSM9ONUyOn1pOPX9ugb37B1zPs9RhHVBq4wiGGWi/LmGwDob0ku420OA7XLCJpPobaI30=
X-Received: by 2002:a05:651c:210d:b0:309:20b4:b6d5 with SMTP id
 38308e7fff4ca-31049a7e5bfmr59334191fa.28.1744704188733; Tue, 15 Apr 2025
 01:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com> <20250402122058.1517393-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250402122058.1517393-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:02:57 +0200
X-Gm-Features: ATxdqUG8QfFP3eJEKd-SVmIh30MEixKKcvWkROjudjJnuccbbmELYQ8FlwuP_As
Message-ID: <CACRpkdbrRWVOkwU932qehOK8QOZvWAuo1hsnAtV3u5uJeT-Gdg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: of: Fix the choice for Ingenic NAND quirk
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 2:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The Ingenic NAND quirk has been added under CONFIG_LCD_HX8357 ifdeffery
> which sounds quite wrong. Fix the choice for Ingenic NAND quirk
> by wrapping it into own ifdeffery related to the respective driver.
>
> Fixes: 3a7fd473bd5d ("mtd: rawnand: ingenic: move the GPIO quirk to gpiol=
ib-of.c")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
