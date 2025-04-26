Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EC21B4140
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 06:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745650466; cv=none; b=VwfDqQEVVmlGaISalDembhRkVsCtIm0qpLGCnHTGIAM4nO/l0FsiUBBsTCASWrQ7rCSl/kKHORynWg0uW+mpfoyHp1JNa1Lu/Y8iC96/IoTBAd93Fgjent4FNpNOGBqDz04+OIVUEUmlSFoR5jtwjyGyTkgeoWy/cc58EmCrbKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745650466; c=relaxed/simple;
	bh=m0GzTi67G/BBlHNZ1XWaTzJYi8lLqT/n/ATxOLVWBK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=THppvGQg/6m1ntWpwoHnPkPz5pLXlGKasQNDdM6W3P4YyyuLUOfYX5F8HO2TyhHmyJEwTMVbXfFbqWV/oIcs4wOdYsNsWe2o0wMed9YnUPqyFtJuKLsXf1RAqSL5SWP6aMBL9HzwrIo+Ykk/KGFG6w4E+3q2RpTLw2j7kQehVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQJPsOol; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQJPsOol"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so566863066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745650463; x=1746255263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8WoCmUis8Ol6Z+c7rTs6b7qBE/ahNLhfc6fAQ3sAHhQ=;
        b=VQJPsOolp/Cg23FENMiqoWTtffRcsUT+EZDhd7KAzcdj+dpSF1lVkvw3ykbsvIhOMl
         x1Nmj2ARevIWLwoXOfb1t3KDL+abvslEC8Lr6CAwq7VrKYG+t/x2jv0EaKGq+bdY9a6O
         gbOkE8vBVpGSn2CY+f5BUmLmLbObANsQSYHks4X0fyiknnuT2gl+Gp/r2bNRKWRseqdm
         PDbBwTR+D+1yjapyOgJn7Q7sT/ZDwqDfY/gjdp6W7CFHw7wctjX4emIpDgjL9PeWd14P
         qokbt7DzIm9kScFxiWRj/PDFas1zw5wASJKaMmWtpsDLAEqTbSa2mjLBA8FJBWkV3Vuo
         P6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745650463; x=1746255263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WoCmUis8Ol6Z+c7rTs6b7qBE/ahNLhfc6fAQ3sAHhQ=;
        b=r2SeXuUlI0mVoK5xP+uuYQ39maTsIqV97REdvzrPkEZrGqNbaEobT60aguKCwXgH6r
         6GGCXqUxUUBBo1oWkqKNnsNuKvk0iQaA2Af8JZV4sPR3NWUSQtpbXQTahpRG0xTa4D2D
         XRCVLeV1UfFBbwir+DLRyTTP9cSsQKQkTkp3ye/8Dpvd/PfdVAn0VOiZy46uUSSbnHrQ
         LfN5qIoye2HNxL50H8ymtWiuRbDFmitXZjy50u3wNJ7WJFwe03Y0bYnmAUbEExQh+oJW
         jmYc4N3OEPoyeTlHDcSY92HBkmYjZZmPBEbJvqf9sguJhhkQEGkz8YdUQTgByhDf/B9e
         Wy3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeqVXEg3heT7YWspKHDOp79fQnw0WM6vjm9gImFuEbl/Md/f9Ufw1fnJi//byXjp1QzaEHHMvehMkPvF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpyRlAMe/q40CZV0/YlZh1iH1cl6hHmBktYPppWSx+PeEfqJfm
	IyW8ocwOfGRNMkFonLQbDH6Gb9QqNlgqXcOOfz4JjYt2pgC9BfSRO+nCOIs+ERbiRnrW3bJANgr
	ud2eJPmow4olUXnB+3G+DEDoN2Uk=
X-Gm-Gg: ASbGnctYn0urFR+lgiefjkP+R9VGeaBJfJ5I8hcK+nCvLymsTjVDr/rHfRzmgB1+zGm
	LRncw+lfGfboD97r04KCjn+0k2tsewoBlc3Ixu/Q2eRYFKu/db28LiHq25wcKoojEQfCHdUKnJo
	X7bIP4U9QvlOxH4qUoXVgi
X-Google-Smtp-Source: AGHT+IGC0uvpV3EDS4q705RyZRePh5QkNiJf6PrdO99FXottogwNk+Gb4LWLNJ1XHzSx+9giL/LPUBOCImqGbG+Ekd4=
X-Received: by 2002:a17:906:db04:b0:ace:6a10:aba2 with SMTP id
 a640c23a62f3a-ace73b46db5mr372271066b.57.1745650462894; Fri, 25 Apr 2025
 23:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
 <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com> <CAPM=9tx2XsDNFDWkxndpFPNihgf18CK7Ps85vE4ZRvuLBG35UA@mail.gmail.com>
In-Reply-To: <CAPM=9tx2XsDNFDWkxndpFPNihgf18CK7Ps85vE4ZRvuLBG35UA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 26 Apr 2025 16:54:11 +1000
X-Gm-Features: ATxdqUE73n1-4m37EOUkbbFZ1-rjlaR3nnvcNv5GqEIbodg1glh8xu1Pail9vBI
Message-ID: <CAPM=9tzh5sdpfDXQgLymXKn2_qf7ccN4EsAEaYTNEY=hWNbGNw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>, bentiss@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 16:44, Dave Airlie <airlied@gmail.com> wrote:
>
> On Sat, 26 Apr 2025 at 10:56, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, 25 Apr 2025 at 16:12, Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > Weekly drm fixes, mostly amdgpu, with some exynos cleanups and a
> > > couple of minor fixes, seems a bit quiet, but probably some lag from
> > > Easter holidays.
> >
> > Hmm. Is freedesktop.org feeling a bit under the weather?
> >
> > I'm getting
> >
> >   remote: GitLab is not responding
> >   fatal: unable to access
> > 'https://gitlab.freedesktop.org/drm/kernel.git/': The requested URL
> > returned error: 502
> >
> > and when I look at it with a web browser, I get
> >
> >     HTTP 502: Waiting for GitLab to boot
> >
> > and it talks about it taking a few minutes, but it's been going on for
> > longer than "a few minutes" by now..
>
> Indeed between me pushing this branch and you trying to pull it, it
> does seem to have died, I've pinged the appropriate authorities.
>
> I've pushed the same branch to
>
> https://github.com/airlied/linux.git drm-fixes
>
> I can try to create a pull request from that if gitlab isn't back tomorrow.

It seems to have recovered now, but not sure how stable is it, please
repull the original PR when you get a chance.

Thanks,
Dave.
>
> Dave.
