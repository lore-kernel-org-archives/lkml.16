Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC779176ADB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769048; cv=none; b=PsUsIDk1x08m9Lb1dK+kxiPJ5ihspB3WuGxZbu74uekL6HyHvKBojI7tptOqBSCUIA7a3cdKkx1MjCMhbUIXUSIqFhU5BSjKjxrQK5fa5bxbrAiusAoXQOQUSO4NFpOyPLv6wJdxH7pX9oQy6g8y00P8j8ge2CGtkBz52A6xxVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769048; c=relaxed/simple;
	bh=h7w8GLzZ3jPLSpMlchqSLHPjqAQLpppbV2yNWZyQRm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDpXzrmBnouUnIEb9Isha/mhAAsiQ1Ms+MKA80S6bK92RBMmEFeC6HDpK4pQxdvGb1OUcqB9PogKjZ+9SpHv26gRIBCknWEX23MBQxbuRuKI5/5NtzgjWsO5uv9skOv6zBqxTG5l43hVNIPVwoREfdBjejdmmgPOL3umW6wx1iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9T2MBMV; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9T2MBMV"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4768f90bf36so56089801cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744769045; x=1745373845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbUcpthGBxgpioJ0YdF+W21SvPgh0pMiriNi3aNsZiE=;
        b=Y9T2MBMVLjh8XaO3nP0ie/soF4mDOzktWvKGDKFRg4I4keb8meGIlCdfj0mEMCSdOI
         VtXCJ2xRQt1abWXFaG8DcwU2MKzKRLfEGuBSwcCqlEMAO5IupyugTGddEhmSkqt+JMfD
         jmIjmTXKqWAzOa7gbLCFG1BRfJcvrM2vv8VJFo9etMgv0kR2JbRvvl2+iFFeYSU0tf4z
         tSS4rSjMV/AQvn7qLRiyPHaynYVTpyxVksajj+yzYnJj8HODQV5Hrt9FI5MO9UA5apFW
         tItytNY+EjRga1IFwAy9hjgtugHdCv5JlGUhiX6jdq7wQZbQWgZNoK4+pdN6Nmv4gaQF
         pC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744769045; x=1745373845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbUcpthGBxgpioJ0YdF+W21SvPgh0pMiriNi3aNsZiE=;
        b=UugfEOy/jIW4VyTtZiEIIXbw1K1frzKfGUMziRqKKkh9MVo2TovAP46G10Fs66Z224
         C7BYBUwrSvk0qk/49ewn3Q0MDlvOt4p1L2omnPHyKoWTBrMK/wMbL0WtrKa3WVy8eghW
         bzkLZKd3nq8ycOIOEhAqUPcFLHntXo816zkxmeoUSp8Jr3hMhAYX0Pz+VsktZ9JaNTlG
         1RFT2gDIIbGx40MAe1GmPsZ/jp4/TXk1nMf8qfBXUhfjvrjdKauBcsSvi9+be+Uix1Cl
         YB0mZ8KyjtgrZVaxyL5KdoFBj5uQAFvx6Y6Y0qEfln+KCuB7U5Yq86R/vceAYstqHVwx
         9PjA==
X-Forwarded-Encrypted: i=1; AJvYcCWAk75l6Ctpa0yCNeOUPF7umIxh0GxW/xJCEFXGmcsJESyLEfrpNAfo0yoADiyPw5/a4Fi9Mlnxz7XIHGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw38HE7fNRAZEyk294dBSV4ljBHpYojqT1WCixWC98UbM5Ra/Pk
	Ffcn7M1/bQsnI85ogV9oeVXie3fsxmw+Ev2KA5xPQXB95uC9hxnM7CbbK9OI2cHJsuwDI6U+q8q
	1KCcPhbi0kys3PSvURBoVONftgD8=
X-Gm-Gg: ASbGncuxvzQ1M2tFvH1LORKkoMqRdW5lFtHsdX5IePK4LKsf+gexZrNUVPJEsrQBoa6
	mSk6VU5msqmZ/SZ0e6ynm/7gnEbdgPAk+OGmwSQopDys7ELVhvqZ+vTE9Q6gWeA1ZxLtekpSkMf
	+8vWb/29I+Ppen1F2pTasWvRU=
X-Google-Smtp-Source: AGHT+IGKfTwQcXGEJbQe9+Ue3S4nOT1Fc572p6VkTPPxgr4XWVPqJJCP6xPCtUbm7ki7cQCenaCJBYfuZvRQNuKCUXU=
X-Received: by 2002:ac8:7f0a:0:b0:476:7ff5:cc27 with SMTP id
 d75a77b69052e-47ad3af412fmr24420761cf.51.1744769045588; Tue, 15 Apr 2025
 19:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302210539.1563190-1-vincent.guittot@linaro.org>
 <20250302210539.1563190-6-vincent.guittot@linaro.org> <CAB8ipk-MgPPptz36W0zYx3TGiESyMwoY3Xoh8xw+zubPSJsZMg@mail.gmail.com>
 <CAKfTPtAbz1mBxgMdPH+FZesX0hVnmYCdapygaZY19DH1O8LJ5g@mail.gmail.com>
In-Reply-To: <CAKfTPtAbz1mBxgMdPH+FZesX0hVnmYCdapygaZY19DH1O8LJ5g@mail.gmail.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Wed, 16 Apr 2025 10:03:55 +0800
X-Gm-Features: ATxdqUF-_oXzFP39UkE0ORnxBb8TgrxGp-bLYTut7fm-qkIf6PvexwPcZJkiGuk
Message-ID: <CAB8ipk8MY06Z+rwuA+FEaKqnwWjuf42VeBS5F98ww3tYttjPWw@mail.gmail.com>
Subject: Re: [PATCH 5/7 v5] sched/fair: Add push task mechanism for EAS
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, lukasz.luba@arm.com, 
	rafael.j.wysocki@intel.com, pierre.gondois@arm.com, 
	linux-kernel@vger.kernel.org, qyousef@layalina.io, hongyan.xia2@arm.com, 
	christian.loehle@arm.com, luis.machado@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

On Tue, Apr 15, 2025 at 9:51=E2=80=AFPM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>

> > I am carefully studying this series of patches. I have some doubts
> > about this part.
> >
> > Need we check the state?
> > READ_ONCE(p->__state) !=3D TASK_RUNNING;
> > Because the tick will check it.
> >
> > On the other hand, need we check the sched_delayed?
> > Because it also checks it in put_prev_task_fair().
>
> In the case of tick, the task is the current task and the only one runnin=
g
>

If the following occurs:
set_current_state(TASK_INTERRUPTIBLE);
schedule();
    __schedule();
        local_irq_disable();

the tick occurs between set_current_state() and local_irq_disable(),
maybe we do not need to migrate it.


BR
---
xuewen
