Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E7A20F089
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738617228; cv=none; b=GmrgcjhzgZunweVWUVUPw88gBztyEY5wSxmsG3/Sj6+zXeIkvGZBvhh8c+c47o1s4oLmUqV4a/ra2W3QEUEKXpEWD302N6t6RV3+0jRLYrd8argE1xCVPTA/MTUvyChIr95oWemi6CjToWGYrIc0bFQbzgUowuJFXCFGpSjb4i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738617228; c=relaxed/simple;
	bh=tAYmfpPpTIx5FZc3r00kVagj8/8I8DNBOJ+e1U6EjuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VT7tij0Pe7PCIQ07KkWOaHospsoA8pFbpF+WGo60/A4p1l3emkhidN5BBvtCTcvzqNp3GoZ/6U8VVMlDJndUHY1vF/RgyvIhajz0/79kQ41/MzSyg25SThjO6GYeaz1+XxwAgUT/5yPXy/OWuf+E7FwBgHnSoT/FiUgDCRWcqeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PGvJ8dpx; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PGvJ8dpx"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53f22fd6832so5421860e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738617224; x=1739222024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbnTeeOBFGu3Hhq+Z/m06fuNB5/77NFmMN/5+AMCt/E=;
        b=PGvJ8dpxWzL5KYtC5K3X83nbyHuB64KCityPCzdo0s6/LIEKx6Ts+QO7IA4SiQVNIA
         /2WcEFCvpovO8rTRUPeliml5x6QMxxIUW503wrf5cJW/f7RBz/bTQ+6+k0kAxNX6FSyW
         bodd8NyH6I+/kGcaySBZXhjXJMfOxjSu+J7l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738617224; x=1739222024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbnTeeOBFGu3Hhq+Z/m06fuNB5/77NFmMN/5+AMCt/E=;
        b=lv56n3uPzWyjSXkS6vvBt2xx8ZFB65P0hP4yYjOpRa3HWIpRNZDX5NeP3jcqmpemPg
         GGWIwsaaaoDPtiy0GQQYH7G6VjhnlQQUeeHFbukCmZozThF4wgB/ro/oZa+G0BcRTHwc
         yILJITms6K/XjJkhHl6cVIWxI3wRtEzAqBOk7gOMfsH1wxcWgx32dukjQawf9UZD5MFS
         gqXM3+i51xW+R3qk4TcjKBJ8a9OaGuSO2ma+iiVcGpJ/O9K4zJK+pwwja/NvtdI4II1g
         1RcW65086wIP+zHjnlDKegmaPy2rf81HfF+Vc3djgN9jMNNez2nOvako17lUc6/Rtk07
         bavg==
X-Forwarded-Encrypted: i=1; AJvYcCWxcv1kJD/cAbbystH/CVjVSjLu9BXHV9y7XUJJiDlhQk80C0lQYcSBZ8Yi4QWDMBmzhJ65xQFPpjybbG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRcD97Vflmi6qJPwkOTDFglWCUs2jKg7M8J2T5KNND6l8YvUqT
	KcUZtGIspy62U0isFOIeid4lsICbhTyDeANQnWfmNhfk6N/KfJ3DVAs7ysh7z7cWEQRtUt/f348
	edQ==
X-Gm-Gg: ASbGncuO34mXRK313VdftMBpHXTrA8jY9jRAr6pjpLFhLqHXMFoY4RwNuQPOnvaAkaS
	o7JXcIrgBrNTvugVr2JCUI3GFy8eEq2gO1zrV9QAhD/T+ZyVOqA6a1o98nniJi0/Z5TGgrtQSIL
	KrGh/i1XPyI/OoQpylEG7eJ4m0R5+KU75gbBeiN4vqX8V6HNKTSlWvHIcO2oYjnNhOEcYF0QF8h
	4yH4OmHst/s+Ozbv2aMRrbmyXrQwPjMgBXrtkRrVdlGyF+Z9Ic3/2KZBtaJ5amxOED+xZniH2w0
	pNdutYER+wbq2Ik4hj6IvcfgrY+bithA/rr4NZaqkAE8fRIItAMOPNI=
X-Google-Smtp-Source: AGHT+IGf3eXv/OdJM6ACWomKkXMzdoanqYXSkb/JytzvgzRVhsGhUJH3TPel9uBa0+GhAQUkDqXmqg==
X-Received: by 2002:ac2:4895:0:b0:542:91ac:3919 with SMTP id 2adb3069b0e04-543e4c02d92mr5860989e87.23.1738617223729;
        Mon, 03 Feb 2025 13:13:43 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0fbcdsm1443702e87.60.2025.02.03.13.13.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 13:13:42 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54021daa6cbso5207689e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:13:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMINbi8aoJAobxUrC6lHxf96GdZ0kJLNTQMWJXV96Mh1MFpmkGatqof0wUhQHU47FfDJrj6MCvVhXcobg=@vger.kernel.org
X-Received: by 2002:a05:651c:1145:b0:2ff:c027:cf5c with SMTP id
 38308e7fff4ca-30796866f46mr74227291fa.16.1738617222537; Mon, 03 Feb 2025
 13:13:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203202028.GA1215122@lichtman.org>
In-Reply-To: <20250203202028.GA1215122@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 3 Feb 2025 13:13:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WoS+WZ-OX5FnAUuab8re0ovrN9jEm4uADo1XmP5DAGQQ@mail.gmail.com>
X-Gm-Features: AWEUYZkwwpC4ZQkpVf23tESEqF37M3-K6zXbboQkcQWm1IjIhDcWSGutoT6z24A
Message-ID: <CAD=FV=WoS+WZ-OX5FnAUuab8re0ovrN9jEm4uADo1XmP5DAGQQ@mail.gmail.com>
Subject: Re: [PATCH] kdb: remove usage of static environment buffer
To: Nir Lichtman <nir@lichtman.org>
Cc: jason.wessel@windriver.com, danielt@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 3, 2025 at 12:20=E2=80=AFPM Nir Lichtman <nir@lichtman.org> wro=
te:
>
> @@ -348,9 +315,12 @@ static int kdb_setenv(const char *var, const char *v=
al)
>
>         varlen =3D strlen(var);
>         vallen =3D strlen(val);
> -       ep =3D kdballocenv(varlen + vallen + 2);
> -       if (ep =3D=3D (char *)0)
> -               return KDB_ENVBUFFULL;
> +       ep =3D kmalloc(varlen + vallen + 2, GFP_KDB);
> +       if (!ep) {
> +               kdb_printf("Could not allocate space for the env var: %s\=
n",
> +                               var);

You don't need the printout. kmalloc is already very shouty if memory
allocations fail.


> +               return KDB_KMALLOCFAILED;
> +       }
>
>         sprintf(ep, "%s=3D%s", var, val);
>
> @@ -359,6 +329,7 @@ static int kdb_setenv(const char *var, const char *va=
l)
>                  && ((strncmp(__env[i], var, varlen) =3D=3D 0)
>                    && ((__env[i][varlen] =3D=3D '\0')
>                     || (__env[i][varlen] =3D=3D '=3D')))) {
> +                       kfree(__env[i]);

I haven't tested it, but shouldn't the above be kfree_const() instead
of kfree()? Otherwise won't you be trying to kfree() the initial
strings? ...or am I missing something?


-Doug
