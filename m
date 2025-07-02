Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2C8272E54
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463958; cv=none; b=Gk5j9N54kM/TDQI+q9EyQLoPi8cNZrrAmy50sZJgJszPtbX9hB7AcLQZip4Ngfel4pYSL5JisI0JfOm8wBiyp8LvbCaOi6qOcx0bw3rxK2gjnDqoRPw3x/VIllcdjAefnS8ZqP69mbGHuwYCAN4EFdYA6ueDPB90ptFm93oaOik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463958; c=relaxed/simple;
	bh=8u9Qf8DAyVnLgBL1BAQ7bJ/8OyB7sVxNOtB6nFzcscs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBscZTOpaUUuhRL2TVfBEWGYW7VLRGOw6BN2iC/pzO5cAN+aDXG1Ckf5InOOwPbI1VBo5OW9qWTijyBlgQvHuMBDlNWJKUaHsvlyVVAYe+nxWdRUMetfH701xbSpDExU6ku6uRP/anNuuohMlPzJm1HgU88VmvEvlxj5V9vrKoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LykDpfuJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LykDpfuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751463955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nzGM1dlehEBmeEpSlHweKlaaEOCqBU5H5nX/N5Y7Ic=;
	b=LykDpfuJ0vY1XegJiz1P3f6k61nMw9kdLEiyp7ja9yg1y8/5MInAdIcwLOOZSSIZDBUyMm
	oFlpBHqIKCpKlupw2QnDSwAKVM+ZShZeqmMoyAywb8UCoptafKRCD6NVLOacEl7FytxLeR
	1M6jLAjmXaDqyykaGRxFlRTtxY+l8BA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-sV1OD7WBNuO6ViiVasjUwQ-1; Wed, 02 Jul 2025 09:45:54 -0400
X-MC-Unique: sV1OD7WBNuO6ViiVasjUwQ-1
X-Mimecast-MFC-AGG-ID: sV1OD7WBNuO6ViiVasjUwQ_1751463953
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a985909a64so834541cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751463953; x=1752068753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nzGM1dlehEBmeEpSlHweKlaaEOCqBU5H5nX/N5Y7Ic=;
        b=UGXrNZMZpREXPdF88rz1H0GQHHua1uH/m22Va+npjo4QHnfm1jFjhh2EbcuAwDa7V1
         8sGir1tV6z9z7YpKpzwJ+0gSwZ1lg2uv30LItb919CTna57ZT81NBAtxJE61yRNdtKJe
         4HaZ/PXsVyfwaW4UCM7oEP+Ds6ae6dbCrAoIm907ISZtyPInqV4TPpRROzROEq19O9MH
         kEJAWpoBPg+iLBaY4l1JiFcC5kNbFW380gxNm5tW+FxMIaUv9ydCXybiM1jrtvUofrST
         UIBB+fQnQq1upYN/zk0RCcE/pBxtH023eIKut32CqOae9YDDCPyouezyw2v+qlXkTbSL
         xBLg==
X-Forwarded-Encrypted: i=1; AJvYcCWWCnPksRZOwahxMkuKS1ATybbjY0TGMeFOsHFS5UZVOHzZvaNcAPIx0z9iIyinlBjLvgjGIyLUj0Fl2XY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE3i9SUsysf4nCtrJHwKjy2qYhDWAX3ZP6TuRl4XytunKgJWB4
	X1v3zMrJIoNZE87vwlbbJF68lm0cTUa3QQUhhNmmTRlVH2/WRELHJ6dWH1uGY/BNaQwvsZ5QnDz
	RQI6QmGa14KEZ/andireF2c5Lxnb3HC0A5QdYUMSjXyYwuFByrsdVmI9FAEbCHQW8V5OgrMrnq/
	OwrZ6n46kYIFiH9Ee/I0gBX0lHndUI2upvFjrsD+Lf
X-Gm-Gg: ASbGncvUZ0hKdoIZrs5adRnKUCOILwFQ5sgsQl0FZO68s6dFgxFni2gaTpMgIuxsqCJ
	8DkO7mGZSffv178N7eI9khhIMs7bT+qu+rMNma2umjUOU904QDZwmxqQDDh0N3Id4BhauZz7bO+
	CTfg3jIc30Pro6fRPMRTPj4sa03mm8PTzS1aeR
X-Received: by 2002:a05:622a:4818:b0:4a6:ded5:3d62 with SMTP id d75a77b69052e-4a9768b5572mr41766081cf.9.1751463953181;
        Wed, 02 Jul 2025 06:45:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWWtZVKx5fXIrRfAlsWmy/44wHP/k2Ly2v2p19YYL7wyYAokSZ3ve58bfy9iDjapL+dYCF5bm0irryd6vCVL0=
X-Received: by 2002:a05:622a:4818:b0:4a6:ded5:3d62 with SMTP id
 d75a77b69052e-4a9768b5572mr41765701cf.9.1751463952674; Wed, 02 Jul 2025
 06:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620085618.4489-1-gpaoloni@redhat.com> <20250701195939.3e297e20@gandalf.local.home>
In-Reply-To: <20250701195939.3e297e20@gandalf.local.home>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Wed, 2 Jul 2025 15:45:41 +0200
X-Gm-Features: Ac12FXzaoj0JCj2YIlLuiPzae-grwKdgkAOETspd5fkGO1Lj_S1SFUvMoU3TDQg
Message-ID: <CA+wEVJY2a_ERXemup7EefPPXHOv8DAfyauuP6Mn5vHYFkbbBcQ@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND] tracing: add kernel documentation for
 trace_array_set_clr_event, trace_set_clr_event and supporting functions
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven, many thanks for looking into this

On Wed, Jul 2, 2025 at 1:59=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
>
> FYI, I know some maintainers prefer a "RESEND" of a patch, but I personal=
ly
> prefer a simple "ping" reply to the patch. Actually, I'll take either, bu=
t
> my workflow is with patchwork[1] and I tend to give older patches in
> patchwork priority. By sending a patch again via "RESEND" that patch will
> supersede the older patch which actually pushes the patch further down in=
to
> the queue, which makes it even longer for me to see it (having the opposi=
te
> effect of the purpose of sending "RESEND").

Apologies, next time I'll ping instead of RESENDing (I recently
started following
this mailing list, so I was not aware).

>
> [1] https://patchwork.kernel.org/project/linux-trace-kernel/list/
>
> On Fri, 20 Jun 2025 10:56:18 +0200
> Gabriele Paoloni <gpaoloni@redhat.com> wrote:
>
> > As per Linux Kernel documentation guidelines
> > (https://docs.kernel.org/doc-guide/kernel-doc.html),
> > <<Every function that is exported to loadable modules using
> > EXPORT_SYMBOL or EXPORT_SYMBOL_GPL should have a kernel-doc
> > comment>>; hence this patch adds detailed kernel-doc headers
> > documentation for trace_array_set_clr_event, trace_set_clr_event
>
>
> When referencing functions, please add parenthesis "func()" when naming
> them.

Thanks, I'll change the commit msg in v2.


>
> > and the main functions in the respective call-trees that support
> > their functionalities.
>
> Also add newlines in the change log, to make it visually easier to read.

got it, will change in v2.

>
> > For each of the documented functions, as part of the extensive
> > description, a set of "Function's expectations" are described in
> > a way that facilitate:
> > 1) evaluating the current code and any proposed modification
> >    to behave as described;
> > 2) writing kernel tests to verify the code to behave as described.
> >
> > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > ---
> > Re-sending as no feedbacks have been received.

Now that I am reading this I realized that I missed the most important
discussion comments from v1, so I am adding them back here inline
below (BTW one more reason to avoid RESENDs):

While working on the documentation of __ftrace_event_enable_disable,
I realized that the EVENT_FILE_FL_SOFT_MODE flag is mainly used
internally in the function itself, whereas it is EVENT_FILE_FL_SOFT_DISABLE=
D
that prevents tracing the event.
In this perspective I see that, starting from the initial state, if for
a specific event we invoke __ftrace_event_enable_disable with enable=3D1
and soft_disable=3D0, the EVENT_FILE_FL_ENABLED is set whereas
EVENT_FILE_FL_SOFT_MODE and EVENT_FILE_FL_SOFT_DISABLED are not.
Now if for that event we invoke __ftrace_event_enable_disable again with
enable=3D1 and soft_disable=3D1, EVENT_FILE_FL_ENABLED stays set,
EVENT_FILE_FL_SOFT_MODE is set, while EVENT_FILE_FL_SOFT_DISABLED
remains not set. Instead if from the initial state we directly invoke
__ftrace_event_enable_disable with enable=3D1 and soft_disable=3D1, all
the status flag mentioned above are all set (EVENT_FILE_FL_ENABLED,
EVENT_FILE_FL_SOFT_MODE and EVENT_FILE_FL_SOFT_DISABLED).
Now I wonder if:
a) such a behaviour is consistent with the code expectation;
b) if it would make sense to have a standard enable invocation followed
   by a soft enable invocation to end up in the same state as a single
   invocation of soft enable;
c) eventually if we could get rid of the soft_mode flag and simplify
   the code to only use the soft_disabled flag.

Probably there are aspects that I am missing and I really appreciate
your inputs/views.

> > ---
> >  kernel/trace/trace_events.c | 125 +++++++++++++++++++++++++++++++-----
> >  1 file changed, 109 insertions(+), 16 deletions(-)
> >
> > diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
> > index 120531268abf..4bd1f6e73ef1 100644
> > --- a/kernel/trace/trace_events.c
> > +++ b/kernel/trace/trace_events.c
> > @@ -763,6 +763,54 @@ void trace_event_enable_tgid_record(bool enable)
> >       } while_for_each_event_file();
> >  }
> >
> > +/*
>
> If you are going to use kerneldoc comments, might as well make it a
> kerneldoc format: /**

Uh this is bad, sorry I'll fix this in v2.

>
> > + * __ftrace_event_enable_disable - enable or disable a trace event
> > + * @file: trace event file associated with the event.
> > + * @enable: 0 or 1 respectively to disable/enable the event (any other=
 value is
> > + * invalid).
>
> Saying 0 or 1 should assume that those are the only values. Don't need th=
e
> content in the parenthesis.

Agreed, I'll remove it in v2.

>
> > + * @soft_disable: 1 or 0 respectively to mark if the enable parameter =
IS or
> > + * IS NOT a soft enable/disable.
> > + *
> > + * Function's expectations:
> > + * - If soft_disable is 1 a reference counter associated with the trac=
e
> > + * event shall be increased or decreased according to the enable param=
eter
> > + * being 1 (enable) or 0 (disable) respectively.
> > + * If the reference counter is > 0 before the increase or after the de=
crease,
> > + * no other actions shall be taken.
>
> Although this has newlines (which I like!), the indentation should be wit=
h
> the first word after the hyphen. That is, instead of:
>
>  * - If soft_disable is 1 a reference counter associated with the trace
>  * event shall be increased or decreased according to the enable paramete=
r
>  * being 1 (enable) or 0 (disable) respectively.
>  * If the reference counter is > 0 before the increase or after the decre=
ase,
>  * no other actions shall be taken.
>
> It should be:
>
>  * - If soft_disable is 1 a reference counter associated with the trace
>  *   event shall be increased or decreased according to the enable parame=
ter
>  *   being 1 (enable) or 0 (disable) respectively.
>  *   If the reference counter is > 0 before the increase or after the dec=
rease,
>  *   no other actions shall be taken.
>
> Making it easier to read.

Agreed, will be changed in v2.

>
> > + *
> > + * - if soft_disable is 1 and the trace event reference counter is 0 b=
efore
> > + * the increase or after the decrease, an enable value set to 0 or 1 s=
hall set
> > + * or clear the soft mode flag respectively; this is characterized by =
disabling
> > + * or enabling the use of trace_buffered_event respectively.
> > + *
> > + * - If soft_disable is 1 and enable is 0 and the reference counter re=
aches
> > + * zero and if the soft disabled flag is set (i.e. if the event was pr=
eviously
> > + * enabled with soft_disable =3D 1), tracing for the trace point event=
 shall be
> > + * disabled and the soft disabled flag shall be cleared.
>
> Would it be possible to group the requirements within "If soft_disable is
> 1"? Seeing three different lines starting with the same state seems
> inefficient.

Possibly yes but IMO it would not save much; e.g:
  - if soft_disable is 1:
    - if the trace event reference counter is 0 before the increase or afte=
r
      the decrease, an enable value set to 0 or 1 shall set or clear the so=
ft
      mode flag respectively; this is characterized by disabling or enablin=
g
      the use of trace_buffered_event respectively.

    - if enable is 0 and the reference counter reaches zero and the soft
      disabled flag is set (i.e. if the event was previously enabled with
      soft_disable =3D 1), tracing for the trace point event shall be disab=
led
      and the soft disabled flag shall be cleared.

However IMO we can revisit this point after we have a discussion on the
considerations that were missed in the RESEND process and that are
now pasted above

>
> > + *
> > + * - If soft_disable is 0 and enable is 0, tracing for the trace point=
 event
> > + * shall be disabled only if the soft mode flag is clear (i.e. event p=
reviously
> > + * enabled with soft_disable =3D 0). Additionally the soft disabled fl=
ag shall be
> > + * set or cleared according to the soft mode flag being set or clear
> > + * respectively.
> > + *
> > + * - If enable is 1, tracing for the trace point event shall be enable=
d (if
> > + * previously disabled); in addition if soft_disable is 1 and the refe=
rence
> > + * counter is 0 before the increase, the soft disabled flag shall be s=
et.
> > + *
> > + * - When enabling or disabling tracing for the trace point event
> > + * the flags associated with comms and tgids shall be checked and, if =
set,
> > + * respectively tracing of comms and tgdis at sched_switch shall be
> > + * enabled/disabled.
> > + *
> > + * Returns 0 on success, or any error returned by the event register o=
r
> > + * unregister callbacks.

FYI I also noticed here that "Context" is missing and "Returns" should be
"Return:", so I'll fix this in v2

> > + *
> > + * NOTE: in order to invoke this code in a thread-safe way, event_mute=
x shall
> > + * be locked before calling it.
> > + * NOTE: the validity of the input pointer file shall be checked by th=
e caller
>
> I have to find some time to make sure the above is correct. I'm looking a=
t
> this more at a superficial level. And I'll look at the rest later.

Many Thanks!
Gab

>
> Cheers,
>
> -- Steve
>

