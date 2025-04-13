Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3248517A58F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 19:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744572321; cv=none; b=iDwkAnp/1sDhe2pEpaOo1sh/O93dGpr2ySiILxi5pIjMMhZw+mRw8rTDomP0qGULc8BfvG67ALqc9F815S+ar/XQ8+cNF7l6DNoNqy5yw6JW1xinMrSMESP4lR435nqv5C6BvASyvV/r5zeIdWTp1Cd/zYSDGti7/VimnHDd/xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744572321; c=relaxed/simple;
	bh=cgoVDjX9IT6EtA89494TbMxqJl0RE2iUlZQmz+9vkuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asynN7nu1ICOeSzUkEJ2txLy9iplGcW8XXXi2Sl4V0Fo49cp/5oMBDusnlMi2aLmbqtYAls+PJYoqSWjpcfNk6zejsB1RzdLCTXjVeQTaHzL60HVi78CQZvq30E3xIo+zRGf/z8mKJ8HvIBtN58cAn6ZNR52ou8FGub8yqSsSIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=B5aFJFzI; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="B5aFJFzI"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e53a91756e5so3247243276.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 12:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744572319; x=1745177119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dq26RbuqV8heXEFnUrcIAdRGV+/86EMAIyh2oJSHIJI=;
        b=B5aFJFzIKjGgXqlYYGH9NShbk9/0aVER7GR/KLHODSF3YXlVT5Tl4PBcjBE8oOBNDr
         ce2RM71SZ6CD9tS48a+ZrU7dTa0RPp4+8+/mq31ZWrT0inYfuVjCw4hS/+DgC+FqynIW
         njlgGNKNgsje5t4K7E6BaT+QafjClfA5/m+qA/Hj0VwVun53bWFXefAywPhpy32s9LX8
         1/y7piHBf9qCOWRXqAFgqy71SEJaDbgHBs0Xh0Bg2/kfdI/shMLNLUb1MqE4dvBXhduF
         Mov1ms2gv9DOsMWpFTcqB9dKqYbukayUsfgdUqgKW5yCgUpaBgpAXSqjJlowg10Sa9UG
         Ahnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744572319; x=1745177119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dq26RbuqV8heXEFnUrcIAdRGV+/86EMAIyh2oJSHIJI=;
        b=QL1+nCETELRSYO+JkrAZwMq62zFA1CUvJzwR6Y4WJb/8qlIHRs/0IAfP8QoGmr36gQ
         /E6opGGcfD1KDyni7bW2CjYG/XyFQ6EzX4pZ81M/UcUIB+lpBkRHiKpQ4Ar+DUMyjG37
         MiXAJvzVroHxpjVWgUoE6KaMg1LqQLE2fIlqe1OPsmokU+E/0PysDee1SEPgp9pu8Bdg
         MA0ibrU1dxDm5LWWn67pShpFqiwUvdyzRZd/g1SZHI21hVNbrQFInoEVmnGQdOes51tT
         ei2+f/1h29e1ZWrtickQ7PM0sZVRZJ9bEu+dxgCvDc/CMVI+Cu2NxcDb4+/+HepJQaHk
         qh/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcH+4auQwOXcn2qHXtrrji4mNcBbfbNBV/WmJ/Z2jzargtND8yMY0d7tyac8PjpLO2mSaL7LJpNgYOQc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT9GnNhIn3nHSzl1eYmyqWTFeqPYiHhQ2TFCBDJQGDnrz+ae1s
	Aj9vLuHd5fm67KU2W3Doqg/dtIiKmWzqBNg/ZLM20dcjSb0wndeetv29KsTSB2giTqhR1H6MGbX
	AzMHJU1HJkIcenxyZ0HtKhstorTSr+s2ysFAr
X-Gm-Gg: ASbGncvcdzVwDUCHVXlV5N/gGVJEbT7imuc6Dc7uRAYhtRQaB61GkxPsefTWWA9z4Sp
	9hnzur8zKh2MeFwzwItjYJSedHoGLScjzaD80ommJcq3OO7VP2whzbnZHkY1ZzU2+zOZKWtmVwx
	+Olk96IT+9sb9kpnAFalh+j6SEq30P8hU6
X-Google-Smtp-Source: AGHT+IEK3FZOyF5DkkCwjbI6gGNlgoKbpro7f3xzWGq57ut4TKBLbfWVw1Qp6lUKEtjw+o5HwzHf67W/QIFHUN1a7Do=
X-Received: by 2002:a05:690c:4901:b0:6f9:b0a6:6a15 with SMTP id
 00721157ae682-70559ab718cmr165647647b3.38.1744572318910; Sun, 13 Apr 2025
 12:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321102422.640271-1-nik.borisov@suse.com> <CAHC9VhSpgzde_xRiu9FApg59w6sR1FUWW-Pf7Ya6XG9eFHwTqQ@mail.gmail.com>
In-Reply-To: <CAHC9VhSpgzde_xRiu9FApg59w6sR1FUWW-Pf7Ya6XG9eFHwTqQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 13 Apr 2025 15:25:08 -0400
X-Gm-Features: ATxdqUFFPMWUt_uYVOB3P94cPJvgJmNzGSw0uhdEvSDjwZkXZa-eQQ48N-qvI6I
Message-ID: <CAHC9VhS97RWMYmCOQVCZPUUCxdMXPMzM3R0z_U4zJQNe40M4BA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Allow individual features to be locked down
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: linux-security-module@vger.kernel.org, serge@hallyn.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, kirill.shutemov@linux.intel.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:13=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Fri, Mar 21, 2025 at 6:24=E2=80=AFAM Nikolay Borisov <nik.borisov@suse=
.com> wrote:
> >
> > This simple change allows usecases where someone might want to  lock on=
ly specific
> > feature at a finer granularity than integrity/confidentiality levels al=
lows.
> > The first likely user of this is the CoCo subsystem where certain featu=
res will be
> > disabled.
> >
> > Nikolay Borisov (2):
> >   lockdown: Switch implementation to using bitmap
> >   lockdown/kunit: Introduce kunit tests
>
> Hi Nikolay,
>
> Thanks for the patches!  With the merge window opening in a few days,
> it is too late to consider this for the upcoming merge window so
> realistically this patchset is two weeks out and I'm hopeful we'll
> have a dedicated Lockdown maintainer by then so I'm going to defer the
> ultimate decision on acceptance to them.

FYI, I expect we'll see something on the mailing list related to this soon.

--=20
paul-moore.com
