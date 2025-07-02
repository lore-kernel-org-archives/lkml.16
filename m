Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151F2E7BB9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472751; cv=none; b=l8EeE940ZnFa3vbbMVpDPwmFY+W5ITVCv2QlnE9NynZGybPmXCxSA9PPcYOaNinkM1cR5FiTUvwDvLLeNLbqdSzC0dtoMCx9mbwWpLl89gSlg05rqQP7/TgaZrbuMGlGhrxHjsnt+72rbJ9qHh+2zot9+AH+dJw5kKiVeVYxIlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472751; c=relaxed/simple;
	bh=m0eEcaCjmUCFL4JFaEiBzPDfdxn8QHFuAUdYAEKfPb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFsG1+i+lXPf7DkClFr0q9Ovm1SElLH0LSg+Ra1f6UFYBkx+oZoEYQeAi29vP5F7h359A5owk2F+bJhbflis6GM4ViB/c8tJc3HpZ7FVSy0IDk9Yz/zlXuvo1XhluGBTF+3dWMW+HMVwPZe25RAhZkg/Dh5xQ/8NRnFdskBxujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AhmPsFF0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AhmPsFF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751472747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUYWoR42G+SMmKsDPy2iaqrLNIu9+Nuw9et8Q6pFC+U=;
	b=AhmPsFF0jJaTLpxtqgtIrrVshXTBb4VmIn1sTBoyhPpACk5wunDHHs8Bx5zoa4qoQr2cAB
	p368JwuDW5HdKroiScwSmBI5zjqj74Qz5LQaqQfursg7os46ZZ1nTI0/Kkj7GAaP6OiT+I
	pjbl8UI2hIJlGK8pRsK+DdSeppRsJY0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-n80TOq8dNAKf1alAYALrnQ-1; Wed, 02 Jul 2025 12:12:23 -0400
X-MC-Unique: n80TOq8dNAKf1alAYALrnQ-1
X-Mimecast-MFC-AGG-ID: n80TOq8dNAKf1alAYALrnQ_1751472743
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a985909a64so2646761cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751472743; x=1752077543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUYWoR42G+SMmKsDPy2iaqrLNIu9+Nuw9et8Q6pFC+U=;
        b=e7Qn6wmnZUlcrG6wlpGAKFeaHARXqY3OreZ1I446ogayFX7dxJCjhxAuVeA/y43rfl
         t8gm8ZQgVc+sJpjUoLPVySwzn+7gLcyOiAojuExsUdQ4C/jGlNzVFhlFGS8/dBEwj5J2
         GpyCRjrR006RlfWqRkN8MMtZwv7rSoddvdl+5Q0cElKkR4/hbLQxbEonEFVqpWMqIv1r
         Py2u1wDzjBiYEj+CU1sgODG5DGAVvhYAsY3Hs4gvLcB5dQGxu71EGII3Me28GFIUoGsA
         M+eUDKuqagd4q7uMkuco9kYi4/cj/XRwgEzHNeyGs6Mxdxohuu5+xw52v/eNV7Ea89vM
         ykqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFiV+Fq16rCELuj8WAAzSVH7ez8umTEqMGKELf1yDpXE0X+0e5q5xN2QQvH2MrYb1v1xP9Qdid4WSbu34=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvYCcpiGgs2xMZwFz11smxkeysyfd6Bp8CLizBmddWxo5PN4Nh
	vKs2W6yIt78TU0DfbG3Ps1ihH/pfZ1opUPNhMIvls1VLrYJm7UQm0bJQVYzufnIslY1DGwbaiDg
	fxW5b8WWx/T9lSF/HqCUTa6HjN4aozneRVywTzLDg/U+XScQYulhUah6MCCkikqgjL/ujmurQp7
	h23v7oPpS+NOa7Vc+n4ItV7iDgdfIqmcfcrXTijZRI
X-Gm-Gg: ASbGncvo6+1wZ2jxsSX5hcIDo0J0xHM9cog26laTusEqVXHrrGjgf3chl149ce+Wuta
	0ILUH0Mzwou7zg4fCzsvIIWMJUhXR58N9Qaaf1n77HReQfXbkgljFC18o8cAtNH8w+SGa7VlDqU
	cHGY2x6JB7+kVweSGZs9+lAWJpDBKKWNvzJ6SM
X-Received: by 2002:ac8:5a8e:0:b0:4a8:eba:afa with SMTP id d75a77b69052e-4a976a3727cmr65408561cf.52.1751472742505;
        Wed, 02 Jul 2025 09:12:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLnGgcGhxBcVfguvFJiZmlK/0RzO2gvvQsRBX2MAmcT2pXIrn00MLL/gJHBtybAndawS8Bg8/32exWz0tC//w=
X-Received: by 2002:ac8:5a8e:0:b0:4a8:eba:afa with SMTP id d75a77b69052e-4a976a3727cmr65407891cf.52.1751472742090;
 Wed, 02 Jul 2025 09:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612104349.5047-1-gpaoloni@redhat.com> <20250612104349.5047-3-gpaoloni@redhat.com>
 <20250701181119.7b0bc5d6@batman.local.home> <CA+wEVJarZben=F3Dw0A8_tvAAR7-qb4PrjCj0AGFoq=DH1RJwg@mail.gmail.com>
 <20250702111245.1fa23138@batman.local.home>
In-Reply-To: <20250702111245.1fa23138@batman.local.home>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Wed, 2 Jul 2025 18:12:11 +0200
X-Gm-Features: Ac12FXwM4LZQpznS--1r7Sy5LekmCvpoP3iwhSrFZmt-bmCIWn0LWN2GieA0ff4
Message-ID: <CA+wEVJbjhLmA4ZR5w7s6QDCfjET=Pf2J9PsFhC2wdO1nQ5YY+A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] tracing: add testable specifications for event_enable_write/read
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	acarmina@redhat.com, chuck.wolber@boeing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:12=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Wed, 2 Jul 2025 16:59:29 +0200
> Gabriele Paoloni <gpaoloni@redhat.com> wrote:
>
> > Mmm got it. What about
> >
> > * Function's expectations:
> > * - This function shall lock the global event_mutex before performing a=
ny
> > *   operation on the target event file and unlock it after all operatio=
ns on
> > *   the target event file have completed;
>
> Since 99% of the time that a lock is taken in a function it is
> released, I think that should be the default assumption here, and only
> when a lock is taken and not release, that should be explicitly called
> out.
>
> And also we should remove "This function" we know that these
> requirements are for this function.
>
>   - The global event_mutex shall be taken before performing any
>     operation on the target event.
>
> Should be good enough.
>
> If the lock can be released and taken again, that too should be
> explicit in the requirements otherwise it is assumed it is taken once
> and not released until the operation is completed.



>
> > *
> > * - This function shall format the string copied to userspace according=
 to
> > *   the status flags retrieved from the target event file:
> > *    - The first character shall be set to "1" if the enabled flag is
> > set AND the
> > *      soft_disabled flag is not set, else it shall be set to "0";
> > *    - The second character is optional and shall be set to "*" if eith=
er the
> > *      soft_disabled flag or the soft_mode flag is set;
> > *   - The string shall be terminated by a newline ("\n") and any remain=
ing
> > *      character shall be set to "0";
>
>  - The string copied to user space shall be formatted according to the
>    status flags from the target event file:
>
>    - If the enable flag is set AND the soft_disable flag is not set then
>      the first character shall be set to "1" ELSE it shall be set to "0"
>
>    - If either the soft_disable fag or the soft_mode flag is set then the
>      second character shall be set to "*" ELSE it is skipped.
>
> I think the above is easier to read and is a bit more consolidated.
> Stating the status then the effect is also easier to read.

I will add all your suggestions in v4.
Many thanks for your review!
Gab

>
> -- Steve
>
>
> > *
> > * - This function shall invoke simple_read_from_buffer() to perform the=
 copy
> > *   of the kernel space string to ubuf.
> >
> > (pls note that the check on cnt has been removed in v3 that is out alre=
ady)
>

