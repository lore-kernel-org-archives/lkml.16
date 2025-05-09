Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E367C220F30
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825783; cv=none; b=Qi5KQHMY3fAidN4FkeLuOS081Cwm7oZq2gsFhBdzF9vDq1G5qACKPHu/sn7F3ik9Mluw5reaPENKKIg4/wFh/X4RJD70nyow4/O1/tlg72UEU6dzxjguFlgYeYt0CxgL9OnA6acPbF+WESOno+maH5QbWOHrrxArbkVg2knTeDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825783; c=relaxed/simple;
	bh=UQ0qlo+cumKX79UwBgG9XqDTrOvjRxyPzj5vvdhGBQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVFGCRzwtA6uvuzI5JMvU334yA+G111GPc3+tUVQMg2Eyq+80Q7FXs+KbmAUkz3pAcMjj93ra9Qonvbe8tb8YciT2lTCyp2pXPx4C1fE+Sog6gpkjxtHjgLjSblU9Y8oURkMM/SwYXrNQhcCLGCvFnWh1jN4B5y64ADRerWU5yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Z5mSpz7; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Z5mSpz7"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fc4fc27983so844a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 14:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746825780; x=1747430580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmMe3vW4lyNfWDou+q4L04WRl287TtyiakNs3hFn5BI=;
        b=3Z5mSpz74C1GFDy821UDhQ9k1qcoUKkarvTgYgpCT4f5wvCZIukBva8PCQWW0q4342
         C2/mhKCSMKxiDnx43+5spyX2Ueqr1LByJkL8ptXHXZG7xLDjmernNqNidFVKnIcD9Ex6
         6bXYbg/1lr6Km9T7vaNuvHVjuEpZLZK5NFoOkSjfz2EBTtEXv3bZYCvh6PDhbDBaju2j
         VwYY9viKsLQDk7UhaQp9myvhnOLk3vwWQjhYd0HPI5ejUe+gopBngvKQDkzAsePGsChT
         bNsq4UDZL55xTQyCxHS5kJtK3irkc5fOlYzWpJND0v4qzZPPom1JGIuK0uSHVnGs3+8f
         zeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746825780; x=1747430580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmMe3vW4lyNfWDou+q4L04WRl287TtyiakNs3hFn5BI=;
        b=B//Ikia1JyTgo/cIfXfPpPg/nF6PbxgQMjmmiO/ucrlUWdrZGDCmqd3nm7mbFmt4bQ
         7pISjcX5id7JCOdE6G/N0tyzkeldqlOg1a+QYLtryTOhN0XT1An4a9BixI7zKJzTEwqa
         k0PpnoKCw/VAAT0w65W5GEZBw8LXsX/YdT9yO+CIWFO0FDO6jB5EfwEHs1PxUdcqyJUU
         Smh4i3vPg83N/e6HUlhinI7X5MKL2TJE7W60oITDLWtw1brjpx7F/YppXVnXoJuooyyt
         3bx9rwwP2uS4PuE5AO4XLnkBdEPomtJL19Bem0nEC5KyO98wQ0HLhfYhE0nuM09QdUq6
         xawQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/6Xnl/u0FTPAyZ+85gagSJ1TJFOFRO6BtVTPhRLjCdNT7ITKLwO2Gon3kklhZa3N0k4Ivt64YXAm6tjg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/bQoBsl8p4bQy8sHCjuO7fCFL03NneburUUh2psK7OzSjmdpd
	A5K0k3ATHJqQY0Aq/gyiB6R+iqYr7zpIkKAA+G1SjypmS2pFuGGvN/91l0eyXManvMcB8GDynIE
	MBopWavhxnMN+3Ud0zWbNBvimM0u9wbPiPUKo
X-Gm-Gg: ASbGncsmA8nB69KraehNQvA1FTWCeq24HcVHUSehIsjtqQi5CA1xF0Oq1OpgwzE8Zii
	z+Htvz2YsoLNYaDsZj/HhB73zS+DONWjYjitPUV3Jz+xI6j+HAJxkMHMUxAidxlSu0usX4iboR3
	VSQV8CAz86upuaTctEoaKz21tmPJiN12oh7ot6UA+XyCAuhml4UXv2M0yvP0nz0fiBq6kuWqg=
X-Google-Smtp-Source: AGHT+IHPOsOvytyLoZXJ/HaSBzGBFJQlrpcSUA8p8mo1k/cvAVzVFj/B+CSFdZdMT22Ya7LNJGNu3LBrPqnGNFjb6mM=
X-Received: by 2002:a05:6402:c98:b0:5f8:d6b1:71ba with SMTP id
 4fb4d7f45d1cf-5fcca38de61mr24137a12.4.1746825779809; Fri, 09 May 2025
 14:22:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509065114.GA4188600@rayden> <e5bfb069-6adb-4757-a52c-bb3635990686@app.fastmail.com>
In-Reply-To: <e5bfb069-6adb-4757-a52c-bb3635990686@app.fastmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 9 May 2025 23:22:23 +0200
X-Gm-Features: AX0GCFuHNx6MvLb6u653mJm9uz3oiL-dR9aPw7rOMiTgfkX9j4rJTsW5oesdTl4
Message-ID: <CAG48ez3JEg11GZTzmSHeXEDVz9vN68vWjTH+2sq_6+8eK0zkig@mail.gmail.com>
Subject: Re: [GIT PULL] TEE updates for 6.16
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, arm <arm@kernel.org>, soc@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 11:14=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Fri, May 9, 2025, at 08:51, Jens Wiklander wrote:
> > ----------------------------------------------------------------
> > Small TEE updates for v6.16
> >
> > - Remove an unnecessary NULL check before release_firmware() in the
> >   OP-TEE driver
> > - Prevent a size wrap in the TEE subsystem. The wrap would have been ca=
ught
> >   later in the code so no security consequences.
> >
> > ----------------------------------------------------------------
> > Chen Ni (1):
> >       tee: optee: smc: remove unnecessary NULL check before release_fir=
mware()
> >
> > Jann Horn (1):
> >       tee: Prevent size calculation wraparound on 32-bit kernels
> >
>
> The second patch looks like it should be a bugfix for 6.15 instead,
> any reason to have it only in 6.16?

FWIW, it's more of a cleanup than a real bugfix; there is an unsigned
integer wraparound, but if that occurs, we're guaranteed to hit a
memory allocation bailout pretty much immediately afterwards. So I
think putting it in 6.16 is reasonable.
