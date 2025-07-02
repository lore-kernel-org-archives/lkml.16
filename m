Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4782D0C83
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468385; cv=none; b=FNfCelgymttdRTN8C5F/GtezpySiBcOXxzZcfu0UBsJIOC+7nct9c8EA9uoCMdh/w0bsIV7odAefU3K1WBa3q9a2xz+evhYGNWRc+s5ilE4ohHi4mVAPhmaL7vZYbh2HuVadlDoB57puEC1BXXev6ESzOW3k90GgGqjy2rsNiVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468385; c=relaxed/simple;
	bh=MOf9trQewdjP9QfMxCyQxGBJEk5G1TY2psuXiXdC7T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPhxrzOEGEU0z/nDQC1Pq6jdout4vORSwnGDgBLa2lR4hI3UtwUwhId61QKt5wre3rNt36kWbn8vNL7wZB5sR7prvBe5wTmIejfi9NZyS07RysX97TiBRzyANWJPI8CrE/TKZdtVN3H7gEMSUihhoiZ22ubfoVAxehTKHNTvhnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OeCspEXl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OeCspEXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751468382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5wmUNCEXGfxpkIjajzYmk6EkSKovbjZO5NJ8vG4giDo=;
	b=OeCspEXluY1+zJDDWmCiIaaoXFqnM8ODUR1p8Jne+kp0PTQw+ebJrVs6vXOF76KCPoWpyY
	qD+0CNdIWDu9JxlbNc4XLcuCPC8753WFqjfByIW71U4mBxXmhfmkngECbMr9Q04yA6t5rK
	lbhEiZ2ZxoBw3rQnJh5wFwzG1cRdn18=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615--Itd4LGVMbK4yaDl1xNx2g-1; Wed, 02 Jul 2025 10:59:41 -0400
X-MC-Unique: -Itd4LGVMbK4yaDl1xNx2g-1
X-Mimecast-MFC-AGG-ID: -Itd4LGVMbK4yaDl1xNx2g_1751468381
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a762876813so115354891cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468381; x=1752073181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wmUNCEXGfxpkIjajzYmk6EkSKovbjZO5NJ8vG4giDo=;
        b=SylFPYOd57gJgy2TGg1NpkDcwVOL6rSKTNE+uokjPTO0gedFYbdE6rw81onOiNYQe/
         LGtVHbaB6HaT3T8pYxeIkuyCxLDhw+053tz2VTePhyNNobcseGsCupavvX70I66Hjauy
         QBLkf8M7ELDQOu66ixtHMOX42e2H/iE6STaaAWusce279LKA2iJaYoM1Go+2yOxztQAF
         /Q4HwsWd4GEuHbsABA8SeipCbn/lw8ejXinFGNMi9MutmhkyTWCoziHSWprSj0NI263E
         AGuxyXrL4e6zaYz8dm8g4Rb1tI8a4d2gaWru5ZjaKMYDcZY2SxptIE9KFbbEwXXLGJpI
         D1aw==
X-Forwarded-Encrypted: i=1; AJvYcCXZj54Z58MkxnC/pwWAeRhrihRkW79TIOT7jj1qpnWwQZ3zA41SdE4HvcrJOtTRNNPvlJlw4fsOOZnALhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpXw2nEsr0gf+/6kxyoVFC6pOrFfjNsFqOq/JLOCKYTPIw6uxH
	L8PiPmpdQjr1XTPF/Fo7Wa0colqGPSUQ+Kt8dpW4EsEzA55RDOfeR9AhyHQcuaVnmReG3YSueFJ
	Nkj7ysWLg8mUpRds7Pg32BO0i0sDzH0lUeC0VYZIwaia4weObZnice+lMQ9jbc4KF7mHidZoOpM
	UsChD4iFMlx8GFIQkuevt3FR1Oj7WOQ4TNqM7SoNEo
X-Gm-Gg: ASbGncvCVXswJm1LelI+h9Kkv1BWVI6/3v62wVLpIXKo++UpATreg9tODbaEbciOcSN
	dw0WXbTLy2Ge44yteXuHD1bHsaYlCKULTvGllsT+PHOjH1jfkFFxs/SHOgr3uLj5Y/BTeawU/S4
	+XuSywSh/vx94JjOOFuXwc1HszCDuWuh9Lk5Et
X-Received: by 2002:ac8:59c3:0:b0:4a7:9d00:770 with SMTP id d75a77b69052e-4a97695c4ccmr59023101cf.18.1751468380790;
        Wed, 02 Jul 2025 07:59:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaNepOgpyCeBhihJKbBjhYJfTKbzKignekI+Aoo8Q5tFXFCyz52XXraXwenwRW0BoW0Ph2rhWB/eSU22HbCzI=
X-Received: by 2002:ac8:59c3:0:b0:4a7:9d00:770 with SMTP id
 d75a77b69052e-4a97695c4ccmr59022491cf.18.1751468380212; Wed, 02 Jul 2025
 07:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612104349.5047-1-gpaoloni@redhat.com> <20250612104349.5047-3-gpaoloni@redhat.com>
 <20250701181119.7b0bc5d6@batman.local.home>
In-Reply-To: <20250701181119.7b0bc5d6@batman.local.home>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Wed, 2 Jul 2025 16:59:29 +0200
X-Gm-Features: Ac12FXxtKwj8zXgnkqrF16vYUbKFGK3Hp-aUHpbvEVWbN2O1dqS4y6-MCyKKAKM
Message-ID: <CA+wEVJarZben=F3Dw0A8_tvAAR7-qb4PrjCj0AGFoq=DH1RJwg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] tracing: add testable specifications for event_enable_write/read
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	acarmina@redhat.com, chuck.wolber@boeing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 12:11=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Thu, 12 Jun 2025 12:43:49 +0200
> Gabriele Paoloni <gpaoloni@redhat.com> wrote:
>
> > This patch implements the documentation of event_enable_write and
> > event_enable_read in the form of testable function's expectations.
> >
> > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > ---
> >  kernel/trace/trace_events.c | 72 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >
> > diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
> > index 5e84ef01d0c8..eb3c5e6e557d 100644
> > --- a/kernel/trace/trace_events.c
> > +++ b/kernel/trace/trace_events.c
> > @@ -1771,6 +1771,46 @@ static void p_stop(struct seq_file *m, void *p)
> >       mutex_unlock(&event_mutex);
> >  }
> >
> > +/**
> > + * event_enable_read - read from a trace event file to retrieve its st=
atus.
> > + * @filp: file pointer associated with the target trace event;
> > + * @ubuf: user space buffer where the event status is copied to;
> > + * @cnt: number of bytes to be copied to the user space buffer;
>
> Why is the above ending with semicolons?

Sorry it should be a full stop, I'll fix it in v4.

>
> > + * @ppos: the current position in the buffer.
> > + *
> > + * This is a way for user space executables to retrieve the status of =
a
> > + * specific event
> > + *
> > + * Function's expectations:
> > + * - This function shall lock the global event_mutex before performing=
 any
> > + *   operation on the target event file and unlock it after all operat=
ions on
> > + *   the target event file have completed;
> > + * - This function shall retrieve the status flags from the file assoc=
iated
> > + *   with the target event;
> > + * - This function shall format the string to report the event status =
to user
> > + *   space:
> > + *   - The first character of the string to be copied to user space sh=
all be
> > + *     set to "1" if the enabled flag is set AND the soft_disabled fla=
g is not
> > + *     set, else it shall be set to "0";
> > + *   - The second character of the string to be copied to user space s=
hall be
> > + *     set to "*" if either the soft_disabled flag or the soft_mode fl=
ag is
> > + *     set, else it shall be set to "\n";
> > + *   - The third character of the string to be copied to user space sh=
all b
> > + *     set to "\n" if either the soft_disabled flag or the soft_mode f=
lag is
> > + *     set, else it shall be set to "0";
> > + *   - Any other character in the string to be copied to user space sh=
all be
> > + *     set to "0";
>
> The above could use some new lines. Like between each bullet. My
> eyesight isn't as good anymore and I find reading gobs of text more
> difficult. Newlines give my eyes a break.
>
> I know this is being written so that a tool could parse it, but also
> needs to be parsed by aging developers. ;-)

Agreed, I'll fix it in v4.

>
> > + * - This function shall check if the requested cnt bytes are equal or=
 greater
> > + *   than the length of the string to be copied to user space (else a
> > + *   corrupted event status could be reported);
> > + * - This function shall invoke simple_read_from_buffer() to perform t=
he copy
> > + *   of the kernel space string to ubuf.
>
> Hmm, and it is also verbose. This is a relatively simple function, and
> it caused quite a bit of requirements. I wonder if it could be
> shortened a bit. Otherwise more complex and larger functions are going
> to be overwhelming and likely not acceptable. And those are the
> functions that I think this will benefit the most!

Mmm got it. What about

* Function's expectations:
* - This function shall lock the global event_mutex before performing any
*   operation on the target event file and unlock it after all operations o=
n
*   the target event file have completed;
*
* - This function shall format the string copied to userspace according to
*   the status flags retrieved from the target event file:
*    - The first character shall be set to "1" if the enabled flag is
set AND the
*      soft_disabled flag is not set, else it shall be set to "0";
*    - The second character is optional and shall be set to "*" if either t=
he
*      soft_disabled flag or the soft_mode flag is set;
*   - The string shall be terminated by a newline ("\n") and any remaining
*      character shall be set to "0";
*
* - This function shall invoke simple_read_from_buffer() to perform the cop=
y
*   of the kernel space string to ubuf.

(pls note that the check on cnt has been removed in v3 that is out already)

>
> > + *
> > + * Returns the number of copied bytes on success, -ENODEV if the event=
 file
> > + * cannot be retrieved from the input filp, -EINVAL if cnt is less tha=
n the
> > + * length of the string to be copied to ubuf, any error returned by
> > + * simple_read_from_buffer
>
> Returns should be formatted better where each return value is on a
> separate line.

Understood, I'll fix this in v4

Many Thanks!
Gab


>
> -- Steve
>
> > + */
> >  static ssize_t
> >  event_enable_read(struct file *filp, char __user *ubuf, size_t cnt,
> >                 loff_t *ppos)
> > @@ -1808,6 +1848,38 @@ event_enable_read(struct file *filp, char __user=
 *ubuf, size_t cnt,
> >       return simple_read_from_buffer(ubuf, cnt, ppos, buf, strlen(buf))=
;
> >  }
> >
> > +/**
> > + * event_enable_write - write to a trace event file to enable/disable =
it.
> > + * @filp: file pointer associated with the target trace event;
> > + * @ubuf: user space buffer where the enable/disable value is copied f=
rom;
> > + * @cnt: number of bytes to be copied from the user space buffer;
> > + * @ppos: the current position in the buffer.
> > + *
> > + * This is a way for user space executables to enable or disable event
> > + * recording.
> > + *
> > + * Function's expectations:
> > + * - This function shall copy cnt bytes from the input ubuf buffer to =
a kernel
> > + *   space buffer (or the whole input ubuf if cnt is larger than ubuf =
size)
> > + *   and shall convert the string within the kernel space buffer into =
a decimal
> > + *   base format number;
> > + * - This function shall lock the global event_mutex before performing=
 any
> > + *   operation on the target event file and unlock it after all operat=
ions on
> > + *   the target event file have completed;
> > + * - This function shall check the size of the per-cpu ring-buffers us=
ed for
> > + *   the event trace data and, if smaller than TRACE_BUF_SIZE_DEFAULT,=
 expand
> > + *   them to TRACE_BUF_SIZE_DEFAULT bytes (sizes larger than
> > + *   TRACE_BUF_SIZE_DEFAULT are not allowed);
> > + * - This function shall invoke ftrace_event_enable_disable to enable =
or
> > + *   disable the target trace event according to the value read from u=
ser space
> > + *   (0 - disable, 1 - enable);
> > + *
> > + * Returns 0 on success, any error returned by kstrtoul_from_user, -EN=
ODEV if
> > + * the event file cannot be retrieved from the input filp, any error r=
eturned by
> > + * tracing_update_buffers, any error returned by ftrace_event_enable_d=
isable,
> > + * -EINVAL if the value copied from the user space ubuf is different f=
rom 0 or
> > + *  1.
> > + */
> >  static ssize_t
> >  event_enable_write(struct file *filp, const char __user *ubuf, size_t =
cnt,
> >                  loff_t *ppos)
>

