Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B0A3594E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569801; cv=none; b=dAmwZY18EcQNjTTYnwB3S5vGjlUXFNu5kPLQl+JxCXXjh66AUX9ehwhg4xYqKu2DzGNTCowWnPl+FMa6bj9u7N5/efSbMScVTw6DXbLVD2QaIHW1hfv4SwgELIC09ltXDVC0vSYOnuVfMY5YcmvqmyGm5yc6gT4r4Q52/Qf+k2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569801; c=relaxed/simple;
	bh=QrWQ2WKE4sI7115aKLlatif48JOYPm9yzXpHcTYJNrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HdoSuQxTkZYw9P2EtRYOr7l7qG7rEfQPlSEZtQSsJ7fAimAQ8gZ+fBDXKDqlxduTPhzst+aq2JDi26iRaKMGbPF0gWPIcPtVRgTPkK6GKcnklubVBnyC88b5+8nIBNAIf3ZJJE3XBAM3iSsanyoPHv6R2cqA54A0VF61cWf9Hjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LmKHFxI7; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LmKHFxI7"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4affbc4dc74so2647851137.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738569798; x=1739174598; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QrWQ2WKE4sI7115aKLlatif48JOYPm9yzXpHcTYJNrQ=;
        b=LmKHFxI7tt/PYNhc2EdraQfBV+Ab1hLsyHIHAP3yLC7jqwQ/uwIcEkAv1crt/L2Wi6
         uPLcMGpJcYbI5LNuYFG4oKHqpYbp22tJO0I+gz5e56mS1rtCkuacZHLxVOYU5caXf9h2
         ZHlokEdlh9vDW5oUPrHjWVMuhCY2Uk2iRh99zkXPApWTcaYs+01PkE2+SWM2WyCr1ly4
         39XbxYh9ipXEAX6hCe7xt1DrwlGvI7hOx3/KkYTxuW5f5FQ9aRSGvC66wd+mbiCFAW/s
         nOrotHPpPCkZP1AklDcJmXfw9EtPfsPZ4tS5qCiIxHnVBkb0pNw09NUeDfx5DMc6qQVA
         Yk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738569798; x=1739174598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrWQ2WKE4sI7115aKLlatif48JOYPm9yzXpHcTYJNrQ=;
        b=SfOlt6CVfq+tqZBZsX/M0Vir0VoARPEDdtac0URiPOfvsITVxJVGQGzR7apNQF/YYU
         eOxb1DePm5SJpVG+9fn1NLU/nmwOJJ0MiPfuM0kIMaWhSXLxrlZbV6EXfnLZUcSIQ6xt
         UaIS9RgQKqruwtWzZvKmUVGlI1FWa6yde6gI5afGyErlIxdiwFY/7UiTRzhPu/23THsS
         s+SeSND5U0ITP2ehq81A8UKAKyPN48CeSEl3uFpmPaT1nIP6lm6hN8Z/2qLRgVrKgE9R
         CBz25hvhtqarW+4VRFZEjC4mJjbwVaaJID5h1iXflNSj8LMzCMf9hk2lriwufwB9I9/Z
         okzA==
X-Forwarded-Encrypted: i=1; AJvYcCU2LppqcIwLwBRI948YLsk43LXJLW8HXSrH+9SoAC7OSSc0OhlxhZjGXdaW8iNEd8egz7JZnZiBwujmIyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXh6mP+Heji3reMHpSw97gPUWghcJuoWi8h9dpPCmsxdnKadYd
	+SK88bhSRCfeKaAUJCdd9J6dzJ+JOVrjTZTC3gVGqGs6iybwjAhbPAiZTybhPD+BOwQdKO/OYhl
	kkyn+DPIfrH8JFLBlhz/PFxkRfniPw/ymLUruzw==
X-Gm-Gg: ASbGncuCFfTl0rvQtk4YbZqLwk4zEcjSpUsMTOzvEh+Zke9vc3bUGb5Mvz3Q5CpkRGk
	DmV7SSyQTpMRy9qoSTjfIl6x3jXay5HxRxyxryg2CN/wez3pTG7oDcdGelRkKXrgdIgi9qt/yUw
	==
X-Google-Smtp-Source: AGHT+IGx/zcHNb0KNJn1OlD+LxfDqmzEuqqLYZfWE7i0X2+6ITt3LUtS1bJEVKp5xrJKbWMTCb94452lW2XHypAU8aQ=
X-Received: by 2002:a05:6102:1504:b0:4b6:1a64:1c95 with SMTP id
 ada2fe7eead31-4b9a52dd9famr15012722137.22.1738569798027; Mon, 03 Feb 2025
 00:03:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213111453.367031-1-sumit.garg@linaro.org>
 <CAFA6WYO+T2pZcB2VBhP=ut2w9HtkeCvYkqoM85LZnJ9iF+gvNw@mail.gmail.com>
 <CAHUa44EE6XL5zgf0VNeqPkUukFGz5BgiHz=0yAVdd=tEzLEq6Q@mail.gmail.com>
 <CAFA6WYNRD-CGTHufafFLX4SjvpH6fBKwqCac8JE2oLepqqsNOw@mail.gmail.com>
 <CAHUa44F76AqB4ijQHBfoNXveiyxeBLOLh6ULT+pc+va3y0qBdg@mail.gmail.com>
 <CAFA6WYO1aXiUozs8WiawSbok5hCmV8bXz9cRgEJ0r+LAwL9J9A@mail.gmail.com>
 <CAHUa44GdxO3TCLyOQdCHbdVGKpSHpnxBp_JAfAhpVgXuWYOVhw@mail.gmail.com>
 <c3c782f8-fb48-4d3e-95b0-d0707f57acff@app.fastmail.com> <CAHUa44H4yLvkU6ATvk0KOzVDa2TOgS9EBsU+BKR2piZbX26kLQ@mail.gmail.com>
 <CAFA6WYNj0aWnV+jxoxHU7OOg8oWC2-AboUMztxaPCDQuO+c8gg@mail.gmail.com> <11d19be4-85a2-40dd-b3c6-07bbdd794df0@app.fastmail.com>
In-Reply-To: <11d19be4-85a2-40dd-b3c6-07bbdd794df0@app.fastmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 3 Feb 2025 13:33:07 +0530
X-Gm-Features: AWEUYZkQbIfgPPrO9DIl_5ofovbjnFCiZLbYA9dl7AmZETK_pU2ULtMhAra0l_4
Message-ID: <CAFA6WYOHbv4GA2j7DWf25QFGjoyzp7szoxhij4CMFjg+NQvN9w@mail.gmail.com>
Subject: Re: [PATCH] tee: optee: Add support for supplicant timeout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org, 
	Jerome Forissier <jerome.forissier@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jan 2025 at 17:03, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Jan 31, 2025, at 12:06, Sumit Garg wrote:
> > On Tue, 28 Jan 2025 at 13:49, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >> >
> >> > As far as I can tell, even that DEFAULT_HUNG_TASK_TIMEOUT
> >> > limit is only for tasks that are in an unkillable state for more
> >> > than two minutes, but the supplicant not providing results
> >> > to the kernel could also happen when it waits in a killable
> >> > or interruptible state, or when it does multiple I/Os in a
> >> > row that each block for a time under 120 seconds.
> >
> > The supplicant itself can be in a killable state but the client
> > application which will be waiting for it in the kernel is in
> > unkillable state. So if a shutdown/reboot is issued at that point
> > which has to kill the client application first and then the
> > tee-supplicant, it will just cause the system to hang up. That is a
> > real problem that I am trying to address here.
>
> Is the client the one waiting in optee_supp_thrd_req(), or
> is that the supplicant?

It's the client only.

>
> If the problem is the client being unkillable at the moment,
> could you address that by using wait_even_killable() or
> mutex_lock_killable() and just bail out safely? I assume
> at the point the system is rebooting, there is no need to
> wait for the supplicant to complete, other than making sure
> the function can return without running into undefined state
> of the kernel.

Thanks for the suggestion, it helps to resolve the shutdown/reboot
hung up issue we were observing. Incorporated your suggestion in v2.

>
> >> > A single sector write to an eMMC can easily take multiple
> >> > seconds by itself when nothing is going on and the device is
> >> > in need of garbage collection. If the system is already in
> >> > low memory or there are other tasks writing to the file system,
> >> > you can have many such I/O operations queued up in the device
> >> > when it adds another I/O to the back of the queue.
> >>
> >> Adding a timeout means we must somehow handle them to avoid spurious errors.
> >>
> >
> > The timeout I am proposing here as default being 2 minutes is just for
> > a single tee-supplicant RPC request. I suppose that should be
> > sufficient to avoid any spurious errors.
>
> It won't guarantee that, but if there is a 2 minute delay, that
> likely means that the system has become quite unusable from being
> slow, even if it hasn't otherwise misbehaved to that point.

Agree.

-Sumit
