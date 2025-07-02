Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB3128A71F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467133; cv=none; b=td8aw3OxNXIHOe/NMUiFHJKcHq4vK5k/m68Z+1iYT9oYgZRV/bOuUMVORlWclrS3akSTFLRuTO/H+M/UOIQVD+MJvm9eXTLOAR2wljziGOBQA9tB7HJks7q3TBlYlIfMfahS0MA9crgPx7/CibiFaryfLmxkbwbf+YZrFpFXY7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467133; c=relaxed/simple;
	bh=wZUs0Lg9nLG5vj3a0ZB7yNj+yaPuo6lcWjmwj8/JImo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtoDGABtJfSyyesDvHh1zORoKEw1fjQxCbaN0qZ5hiqKYFx+NQKJJck5LcVp7/S/S1kIznemGmm1WEfADh8h7r29OYISf09hERyth7ZPVooBd98vx9e4pURRNSTv24dBnkf+jy5qeDzRjBwIDSzWPqA08Q/OYpKPf1i5+/9Gayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oa4Y/b/4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oa4Y/b/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751467130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsW6zqBgtCDTnvN34Xc+Lxt07USTsTvI2l+xYg+WY9U=;
	b=Oa4Y/b/4MHUa5BR7YnPi7+LHD02ZjKVS4Lm0LATlTDDYjKOBtiL16TnpC3Fbubl9smiWBh
	xGmNjf49aFGIibBpjLrMGycGYv8KpyFiC3MwLubuHkBKp0NE8wLNfe4k/36Xw+O7iX2jkn
	pM6IbouLxY8BowVwcduj0pvvy9TlvzE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-FmDmaMDPN8i-4cA9eESOAQ-1; Wed, 02 Jul 2025 10:38:49 -0400
X-MC-Unique: FmDmaMDPN8i-4cA9eESOAQ-1
X-Mimecast-MFC-AGG-ID: FmDmaMDPN8i-4cA9eESOAQ_1751467128
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-40b0a248ce8so4065022b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467128; x=1752071928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsW6zqBgtCDTnvN34Xc+Lxt07USTsTvI2l+xYg+WY9U=;
        b=etmKSfrYfnz65ZzQK/bqVjFdSzxMaUPq3K3R4fFCXath4+bVMn01jB0BQtJQDSQTVn
         1jeMbHGgG6rkrUe1zbhSOorSsKVBpXm7s9az2zmZDFTQgtvmZLdBFHFXBVXfDu4U9vNF
         xZeT+zmAU1VXYmKZpUYqNyfVutOSybkdTK9615d+tOGDAh0N2qD3pJm7XEU/Mt03wJ8i
         SULz3Tu/3y/wWR81a8GoG8+m4t1Dp8qQs6VgiJ9pLE+Qa3tZHu+DQ/D5SivD9dSzk7bc
         LOF8MT+odjoL/iXGR/mhYa49V8l+cACy12yJg+5Dr96T4hBUvhLEZf/nulARTJyYVRKZ
         It2g==
X-Forwarded-Encrypted: i=1; AJvYcCW97GW6zdtMydJSvgtVt+liGlJOLtSypgrusWMuVhsiIiulq5t5TRl1YDpQzQG+d2uds92C3hqR12GOyLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhcZ6FUsz2rJilYsgcRuU8Ku0z8AX3PepE1GfKSYvhmz0VXcjx
	5andmpt1dsJzGxPK0NEcyamgZhTzOLfOOVb8pbz05G+ufwVsMtH0Y05wcbqcM/vRh31FuAsmm55
	zRWJXsl4mmsKwsII+fTjY1YXE6vkzplm8+r4cQfqf0mlaQJqVBCaNpd960B/t1h3UcBtqRPZIW0
	N7BbyfQE4Sjfuk5RpbUfpk+uirsbKjo+JrX8021F5g
X-Gm-Gg: ASbGnctv2V4bojQpYhK4KZOEFhUCOQvpBenjzSZQ01STwfQfTfBcja67TN8JapuZpxg
	pN+v6zDl1N18hdEDX/kW34KI+9P6Ir06NFCS1Y376JBLiDAJi3h6ksGXF7buhlKfD8TBTb76LaD
	fDZw==
X-Received: by 2002:a05:6808:1b90:b0:3f8:3489:d93d with SMTP id 5614622812f47-40b88816cbemr2174539b6e.25.1751467128237;
        Wed, 02 Jul 2025 07:38:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGJkEyRApKN9Snn2Qns9uRFnPDyzYI0heJJY+yiOKE3hkdxWXuRgqyrbD2KwH2XrfLhobH6R7OolRAxc95iss=
X-Received: by 2002:a05:6808:1b90:b0:3f8:3489:d93d with SMTP id
 5614622812f47-40b88816cbemr2174514b6e.25.1751467127863; Wed, 02 Jul 2025
 07:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
 <20250625201853.84062-3-stuart.w.hayes@gmail.com> <2025070157-undaunted-curler-bda3@gregkh>
In-Reply-To: <2025070157-undaunted-curler-bda3@gregkh>
From: David Jeffery <djeffery@redhat.com>
Date: Wed, 2 Jul 2025 10:38:35 -0400
X-Gm-Features: Ac12FXy9HjgNoFaB4FAc6SLNfV66UqBtwIgyuy9-ldwc1GEwfSJnUe5aDVCjxV4
Message-ID: <CA+-xHTEk_N6qE5w+hWxXfSMJLQ5tFROMVZnr5h2HUmrwEKVdNQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] driver core: don't always lock parent in shutdown
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, linux-kernel@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Martin Belanger <Martin.Belanger@dell.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>, 
	Lukas Wunner <lukas@wunner.de>, Jeremy Allison <jallison@ciq.com>, Jens Axboe <axboe@fb.com>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	Nathan Chancellor <nathan@kernel.org>, Jan Kiszka <jan.kiszka@seimens.com>, 
	Bert Karwatzki <spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 5:03=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jun 25, 2025 at 03:18:50PM -0500, Stuart Hayes wrote:
> > Don't lock a parent device unless it is needed in device_shutdown. This
> > is in preparation for making device shutdown asynchronous, when it will
> > be needed to allow children of a common parent to shut down
> > simultaneously.
> >
> > Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> > Signed-off-by: David Jeffery <djeffery@redhat.com>
> > ---
> >  drivers/base/core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index cbc0099d8ef2..58c772785606 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -4823,7 +4823,7 @@ void device_shutdown(void)
> >               spin_unlock(&devices_kset->list_lock);
> >
> >               /* hold lock to avoid race with probe/release */
> > -             if (parent)
> > +             if (parent && dev->bus && dev->bus->need_parent_lock)
> >                       device_lock(parent);
>
> What about parents for a device that is not on a bus?  Don't they need
> to be properly locked?

From my examination of the code and history, I do not believe so.
Locking the parent was added before need_parent_lock was added, and
when the other locations changed to depend on need_parent_lock to lock
both, device_shutdown was left always locking both.

It is simple enough to change the if checks to:

if (parent && (!dev->bus || dev->bus->need_parent_lock))

if you think my understanding is wrong and some bus-less devices have
come to depend on the behavior.

David Jeffery

