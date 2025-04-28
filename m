Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1A05D477
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844511; cv=none; b=DBPgigBluXxvWT53l3vkcmVA/1AIfycES6c1ZQ+hvJnMW7gx0J7RExkAJC+imeHkApvJ19QzIkuIjpMcqrrkuzOyRNEFbspvttfCtGsnLiHQFLKHrVDHacKg2VmF163LkRzJshPlsAF/2bHi+7f0ZScpVl05FvdM9IZs0mFYvZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844511; c=relaxed/simple;
	bh=sBX41oy5q+NVzneEJp3/De7il4orb3AbguaLLlqdrDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNJ+SSSUg6Ud5vIZ1BuYjjQW+o4S/1oK8CmZ38Stz/f1fesnKU4L+nnJAmreLzBSxY8kxad9qOWY3oRUTphQBWoLcFl0w4q7wun0FOsS9VhXUIJl7H67MKaqgGzNYiFuJB9y/1aCeVNjBxS6RSOUfr7csj/oEGTVtHaXcguQieA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mPuoeRB6; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPuoeRB6"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72c172f1de1so2935548a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745844509; x=1746449309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKXmohf/rYRMfzCRTyUm0eMIlUV2EGFBdpsRN9XwbC8=;
        b=mPuoeRB6OsQAeMgBt/EivnNIo6o5SzBQDszR1XjbK05Zg3HkMSeZ0Thc+6XQ8PtwoP
         NTUlivoCd9xAUcL0MeLVCwLAI5ahpPnAS0lViui1e78gK3/K4W7vlmVhN0NiWqC0moDR
         s6rAk0xwdkiRMSxyZQcc2aZFKkUAJ7KyKeOhI6leeOQW0O/GqxL96r0s+AAxduFDQo3k
         K6Dzsk3m5mQoO1E1L5WVeEihcdPR2Pr3WNwraFJtjQMCsAJV2q1wKdtD7UuC3r4/ya3J
         hoJYEyDJ3h3DbP1g/5Yiu+1VWvmD910waW7b52A6lxgTIkFYhqqXS1aOO0yrhGtntwEN
         0Wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745844509; x=1746449309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKXmohf/rYRMfzCRTyUm0eMIlUV2EGFBdpsRN9XwbC8=;
        b=LeLjzrJ88chpep2VooFvq6KmYEDnbtourxYIlFIEIrkb9/p4NEZ8LxR92mWDezHb/M
         JCUEp8MdgimT2iaNMrpw3J5WphbPf9n29xRB9zaop4gVwJPdLTo9SDO+TLqiz7oFZM8X
         Shg/Yf4snulhsLgUW/A4jsklY8wQyRBPBjA0JLJsIHY5qAHKDCHBrKVRQMQ9HFViGrJe
         PYjmptyKjM6dM/fTFJ0J0eo7wsr9+eBF4aNRETcyyFas2ha80fNSiMnhCAI2A2TvUq0I
         5fF5WrbUqorawdtnn2hK7Uz4/mUM9B7TJrCAT3w7AYjUzu3FgTAwLjT/J3Rs5a4cRIec
         xWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8RJzGY5qgM+CWXplBbQLvb8ZDBzTmeJRTY0o8SRQONCGfrpd3OFV80E8BJrWbw9eRAt8bmGNigtHHktw=@vger.kernel.org
X-Gm-Message-State: AOJu0YymHvUS+XXSbYXsPhio46CO99vkBa85t2a3ROYTzGmWv/XlXSF9
	eiGyBYID5Oic3UU0l2dzUdTlIFsBbuBHxSMouUBZBFbk5OxiCY98YfylO52qLzpvpyCWnbS30P9
	6lRki81FtFnDBJhjxZkrDU3Z2ZiSUhehtWZZYTQ==
X-Gm-Gg: ASbGncslygsJpGM//EQH4sY6C+a3lzfa/X6U3+RQIxi2UXC2QT8AAScZBuWNcBVmWra
	LRCLWQ6b2b5XKoqFc2XG7c8k8UOe3VJYleibKIqjDS+T61UYwrUgUJL0Mdrl7Duf3IVJ5jvlIUc
	kmzvBL9ZmhOeRG+BjYN86/3kE=
X-Google-Smtp-Source: AGHT+IEKkJMN8rv7lns8SrDAkmFVU/eA84TXCYOaeFnM5RDCqVT1r578K613WDg3O1mJT13ELpQEF5gWqWlCh5F9b58=
X-Received: by 2002:a05:6870:a7a5:b0:2bc:7d6f:fa86 with SMTP id
 586e51a60fabf-2d99de7e336mr7327702fac.35.1745844508661; Mon, 28 Apr 2025
 05:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325200740.3645331-1-m.felsch@pengutronix.de>
 <Z-Pc6C1YUqLyej3Z@casper.infradead.org> <20250326110718.qzbwpmaf6xlcb4xf@pengutronix.de>
 <CAHUa44FUK_73oKSaqGdiPqB3geZbTNDFsC1Mh=KN3YPWr9=7gQ@mail.gmail.com> <Z-TXMIXzaro0w60M@sumit-X1>
In-Reply-To: <Z-TXMIXzaro0w60M@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 28 Apr 2025 14:48:15 +0200
X-Gm-Features: ATxdqUFNwbXIdhC9JmpFT6PMYUhHRoccu6LeSmRbvgshoecHjCAuCQo-WTMcvT4
Message-ID: <CAHUa44HEsMkzQHZZufdwutQyZRtig6e0qWomhwgDZAhy2qDyhg@mail.gmail.com>
Subject: Re: [PATCH v2] tee: shm: fix slab page refcounting
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Marco Felsch <m.felsch@pengutronix.de>, vbabka@suse.cz, 
	akpm@linux-foundation.org, kernel@pengutronix.de, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 5:42=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Wed, Mar 26, 2025 at 02:47:46PM +0100, Jens Wiklander wrote:
> > On Wed, Mar 26, 2025 at 12:07=E2=80=AFPM Marco Felsch <m.felsch@pengutr=
onix.de> wrote:
> > >
> > > On 25-03-26, Matthew Wilcox wrote:
> > > > On Tue, Mar 25, 2025 at 09:07:39PM +0100, Marco Felsch wrote:
> > > > > Skip manipulating the refcount in case of slab pages according co=
mmit
> > > > > b9c0e49abfca ("mm: decline to manipulate the refcount on a slab p=
age").
> > > >
> > > > This almost certainly isn't right.  I know nothing about TEE, but t=
hat
> > > > you are doing this indicates a problem.  The hack that we put into
> > > > networking should not be blindly replicated.
> > > >
> > > > Why are you taking a reference on the pages to begin with?  Is it c=
opy
> > > > and pasted from somewhere else, or was there actual thought put int=
o it?
> > >
> > > Not sure, this belongs to the TEE maintainers.
> >
> > I don't know. We were getting the user pages first, so I assume we
> > just did the same thing when we added support for kernel pages.
> >
> > >
> > > > If it's "prevent the caller from freeing the allocation", well, it =
never
> > > > accomplished that with slab allocations.  So for callers that do km=
alloc
> > > > (eg setup_mm_hdr()  in drivers/firmware/efi/stmm/tee_stmm_efi.c), y=
ou
> > > > have to rely on them not freeing the allocation while the TEE drive=
r
> > > > has it.
>
> It's not just about the TEE driver but rather if the TEE implementation
> (a trusted OS) to whom the page is registered with. We don't want the
> trusted OS to work on registered kernel pages if they gets free somehow
> in the TEE client driver. Having a reference in the TEE subsystem
> assured us that won't happen. But if you say slab allocations are still
> prone the kernel pages getting freed even after refcount then can you
> suggest how should we handle this better?
>
> As otherwise it can cause very hard to debug problems if trusted OS can
> manipulate kernel pages that are no longer available.

We must be able to rely on the kernel callers to have the needed
references before calling tee_shm_register_kernel_buf() and to keep
those until after calling tee_shm_free().


>
> > > >
> > > > And if that's your API contract, then there's no point in taking
> > > > refcounts on other kinds of pages either; it's just unnecessary ato=
mic
> > > > instructions.  So the right patch might be something like this:
> > > >
> > > > +++ b/drivers/tee/tee_shm.c
> > > > @@ -15,29 +15,11 @@
> > > >  #include <linux/highmem.h>
> > > >  #include "tee_private.h"
> > >
> > > I had the same diff but didn't went this way since we can't be sure t=
hat
> > > iov's are always slab backed. As far as I understood IOVs. In
> > > 'worst-case' scenario an iov can be backed by different page types to=
o.
> >
> > We're only using kvec's. Briefly, before commit 7bdee4157591 ("tee:
> > Use iov_iter to better support shared buffer registration") we checked
> > with is_vmalloc_addr() || is_kmap_addr(). I like Matthew's suggestion,
> > it's nice to fix problems by deleting code. :-)
> >
> > Sumit, you know the callers better. What do you think?
>
> If we don't have a sane way to refcont registered kernel pages in TEE
> subsystem then yeah we have to solely rely on the client drivers to
> behave properly. Nevertheless, it's still within the kernel boundaries
> which we can rely upon.

Yes.

Cheers,
Jens
