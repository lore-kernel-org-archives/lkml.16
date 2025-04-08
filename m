Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C04429A2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 04:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088359; cv=none; b=ERv31RBWkolS3VhCWUAHXJtpmxXPIwrqK5dXsO1/AG8Myk+M8pH5e03xHsBfz/68fpB8H1PW3FQr7Dk9JJ1RmSaR1QUyRrxBARSYk0jrnU0m5lQ/bX3AHLxepu9iJZy1bqREQ9LSyhAKaNa7a6IXPwbY/bC7lKH+IXGqEddeUcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088359; c=relaxed/simple;
	bh=lPyKFL6EYtrBQlINHjnofiBgH1A/3A3RrizKk2o/+FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLyeZMA/BVCcqJ8A9Z0Y/12B5MqQVGPT4RTGZeNkdHTMG4a4+pJ8z65ZZu4jky2dmMnFHv4slbGAU1SZGkXVtuTIV+sja1ampKTL4KlK1CQ68eJKlDcSdOXrJc4LRWP4498/tFIYTF/XkEotiNpYy3a3yDBdgUr7ucZb/5k1H0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZLNeTHQ1; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZLNeTHQ1"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so627575166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 21:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744088355; x=1744693155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPyKFL6EYtrBQlINHjnofiBgH1A/3A3RrizKk2o/+FQ=;
        b=ZLNeTHQ1odkW9OsQ0WUgDiwIp2Cz/VgIvSoDMztlBYkYfLrhGzNVOK8gJ5tIf5i9j0
         6YAq6RIpnCfsfnO0i4VmqvZj0Jaim3EDl1pt/ApyTh8S038OjSttaY8RKKF5Nc5ZiZVo
         ULfYoyW8PaFAEdCOFOiPOe7aJMthvdrjgicaj1SHFhBue66m5NpYm2we+2scbhmrvw7R
         875viHjUMmi91yuIq/dvQyRvRXJqEzrSy25s+70rlVbwicDRLegWupFpkW+TDDrmew7G
         zJgrfKCZt0pwyvyrr/vdz8xecjXKXmKf7pYmVzE5peHa6PbzFJZA4unwF8+wuj2VF6A5
         sQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088355; x=1744693155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPyKFL6EYtrBQlINHjnofiBgH1A/3A3RrizKk2o/+FQ=;
        b=EKtwSDwWfE5CZOwImyObaP5QHD7mB1SriFrxJVyjj6zTPAmNb1RUKnCHZtumZ2Vo2H
         sjZguAzGsBCH8JqbRzeitOs8n7CAFS5LskSAdol6W92VrnhdJT4pglKYQrbiRppJck/3
         9MD5KCpVxi+NxOm5UajIVf1nl3F9PNUGlhdFPRJCdaDAQvw8LsK2NaX7//W75Q7Bxr/n
         1L+hSJ4X6dzn8Osmu/HcBI7KpYdDK8cZI77kXF2kLoVlQKR8DBQeBCYcO1Pr6wb8NkVg
         swFOOH+4nxt/ItYkHCzmdwB3qQinbQambd70Tid2ArfUrwaQL6asP4zq/3u1usZToT75
         FyaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTGESmBR55KdGiaW7S4HwPRqMVtrOnRF6un3BFGHSayQXXQlnFT1DSpW32y/Ls2s0Eafh0Aja56cr7ur0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqp7IqbbHJHTjj2rSk+qQJ9WY663s7RBDnWqJpDiChAutt4vB9
	uL9nM5xEq90A/vYQB5+rAvKl++WOMYfWh0LJXjXcCp4S1wluA0y+MImMUfZG9PeXwC83QD0zRTV
	Etn2Gn6ZJd6Necu3kgieTSa+qFdWntE8/Lvs4
X-Gm-Gg: ASbGncs2ZZqYv0MuovWo/G+EZHqbWFc5LHiTcyXfC1o74OzLA6imnJs6zTYSAgUXhaD
	8b5LC+M14l1u1uv5WJ2XGLjUtlVlqgVyRduxkBp42kXcqYeBEym/LXwibOGTQrnA0+Z/c7KFPHd
	57VJwhBwxfG5zZB1qORRBcHA==
X-Google-Smtp-Source: AGHT+IHMBU+wq6W4T0NSttj+q7k5OMgLNQuKpd0k4v5A7VJLj6wPKTL5/A69Xh6L5iIW/4Jk2sxylEsG5cY8WRJ7HAs=
X-Received: by 2002:a17:907:3f24:b0:ac7:7f14:f31b with SMTP id
 a640c23a62f3a-ac7d1824971mr1478492866b.3.1744088355421; Mon, 07 Apr 2025
 21:59:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202728.2157627-1-dhavale@google.com> <CAB=BE-TzPKSsHo_nvMuGkB_4JbbP8OZ81ce=76y-28nAeZiniQ@mail.gmail.com>
 <da085862-1c82-4b3e-82ea-b54e2432d96d@linux.alibaba.com>
In-Reply-To: <da085862-1c82-4b3e-82ea-b54e2432d96d@linux.alibaba.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Mon, 7 Apr 2025 21:59:03 -0700
X-Gm-Features: ATxdqUH2xMaLI3V97urZLNZW_D7772R4FJJb9-wv2H5MVDeiqjePJE35yusKzi0
Message-ID: <CAB=BE-T7s7zgExm+A1zqbUFE3SOdB_YzJZgsp4sYBBt2V_EA5Q@mail.gmail.com>
Subject: Re: [PATCH v2] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: linux-erofs@lists.ozlabs.org, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 8:07=E2=80=AFPM Gao Xiang <hsiangkao@linux.alibaba.c=
om> wrote:
>
> Hi Sandeep,
>
Hi Gao,
> On 2025/4/8 10:53, Sandeep Dhavale wrote:
> > Hi,
> > Gentle ping for review in case this slipped through the list.
>
> I'm working on internal stuffs (unrelated to erofs,
> currently I have to handle erofs stuffs totally in my
> spare time), also does it really need to be resolved now?
>
I totally understand.

> It's not like a bugfix, if it's not urgent it will be
> landed upstream in the next merge window.
>
Yes, the next merge window is fine. I was just making sure that I
collect feedback in case you think this needs any more refinements.

Thanks,
Sandeep.

> Thanks,
> Gao Xiang
> >
> > Thanks,
> > Sandeep.
>
