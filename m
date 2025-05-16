Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7A323D28B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398789; cv=none; b=jIFOWRKUQXo24IZhRbnoKiv4wydstvDVFgP96SBQDyu6K/W979+D4UjA/q8O9n+WCKoGFMhVcyZ6emGoOfZccbcJfJL+mlpD8E96ndv9EQhoZpEDyUM3eNmErDm+nfcJB0BiIGyqwb9a+iQrbAbjomU/3A6cJkWZlxgEeK5iolw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398789; c=relaxed/simple;
	bh=0tAXt3mnsy+2oybe3qYYZC8YhgHb4GE7oyn/jQHPSxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMhGFhLEPpMnjE1HZtFa+OyuofsP4jg4tnlyNJQywnxujxQLyJbb+OZ/fvFWiL2JqqA8/90r1xsFxo+1Xp+vid/uUpYw/bgVvQ89yfMdrlE/B7XBrxCqifNPaKigWAeEK9OFyI2uJfb4AdLlTsW+qk89+0EKAbmQVMxuyVUYarY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3ZGU2PbG; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3ZGU2PbG"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d6f933152so2895281e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747398786; x=1748003586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tAXt3mnsy+2oybe3qYYZC8YhgHb4GE7oyn/jQHPSxA=;
        b=3ZGU2PbGiDH7JBxrJpoSsiMQxICvwt7mUzdwZcxANytUv7VxMGXWR2tuEyUTID/CRo
         4VuqIhdfzIHzuf+Kt8ppJU44PPHu3NPuuggr5oGqcbrNYmt9rHJHeSpY0X107WuNfYoR
         WfvAwPgRKCiZ0ChmSznttfLuZA5UCv61W8CjMTkPCajdyhnwqfqwO/4qsUmaR+jGN3Xy
         fhx1Xa0/fZQ08s5e5za5LwuC7dS11PSgBM+hHvs8gXqRY+HlWCymVAa1maQhwjA8ppS7
         fx+XNaRP2hoYKxPdzBlifed9kYIaw2jNMgMviqUPGa4Szd1o56goJad0/Fl6fEKXhemj
         9b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747398786; x=1748003586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tAXt3mnsy+2oybe3qYYZC8YhgHb4GE7oyn/jQHPSxA=;
        b=sM4W0DPqvLZ0RxwtjEXMTsv/oQfUfqENe+/pcK7t1yyOPPUh5WiFKxSWtCwak8UAYS
         DVEQ/+5v86/LTLJUAcKpN5vGdfevSy6pz9nE5zQslBHDE8rhCGaRdBOGa8kUOHnWhlOa
         LJC3wmNGTsH9M5UKjaCW3Qtd/+fH+42FJ1difN3xMi7GGTOXi7Mrcd9VXprzcRqI3SYT
         eFogcXfRw8/oIePieFpizmJcsAuOZ96X9Riu5V8vNNaibeZc8BboVSgvS0+kvgvjXdWf
         nrvhbtjRkBMm+2Rd14/LwQObveBdgQEGZRF1c5WDELYdzq1p16ojQTt1S81z1+8xgPOw
         YZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCVk5KALOZQGIjLQq47XPiQ0goHGKGN5LEvk4lgyMXY+PNJt2u8W7ufI+5tgECpy0I/RbeM4a+8ST6GyhUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZznIqIyMwuo+akFC0Gwt4bWj86NiZKcBab/SuSX2bYFr+kRxx
	J3itMeyvC99OqRZOzjn7V18Lk3GlVUjrR6orutllziv74/avXBZAq++EZt9RYHfmYodFLdNwjeW
	LdICOBBZR9oMbrqf0Bq1c+HxKhr4UO2rWwHevMKduVw==
X-Gm-Gg: ASbGnctAhyZYZ7X0SlGnf7q5sypm8e0RkkmJNHWNJ/HzWiQyh0scQ42dT4Ti4V+lVHF
	vJ3YmMvIwWnRGY9FUWTQxmGZWvwAsNMw4tCXRh1HHbi3obCJfgA9U+Z4KPjzvAo6eGNBDuy+NJV
	jW8duSXNyh3/s/yOAZJ8hRPk21MAkcaQ0=
X-Google-Smtp-Source: AGHT+IHDRCpxLBD4ciAXOEsbtKSxPOvDHMDc/rr4GKx+Mm0MMW/Jvf6eXKQOYFOADgDXdhM2YfIXxALJS+NyEENhTis=
X-Received: by 2002:a05:6512:4387:b0:54a:fa58:a6f7 with SMTP id
 2adb3069b0e04-550e97cc2d4mr953395e87.24.1747398785922; Fri, 16 May 2025
 05:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516104023.20561-1-brgl@bgdev.pl> <aCckl9cC8fCBhHQT@hovoldconsulting.com>
In-Reply-To: <aCckl9cC8fCBhHQT@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 May 2025 14:32:54 +0200
X-Gm-Features: AX0GCFu5kkLp3T0MfIjd7ZcDhu29GuDKlrHblkONIj2lvZBjQLsBkle6dM8L9Hs
Message-ID: <CAMRc=Mf=xW6HFVYOOVS2W6GOGHS2tCRtDYAco0rz4wmEpMZhmA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sysfs: add missing mutex_destroy()
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 1:42=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Fri, May 16, 2025 at 12:40:23PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We initialize the data->mutex in gpiod_export() but lack the
> > corresponding mutex_destroy() in gpiod_unexport() causing a resource
> > leak with mutex debugging enabled. Add the call right before kfreeing
> > the GPIO data.
>
> No, there's no resource leak and it's perfectly fine not to call
> mutex_destroy().
>

No, there's no leak but with lock debugging it still warns if the
mutex is locked when it's being destroyed so the change still makes
sense with a modified commit message.

> You can't just make shit up and then pretend to fix it...
>

There's no need for this kind of comment. You made your point clear in
the first sentence.

Bartosz
