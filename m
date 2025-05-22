Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB45211F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902410; cv=none; b=ciovdjQvdaPR1PJ1eQ+TfQ9BdUs4OoePKOK5hUZxbu34hdHUJuV5ManjmiViPJd3kWg7JPO6Zwq8EHaI64lE8UBH4Z3dy1bmdly8z2dRHjyJl5H+swADj5lwAcXWfZNrBbjoS0BKBqqOjCoob7BnzsFheikscY63xPTRkbzywbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902410; c=relaxed/simple;
	bh=Dlp2azLQltfH6emKWYdlW4k16t8gyfKRpWtf3w9Dv60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvQUJN+6+WRuX9WZFX01ggjkh0bThKvUdUimmDa10kX6tp+nNI124ivIISt/TyJBrGAvCJgoaO82DBGhuvOaDo/vk4bhw0TfXk38KqtGl6/mGYLQXz7GNYnsmGGcW2NkWrvGpPR4sa18+PoEVUC3oomWlV77nytW/zheGjVEOYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I1+8QZaf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I1+8QZaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747902407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dlp2azLQltfH6emKWYdlW4k16t8gyfKRpWtf3w9Dv60=;
	b=I1+8QZafWte4nOjPAfO/GFqVhDtRg52/fJ5vjft6mOzWtfpudhvSNmESHhIQWlkD6Bdwqf
	l0PgYJ2SIRNVyaXmtYdaLW9ew6EP5evZN38zqDXclH4r0cdmI8aUvl0+J7ePsN8rWa9+sq
	NwmrwENi3Ven9+sK9BL+tUSMUDBneaw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-qvyt2GSNOOWWJpHGo32elA-1; Thu, 22 May 2025 04:26:46 -0400
X-MC-Unique: qvyt2GSNOOWWJpHGo32elA-1
X-Mimecast-MFC-AGG-ID: qvyt2GSNOOWWJpHGo32elA_1747902406
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70dec158de2so34160657b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902406; x=1748507206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dlp2azLQltfH6emKWYdlW4k16t8gyfKRpWtf3w9Dv60=;
        b=Cm8BWlHPId2L+dJ1wjQDefCfBF7G0gwkpxgPME1hMySDdSHmxRyE7RTKL8wVw8FRvj
         6mOdLDaNcHASNJ7YC/miDoZ4bacp7RaZHCvWM4ycT82SaGmHgZ1BcpiQj+y0KYKsg1AF
         AqDzFxw8Yrzj9tUdZJVJuJL1SJEiez9lxq7VgeMC4wXYAUyctbYWEVV/hu8vA6x59gs4
         pAAWmYqy6uUu3ORfg0WEUY9jWHyhfCDeKaoqSG5m5fLq5xd5Ph5lvKUbmvfoWhwoJZQl
         JedBJOHizK0exe2ixZJcj3qkEiExZ07cKwXRwQBaVfWYHTv2jfOI/7zlhJGki0M4pq+/
         O73w==
X-Forwarded-Encrypted: i=1; AJvYcCWThACLjWeM2O2g9Qyp5m2P9D+OHklXkxEP/35J2MA4zSBcqabaeW3v7B5a/q9DUEjE9PI31K6tS8CPLf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpN6Tet3KxFIqaJx66wJ7MLwmS4c21wTpkJpng047OyNfxnSr6
	mRYAAyQPRscRmTVLpzfAYcaOkDe0pWBG3iUdCF5QokeUOhtDjFuF/xUXQMj/XkUP7ZfDl+s13FA
	6U5g/vImkA3RVx/MELKyOYtZTTwql5yfpICOFF70/sMjskzPqk+1xVGfqrzR15oan/LQE4hyEHo
	Prw2epwDttrhCYkaCTt5SdIkOEcbMVdmUO3Lxpp52T
X-Gm-Gg: ASbGncthr9KWfjcZ1z/MwcX4peIsFJTKjPTo0E2GZajWN8qHXG/O+qzCcmFlOJdMuJ+
	zMTTep8Jd6rn4pxM4DFSwC3qoQOFC9gq1aJxqGUHhp5gNE8SFsgdXvnuT8xsWhQfsVVY=
X-Received: by 2002:a05:690c:3393:b0:70d:f3bb:a731 with SMTP id 00721157ae682-70df3bba868mr78205677b3.9.1747902405939;
        Thu, 22 May 2025 01:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPhVj8JhGJCK+zc7RP834KN5Eve5FMdd9QufZUZBEqDbkQHG8Gr0Mr3Ft0fdQAFQnebVlVVoTvKHtpXaHPSYY=
X-Received: by 2002:a05:690c:3393:b0:70d:f3bb:a731 with SMTP id
 00721157ae682-70df3bba868mr78205367b3.9.1747902405539; Thu, 22 May 2025
 01:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514134630.137621-1-sgarzare@redhat.com> <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org> <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org> <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
 <aC2nBCxkvWWz5y5E@kernel.org> <aC4CVUXpThAyKQdf@kernel.org>
In-Reply-To: <aC4CVUXpThAyKQdf@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 22 May 2025 10:26:34 +0200
X-Gm-Features: AX0GCFvwBrY1Wuz2vdIMhJw7TkALKpOFZS5DJd8t4bfvvVGz5MJKErKjPBRbZJg
Message-ID: <CAGxU2F5zQJR4GvZ9ovtQBqMFGs-wBMoCRks=JYQ1JF6qMKK-6g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jens Wiklander <jens.wiklander@linaro.org>, linux-integrity@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Sumit Garg <sumit.garg@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 May 2025 at 18:42, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, May 21, 2025 at 01:12:20PM +0300, Jarkko Sakkinen wrote:
> > > I tried, but the last patch (this one) is based on the series merged
> > > on the tip tree, where I introduced tpm_svsm.
> > > I can see that series in linux-next merged with commit
> > > 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> > > but I can't see it in your next tree [1].
> > >
> > > How do we proceed in such cases?
> > >
> > > Just to be sure, did I use the right tree?
> >
> > Thanks for the remark. Lemme check tonight. Hold on doing
> > anything ;-) We'll get there...
>
> I just rebased my branches on top of latest from Linus. That is what I
> need base PR also on, and:
>
> $ git show 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> fatal: bad object 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
>
> I'd use git cherry-pick on a range to take them from linux-next to a
> mainline tip...

I see, let me know if I can help in some way.

We can also wait the next cycle if it simplifies your work, definitely
no rush on my side.

Thanks,
Stefano

