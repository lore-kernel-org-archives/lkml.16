Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D66625DB1E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413506; cv=none; b=BniEknOpDUOQAjbkwWDYnyiORcu2/4hqTMfElrSIkU725pu5HNf1+vb7SIkxINnELgBcKYHyjlPqcJlILZ2l2DND/5dcv9AnOTlQ64RkHbvBMGdQzMKDu3Pg20/Q6Z1+WkXcATiBhbcKrF6o2NstltCuastRDyrjQIJuTuZ6zNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413506; c=relaxed/simple;
	bh=CWiE6SLSgBjlC/lQpk4HBTQBMDzAlI73jTRAXnRRQGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzUFiaWqHx6UnXZ/Yq0Xb357fi2QOuMEvK1Q/63cvS4r9PGvfkEyZbGyjxv3elIwwTZUSdGRFWMQm0rw4XKiVWxqdBGq0J3MnR+ddlASfxOy3YGFu12SEwqGxJQ9LMup5hf2WGyHZNI23CuMMdOrZNVxc6eRQCNplk9/2IGRksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KZTkPVQj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KZTkPVQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750413503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xR2YuQkTRswgcsIqlnPnJ1fiPKsZBJpYcZ3pxguChdg=;
	b=KZTkPVQjgDCd5Fz+M5wRJXrOOiyqr00DvriL4Zh7OEV6mwyiaKW+MPTWNygFAqSVB2G04z
	e1JlVLqFIHe2ra05L0By3pYtB5rhFTdM7ZTCEK99N5op3iBbH78g5axNeZakf4RIqk0ghd
	yZTy+bfBINrXj/BKlPWgka2U5sinCDk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-8OPjQhLzPfqQ_laoSb7oVA-1; Fri, 20 Jun 2025 05:58:20 -0400
X-MC-Unique: 8OPjQhLzPfqQ_laoSb7oVA-1
X-Mimecast-MFC-AGG-ID: 8OPjQhLzPfqQ_laoSb7oVA_1750413500
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d64026baso10149895e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750413500; x=1751018300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xR2YuQkTRswgcsIqlnPnJ1fiPKsZBJpYcZ3pxguChdg=;
        b=o1Nd1sqRa0qFsjUV8oo3XZazOHB9t4paEN9euH30ttQ+lxhma3H2XG36xyGuBm3hNY
         qhZ9lv+HmXv2xkNlHjEFuheUCHMICV1CBEbBavmLdABaxerRkZWTj9wl0Sd+hyLHk1QJ
         DclByKVSpCvJD+dggURr1k8rUJtBs48Zpn9MZrfNElttzFF7kADOgAHq+jwfIJmfVn5c
         8QEtvRKSZzeN0NzgOcOrdAdkFsxc8E8ImxtYaH82PQfme+/z2s4W40iXpSFZcRTmtGhs
         V4bcuymOCEB/2yOlNoodyX+tS/XztAO3Pg8tRktyp9mzF6sBj8FjRFKPBeX5iVe/ei3H
         B/9g==
X-Forwarded-Encrypted: i=1; AJvYcCV2kJrgXEReUFq5xWuis9gwtnGEljgLcRECMwIRHmHpZpfCo11JlO8JDUeGUTQajMEbDVtzOrIX1WAdlw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfgU6UaumZ1Um0/EgsOJa3pB6oXYMAXSjj5x0G1xoOg133jfgO
	2VG0PzWgwSKxyi9mOsrPKq6ueNzjsS812TaygPPDVu7DqZo0wHaDjKKaJos4MB74YMz7mY6ZZGs
	2VZE1WPnqBziK9FBWmx8207R55jrm+5ZPbCwu2kvnQYiu2nCgp56cqmQXrES9yUbcJQ==
X-Gm-Gg: ASbGncsebnwo9hbGSslHSJkVSwVp2tTBiCYSHhnIgETNN8QdamqUlkXITuEtDeWciGL
	Mnqw/h9A2+e3bgAvkK2kHaYfSlmeWe29kWnjy2zX8rQ6/D0sNTLn6CW3cf2rMLtnCLKR3z+fJnl
	B2Ky/sG7x87PNW5/5ScEBwcvR5+szUm/sa2vV8Ezm364Eae/C+fV2Dr/JhGZxqo3xKXZHIdiXXi
	+W+3m5Xh8hPwTQUa5a0q8BMSHmXk/sEK2C2lo2YYtvBctWr48tVr6A/U+g0X7hZbL//MF+w4tBX
	0ll4Hname2A+CRal9/KZdoDnZqfj24UuQ9Nr5AKgaYiJw1VvvN8=
X-Received: by 2002:a05:600c:5025:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-453659c5915mr22113195e9.9.1750413499700;
        Fri, 20 Jun 2025 02:58:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+UH/oXjCoatyt9UUuhcodNeIRdkCDiG++nStz6Fv6Ll0Igf2faoRpdmFkAw+Kkc6gFCFTvA==
X-Received: by 2002:a05:600c:5025:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-453659c5915mr22112945e9.9.1750413499346;
        Fri, 20 Jun 2025 02:58:19 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.43.84.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eada7adsm54244745e9.35.2025.06.20.02.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 02:58:18 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:58:15 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <aFUwt6ZIO3VbJ1AJ@jlelli-thinkpadt14gen4.remote.csb>
References: <20250507222549.183e0b4a@nowhere>
 <92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
 <20250523214603.043833e3@nowhere>
 <c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
 <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
 <8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
 <aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
 <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
 <aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
 <20250620113745.6833bccb@luca64>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620113745.6833bccb@luca64>

On 20/06/25 11:37, luca abeni wrote:
> Hi Juri,
> 
> On Fri, 20 Jun 2025 11:29:52 +0200
> Juri Lelli <juri.lelli@redhat.com> wrote:
> [...]
> > I have been playing a little more with this and noticed (by chance)
> > that after writing a value on sched_rt_runtime_us (even the 950000
> > default) this seem to 'work' - I don't see deadline misses anymore.
> > 
> > I thus have moved my attention to GRUB related per-cpu variables [1]
> > and noticed something that looks fishy with extra_bw: after boot and
> > w/o any DEADLINE tasks around (other than dl_servers) all dl_rqs have
> > different values [2]. E.g.,
> > 
> >   extra_bw   : (u64)447170
> >   extra_bw   : (u64)604454
> [...]
> > So, this might be one thing to look at, but I am honestly still
> > confused by why we have weird numbers as the above after boot. Also a
> > bit confused by the actual meaning and purpose of the 5 GRUB
> > variables we have to deal with.
> 
> Sorry about that... I was under the impression they were documented in
> some comments, but I might be wrong...

No worries! I am also culpable, as I did test and review the patches. :)
extra_bw in particular I believe can benefit from a bit of attention.

> > Luca, Vineeth (for the recent introduction of max_bw), maybe we could
> > take a step back and re-check (and maybe and document better :) what
> > each variable is meant to do and how it gets updated?
> 
> I am not sure about the funny values initially assigned to these
> variables, but I can surely provide some documentation about what these
> variables represent... I am going to look at this and I'll send some
> comments or patches.

Thanks a lot! I am also continuing to dig.

