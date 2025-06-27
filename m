Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6810B1C5F10
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751001829; cv=none; b=sC/whYSmwCpPKDrIoG2Mwa8uSWRePccQCyatCcmwwGlCuWOUFDJYq6TZZAezO8Q8pEIVIy5pYlfePsEF4ycrN8YjoQmqqGRhwPAky5brzjMubwgFFfrMFHczSvV5eKsE40VaCF4RqmqVrVCNPCY6h3Ml3KLgzMiVlZty2r1JaM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751001829; c=relaxed/simple;
	bh=SiH7xridhHLVUbjwk1VSxv1+eCF5hmb0du6+goXv3Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDc/19PTrniHqhMwLy2jFtmA8dTgz1L7vRpVcT60/cfJDzdfwwz3O6Qmedc9t1SZBHfcxkLEorm7+0Pkeo6370fPL5Fo6vuhmyo6hrn87G3ECkHkQpXtWdrhUBSOy+/rdUOEKhO1gUE9OUFXiTS7C7q3yV6jxMlcYrIUo9fiUcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OJbuPpun; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OJbuPpun"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553dceb345eso1751576e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751001825; x=1751606625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiH7xridhHLVUbjwk1VSxv1+eCF5hmb0du6+goXv3Z8=;
        b=OJbuPpunTKwf9CcIgUHMnwTB0D04/IE5lfzn3aGfwBhG6KOeb8uEKaRNcwS0lxZMAn
         FdshKYPUSRKJbFWHH4Kpo4eOr1q2i2WAa0c+Mx6vmJeJTR/dJqfAOjwnG3nJRXATSq6h
         8jaDQq+dz1XItwHDGxM92u0bgFCu4JKel+xNUmKHTgTXwFA+XA4DfT4ViikgShYL/UAt
         bHEKZStw+ZnLx8pv7Qzoo7f03ogEp1xq4FTeaBD2LJYFRHM10xoo6FHGDz2B9IwYqfDQ
         HewAzVwYvj4HRGWlFRdogUOmfkxKmVNwWSx5u7E0+dbPCRR0qXbXcfNW4KtOIXdwCXBM
         e69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751001825; x=1751606625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiH7xridhHLVUbjwk1VSxv1+eCF5hmb0du6+goXv3Z8=;
        b=Ml0NCmBYvft9JLtqCyPUR4m47AknlnVy/917r0yin/WwvPbMwU8KUcYQX/pMp95g6H
         0/hDzynZx3aQdJn8whPz602/GdO9Xsp17H/L0Jn8+M0xUxNvSEV+u7C2wLvjPQ830H6z
         zicrs8TXRpBU/yv9Wz9CjTleWnC5Z7Yb3pKnWWwy38ET8+lu2ARVes09SaomPCyDJB8t
         J3d+qMwtCZ/47iWR5PmXJaY43JFBHnQ993wzJ1mUufbNq6JmaWgTt2AuAzL1Mj3ajK08
         xB5HkU11Rc4PLBIf2SsI/D/QEDBORw24IBhlsA8/6ou9ZWrU9nNrabwD1OpJfYvgKBqr
         aUig==
X-Gm-Message-State: AOJu0YxW6XiXGZI24QrKoeJCRsw7soPQu+K1tyo10RI7J0qYHewVpoZh
	qIho3Gu78nW7EbmK/NEQQmvZaD6B+GPwGqbH290axU9NQc/w18SN7ci6BeRgCk3Liix+9zbKFgH
	vV7ec2XQHaglIcSiqDcdJdzfs0Arqj3ZGfJ7WXqc=
X-Gm-Gg: ASbGncuxkio07Dyn4otkuICpfHr6l7KoY4ohZhNGkWhe1604iiUgePpUdH+fNIu6ZAe
	R6HK2CWduZJUAREvvapqk/iqE+WqIBmozg9kToegOPLGZxFoVl6/0oYbAtviDs9XwKNyzSNxXTG
	aNIsdOK10O0r5hHm1Z5eXKrrcA5kUqXTIZrfGk/J6NhQdm0R9S35DgW1p1ROTwriKVin5inniK
X-Google-Smtp-Source: AGHT+IE7lh4Q86gUh7l+Je06VBoRyg78BwI5g+/EKXqdZ1rAx6T+4jk0dsMVX/4rkMiqNvzdEzscayOuzGcNrtzMVgA=
X-Received: by 2002:a05:6512:b9f:b0:553:2698:99c0 with SMTP id
 2adb3069b0e04-5550b899c7amr639611e87.36.1751001825184; Thu, 26 Jun 2025
 22:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626124327.667087805@linutronix.de> <20250626131708.482362835@linutronix.de>
In-Reply-To: <20250626131708.482362835@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 22:23:33 -0700
X-Gm-Features: Ac12FXzM8-aep28R3IArGsJAukHjUz6095wlNSKyugOJbuE92Ig0D61cQdWf210
Message-ID: <CANDhNCoxEYtcmy9fRXOEgqZAEbanFU5A3aous=vG4aBe36Qh8g@mail.gmail.com>
Subject: Re: [patch 2/3] ptp: Use ktime_get_clock_ts64() for timestamping
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
	Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 6:27=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> The inlined ptp_read_system_[pre|post]ts() switch cases expand to a copio=
us
> amount of text in drivers, e.g. ~500 bytes in e1000e. Adding auxiliary
> clock support to the inlines would increase it further.
>
> Replace the inline switch case with a call to ktime_get_clock_ts64(), whi=
ch
> reduces the code size in drivers and allows to access auxiliary clocks on=
ce
> they are enabled in the IOCTL parameter filter.
>
> No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
