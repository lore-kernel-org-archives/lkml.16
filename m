Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EF9C148
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116683; cv=none; b=ndxYQY4sO42MtnfunGwIAo2wb1IWFCcUi0SdE9Vwq3rC7LhExfJny0bFGWpB3u6DmMsnuXEyp86iBUcv8orcwSUZgTqMIFf0kBDA/OGl6rnpKgS9nR3YFILkLyH5IvPi8Quxn8CemFzyZXKqdPdpozGNRoiuJI/0yHz7qIEKk2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116683; c=relaxed/simple;
	bh=TWWl9c0f+OLCp2KqCceIXCvZylrgcfJMAqHgJxHOE0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pu3m2cGbaoXP2fnfOhAmtoajrpSssk454Wop8Z8gV+h5WCvhhxWhB43B4XW9l1TU2Bd69bRwh+obkPrOUgKrGy/gEqMfw64QhdduJUjmSf12VUCleUCIoDUwla1KLAXy6YN8HBErQm2lnNJzeHtdsmkkV/Tb4WRhY58aPAp0vVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCGzdmHP; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCGzdmHP"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff6b9a7f91so977297a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744116681; x=1744721481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJefxB8FLGWpi/gmyGyC0hTJwrgS8z3n6ed8v3Y5FJ8=;
        b=jCGzdmHP1PxYcFbzGT9OOnQvvQfYJQlcW8sxF5LcvZh5m1fZKdWZlwgaBi7MbQ3gD7
         yhm2SgMbLr87EM+e8gfWCRumzZm5mzunHPVD9un3d/MJYUCdJaBBuqqP3UIHV8scpWXe
         4k2C28UxxAv2C6G7YKEyVLLOkXhaQFHgyZuY2xJMNO17fGU01shYSuh4WSiSmUDUaI/N
         yIZerFaY0rz28zgwx6Any1xsdVQo4Rz15tHwwdpBlxRBhGtlh0qRNdYOQemmMnsDaebK
         nsOfgQ0iRINSEOl/RCht3wmm5Eo42OsXUzqu1AAZzSjdHe+mN1ZYuYKhVNAKmSHrG+DE
         6v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116681; x=1744721481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJefxB8FLGWpi/gmyGyC0hTJwrgS8z3n6ed8v3Y5FJ8=;
        b=p4YzJAxTLzFTeoGwY5DJ7D5MN6EQ7yKKVChcy6DH0a5CmJ80GMS6OVsPIa+wXlJ1p3
         nCsR9nE/6w8aXDU3OMVlNP7KtpVQfmNSSC4WJJX8myU2oe9Wq2eCFCJ4fyHV3atsSoka
         WKamsCvKQJcJaKQlwzKRp/ptSCVBU0m8yGCeFDvXuZEHTsNXfvL82N9lFIQf588ub6Sm
         oo8duf7u7apR2fZTKnpMqU9o1FZnXx52TWt+5kxv4RpniMV9X9jQ1V+wmsxQxbV7eZPn
         lc/1zoWrtWbiTDk7FE0iChjf9GY0MtosC1mnEysDBrxfWyo3mjMqiKkZ/iHEtaC2os4G
         jRCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXavTZaJSQVeFEoxRx6CkmhCIWf6z7EV4rHExWcyZYipUyO1Jb1OBSMxgeLzvSu4oykzNV6LOHz5bhLhL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyHdJmqLIRVH9oZEFwlPwqkkbKlkp7lAAAtGc/lsMLVS/F1/7/
	KMpuukTQP51RwpQVWn3KxUA3xUhn6IkbBBei5ZkDqyGWgIu5namnSuisrKHRFGtufASHdlu+D6C
	icKdPXFJKl2762MIEz1Nn4O1D0DN3Ew==
X-Gm-Gg: ASbGncuzFf9OsGsLE/ENc99dfxbZheclwNmp8iF75YPNqrTEUFuauC79FOy7OkEYFVU
	qCZ/XonF8dygG339LtWpEHmypL4sb5x5rHtC2RmAdJM2uXls2+ZHKn2YtXLc2VMEssjwz6oLkWh
	VlxU6thqMBf5ZCLcLH4wZ1qE17uQ==
X-Google-Smtp-Source: AGHT+IE3BGwIB7veoj6eje0Tze9/r/Sfa9ZWHYQiSGUExiNmqGzA6W8+JIfoimN+DZu/Gni15fMcKjpQ8CFj3IA9bI4=
X-Received: by 2002:a17:90b:3a88:b0:301:ba2b:3bc6 with SMTP id
 98e67ed59e1d1-306a496b929mr7897756a91.7.1744116681025; Tue, 08 Apr 2025
 05:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADnq5_O+TMVD0B28Q6CgzhAi1aDR5ofjogE18HDXrJOJ1XwbDQ@mail.gmail.com>
 <20250408081638.5295-1-arefev@swemel.ru>
In-Reply-To: <20250408081638.5295-1-arefev@swemel.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Apr 2025 08:51:09 -0400
X-Gm-Features: ATxdqUGGeuAEy76obe-8bptynlXwPr_CzRnD4kBRgOpWKyyCycqmaT_JREsPGPI
Message-ID: <CADnq5_NHD9ULZ21tApHk=c2z+brnms9XotGUvpOri8G3Df594g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/smu11: Prevent division by zero
To: Denis Arefev <arefev@swemel.ru>
Cc: Jun.Ma2@amd.com, airlied@gmail.com, alexander.deucher@amd.com, 
	amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, kenneth.feng@amd.com, kevinyang.wang@amd.com, 
	lijo.lazar@amd.com, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org, mario.limonciello@amd.com, simona@ffwll.ch, 
	srinivasan.shanmugam@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh, sorry, I've picked it up now.  Thanks!

Alex

On Tue, Apr 8, 2025 at 4:16=E2=80=AFAM Denis Arefev <arefev@swemel.ru> wrot=
e:
>
> > ---
> >  drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/g=
pu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> > index 189c6a32b6bd..54229b991858 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> > @@ -1200,7 +1200,7 @@ int smu_v11_0_set_fan_speed_rpm(struct smu_contex=
t *smu,
> >         uint32_t crystal_clock_freq =3D 2500;
> >         uint32_t tach_period;
> >
> > -       if (speed =3D=3D 0)
> > +       if (!speed || speed > UINT_MAX/8)
> >                 return -EINVAL;
> >         /*
> >          * To prevent from possible overheat, some ASICs may have requi=
rement
> > --
> > 2.43.0
> >
>
> Hi Alex.
>
> The patch 'drm/amd/pm/smu11: Prevent division by zero' was sent
> separately, not part of the patch series, maybe that's why it wasn't
> accepted. Should I resend it?
>
> Regards, Denis.
>
