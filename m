Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B175D35961
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657110; cv=none; b=AnnPuSiY2y8aAXqnz/MUzBYC41T0GY1DqYnaKhcPuFh3XYCbzhbmIGMiPfSeNlj/+D5KiT0cE+gqLl0SvUJl9rYq2AX2AsuQQd0pYfJAnKLOoNqJ4hT9r7fKRdaGPNtX8O8i0LZ8Qcfw9jePHmULyMkSLE0ss9fN1CevsUfghXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657110; c=relaxed/simple;
	bh=xSwsjJm5hVMQ3oyIZl9x6ghPg1fPa7a227nroYphjpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIvo1ypsJ6HgqWwpCBAOeRgztAC/HJ+tLzryAHStlPf0+CykwfFxiLD1vtLr3v7LSQfcYpNF1o/+nrSZl9FcdU4QkFDxiSlvZsQKp9RlfyGjRXzfwDPc6XzrfWGQEEcnSDdJD+oj0hEnPwxoo0eXF5m6W4ZONe434K0aHChzF8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZNWAR9y4; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZNWAR9y4"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3290ae9b011so16414711fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747657107; x=1748261907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSwsjJm5hVMQ3oyIZl9x6ghPg1fPa7a227nroYphjpQ=;
        b=ZNWAR9y4VBBopfZNC+lE2HKdWrIQ+fM7DxtWvca3SQim+F6D6cQUOxyC3GYYEB5rRn
         I3OJo33LOBFSQi9efKZEkOpuxveUho5D1v9c9HrbMKw8iDBSchtCgLDD2usd2AiWHTNR
         psd+GLpdaCIDG83LTU7PTWnKPmYrY2Qmbbv5USuW7WCLuj585gb8ksdhGi3qnnk6At5U
         JZIvUH7ZfvQO5YZM0518VfMJgJccJj2QB1kTXg/mUmr8yKrvFaa9tVUX8jdDZZjw54Vj
         wDKfECuRiQbG7UQEqKKmSdhqJRGz3JkhEGQesF1VBSew/lfDjilt8ZMLAwBQcv5KOk1y
         oM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747657107; x=1748261907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSwsjJm5hVMQ3oyIZl9x6ghPg1fPa7a227nroYphjpQ=;
        b=D3TjFqr4JLnU6TePt8AJpM5G99qfQU+GoGNafKwylcszM3LLEvDXHi0VDbaVf+KxTS
         h1/wnhWvLld+Jl+rwPbUjOM8z3IYYY3J2Cnyq+vOwZGJiI6VF9FkJKpshqfeRq6gKoF5
         bIUUJ84+fCWEiWCp3iLHTiiONV0v3m3oqfzAbfJmKDl++2+fGaMXocEvBuRaKh/vhYjh
         +BYklzcTWGPuCdoJOwBpvTePkkNohOIvKj71vvHqLWDA/+rc0fBS9rn7Dqjg3FfIgrk+
         1b/QZIalK35+ZFu51I4k3D835MpD/MBvONaXynm66CWspF7wo6Sbp453NRD691Mn8G+0
         7AzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU6n7ztqi4AduaNiJJtQuTs74pux/pCd3fdKdIeffo+B/PL4bG8nAGe5oarhDNM7f3rvPfK5K90wEHY/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLYXh9Se/EDFgTP5aG+gkOWPjmxAjXqYyCE2czg4yWoNHlvvrs
	gUMv3bhtJl4s3S/FAFQ+euORbZEbsso/+IzVgtTEChCXSqvK4t+dryX17K3VG40uFqfmCKjfUiJ
	w7WaDWiYdr+iCiMyVbxY86YfhIh7ZqOfE88hVCT2CFQ==
X-Gm-Gg: ASbGncso4UY6lFbPc/H+hg5FJhCwWtjfrL2x/y7oOE/mSzxrGQahVDRlZ0K6uldgqnH
	HpvykI6RWgUBa14Nka/+J3Z/Au3ITDwRLacEWIwEIKaWEyusvbpu2+wVpehxC7nAsbZyTqzVbL1
	155xw6rX5IjHQsyiF4VVSEW5nxp1uJKBzASx2vbMzLxX94ein679PQGn1nwIbm60c=
X-Google-Smtp-Source: AGHT+IEfmcE19StFmDXmpOeCqjpKda6oUT9HRkJFDdD31nUNQnXxT/1wRO4xANSrSCAahsfNovBwxdt00YEcPDJ1D5Q=
X-Received: by 2002:a2e:a546:0:b0:309:23ea:5919 with SMTP id
 38308e7fff4ca-3280974f135mr34269361fa.31.1747657106740; Mon, 19 May 2025
 05:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516104023.20561-1-brgl@bgdev.pl> <aCckl9cC8fCBhHQT@hovoldconsulting.com>
 <CAMRc=Mf=xW6HFVYOOVS2W6GOGHS2tCRtDYAco0rz4wmEpMZhmA@mail.gmail.com> <aCdutI4J6r5kjCNs@hovoldconsulting.com>
In-Reply-To: <aCdutI4J6r5kjCNs@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 May 2025 14:18:15 +0200
X-Gm-Features: AX0GCFsDF9ot7LyL_ZfgUEjkR0eZtCR3neOBlRtmFOBTQNOHogwDGbOPJ6M_0Y8
Message-ID: <CAMRc=MdS0QG_ThYUhwTRaKidyGcj3h6x0=jmaW7UK8EBPhrYrw@mail.gmail.com>
Subject: Re: [PATCH] gpio: sysfs: add missing mutex_destroy()
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:58=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Fri, May 16, 2025 at 02:32:54PM +0200, Bartosz Golaszewski wrote:
> > On Fri, May 16, 2025 at 1:42=E2=80=AFPM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Fri, May 16, 2025 at 12:40:23PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > We initialize the data->mutex in gpiod_export() but lack the
> > > > corresponding mutex_destroy() in gpiod_unexport() causing a resourc=
e
> > > > leak with mutex debugging enabled. Add the call right before kfreei=
ng
> > > > the GPIO data.
> > >
> > > No, there's no resource leak and it's perfectly fine not to call
> > > mutex_destroy().
> >
> > No, there's no leak but with lock debugging it still warns if the
> > mutex is locked when it's being destroyed so the change still makes
> > sense with a modified commit message.
> >
> > > You can't just make shit up and then pretend to fix it...
> >
> > There's no need for this kind of comment. You made your point clear in
> > the first sentence.
>
> Your claim that there's "a resource leak with mutex debugging enabled"
> is is quite specific. Now I had to go check that no one had changed
> something in ways they shouldn't have recently. But mutex_destroy()
> still works as it always has, which you should have verified yourself
> before sending a "fix" tagged for stable backport based on a hunch.
>

Yes, I admitted that the commit message was wrong. And yes, it
sometimes happens that we get copied on crappy patches. However,
unlike what your comment suggests, I don't go around the kernel,
"making sh*t up" just to add a "Fixes: Johan's commit". I had this as
part of a bigger rework I have in progress[1] (discussed previously
here[2]) and figured that with the series growing in size, I'll at
least get the fix upstream before v6.16-rc1.

I should have given the patch more than 10 seconds of thought for sure
but your immediate hostility is uncalled for. Please try to assume
good faith a bit more.

Bartosz

[1] https://github.com/brgl/linux/tree/b4/gpio-sysfs-chip-export
[2] https://lore.kernel.org/all/CAMRc=3DMcUCeZcU6co1aN54rTudo+JfPjjForu4iKQ=
5npwXk6GXA@mail.gmail.com/
