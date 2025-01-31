Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C15F16D9C2
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738321624; cv=none; b=O9/VNWob+WclvzOxsqsCHspietoX2Kp4+jfVp3IlGwuN0NLPkAE97SVyfkPkvfSLwOM8MyI3/BF0gWthuMu+nNjEMFApGaTXUowBo/DzYHN7tni3uMdpap01Wju/KUo9ofkIso2z+PiazSAVSbO6FEbKk1p2znqEjJrKqHD/ZP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738321624; c=relaxed/simple;
	bh=tkiWmhx4HHdHgZ/4sVoXPJ9Wg3nPuxr3sXkv8iGQvd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KSmdWGsy2ahBi8tQtREwEKauyRJQCOM5URvSFFjQ25U+1dWrgUuOEjwAo8XWwpeZHQA/QX2vRwWwO0ale+fTUCKrQ5wYHIj3W78SHQYrYDyWhc/TnfC24x2jJlXUxzMLAaKPCMNLVkUVZYYKxwZlxnAyqT6tjYsLNRBqxBfohm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMTzLbpG; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMTzLbpG"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85bc7d126b2so924770241.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 03:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738321621; x=1738926421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGA47FN8m+yDAL2bTevESwXH0qRDo6T3v7aicRT6EWI=;
        b=XMTzLbpG2X+lgb+SRm8l6SgArgWyeyu1QuKX3Ao99VGQWqkjdrkOsNADVq7WiqUwmq
         ZlPFI3pEzeoEzK+wzDBCCLV4q2tbHZYIv8Sk2hEBtA56uI0k9WHbxs5afZaoOd8tUZ+b
         wTFVf12F94RXECgphf73kxlBKu5mM3xm5p9t0L4ce0vU+hnbsOTkcLbRuFNFSSDSpb7p
         cVO0dSfR2vkZ2mVndy/Sejel7cb+DyB/P+jvnZFzDxYBl8HnSB8DYLhepwR9/2qk8K4j
         DGvzeFRzjWwWSOnQBfP+1wqRP12FT+aySHgYwctHjfmn9hvie82W40c2mIfkKbo8zBKw
         cSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738321621; x=1738926421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGA47FN8m+yDAL2bTevESwXH0qRDo6T3v7aicRT6EWI=;
        b=vCf+ScVD3I0sqMwiX8JIuET9b1QSqX0OZo0IDq1J1uuGax3UTNCNRjVrsIImtUpT1f
         Qbow3jdnbDn/C/A3r31/7hxbgMDiRQccYj4rxkOwpZXT0IQC1Yc39EvUXeNAT5JI0udN
         JSduTH1lwbB2bmEmzocxHXbYEE3C795xyxPEM4fpzucTMYFM4QmhMPewsWQndD9hyhSn
         elBnmvPFz1KDVy6400bzvsfWZHYk/iPKWs0+MZnXfRsIyE4H6jy9Rn5+4L/DNAEoJ/5I
         nUVqrkQu1WKukoM9sp+okzBXiKkOdFXB/QDFIqKOuevw0WQhuw9fu2JYY+UjZgu8zzHa
         +JPw==
X-Forwarded-Encrypted: i=1; AJvYcCVhxrw/Gqf2nGkAWXUMYM/m4Lb+Vw+j/DB+aS1ZnQcPpIRV0kz/m2LuaTpnUeNiRWKSyFwiVEqhQXDwd/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy14AMiHvxFLetjX1/vGkIePKlAwj3N6+mHKlrhkcK5WO1aAs+D
	nvNYAqG7LnVXVhfbagD+GzkhO2I1NyiXpsTeGvpi0aN9qlISlx60uqb63zYf7L9HN1042OztEyI
	7kv72W+5COlI5dID4eqlKXkjvWNQlvojJZ45n6A==
X-Gm-Gg: ASbGnctWwdH2rZo2X4eCLDLHWKYY++EJVQPI33v32zqfmiTBke/0pu8GVDfYKRIx+Qt
	g8fY7zbySVU2AwPIIS3vYQBhRg8z4K+dNbYsW0mZJ3zPE4aDR42n2DHjC2gkyFxbzH8avuDGpZg
	==
X-Google-Smtp-Source: AGHT+IGf4uaz31xNkGAxiVlBgt9nEhreBEYmuljUUMtKYNtYcMR4ej8HTtYnJX6Tjx+CN6wH7O3+UR1VmkHfwZq6dp0=
X-Received: by 2002:a05:6102:161e:b0:4b6:1ce1:30a3 with SMTP id
 ada2fe7eead31-4b9a4ecab5amr8333710137.4.1738321621306; Fri, 31 Jan 2025
 03:07:01 -0800 (PST)
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
In-Reply-To: <CAHUa44H4yLvkU6ATvk0KOzVDa2TOgS9EBsU+BKR2piZbX26kLQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 31 Jan 2025 16:36:50 +0530
X-Gm-Features: AWEUYZkQjUHsPIAFR4NQL_QaNK3zAeu8WlvSuywB5CPQMHDCsndkK6B2NwDRJIU
Message-ID: <CAFA6WYNj0aWnV+jxoxHU7OOg8oWC2-AboUMztxaPCDQuO+c8gg@mail.gmail.com>
Subject: Re: [PATCH] tee: optee: Add support for supplicant timeout
To: Jens Wiklander <jens.wiklander@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: op-tee@lists.trustedfirmware.org, 
	Jerome Forissier <jerome.forissier@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Jens,

On Tue, 28 Jan 2025 at 13:49, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>
> On Mon, Jan 27, 2025 at 9:29=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wro=
te:
> >
> > On Mon, Jan 27, 2025, at 08:33, Jens Wiklander wrote:
> > > [+Arnd for a question below]
> > >
> > > On Wed, Jan 22, 2025 at 1:25=E2=80=AFPM Sumit Garg <sumit.garg@linaro=
.org> wrote:
> > >>
> > >> On Wed, 22 Jan 2025 at 15:36, Jens Wiklander <jens.wiklander@linaro.=
org> wrote:
> > >> >
> > >> > On Wed, Jan 22, 2025 at 10:15=E2=80=AFAM Sumit Garg <sumit.garg@li=
naro.org> wrote:
> > >> > >
> > >> > > On Mon, 20 Jan 2025 at 19:01, Jens Wiklander <jens.wiklander@lin=
aro.org> wrote:
> > >> > > >
> > >> > > > On Mon, Jan 20, 2025 at 10:24=E2=80=AFAM Sumit Garg <sumit.gar=
g@linaro.org> wrote:
> > >> > > > >
> > >> > > > > Hi Jens,
> > >> > > > >
> > >> > > > > On Fri, 13 Dec 2024 at 16:45, Sumit Garg <sumit.garg@linaro.=
org> wrote:
> > >> > > > > >
> > >> > > > > > OP-TEE supplicant is a user-space daemon and it's possible=
 for it
> > >> > > > > > being crashed or killed in the middle of processing an OP-=
TEE RPC call.
> > >> > > > > > It becomes more complicated when there is incorrect shutdo=
wn ordering
> > >> > > > > > of the supplicant process vs the OP-TEE client application=
 which can
> > >> > > > > > eventually lead to system hang-up waiting for the closure =
of the client
> > >> > > > > > application.
> > >> > > > > >
> > >> > > > > > In order to gracefully handle this scenario, let's add a l=
ong enough
> > >> > > > > > timeout to wait for supplicant to process requests. In cas=
e there is a
> > >> > > > > > timeout then we return a proper error code for the RPC req=
uest.
> > >> > > > > >
> > >> > > > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > >> > > > > > ---
> > >> > > > > >  drivers/tee/optee/supp.c | 58 +++++++++++++++++++++++++--=
-------------
> > >> > > > > >  1 file changed, 36 insertions(+), 22 deletions(-)
> > >> > > > > >
> > >> > > > >
> > >> > > > > Do you have any further comments here? Or is it fine for you=
 to pick it up?
> > >> > > >
> > >> > > > I don't like the timeout, it's a bit too hacky.
> > >> > > >
> > >> > >
> > >> > > Can you please elaborate here as to why?
> > >> >
> > >> > Tee-supplicant is supposed to respond in a timely manner. What is
> > >> > timely manner depends on the use case, but you now want to say tha=
t
> > >> > it's 10 seconds regardless of what's going on. This makes it
> > >> > impossible to debug tee-supplicant with a debugger unless you're v=
ery
> > >> > quick. It might also introduce random timouts in a system under a
> > >> > heavy IO load.
> > >>
> > >> Although, initially I thought 10 seconds should be enough for any
> > >> user-space process to be considered hung but then I saw
> > >> DEFAULT_HUNG_TASK_TIMEOUT which is 120 seconds for a task to be
> > >> considered hung. How about rather a Kconfig option like
> > >> OPTEE_SUPPLICANT_HUNG_TIMEOUT which defaults to 120 seconds? It can =
be
> > >> configured as 0 to disable timeout entirely for debugging purposes.
> > >
> > > Adding a timeout when a timeout isn't needed seems wrong, even if the
> > > timeout is very long. Arnd, what do you think?
> >
> > It's hard to put an upper bound on user space latency.
> >
> > As far as I can tell, even that DEFAULT_HUNG_TASK_TIMEOUT
> > limit is only for tasks that are in an unkillable state for more
> > than two minutes, but the supplicant not providing results
> > to the kernel could also happen when it waits in a killable
> > or interruptible state, or when it does multiple I/Os in a
> > row that each block for a time under 120 seconds.

The supplicant itself can be in a killable state but the client
application which will be waiting for it in the kernel is in
unkillable state. So if a shutdown/reboot is issued at that point
which has to kill the client application first and then the
tee-supplicant, it will just cause the system to hang up. That is a
real problem that I am trying to address here.

> >
> > A single sector write to an eMMC can easily take multiple
> > seconds by itself when nothing is going on and the device is
> > in need of garbage collection. If the system is already in
> > low memory or there are other tasks writing to the file system,
> > you can have many such I/O operations queued up in the device
> > when it adds another I/O to the back of the queue.
>
> Adding a timeout means we must somehow handle them to avoid spurious erro=
rs.
>

The timeout I am proposing here as default being 2 minutes is just for
a single tee-supplicant RPC request. I suppose that should be
sufficient to avoid any spurious errors.

> >
> > Looking at the function that Sumit suggested changing, I see
> > another problem, both before and after the patch:
> >
> >         while (wait_for_completion_interruptible(&req->c)) {
> >                 mutex_lock(&supp->mutex);
> >                 interruptable =3D !supp->ctx;
> >                 if (interruptable) {
> > ...
> >                 }
> >                 mutex_unlock(&supp->mutex);
> >
> >                 if (interruptable) {
> >                         req->ret =3D TEEC_ERROR_COMMUNICATION;
> >                         break;
> >                 }
> >         }
> >
> > The "_interruptible()" wait makes no sense here if the
> > "interruptable" variable is unset: The task remains in
> > interrupted state, so the while() loop that was waiting
> > for the wake_up_interruptible() turns into a busy loop
> > if the task actually gets a signal.
> >
> > If the task at this point is running at a realtime
> > priority, it would prevent the thing it is waiting for
> > from getting scheduled on the same CPU.
>
> I see the problem, thanks.

Thanks Arnd for spotting it, I will drop the "_interruptible()" bit in
the next version.

>
> >
> > >> > > So do you have a better suggestion to fix this in the mainline a=
s well
> > >> > > as backported to stable releases?
> > >> >
> > >> > Let's start by finding out what problem you're trying to fix.
> > >>
> > >> Let me know if the Kconfig option as proposed above sounds reasonabl=
e to you.
> > >
> > > No one is going to bother with that config option, recompiling the
> > > kernel to be able to debug tee-supplicant is a bit much.
> >
> > If a timeout is needed, having it runtime configurable seems
> > more useful than a build time option.
>

I liked the idea of a runtime configurable timeout option as module
parameter. I will use that instead.

> To address Sumit's issue of hung shutdowns and reboots, the timeout
> could be activated only during shutdowns and reboots.

You never know if the client application gets hung for tee-supplicant
before or after a shutdown/reboot is issued.

-Sumit
