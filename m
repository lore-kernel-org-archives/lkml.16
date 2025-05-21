Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7757528A1E1
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747849244; cv=none; b=VhuNDH3yqcyHxWI/A4FQiWD2L3O3X0+uPxGqn50uYeIKSlS8mugF1e7+Sv/xZZGFYDrNoJuklVAEjOhKlE1uVtAA9gHjRSipQl+/6KeLUqqw5Dfikj8j3pPaduUxi6jrAJjnzOP2wo2+NOOwb473EkcdJIljYj2yj0KavFyyXSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747849244; c=relaxed/simple;
	bh=+03xei7P5IfU8Zakp+0n1c6eszQ2Bn3al0pubZ7JuiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2pw8yFwpRd0q9KJqtvDpDccmX9a6NINqrNy5ek/5RTF/D+O6kq0tvTUw23q+1ZcjGg3AFR9yPuqHyTjOEQL0KVrkic7CNbihZFX0zvqQS3e9ZYo7EIf1ETEDCa3FKa58aO1848kxXzIDiUwd8frb7C3UZVFqZmRBVWtrAFr6bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ALOGHFJX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ALOGHFJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747849241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qs6bNNC1yflKUpZTQQs7QHuv3FqzIeOQq3NsY0HzBHo=;
	b=ALOGHFJXYNORbCy9yzwE2E9ULr5seTwaPytojKHGlQCnDRt4s0HwQAcS1UZKIgdip1+649
	opE4cRw5NyqWp+IhfgM22Jkbt5TtTchdPQDUOtcnBsCscmiWzXaedNu667WBddznrP3tJ8
	vbj/4WViGuaHN3G4o6kOZFpL/uMu1o8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-IO-A7lcBNLOn2-QngUUUhw-1; Wed, 21 May 2025 13:40:39 -0400
X-MC-Unique: IO-A7lcBNLOn2-QngUUUhw-1
X-Mimecast-MFC-AGG-ID: IO-A7lcBNLOn2-QngUUUhw_1747849239
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70dda56af0cso43192967b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747849239; x=1748454039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qs6bNNC1yflKUpZTQQs7QHuv3FqzIeOQq3NsY0HzBHo=;
        b=MpGzYJszsEKF8ZLJZzWS3LWzEeqXTjyvjY7XPnffdrQhcTBsUcG/7J+qcVFCMkMDuq
         6N3Fiw69MbRZ+tJxLa20BDldnC5vrUxnzoyEEuI6M5SuLKhnVrposuI8wAJMsQ7/DDHH
         LmID0JBYZcEpgsT/75dMLvvTa/KyogUvAFhk90pbA1RUh7pEMeVPfsT6aN8VLYI6WIF9
         haxOKBWY3q67B+2FGgXuMX71NhmohuqfVdgZyJZQKua6rApLLCC9dKIVgPRBxUKGVzri
         +8RFsnX0tq3ewPl1RQQfkHgh9A1Ey+5s/PCO2hOfHwMmNp1eTMmhGmqx0WKSZhOsxjEa
         VR8A==
X-Forwarded-Encrypted: i=1; AJvYcCU/W4TZb/C8YTzPVRn61vkJocezwupxL2VRQRVZDfUMykTw1OzjbPMihltezlIZ/Bv7c4qoRJ74ongjcXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+R2lISEwMNBHLpFlPAcyzvY2K8dhls4IhxtjmyhVX8RVow+np
	9TyoQr+n13aTLTN+f6toMYjd3zJiEqek6JduWTgjHHD+d/R2/nx9gkbRPmXqTpAmF/Joppjw2P/
	wmaUyaftVprN8yM34kdxq7YG1Plkw7XAKzwLxbhyWD5Ne9VZJt2GsU3OwQnxBhzLyIUuxQ40C74
	7NW6QKazC1wHLAOACNnL0kN3tJ3VHUZTOIdoYlu/2D
X-Gm-Gg: ASbGnctVDOn1z2V1FZstqpv4DPoB6Vp1sYSo+1XzV9JQeaXTs8H0SFi8J9F++6a9KNu
	UnKhqOvT7fYmyp6OVBW+aGlcPp7tFh6js6/izGMg98vx5s+0VMKEPkmNKAXoirmhAKLmsDfdR9S
	y3UdJrUBjKnnBfN6Mx+dAtWc/3
X-Received: by 2002:a05:690c:600c:b0:70d:ffaf:48df with SMTP id 00721157ae682-70dffaf5174mr24393737b3.3.1747849238835;
        Wed, 21 May 2025 10:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4kTZ68Nrq3UVQM/px/4Nm80aiKUGlAwD5oJOQSyBpW19i1eQmEsBY8jJT9ohD+wVH0pgounpIjLLNnDqhjzQ=
X-Received: by 2002:a05:690c:600c:b0:70d:ffaf:48df with SMTP id
 00721157ae682-70dffaf5174mr24393437b3.3.1747849238495; Wed, 21 May 2025
 10:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505170244.253170-1-leobras@redhat.com> <20250512104115.KcF7Ct_u@linutronix.de>
In-Reply-To: <20250512104115.KcF7Ct_u@linutronix.de>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 21 May 2025 14:40:27 -0300
X-Gm-Features: AX0GCFsAM8KXUNP0PhKbzjsJyXXVtOmUjqzbsICPAWI1fF2GPZEn7_S5ztqGlzY
Message-ID: <CAJ6HWG7Dtw=UpKbvyRh=SjE0X6Bj9zHGd15crbRH8bybGrUEow@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] local_lock: Minor improvements of local_trylock*() documentation
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Alexei Starovoitov <ast@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Mon, May 12, 2025 at 7:43=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2025-05-05 14:02:44 [-0300], Leonardo Bras wrote:
> > Fix local_trylock_init() documentation, as it was mentioning the non-tr=
y
> > helper instead, and use the opportunity to make clear the try_lock*() n=
eeds
> > to receive a local_trylock_t variable as parameter.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> =E2=80=A6
> > --- a/include/linux/local_lock.h
> > +++ b/include/linux/local_lock.h
> > @@ -45,38 +45,38 @@
> >  /**
> >   * local_unlock_irqrestore - Release a per CPU local lock and restore
> >   *                         interrupt flags
> >   * @lock:    The lock variable
> >   * @flags:      Interrupt flags to restore
> >   */
> >  #define local_unlock_irqrestore(lock, flags)                 \
> >       __local_unlock_irqrestore(lock, flags)
> >
> >  /**
> > - * local_lock_init - Runtime initialize a lock instance
> > + * local_trylock_init - Runtime initialize a local_trylock instance
>
> If you replace "lock instance" please use local_trylock_t instead
> "local_trylock"

Will do

>
> Other than that,
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks!
Leo

>
> >   */
> >  #define local_trylock_init(lock)     __local_trylock_init(lock)
>
> =E2=80=A6
>
> Sebastian
>

