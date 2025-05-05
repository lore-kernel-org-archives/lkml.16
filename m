Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5324826F444
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746470645; cv=none; b=Hwj9qNPsYNq6j81rKIUGZR+FKaJeS4d8EQq1rnY+enznbGJYcAHibymVXA+MFKYcpCEHQZk06EMO0bg+VW6FZr3BGewnMVOSQRYcmqVk9WOrsrFsfTI2Wi2c7Z0G+hy9ErM3XuAGpa59CPIBhqbQofBomooVlK4vtcSJ+fl1DIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746470645; c=relaxed/simple;
	bh=8CPoAXdjgx6Zu0NC3Ckp9At/lE+LbvhdbMzjDIvw09U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ToZzr2ypluv+e5L4L6FG5cbMoG1yGJAjo66TP82wI44ObfZGd2DWxjpQDpLKsB69lyg+Z3YlOHouQf4riSGwt8X9cp1A1OSqYNm9Nf1/K7vT6nSTCXtHjDtnAApEsQa0bo9TPaIkhmAuaMnnkzqrUHE5mBHIw4JQJQcprlOXfx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=etxWyCwG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="etxWyCwG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54af20849bbso5505878e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746470641; x=1747075441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBvywT6i+LVBNPGpI1eL5gnIW7+jdR1JJjac3GeCWbo=;
        b=etxWyCwGNd5Wn7q7WEmpUJYLdj8qsyOO45ZcifT1vh8wx/2ascSexlbacATgqgwzPV
         kC2YOcEHMDVMUU4CMb76qKQ8N5aQGEcsmajbOi6jATmO8IQoQKpTp2ADDT0Zdm4A5/aT
         0C6Zfr7A/yHKNIgvte+IoRJ516aHC7sDAd7luBA+fxIUkgPkhz2s3Lv6+nXwnSCnfVXN
         CmpU31C4hbWcujCb918hAa5I16uONEz5j6Q55eHQElsiRtmQphZtwSNDoSOnbUlITMYK
         uD+FAGAkY686ufhA2+ll3urrxv9Gmrj7G4NKARU58KoI9YBiNnwShZUV9uF9MDJoCHuy
         ym+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470641; x=1747075441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBvywT6i+LVBNPGpI1eL5gnIW7+jdR1JJjac3GeCWbo=;
        b=tQb9jFL5b1MLodJd9jR0O85gj9VHA0qlcJG4xSZqhrWCuwg6EDaH+S/STpeleP2VXz
         f4pwNSU2/o54vuwhSqgLRYSeIlYGn9sIMmDRcqGI/aSKjGnJM/l2wunnMosV2WnRKc/V
         wxZsq9ampSZJO2/SHVqnLYxr9qGsHGbfi2UPrp75Sf0w6TTqDdGlYbdrgp2iTxNnyeiM
         0zGK2rTaXSFF7cwchRBO9orQ57vsyUCqhOaPGqd8bm6EFZ/jKVoYYgIaO0tqiHHQavQA
         o9EWSVpjLlcJ4EQOJ4i46txtapugcTwak4C+c8LyhkdjWAi4WVBqW5mVAMXafYcud+RO
         WpIA==
X-Forwarded-Encrypted: i=1; AJvYcCUM+j6Nb2mNtlm2m8qtcz9E2mdaHzxkRHrXZ/EQyRvU2kpBGSSMqYfmT1fCoA/HZXG1aJMKrO5nbAmJ8Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzPQA5879TA+g+XWVhNo0hGhT4KLMcMhAxBSUT+uM8p328zTUL
	QUEglEVWcuwRCPcY5sQoM241WfruCeDNtGymax+OVcUFqf2Bioqie29uCzPm7bRZLAKkxYvu3uS
	MN73hrSB+nCni/VgTTWNlAl22P5HCmVvukOQTnA==
X-Gm-Gg: ASbGncseQy7NlKE4lOTZ2/IzJTOXtq28kuzDzVv+NygK5FISageZzQkQPpsGlJMQRt9
	YsVUIDPGhNIzLLU1ainUtxYSaVwkbAlYNhMR3O9EwpE7QeBxuKPq8fVBvR1cH3F3AYvAFkPnqz/
	vSODn4RJYEPhTIgXeBCZ+xRuODCsBT1hlO14lCPSAep5JzI9ReBeYr9ZqnVPkjiH4=
X-Google-Smtp-Source: AGHT+IHkKTblpijbX9m0odUnz1ufQomMh06C1QWlUCQn1KaSjaLVR5Lytmdbqk43KYiKX3EYGcV+QQUpxNAkIHRlugk=
X-Received: by 2002:a05:6512:39c4:b0:545:e19:ba1c with SMTP id
 2adb3069b0e04-54fb4a09561mr65073e87.19.1746470641104; Mon, 05 May 2025
 11:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-must_check-devm_mutex_init-v5-1-92fa4b793c6e@weissschuh.net>
 <fb94c25d-80af-41c5-a4b7-230dcd0f1d64@wanadoo.fr>
In-Reply-To: <fb94c25d-80af-41c5-a4b7-230dcd0f1d64@wanadoo.fr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 May 2025 20:43:50 +0200
X-Gm-Features: ATxdqUHlB8qXp9TmdgIUDw3TXZaYE6XCD6ve1l08zojkpI7AyKTVrCCmnc19sLg
Message-ID: <CAMRc=McTy-1mSpr7GUhLvdjUcDbRu+MYY5pAEBa2RztoOkxcmg@mail.gmail.com>
Subject: Re: [PATCH v5] locking/mutex: Mark devm_mutex_init() as __must_check
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Lee Jones <lee@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>, Will Deacon <will@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 7:02=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 05/05/2025 =C3=A0 09:59, Thomas Wei=C3=9Fschuh a =C3=A9crit :
> > Even if it's not critical, the avoidance of checking the error code
> > from devm_mutex_init() call today diminishes the point of using the dev=
m
> > variant of it. Tomorrow it may even leak something. Enforce all callers
> > checking the return value through the compiler.
> >
> > As devm_mutex_init() itself is a macro, it can not be annotated
> > directly. Annotate __devm_mutex_init() instead.
> > Unfortunately __must_check/warn_unused_result don't propagate through
> > statement expression. So move the statement expression into the argumen=
t
> > list of the call to __devm_mutex_init() through a helper macro.
> >
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Hi,
>
>         git grep ^[^=3D]*devm_mutex_init
>
> returns:
>          drivers/leds/leds-lp8860.c
>
> Based on -next, it would break.
>
> Should it be patched first?
>
> CJ

Good catch, yeah it must be patched first. I suggest informing Lee of
a need for an immutable tag with this patch and then applying this one
fast before someone adds another unchecked devm_mutex_init() to the
tree.

Bart
