Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84F12686B9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112776; cv=none; b=vFYmJ1bShJPkkCpjUWEGk0dbAIFV4zWugWOH9BvpKGmKrXE+iSD9NQeXjui+I8hR47EwjmjpsQNwY7wxSJtJ4/ETS8tQij+DHypx8RqwH2k79m3s+62R51J1+H526+Wmt00T1+pGurCoh1HHDUVW54uGP9tFELNdb+Z82GOqM+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112776; c=relaxed/simple;
	bh=vfYcDK8W91jQEu8aDezx1/EMBUzk7HuR49zxGn3n2ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpuU1BPZ9TQ+2GfZTCxzRHm4wEw8KkTIbS+npKmKQuxcVnXpIAPp//D6bFKTYTEGY0bVjxD+gGdKd7/MzcGLg6xrqIMyOkcG4uW7usWQs3rq1vlSkEiC2qd9wHUkiH0FBrbaQDf4in4hJRC0AlDVqCVQEB1skKi99T6NvFBxMo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHo1wGid; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHo1wGid"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52413efd0d3so2350263e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744112772; x=1744717572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfYcDK8W91jQEu8aDezx1/EMBUzk7HuR49zxGn3n2ug=;
        b=bHo1wGidFU2ISwHBkWJjr1/N87jE+3rlJVzlnf9kVuG+9FatUylNG71YncU2kEnq6W
         5m3mDI5NG+59MbQu0YBfn9btdHcHGsNK3Fx9FEgDyR+6O5eY3Zww+bB57dNDIHaeh+6f
         80C4zerN7ADlq0BH3f3j5ZoYM9ei5vu4Z5Ah5IN4R8lRLUUWSAnCoUjamnGr6ZelTj7p
         7AiPLbp1FzhFlEdAD+spzHOTNmLtX95XQkT+kaIm1x6TVQsh8X61UgbHzUtNZ6Tqjmkh
         pMU1CA9yslf5m/gt3AC8XEDWIEriEvENOiJNM1HOfeqUQzb0YMPPYT9+eDX5ZMpm6VFg
         s/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744112772; x=1744717572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfYcDK8W91jQEu8aDezx1/EMBUzk7HuR49zxGn3n2ug=;
        b=Aiq0yiqyRxiULcYIb7364ZWQ1exvsfzlU0SMwwURtJDNJ6MeuWk65xKPCKD4WU7eQT
         k5L2dBkEr2tCF391XHfd2Gk1gaBScYOWFwxLdM9PgD0wevtNFAgsznBQjOZujp24xmBp
         kfJsUo3auNQDisF5dzV0ngsD232TBF7dLpU2M2R8kwlLmFR+Ef/PSNUsBYiE7i1qc/UY
         AZmA2NFXKi/qj5QV4o6tyCO7T14lfcXtPbFOFWfWD2GepG0yJjobTv4QZYw/d58PleOt
         10rBO7iTwezyNneV5qs5DIGKvvVatB/0OQGzBUJuprWkHvidutp5EQamxOPHBxmPx1yF
         q78Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxmY9pDl7TwpII1ch6NzmG8DP4iXyf7sag0nuRUqAyEty043d3HdttsAVM+hCmJIIZs2g6F6ovwLR4eS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfu8IZ3t6l5OstCNr9gg4Mh4UfngM9KU/INNnmT8/go10pQ78L
	Xev/1y7Lmt/ZsD+4WpzyDzYRoDk0BbiUMHdElmDOItObGKa1NEOIiT4Rui22a3s+AiFInKTu8di
	mlgSWP6GmXvTKe0OeMxoi6bkq4Itim1ni
X-Gm-Gg: ASbGncsGl09Jtl6BZe461INYYIXnN6uZzUCLGM/duw/huQ1weAh97nZnG+5BYMB9q9s
	k4LwqFUVD0+7MgD950ouRwNI2Ou3Uy6GND+6JoYNJ2l+F6jKNCFBThrdgjd5K7ET7KnhOEjAmZI
	UFuapMdUj9uRNvJ9YrM4pvgFfQwQ==
X-Google-Smtp-Source: AGHT+IGc7DDfMqh9nubhR58qDhK7AJO3px6RkG3rfBzevANUMo8NKMnT5ZD39JWOXn5PG3fovJZ/bytwHru8KKdxAH0=
X-Received: by 2002:a05:6122:250c:b0:520:5a87:66fa with SMTP id
 71dfb90a1353d-5276444665cmr10905004e0c.3.1744112772482; Tue, 08 Apr 2025
 04:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75VcCdS30LHPMwk3HO1o6db_0p+LDQoASx-7oCVw__MpMdw@mail.gmail.com>
 <CADYq+fYeXCUgXqWu_97gvUBOvTG+H4Q76TSX2M1s5jV7EWcuyA@mail.gmail.com> <Z_TuIjwuihXF3mbM@smile.fi.intel.com>
In-Reply-To: <Z_TuIjwuihXF3mbM@smile.fi.intel.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 12:46:03 +0100
X-Gm-Features: ATxdqUETrnM7RqnM5irfx0EHl9vUJKqc2rm4n9p8JTcJxxQNWiJnaUY83TsWmNA
Message-ID: <CADYq+fZAr7BMvzex7izRuR_t4Ez5v3f3LaaPOS_=7=LYjwExbg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	julia.lawall@inria.fr, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 10:46=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 08, 2025 at 10:28:36AM +0100, Samuel Abraham wrote:
> > On Tue, Apr 8, 2025 at 8:21=E2=80=AFAM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
> > > <abrahamadekunle50@gmail.com> wrote:
>
> ...
>
> > > > Changes in v5:
> > >
> > > This is v6. Are there any changes in comparison to v5?
> >
> > I added a cover letter and named it v6 to show it's a continuation
> > from v5 and to show I added a
> > new patch for spaces.
> > I was not sure where would be best to add the change log so I put it
> > in the cover letter.
> > But as it concerns the patch for the % operation, there is no change
> > between v5 and v6
>
> Then it should have
>
> Changes in v6:
> - none
>
> which then questions the purpose of v6 :-)
>
Okay, what should I version the next patchset I will be sending as, and als=
o
how about the change log. Do I write it in the individual patches
rather than the cover letter?

I am a bit confused with that please kindly clarify.
Thanks
Adekunle
