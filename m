Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307528A1ED
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736637; cv=none; b=p2Io8QitVMjxSKpT4+hQniPzGXbmOIkykS7HVg4rZI9R57yPt3jOA8Sf90mQZCmMfEo/lDH1L3/1a8RC++NA6sEM5HXrmSjpUzLZ19eDa1vZR62KTc7kTeKUoRxVXgMZE1AiTDLvyIbzSWLdAGpD5h+br7T1ETPAHPvSwZj/iB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736637; c=relaxed/simple;
	bh=A5FEGp8r+5od+JlaprBQcT/Ywrc2ivb4zcsH9pA1f9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tv3k407J0ks0Fl3gBhsDT+N433WUGKOC3MMt1A7aFBmquKfTdWUipREz6nuginOwhnJroTKbSVIdItYyBoEFPeE/nkzZpqmConx7YSosczQWVwW7oukBg2nhrEyJp0GPLY9aWdckxmI/i2fhkryyJ0/12UO1hWBFVeuJ12VssSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JVAD62Em; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JVAD62Em"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30de488cf81so13046301fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746736634; x=1747341434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5FEGp8r+5od+JlaprBQcT/Ywrc2ivb4zcsH9pA1f9I=;
        b=JVAD62EmfLHsumDHR0bQxa0np9QDUeruNBACU35Qk/clh1cAeTAxmP9NjOSLEuVxXN
         0CVYCfGxNcbUYy1Ujev3hCnkwdiUcRMrQIh4G/N/pxOu1keQFTsaxRKidBXpZObj/lqO
         l3uIuR5klgbhXGwVVUS0vXSD+fQ5LLl1E5283iLO7pT02kuzDQbUmcC9WbQvofe8JW4n
         JHmE6AaqL7PjEBlK//liGKS1Gwrlx0nTeYlSC5BO5jQ9ObZsOohwHcititi/Hirt8JOW
         2aN5H3a8rHQgch6VMhnJbvcN5oLQ3atUSoLI6+cZ7y74wX3zv3SAV7ntkt2gBGgSQxdc
         UGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736634; x=1747341434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5FEGp8r+5od+JlaprBQcT/Ywrc2ivb4zcsH9pA1f9I=;
        b=lwsTkznbH99ywvnT7VbkQEQoGDIjxAuwh8OTEUhfMVGpA1Dg317EAcy39GECY9GZSg
         zT+4SpMviR1A6+8+oxsAmkrQ9bo7tl7qtgmXl24bX7I8o3IR3hcTAQp1q3jhUjjG/72B
         63w5DHpfJSDVhgBdHsP2YFQpBP6IrqYY9ttq1ECzrdJYJCg5fifhy9mTc6UDuRkYUAxo
         elkLJQ91cxNCN4kPij0nKw+mPXSRBLyPUXQVYuJy4Tzqj02f00jz46pNV9oFn/VD+gaR
         HdIu62uu2kDHH2iEQpPoEZNEld6Ilc4UgdbQATYXuBmVr5AxflnhLXae6gPNVbRSBike
         Y0AA==
X-Forwarded-Encrypted: i=1; AJvYcCVmzV/vQRBUSduc36i6n++iYTtz9jo4kAcDB/rKNrUOmwz1PUJlJ+gj7sCC6MlRuYMcpi3I19O4ZAPcxtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTekzwFqg3Y5fI/SqqpucSOJDURzRINIaKNoiJ8m2LYitDoay
	HbK8ffHs55hYcAIeDQWUVObsMckuoBDri//1Mvp9dxx00i8d/VrVcrrVKV7VpDw3Xmsqg3hk04j
	jxU+mJ4t7YdactiQNqC0wdPb4zTrhn/lF2TuMiw==
X-Gm-Gg: ASbGncvf1+TAOSTE1BGrGzdrv/luSSWd2zjhMVl26co4PzVWslsL95OR1+lrB0UCagi
	AZ1L+d1CRXUi6F8Xf3RXBix+2/bRd35n18kio6IDQSaxrYf5odTzdcE8YmyZFYgm/fOesKnxq4n
	q9QDQqIj3sH3NgDVbxi08gAw==
X-Google-Smtp-Source: AGHT+IGVs8OBs3YrTtONe3XV7US68XWWpLWC5HM5bRwwTzVW+hZBYesbymsxYB94plP/2lMdY5IxGudKdxOVmw3MRXA=
X-Received: by 2002:a05:651c:885:b0:30d:e104:d64a with SMTP id
 38308e7fff4ca-326c46b2b7bmr4152421fa.38.1746736633880; Thu, 08 May 2025
 13:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502100841.113091-1-brgl@bgdev.pl>
In-Reply-To: <20250502100841.113091-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 22:37:02 +0200
X-Gm-Features: ATxdqUGIytDrG-RZcZQg2XJ82RlylEF1rDHHrGyUvjJm9IxmZt1ZkIxiitbTU0Y
Message-ID: <CACRpkdZ+K8gw_L3TT=UmSEYo7fA2feYkaP-YAf5QaOrWywHu2Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: drop unneeded dependency on OF_GPIO
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 12:09=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver does not use any symbols from gpiolib-of.c. There's no
> reason for it to select OF_GPIO directly. This addresses a kismet issue
> reported by the build bot.
>
> Fixes: 8e86af65f39d ("pinctrl: at91: allow building the module with COMPI=
LE_TEST=3Dy")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505010447.kUlI61vt-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied and pushed out, sorry for the delay!

Yours,
Linus Walleij
