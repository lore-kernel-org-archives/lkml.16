Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639CD265632
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476635; cv=none; b=RS+5mSHYLQYBrT3uRUFoe6i2+ycssqVhxIqBXaOmhuet8CzvDxQLi86Nx5uY1gIGQXRV6rLEv1mDN6IzGjEHvhi3rIeq29cJkFqEgVBMLzObFL4oiGUKpPacrhu12B1hSbuDk6/CEtCxcEZYNvvFg9RkM2N9EuP1xPamrbAK5v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476635; c=relaxed/simple;
	bh=riBtx9XwOeyMU2QIu77jUV5dt5PPlfFKHZ9kuYlBB6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljiHpUfuBFdY6fB0EHEaGfmdrr6e3mZGVIEDyw663qU8bBaA6Vz/S7Jo+y0mPrDcXm5mQoNuhEbzzpP3Y4sK5CKYh5u4HUaZ2PV+gS0iB9B0EKBPt2dgmWRBiuPQ5ueDpou493IbBuDgePI+NmYDFH9joZGGDKUpox4ZiSg/W6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TaGgKecY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TaGgKecY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751476631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uSVhAhp3u+4Vki++ndCuhcazjBcgv0QCkXAVnaJGZSE=;
	b=TaGgKecYdKEWY1wh1rVd7pyy5qqmDxbMgTIiC8S6lUnr4uHfw206SGLiNmmHa4D9Hp6uBM
	75cFD3RHY2CqSwQdeYCWP+KvZeLSBVah5ZYddtsag1mfO03PMnabNKuAnGq/+EPMzqoCdm
	nVd0oczjfxaQbgoYKFQW5mY/PZ+sU7A=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-yQv7eeK3OviDSq6rNujJtw-1; Wed, 02 Jul 2025 13:17:10 -0400
X-MC-Unique: yQv7eeK3OviDSq6rNujJtw-1
X-Mimecast-MFC-AGG-ID: yQv7eeK3OviDSq6rNujJtw_1751476629
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb5f70b93bso108961636d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476629; x=1752081429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSVhAhp3u+4Vki++ndCuhcazjBcgv0QCkXAVnaJGZSE=;
        b=NwtQJIRvRSt1hZMTKMIpb5Dg/ovvf0RdBQTP5KTDvp0iW9X7mMMQYJIPBUUYnUyn0v
         /p2ZDgZdELE+P4KNzurgPRPTVqRI+0la5gZvdDZnkZ5NQE5zI1gfFepB14rqoW423Wta
         /m8/4O2VVP3yaOjLvVdak7GeNU2G7LYg6eLw6MFTlbTG6DjgKrRYx6964PQ47MXDeYzr
         DJGJ6PZfLSAXnaKAnJ75Yeweay5S62N6MKQOVOynKm4nhOf6FbyMqVSzxSxdAKcBhv/G
         LlIoQ1wRg6KFdXdbwVs1DtaWMIC9NIKmGBWdV9088BW37m+5eoGkNMfIBlAXkif9UUHC
         5hlg==
X-Forwarded-Encrypted: i=1; AJvYcCVVFd0/zT10/vz8wOzHaqykh3an+V5oSht2VkoE1J2IejtdXPGtNQT5M7bam5wipLIMMDkYmZJWJeufAt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRywKYaTU6V9UWOPZoxKqbh4SaxHpv+yTaUGbFpty6PVAI2I4
	pxJvq3gjcgu/Jf74Ur/o89yaxo8dGaj//qupSQ9+JKvEcfE8HWn3YkrBDfNhv2KFeE4vS6/A9AK
	rLgjdTMdOzoMPCcMn8qxhuMvnERe/m2m3Y07Kkd2k7IGCV/cwy3EP5fD4HPJXefuqU5dYX49xYd
	coTeHYDf7bpFuSZ6ZitF5XzbBgvX3inkxLzx2czVw5IlBWMuJe5fg=
X-Gm-Gg: ASbGncvp7PtFsvierBZ/fVpBRRXYd+lQ0Iuzp2LR5BKdsRcHCTdwA9diU8Hohz9sNNt
	ZCKomqNe/Hg/KoTo4je70QsOn4RwVn6TAPoC4KnIj8W9NEv6e7wHq7JdzOkW1UsYHdWv+wsdA16
	Oe3wfK4ynabV1o7JojwiduTJ9Uj/1DQ6JIxuKg
X-Received: by 2002:ac8:7d96:0:b0:4a6:f57a:8638 with SMTP id d75a77b69052e-4a9768dc721mr57335401cf.8.1751476628463;
        Wed, 02 Jul 2025 10:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH+AMMUZAOj3amORO0aMK2ZKDlnKZVlNL2/+b8mjx3ZE1SdBxsYFHrVdt2f+olz5WlbX5VzbgDdY4zneq2vX8=
X-Received: by 2002:ac8:7d96:0:b0:4a6:f57a:8638 with SMTP id
 d75a77b69052e-4a9768dc721mr57334931cf.8.1751476627866; Wed, 02 Jul 2025
 10:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620085618.4489-1-gpaoloni@redhat.com> <20250701195939.3e297e20@gandalf.local.home>
 <CA+wEVJY2a_ERXemup7EefPPXHOv8DAfyauuP6Mn5vHYFkbbBcQ@mail.gmail.com>
 <20250702104058.3cf9c1a3@batman.local.home> <20250702111908.03759998@batman.local.home>
In-Reply-To: <20250702111908.03759998@batman.local.home>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Wed, 2 Jul 2025 19:16:56 +0200
X-Gm-Features: Ac12FXyKKNK9BPwRvvev7YbFqGUxTWxSMPjBN1AyhtJxcK_x9QUHZqnrchkLMoM
Message-ID: <CA+wEVJaH8NcwUoobn7UMFBJzyT-4xyqD34bntmWCukKLAPbG6w@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND] tracing: add kernel documentation for
 trace_array_set_clr_event, trace_set_clr_event and supporting functions
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:19=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Wed, 2 Jul 2025 10:40:58 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
> > Now technically, the SOFT_MODE bit should only be set iff the ref count
> > is greater than zero. But it's easier to test a flag than to always
> > test a ref count.
>
> So the reason for why we have both a SOFT_MODE flag and a ref count is
> because the original code expected only one user of the SOFT_MODE case.
> But in 2013, Masami found that if two users used soft mode the
> accounting broke and added a ref count. This does make the SOFT_MODE
> flag redundant.
>
> I just tried to remove it and I think it can work. Instead of using a
> SOFT_MODE flag in the file flags field, simply using the ref counter is
> just as fine.
>
> Also note, I'm not sure there's any reason the ref counter is an atomic
> value. All updates to it are done under the event_mutex lock. But that
> can be another clean up.

I also cannot see a reason for an atomic counter. Please let me know
if you want me to add this cleanup patch as part of next patchset
revision (if so the doc patch will change accordingly).

Many Thanks
Gab

>
> -- Steve
>
> diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
> index fa9cf4292dff..04307a19cde3 100644
> --- a/include/linux/trace_events.h
> +++ b/include/linux/trace_events.h
> @@ -480,7 +480,6 @@ enum {
>         EVENT_FILE_FL_RECORDED_TGID_BIT,
>         EVENT_FILE_FL_FILTERED_BIT,
>         EVENT_FILE_FL_NO_SET_FILTER_BIT,
> -       EVENT_FILE_FL_SOFT_MODE_BIT,
>         EVENT_FILE_FL_SOFT_DISABLED_BIT,
>         EVENT_FILE_FL_TRIGGER_MODE_BIT,
>         EVENT_FILE_FL_TRIGGER_COND_BIT,
> @@ -618,7 +617,6 @@ extern int __kprobe_event_add_fields(struct dynevent_=
cmd *cmd, ...);
>   *  RECORDED_TGID - The tgids should be recorded at sched_switch
>   *  FILTERED     - The event has a filter attached
>   *  NO_SET_FILTER - Set when filter has error and is to be ignored
> - *  SOFT_MODE     - The event is enabled/disabled by SOFT_DISABLED
>   *  SOFT_DISABLED - When set, do not trace the event (even though its
>   *                   tracepoint may be enabled)
>   *  TRIGGER_MODE  - When set, invoke the triggers associated with the ev=
ent
> @@ -633,7 +631,6 @@ enum {
>         EVENT_FILE_FL_RECORDED_TGID     =3D (1 << EVENT_FILE_FL_RECORDED_=
TGID_BIT),
>         EVENT_FILE_FL_FILTERED          =3D (1 << EVENT_FILE_FL_FILTERED_=
BIT),
>         EVENT_FILE_FL_NO_SET_FILTER     =3D (1 << EVENT_FILE_FL_NO_SET_FI=
LTER_BIT),
> -       EVENT_FILE_FL_SOFT_MODE         =3D (1 << EVENT_FILE_FL_SOFT_MODE=
_BIT),
>         EVENT_FILE_FL_SOFT_DISABLED     =3D (1 << EVENT_FILE_FL_SOFT_DISA=
BLED_BIT),
>         EVENT_FILE_FL_TRIGGER_MODE      =3D (1 << EVENT_FILE_FL_TRIGGER_M=
ODE_BIT),
>         EVENT_FILE_FL_TRIGGER_COND      =3D (1 << EVENT_FILE_FL_TRIGGER_C=
OND_BIT),
> diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
> index 120531268abf..0980f4def360 100644
> --- a/kernel/trace/trace_events.c
> +++ b/kernel/trace/trace_events.c
> @@ -768,6 +768,7 @@ static int __ftrace_event_enable_disable(struct trace=
_event_file *file,
>  {
>         struct trace_event_call *call =3D file->event_call;
>         struct trace_array *tr =3D file->tr;
> +       bool soft_mode =3D atomic_read(&file->sm_ref) !=3D 0;
>         int ret =3D 0;
>         int disable;
>
> @@ -782,7 +783,7 @@ static int __ftrace_event_enable_disable(struct trace=
_event_file *file,
>                  * is set we do not want the event to be enabled before w=
e
>                  * clear the bit.
>                  *
> -                * When soft_disable is not set but the SOFT_MODE flag is=
,
> +                * When soft_disable is not set but the soft_mode is,
>                  * we do nothing. Do not disable the tracepoint, otherwis=
e
>                  * "soft enable"s (clearing the SOFT_DISABLED bit) wont w=
ork.
>                  */
> @@ -790,11 +791,11 @@ static int __ftrace_event_enable_disable(struct tra=
ce_event_file *file,
>                         if (atomic_dec_return(&file->sm_ref) > 0)
>                                 break;
>                         disable =3D file->flags & EVENT_FILE_FL_SOFT_DISA=
BLED;
> -                       clear_bit(EVENT_FILE_FL_SOFT_MODE_BIT, &file->fla=
gs);
> +                       soft_mode =3D false;
>                         /* Disable use of trace_buffered_event */
>                         trace_buffered_event_disable();
>                 } else
> -                       disable =3D !(file->flags & EVENT_FILE_FL_SOFT_MO=
DE);
> +                       disable =3D !soft_mode;
>
>                 if (disable && (file->flags & EVENT_FILE_FL_ENABLED)) {
>                         clear_bit(EVENT_FILE_FL_ENABLED_BIT, &file->flags=
);
> @@ -812,8 +813,8 @@ static int __ftrace_event_enable_disable(struct trace=
_event_file *file,
>
>                         WARN_ON_ONCE(ret);
>                 }
> -               /* If in SOFT_MODE, just set the SOFT_DISABLE_BIT, else c=
lear it */
> -               if (file->flags & EVENT_FILE_FL_SOFT_MODE)
> +               /* If in soft mode, just set the SOFT_DISABLE_BIT, else c=
lear it */
> +               if (soft_mode)
>                         set_bit(EVENT_FILE_FL_SOFT_DISABLED_BIT, &file->f=
lags);
>                 else
>                         clear_bit(EVENT_FILE_FL_SOFT_DISABLED_BIT, &file-=
>flags);
> @@ -823,7 +824,7 @@ static int __ftrace_event_enable_disable(struct trace=
_event_file *file,
>                  * When soft_disable is set and enable is set, we want to
>                  * register the tracepoint for the event, but leave the e=
vent
>                  * as is. That means, if the event was already enabled, w=
e do
> -                * nothing (but set SOFT_MODE). If the event is disabled,=
 we
> +                * nothing (but set soft_mode). If the event is disabled,=
 we
>                  * set SOFT_DISABLED before enabling the event tracepoint=
, so
>                  * it still seems to be disabled.
>                  */
> @@ -832,7 +833,7 @@ static int __ftrace_event_enable_disable(struct trace=
_event_file *file,
>                 else {
>                         if (atomic_inc_return(&file->sm_ref) > 1)
>                                 break;
> -                       set_bit(EVENT_FILE_FL_SOFT_MODE_BIT, &file->flags=
);
> +                       soft_mode =3D true;
>                         /* Enable use of trace_buffered_event */
>                         trace_buffered_event_enable();
>                 }
> @@ -840,7 +841,7 @@ static int __ftrace_event_enable_disable(struct trace=
_event_file *file,
>                 if (!(file->flags & EVENT_FILE_FL_ENABLED)) {
>                         bool cmd =3D false, tgid =3D false;
>
> -                       /* Keep the event disabled, when going to SOFT_MO=
DE. */
> +                       /* Keep the event disabled, when going to soft mo=
de. */
>                         if (soft_disable)
>                                 set_bit(EVENT_FILE_FL_SOFT_DISABLED_BIT, =
&file->flags);
>
> @@ -1792,8 +1793,7 @@ event_enable_read(struct file *filp, char __user *u=
buf, size_t cnt,
>             !(flags & EVENT_FILE_FL_SOFT_DISABLED))
>                 strcpy(buf, "1");
>
> -       if (flags & EVENT_FILE_FL_SOFT_DISABLED ||
> -           flags & EVENT_FILE_FL_SOFT_MODE)
> +       if (atomic_read(&file->sm_ref) !=3D 0)
>                 strcat(buf, "*");
>
>         strcat(buf, "\n");
> @@ -3584,7 +3584,7 @@ static int probe_remove_event_call(struct trace_eve=
nt_call *call)
>                         continue;
>                 /*
>                  * We can't rely on ftrace_event_enable_disable(enable =
=3D> 0)
> -                * we are going to do, EVENT_FILE_FL_SOFT_MODE can suppre=
ss
> +                * we are going to do, soft mode can suppress
>                  * TRACE_REG_UNREGISTER.
>                  */
>                 if (file->flags & EVENT_FILE_FL_ENABLED)
> @@ -3997,7 +3997,7 @@ static int free_probe_data(void *data)
>
>         edata->ref--;
>         if (!edata->ref) {
> -               /* Remove the SOFT_MODE flag */
> +               /* Remove soft mode */
>                 __ftrace_event_enable_disable(edata->file, 0, 1);
>                 trace_event_put_ref(edata->file->event_call);
>                 kfree(edata);
>

