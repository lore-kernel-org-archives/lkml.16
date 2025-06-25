Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB93321B1B9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839988; cv=none; b=Qa/OCZWMBfaR7J8GjqL167ZeoBi6lHYEXr0Yjzy3BqY5Zpb9/Y+QTl9DV4e5AoNt1ad0jkbFCcT3pA6O4LkfRfS7UOCqNrYO6c7jJ8hF9xeqNtyZPDJlkFjV1cnyGI5/N9xJTFkN+iuu8Nk2RnXfQJdvY1L8ORgWToZvm7W4UZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839988; c=relaxed/simple;
	bh=HS4wAnVjCQeW1rVCh4eHK2uX9ZfsLA1faWghmR3VJxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIylIqa4jHKElNEF9559GqtK3XyD+D2PfcwoRhe3W7FbFxu+BS5AtRhUtXZOzDti41/lTZJ/waG4/556xbN1PeZnYaBlUy98TfhQ09EumWNRx4do+S+x6ULVXSbd6172QwrQyQpSp8c48KOkolkDOAel5bkvDdhpp37ogj3Zl6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0BLatIBb; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0BLatIBb"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5533a86a134so4671454e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750839985; x=1751444785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS4wAnVjCQeW1rVCh4eHK2uX9ZfsLA1faWghmR3VJxs=;
        b=0BLatIBbTusvOWQOSK2PRieumkTqt50JsgYQ2iR6BvfU+C8OIp3zErrUw7Dwzwzkpr
         +Kc5ucHXVpkO38Pfg158KUcESXu9+NKloZaLAmr49eyvV+Ux4t9CpD7QmbdQlM2c0bws
         Luytt4puuoQbSU7UNjmYPxBUD11LCXRUTiyHuyjAW7UT5nn8a/poqCm6qtCZoNMRzW1O
         hNTGT8iYxq67IYUyhjm9O8ejiT8lTsZoXQQ+Pb2j1NfpELfsv7mVhG88tG9GoGniAFDS
         RUJ+eqOPyTD3zdcYb/XFZCNjn4tc6HRSy+5rN8VZzvQEalc/e2YGSPVrqd9EA19cCUFF
         VKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839985; x=1751444785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS4wAnVjCQeW1rVCh4eHK2uX9ZfsLA1faWghmR3VJxs=;
        b=h8DTePUeVDnxsy65h++yJygmAmnUIq7NTcrtkK5FPEWZxeF7SUGjU1cAETPbRzNe6p
         nPjhJAD7f0F2PJmaoyw2ZxvLkCPujRyjpl9DOXW3la/5vP4szCzwxrLJvLfvFdE+VsM9
         4kknpVVMrYUDf6xCi8cvwbdcYxb7pAPke1J6zeAyT8vWX6dtVHYQXQSGsbuMwkEC/jIt
         TyfLdZF+XD86G9EitJ3lgu0X4F/aTtiCZLDxxWYklrsqWZNt2nsFd1vPESfpnJbYq5D3
         v5/YfSdtpv8Ny8RP0M/Ab9FGLdmxtJDkZpQJPcyJS4G5iLtLgSA5mrkF2NxqflqbqFh+
         U1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCX7zdXKEU/XVXfaCulENip5EnutM1Flx4Cy+fvGPEwyGToQvbI7dN1jLQM4WB4DpRKyrMCG1z6ZCfnkc/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHwyBT89nVR52+/x2Vy58rR0mC6eVghyTKqanVqwauaP5i/ZH+
	ukX9jc0X9qKJdY6PmGS4Bv0zDXUVOR5/wt6ngJMr0jR0DSri1JCq24UqafprdclLoETd5mO1lWs
	7+k8NX2m5LOhUoAEtayFMgPKmdVQeGQGB0O49uy0gIA==
X-Gm-Gg: ASbGnctFdDwqrVVn7ibAU95ToaqL9ahKsiBZOdxGscON0+MYdI25748gupwCIEjYLFA
	E/cTx5UnS/4E/7TB0HtzpmusJjMUIN93Z/hdJPx7sGDu5OFgrq4F4ONCwo+RnEE/mZpHi99A5od
	vzHLYNWCJzAoRhSwbXVg8P7LqBIpJb4EjaMv5ylkn16/fIhKfzVoP+/rEX2PwQJNbQHJAlqykYW
	7k=
X-Google-Smtp-Source: AGHT+IGpMxg8o/chcnQe5MhULiua6yOTHYM+kv1EqdYOqZzH7FhLx1vYLQZI7NUn33/FILfroU1k/T45xBu991cKMZg=
X-Received: by 2002:a05:6512:3055:b0:553:2868:6361 with SMTP id
 2adb3069b0e04-554fdcf5558mr547065e87.18.1750839985044; Wed, 25 Jun 2025
 01:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
In-Reply-To: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 10:26:14 +0200
X-Gm-Features: AX0GCFt4ItqCrsm7oeOr_Iat7x8NjoEMSLW9yiH4e8zUF9RBY6CHWLkj4pkFCt8
Message-ID: <CAMRc=MfS5Em65n0fwbu8JtJsc3rTgQO5cv+PymSonJtf6_zRKQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 11:00=E2=80=AFAM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> This is the eighth version of this series. I just added a missing header
> file in gpio-aggregator driver to fix a build warning reported by a kerne=
l
> test robot [1].
>
> [1] https://lore.kernel.org/oe-kbuild-all/202506092324.XqSwWl1z-lkp@intel=
.com/
>
> Best Regards,
>
> Thomas
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---

This series looks pretty good now, any objections to picking it up? As
usual - I can take the GPIO patches and provide an immutable branch
for Linus to pull.

Bartosz
