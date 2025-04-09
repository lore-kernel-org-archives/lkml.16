Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036FD267B1F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217041; cv=none; b=KdGwvM0+xvLxf8gA9PnTFlqSbnkF0L1qI+CvKXn5qW/h2M1uJh8eZnV+ERVVZoZYPOsm7n7vi4/SeUdV5wzb2q0BETxc/EWajsSA6/GZA1TSdljEWCr6t5qJDzmvPLEPt44qzqTMh7SRD6/0B2TELfywPBGJvU552iMFev7W9qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217041; c=relaxed/simple;
	bh=T1UOxjhpPsPhSQtw6G+iRKDta4RLFuAj7TRD1IXXveo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQlTdy9AbzVR+E+8aU3WDYKfhQPhtVGTi4rqryIgfxX3+dkaoFujwkgEr+tD3zhnYIKrdQX8aXoP35MLk3fj8QgB1tBuZTPgo8v0NhLOhajexmqvFRV0g2o99t5W+EafFrb2znehguhe+afl0dVW/EOwm657FQIKc+swdpwIRMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gd7VRII0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gd7VRII0"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54acc0cd458so8381563e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744217038; x=1744821838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1UOxjhpPsPhSQtw6G+iRKDta4RLFuAj7TRD1IXXveo=;
        b=gd7VRII0VB7hhUaD5AsdkLlob5qBs++5+9ziNzuGUGwjY1pRVRWACIYmEOhf5IYPVO
         HpOZJD1xz7OKZ4bYktpPdUHmht+HQfjc21ulmYEQBB8MRdutCPpDdJb8cNNC/WglbELF
         isCCisr8HMV94sHYsv/37Y0Xdq85SwJ5UJPgfCjI36m0LVUfsPQoj/qeG0bFpP7qp0yq
         DtmdHYSJzcQkjmNnbwDP4HXHbzBmnut/7NSTR0FAcCvN0iu2uFrTiE7tO8075SqwydcP
         jCezFrrGzF7B/xZ8x2Bjoe3VH6d2bF0RSAheUpeag/jopILjjpdxRWHIi2MfZE7NxxSj
         O51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744217038; x=1744821838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1UOxjhpPsPhSQtw6G+iRKDta4RLFuAj7TRD1IXXveo=;
        b=krYPLYg17jIbYCYbESbtkyVoNOEZJeINBMO0dcaHNELP2RhL8GzhCKMP/Q7Zvp3N4d
         7TfXtAXztCYvTacge8t//7eCc+M0HWDOVQmpOHjknkqOCJvW95eLMp0Iv/RL4kJPBhfT
         1NSrk4P3mnUSXnarSh+4ONKLutX4LbCdctDZTvJgeMWrW+6qv6DOY4Tb6ZaaIIEgbOW3
         mPAHYKJcSsRyJ8EghOlr40jdcX5XUVeKaKYWuSo7004V3yTk/6oGnwCG8JXfaZV5UKY/
         HoiwII4o7CP4QxkBxKvnhrZh6QsHTP2teSJ1QGUhSleQSLNFgVk8jTiNtiN9t1vNObi1
         6RsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8voJIlZweExdzHSSGmlxNR5JMIX0CGEpa+B+qbOHTiwkzkdkSncWq6XTS/5BD3P+K7XGyAVZID3X6+9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM4NFds70vIaBws5a9vjTQeI1vaAgDIsLyPO3LP9E1qyVz2cTx
	GoN6Awb/D/m6TA21jxvuIBkvlp0ThDlnXlwQ0i4EQRXViswv5A5mDvGppQhOUC3R/I1oQwk0FOK
	8UHk8miUug7gznBfngX5hzOZwF6KK2FYu5+OwRA==
X-Gm-Gg: ASbGncu1Y6nDUS0fHI/dYCpap8DvZlQwX0x19iuy9miOvR0MI3aADjIiJoAyZ7N5PMo
	0kE52mMESINj8gMxD4idHCjmYoEqEVoD1yTmx0QiXnyMXnSejV5UrL7yA7wZrIvhcKtVCvSynea
	ocq8eDZNWTxJ7MzJBK/iEI+0WScS6cK7qrKmFlKGaZPwkS4aBfrIrH2Q==
X-Google-Smtp-Source: AGHT+IHhkAgu3QjROCGUJXTB4kW4wwAYSm8J2vtOKbqbIo+dJ2n+TEanaH7n1VTiK2H21P/9SxUOmXw5m8Let4mT4vQ=
X-Received: by 2002:a05:6512:3d92:b0:545:2f0d:8836 with SMTP id
 2adb3069b0e04-54c437b480emr1159242e87.40.1744217037919; Wed, 09 Apr 2025
 09:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-gpio-set-check-output-v1-1-d971bca9e6fa@linaro.org>
 <CACRpkdYujYhF8VP-_6O4Bt2tWL-NO-GgQPr=DeqE9QwCq12gqg@mail.gmail.com>
 <CAMRc=MdwQZMDaHn15n4zgCujtDRg=UUwz3A9ZUYY9Uv7FFgz2Q@mail.gmail.com> <Z_aGZqsUXq2uyQfC@black.fi.intel.com>
In-Reply-To: <Z_aGZqsUXq2uyQfC@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 9 Apr 2025 18:43:47 +0200
X-Gm-Features: ATxdqUFMPhXHk7lQUf3DMlzg5Y5WXAkfdazwddpm-cxwT2Q6grS3dEAYZSF1S4A
Message-ID: <CAMRc=MdsRWNVT0XC1DvwBdhZFsVZO6DeMrVePKgiF4Mj_Ryykg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't allow setting values on input lines
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Mar 14, 2025 at 11:35:21AM +0100, Bartosz Golaszewski wrote:
> > On Fri, Mar 14, 2025 at 11:33=E2=80=AFAM Linus Walleij <linus.walleij@l=
inaro.org> wrote:
> > > On Tue, Mar 11, 2025 at 3:20=E2=80=AFPM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
> > >
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Some drivers as well as the character device and sysfs code check
> > > > whether the line actually is in output mode before allowing the use=
r to
> > > > set a value.
> > > >
> > > > However, GPIO value setters now return integer values and can indic=
ate
> > > > failures. This allows us to move these checks into the core code.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Makes sense, if there are regressions let's smoke them out
> > > in linux-next.
> > >
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Thanks. I decided not to queue it for v6.15 for exactly that reason,
> > I'll pick it up early into the v6.16 cycle and let it sit in next for
> > several weeks.
>
> As far as I can tell from the reading of the code, this will break the op=
en
> drain emulation. Am I mistaken?
>

Could you produce a call trace where this could result in a breakage?
I tested open-drain and open-source emulation but maybe I'm missing
something.

Bartosz
