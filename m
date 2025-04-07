Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D719222B8BD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744020830; cv=none; b=R3AOdWC7EtoodpddcfXCw3gWdcFEJ3rYF8NnSAk3Y8bPDOkvBX0fFzw5DXX6NUdMbyMbUeqwdRSW4CfX2NvdMIhCGBK872ta51JYd0NlyR9feBeLQF4Lv2deSDfb4UPxXc2hvVHaGSwa3dxFbgqsiWsjCOAoo8TBRF70qG+Ew4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744020830; c=relaxed/simple;
	bh=dX1/+XSuAHobVpykCO+uGfUJlHL5PEjYe6qDhF5RZVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhhFYyt2S2CDilbzebeKRksCh6u7KDuSGY0TtHfs2L18MCNM/9fAu/lI7YN++zt+Wqw2qZSuoLk4T4t1wK2obQxb50ywbMObjmTq2h9J/qVz0QTDCNmI2gDo3UcyznB4oTg4EZUbB6eaJqcqk8pR8g+eoQad2AVkC9rrAfavzk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b0Dl6lU5; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b0Dl6lU5"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfed67e08so41722221fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744020827; x=1744625627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dX1/+XSuAHobVpykCO+uGfUJlHL5PEjYe6qDhF5RZVk=;
        b=b0Dl6lU54u/af0fU5yv7FvrFVf+mpt7qie2NAEqmFV3xHSmQiyh8kykOP5vfZhwOW5
         niqiUtIMCOon3L3XZt3GDItz6ZwgMKwj4JtzMAT+oeT6jzUmvcllMgF9QX2E8AaASr/S
         2dT0HlN7MGYHbfGfWcPjrWcSWY1l5OvtQ5PdhhPTFeuBy1reSdstFioCwSy0oXTgyT+P
         lKjhzXyBPm/W8Iv+jl8UVnyk/OCDR9MBlJbvdox++yXxRj2Ov9FBKk9dMCar5JOPXBvX
         KmbE5KPcrwNpUjdbV5N87X15TeI1anLEkmPyQH4ooHtsl9co53JiGMvTexMC92fE5rJ1
         W5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744020827; x=1744625627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dX1/+XSuAHobVpykCO+uGfUJlHL5PEjYe6qDhF5RZVk=;
        b=CJ/uoOF3BSlr+h4jkQsb81xWwmkGq4Kc65Ze+KIf16ZKg2RuluUicB3Zzn0F9gaQTu
         fWM6FBO04fVP1GUY1gNo3OD17WApXrX+6TUDeiplEtVPnKktns7G3+rtp2551AqJQ/dW
         ipDpwZbvZ1gvnTL2SQH60UztCSQaOPXn+kkpX956SAsxJMCCpbuNXyC7J3BmREwH/Vhw
         pouIHFAvtW2nGIYvqDb5gvCHg2CCpi4jJmmFsJbRwXgP5qAV6F59S8fCS49YGv30ytLU
         Iq8OYSal48N3JDSQClQP4UhcMCanZiHnZk0BmVO+ydJzaajvoocF6MxtkTR59+7AgRTa
         tRMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlvrkaKAtjPJdkNUUDuyiXN/LJtMTxS/XEYWoONafKavIL89ANcJf4IiBnE3/UfuSAYsv0Jg242NZFICU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTwYJTpK3IM1hYACOP45BEZEHnNd6MOFJfn27nCfaUe1iBI9L
	Exjb5wQSjuWSSI9S0kB/Omt0HcoG1fstDPHSzn4TjAlwWfB4orHsYQtSO7zh6ociKeF6uPy4GVI
	CBqLFRDVQ9vzRq/cps1QjPQfk9E875Cgj0zafDg==
X-Gm-Gg: ASbGncvANW/U2LjpfoEucgK3dPWEMC+upp2MzSOc9ouKWtXd7Zpm/YkrkGo+6vXC9c4
	8pVJJJ8CypJ5pVhi0cA9VVj8a/vs71fuvEVthACgiqC/+qXUaZsE+a4r3iCLPt/K3VCQEpCWAY3
	57BTrqVU1F0dPIJmLx3Uqwlx6FbUictmdq0lmwZMdmSFOdw/r6ay17bdy0RbC0e+OPQe+f
X-Google-Smtp-Source: AGHT+IGUj+2Um57K9D9VVnZKJ2wBdrPDVBKaixvt+pbBuz5lHLoqoJaDr+EysI/Ojf9urHGLv3Fa+GklOvIXwv+POLc=
X-Received: by 2002:a05:651c:2115:b0:30c:5c6:91e0 with SMTP id
 38308e7fff4ca-30f0a0ec026mr37136501fa.2.1744020826799; Mon, 07 Apr 2025
 03:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318-gpio-pca953x-level-triggered-irq-v2-1-c8bae60e7e17@gmail.com>
In-Reply-To: <20250318-gpio-pca953x-level-triggered-irq-v2-1-c8bae60e7e17@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 12:13:35 +0200
X-Gm-Features: ATxdqUH857ddIG8vrZvXaER-ytMY-5I2Ye3xG7kjDWI0ccqry6HWIeId4Nrnd34
Message-ID: <CAMRc=Mep_p7RbfWRrBToCuf+SKnHQKNf_0kxc0inpuGD-t4vpQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: Add support for level-triggered interrupts
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrick Williams <patrick@stwcx.xyz>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 4:46=E2=80=AFPM Potin Lai <potin.lai.pt@gmail.com> =
wrote:
>
> Adds support for level-triggered interrupts in the PCA953x GPIO
> expander driver. Previously, the driver only supported edge-triggered
> interrupts, which could lead to missed events in scenarios where an
> interrupt condition persists until it is explicitly cleared.
>
> By enabling level-triggered interrupts, the driver can now detect and
> respond to sustained interrupt conditions more reliably.
>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
> Adds support for level-triggered interrupts in the PCA953x GPIO
> expander driver.
> ---

This no longer applies to my gpio/for-next tree. Please rebase on top
of v6.15-rc1 and resend.

Bart
