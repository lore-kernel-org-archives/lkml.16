Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD47328AAEA
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293434; cv=none; b=YDcuWg3J4ul2i6qqO8Cbq9cwGu78c2JO3/rbKjR5v8exNtzVgTeEV2BF1zOhp1IFDOcDtXMSGqRMtT9sC8jxV3ATprFb7FDw8ZqvDBizG4SRSV/j0di2twF94sRGnCGUgJVx7kSniJ/Xm1HSQuQgjHn9uk5/SbiOexGRGOm9xes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293434; c=relaxed/simple;
	bh=EVdGHxFj7R2lvNR2PW9IbUqmGDuMs576qFxuJLd2zj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=atbEkSmo7H/GVieNoAnI7M+kb6jeVN85AnefA50H2QN+CYgy7F/BhPrCBPm4q9kipwNGwdodq+w7At5TUjTP8/fMGz83j8enqaLg10ORb27BkV7dHbrhi5HJPggT8yLmdZREvtl3Uil0RcNpFLl9cIt9r3c59vMBux9xITaLbE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bnp6x4gT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bnp6x4gT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751293431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xdovFaBBmd/2kkwjuLB1TgmyFJy3oMjvZokOLh7RDBw=;
	b=Bnp6x4gTK2O9ur6JVEn3sbgIInvHY0dZGA+49yEPYIUABqoRrqIh7Vp7oQH0JJxm56cytS
	PAkpYtjpcNJzojI23SrgjsdSkud72cukut6J+i5+EjAdxDF3nTkR4Xq2yovrKhIXYisDHn
	AzCZTC9hTdCOPJSNrcOoAxKetZEco0s=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-K0mzXjp8M6-m6paBAnboVg-1; Mon, 30 Jun 2025 10:23:50 -0400
X-MC-Unique: K0mzXjp8M6-m6paBAnboVg-1
X-Mimecast-MFC-AGG-ID: K0mzXjp8M6-m6paBAnboVg_1751293430
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a589edc51aso67186121cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293430; x=1751898230;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdovFaBBmd/2kkwjuLB1TgmyFJy3oMjvZokOLh7RDBw=;
        b=AKHekYsp1CjPksU2j+CmI/TWX7+Dh7wjuxQUesNvQw2q/H+f59ruFWbtx+j7HXFrPJ
         W6LY9Fwa0eoIE45oxMvqpeFP11qFBkcJp9dwnrBmRQX2iqiLAizQq4oqVCG4yUtnspC/
         9SSjbY8y2sHEEpFjxOEEKEwtRaoZcec/u6QjniXRkd/E4E7BAE4GOnZR9uiw4eGGd4jh
         DYA5XgenmUzG6PNb8lg1U0cL26wHFMha73Tf35yrdA9YZinRqIWIu9538UPNoOLVdEv4
         bhk7X1mtIEYAJUh3sMOwSNvt6xA/V4tPb+D8P6xkMJOG4tIMZM97Gva8wYzn13Z9kS/9
         ZXMw==
X-Forwarded-Encrypted: i=1; AJvYcCXZhtuucyXZLjDMN5vcZkOpOSLV/r71GWEBAYJwujjmmh795BHTL41iglEZ+GY4Bbovqpqc7MQaR5x4AY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Z47AeTsElUd+3Z5jC5yBub0RAKgq1fVbtFnLgMOfF/XyYS2K
	UKNSivt5igUlOdUqWqMYY5anrDIVqiJ3ji7ro6S9jjfpjoj2X864PiWQyxIK224FXI5iRajKpa/
	OZAxKBHB4C08Wn81opYiL3i5FheLZ5k9shbGwuN/ntRzrwtNmBtuYZd73zn7Ze142aAHOhd9xkc
	wpI8paIZFMVnQlCKsokJ3W5CtJfQL4tWHjCCTIOadi
X-Gm-Gg: ASbGncsl/PhIONR91jzzWo0Di1cth6GekkQq0c5wDB32unG8PgZpAA0NgdC4a05nbLX
	9FiMrmgp2hKrFylj07HoYo+h5Gfx56XzUSeq2qYrA6PiR17QFAnnuvhMrzC7agqNKCCGX8Gwm7N
	oyCLBrncwrLyh/cMXTtT2xtlNDc6xxy2c2Rg03
X-Received: by 2002:ac8:7e94:0:b0:4a6:f7ca:2fec with SMTP id d75a77b69052e-4a7fcad52cbmr174610211cf.24.1751293429489;
        Mon, 30 Jun 2025 07:23:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGBx6kvlsf0HAW+47EWCZROILjtBtY+tNf1X4LVnWQFfs1oE0j0fNksgekjuc/2wsgKmmJrPBGuAR6faiiyDM=
X-Received: by 2002:ac8:7e94:0:b0:4a6:f7ca:2fec with SMTP id
 d75a77b69052e-4a7fcad52cbmr174609791cf.24.1751293428982; Mon, 30 Jun 2025
 07:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630135519.11429-1-gpaoloni@redhat.com>
In-Reply-To: <20250630135519.11429-1-gpaoloni@redhat.com>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Mon, 30 Jun 2025 16:23:38 +0200
X-Gm-Features: Ac12FXzPIg1Ohi8SNWfszDeBlwJjq5syqSxuL4LIeLWvCE8I6LkXyKSmk9Imv1A
Message-ID: <CA+wEVJax6owyYJVfVn+=uoFXsy8qgc_sTHHwJBMU0fiAXDtUfA@mail.gmail.com>
Subject: Re: [RFC PATCH v2] tracing: add testable specifications for event_enable_write/read
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:55=E2=80=AFPM Gabriele Paoloni <gpaoloni@redhat.c=
om> wrote:
>
> This patch implements the documentation of event_enable_write and
> event_enable_read in the form of testable function's expectations.
>
> Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> ---
> Following the discussion in v1 (see [1]), v2 adds improvements with
> the "Context" specifications and the definition of the assumptions
> of use for the correct invocation of the documented functions.
>
> [1] https://lore.kernel.org/linux-trace-kernel/20250612104349.5047-1-gpao=
loni@redhat.com/
> ---
>  kernel/trace/trace_events.c | 81 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>
> diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
> index 120531268abf..57284f540566 100644
> --- a/kernel/trace/trace_events.c
> +++ b/kernel/trace/trace_events.c
> @@ -1771,6 +1771,52 @@ static void p_stop(struct seq_file *m, void *p)
>         mutex_unlock(&event_mutex);
>  }
>
> +/**
> + * event_enable_read - read from a trace event file to retrieve its stat=
us.
> + * @filp: file pointer associated with the target trace event;
> + * @ubuf: user space buffer where the event status is copied to;
> + * @cnt: number of bytes to be copied to the user space buffer;
> + * @ppos: the current position in the buffer.
> + *
> + * This is a way for user space executables to retrieve the status of a
> + * specific event
> + *
> + * Function's expectations:
> + * - This function shall lock the global event_mutex before performing a=
ny
> + *   operation on the target event file and unlock it after all operatio=
ns on
> + *   the target event file have completed;
> + * - This function shall retrieve the status flags from the file associa=
ted
> + *   with the target event;
> + * - This function shall format the string to report the event status to=
 user
> + *   space:
> + *   - The first character of the string to be copied to user space shal=
l be
> + *     set to "1" if the enabled flag is set AND the soft_disabled flag =
is not
> + *     set, else it shall be set to "0";
> + *   - The second character of the string to be copied to user space sha=
ll be
> + *     set to "*" if either the soft_disabled flag or the soft_mode flag=
 is
> + *     set, else it shall be set to "\n";
> + *   - The third character of the string to be copied to user space shal=
l b
> + *     set to "\n" if either the soft_disabled flag or the soft_mode fla=
g is
> + *     set, else it shall be set to "0";
> + *   - Any other character in the string to be copied to user space shal=
l be
> + *     set to "0";
> + * - This function shall invoke simple_read_from_buffer() to perform the=
 copy
> + *   of the kernel space string to ubuf.
> + *
> + * Assumptions of Use:
> + * - The caller shall  pass cnt equal or greater than the length of the =
string
> + *   to be copied to user space;
> + * - Any read operation on a file descriptor, unless it is the first ope=
ration
> + *   following a trace event file open, shall be preceded by an lseek
> + *   invocation to reposition the file offset to zero.
> + *
> + * Context: process context, locks and unlocks event_mutex.
> + *
> + * Return: the number of copied bytes on success, -ENODEV if the event f=
ile
> + * cannot be retrieved from the input filp, -EINVAL if cnt is less than =
the
> + * length of the string to be copied to ubuf, any error returned by
> + * simple_read_from_buffer

Please neglect this RFC since the above return value is not correct.
I have fixed the issue in v3.

Apologies for the noise
Gab

> + */
>  static ssize_t
>  event_enable_read(struct file *filp, char __user *ubuf, size_t cnt,
>                   loff_t *ppos)
> @@ -1801,6 +1847,41 @@ event_enable_read(struct file *filp, char __user *=
ubuf, size_t cnt,
>         return simple_read_from_buffer(ubuf, cnt, ppos, buf, strlen(buf))=
;
>  }
>
> +/**
> + * event_enable_write - write to a trace event file to enable/disable it=
.
> + * @filp: file pointer associated with the target trace event;
> + * @ubuf: user space buffer where the enable/disable value is copied fro=
m;
> + * @cnt: number of bytes to be copied from the user space buffer;
> + * @ppos: the current position in the buffer.
> + *
> + * This is a way for user space executables to enable or disable event
> + * recording.
> + *
> + * Function's expectations:
> + * - This function shall copy cnt bytes from the input ubuf buffer to a =
kernel
> + *   space buffer and shall convert the string within the kernel space b=
uffer
> + *   into a decimal base format number;
> + * - This function shall lock the global event_mutex before performing a=
ny
> + *   operation on the target event file and unlock it after all operatio=
ns on
> + *   the target event file have completed;
> + * - This function shall check the size of the per-cpu ring-buffers used=
 for
> + *   the event trace data and, if smaller than TRACE_BUF_SIZE_DEFAULT, e=
xpand
> + *   them to TRACE_BUF_SIZE_DEFAULT bytes (sizes larger than
> + *   TRACE_BUF_SIZE_DEFAULT are not allowed);
> + * - This function shall invoke ftrace_event_enable_disable to enable or
> + *   disable the target trace event according to the value read from use=
r space
> + *   (0 - disable, 1 - enable);
> + * - This function shall increase the file position pointed by ppos by t=
he
> + *   number of bytes speicified by cnt;
> + *
> + * Context: process context, locks and unlocks event_mutex.
> + *
> + * Return: the number of written bytes on success, any error returned by
> + * kstrtoul_from_user, -ENODEV if the event file cannot be retrieved fro=
m the
> + * input filp, any error returned by tracing_update_buffers, any error r=
eturned
> + * by ftrace_event_enable_disable, -EINVAL if the value copied from the =
user
> + * space ubuf is different from 0 or 1.
> + */
>  static ssize_t
>  event_enable_write(struct file *filp, const char __user *ubuf, size_t cn=
t,
>                    loff_t *ppos)
> --
> 2.48.1
>

