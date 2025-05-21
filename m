Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4702C235041
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811631; cv=none; b=aNngY9YOOQdKRhOUMPpMgnLQyytBrU830Y1H3ZAd1Cqqk2rbQAvqkvOdHbGvG3nt6HGM1rM9anqrRcGFh6O3GVdNoqGWAsAolWBGCRHS9eiTpIh3QwB3+9iCZv8gLLRwAw/oCItUtZ9oKhwJ25LRei+Lu7ehedWej9GThQ6vbeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811631; c=relaxed/simple;
	bh=9VQ346ebPIpVRMm6f9y5EgRDO2obIT85xOV3Gw2udo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkOs+qDcHDxxoH40d7lik2s5soOBX/ao0/VgM0YznycqgM/vmZEn5EGRN17Ao3RvNM9hWrZF0Pz50QuEyFYXCFXmEGJBKZnpAo8xHMBBVMVzM8/barMMyDY6+pYqtz3iEJPEriRogdTO2o/HNzwHtjVRRxx1sSz4JvUcr3fNmGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aHt/ldBQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aHt/ldBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747811628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x4uXFki3RXaBZTP7u7kZxHdvFx0pW0nGcDYfjm3cMQc=;
	b=aHt/ldBQOdHXusg4hsKOgwi1mNLs6JgHbRLPlZstlbyLAiePDgOAWSVYyHmadrSeF0n7sG
	w25FApDp7KtXZz/Gm46etP/Zc+pYgi3vOA+rikMWZX2nHKOJF526ekRlGYZWQq2G3mZE5H
	VceojLaCMdISsBz7gF5MryJkXhpT2ok=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-ZymVB_6-MEiXxWwHKe7J2A-1; Wed, 21 May 2025 03:13:46 -0400
X-MC-Unique: ZymVB_6-MEiXxWwHKe7J2A-1
X-Mimecast-MFC-AGG-ID: ZymVB_6-MEiXxWwHKe7J2A_1747811626
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e7b9115c1b4so5391997276.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 00:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811626; x=1748416426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4uXFki3RXaBZTP7u7kZxHdvFx0pW0nGcDYfjm3cMQc=;
        b=e1Yhgwm+7BcCM+PUVbSiW8nyDAJ8v9BfqmJ1+PI/M/3W8q/8BjLalmnspc+VtqBfZD
         5WzAATjsl9NHrgINnlniZVahQbH93HLXWg0NLVwAnrUBESX2KYh0XOCH5eQyvuweZC/k
         Daym+5X8sHsWqgbH7cVSDBzzSusl/Z+i2X8v8IvT5bTHUayZULSL2JU3XU3p3S4P0Rps
         pN8LIzlZiNqNsD6GBzYE4tEeuSWRAtkMhIbZkv3phn3OQ01FklqwGj2rMVOaFtODGT0V
         eLEDeTJo5QRFjsS2zgTkr1wjsTbKMTXpB8+oTBw8MFZkqeNGAWG24ymIR3vAeUGa9txG
         gbbA==
X-Forwarded-Encrypted: i=1; AJvYcCU5nQOkfxg9Q+4psfH/+y1CeRIH5pXMqmbsNpyMrxenQFHJhPMMQAEhPS8kk08xNKaKSJxZmZSTMsgDGao=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxrn9F78JiCBaTyhEclM5wOmBTfU87gME2r9mMRFUkvy3Ep3I
	DKAGIXe6qUzmYG9VW/uTVOav8yq6v/f/DUVLEf8Bo0tLjt7ZIlcavj1jH082LYbeAUxgnHq3/Ls
	v+JwztGoU1CoYfBlJzhTrLp6kiyM4p5tqEmuuMQ7bVCQtXpbOYSH02xroa3kuLfwBTK/wEdTShn
	4wFZ19FV8GVKOfixoETwIPRLbAGZ1s5RfkhGibLMpK
X-Gm-Gg: ASbGncsVy4lei+pYhceU3qyZq4eGq9pIapxNg324BkzgCztKtQGCJI7V3C6suVW8ME/
	co+2+04Bo7ThFNyfyx812pLAUYCfWJlKDTupd+Gf5wf7NYsojVycPszX2udhaG9LseeI=
X-Received: by 2002:a05:6902:1287:b0:e6d:ec5e:b5ed with SMTP id 3f1490d57ef6-e7b6a08f421mr26886343276.21.1747811626130;
        Wed, 21 May 2025 00:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKNo15Oi/QZ/k66bSnuQxE6bf08k4qaU0blNDQ7dnxZLVMy+YcQ+rT1+Lvnu8ha0WE5sLFghYmv/ZaOBdZByk=
X-Received: by 2002:a05:6902:1287:b0:e6d:ec5e:b5ed with SMTP id
 3f1490d57ef6-e7b6a08f421mr26886312276.21.1747811625773; Wed, 21 May 2025
 00:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514134630.137621-1-sgarzare@redhat.com> <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org> <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org>
In-Reply-To: <aCzf6aoJAC-IdS_n@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 21 May 2025 09:13:34 +0200
X-Gm-Features: AX0GCFtXE4dDeCn9cUTuVG4Gx57oa8NEQ7aSl0jUrOWZcTyJncPcrt8z6mYPIQQ
Message-ID: <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
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

On Tue, 20 May 2025 at 22:02, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Tue, May 20, 2025 at 06:06:50PM +0200, Stefano Garzarella wrote:
> > On Thu, 15 May 2025 at 03:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > On Wed, May 14, 2025 at 03:46:30PM +0200, Stefano Garzarella wrote:
> > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > >
> > > > This driver does not support interrupts, and receiving the response is
> > > > synchronous with sending the command.
> > > >
> > > > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > > > ->send() already fills the provided buffer with a response, and ->recv()
> > > > is not implemented.
> > > >
> > > > Keep using the same pre-allocated buffer to avoid having to allocate
> > > > it for each command. We need the buffer to have the header required by
> > > > the SVSM protocol and the command contiguous in memory.
> > > >
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > ---
> > > > v5:
> > > > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > > > v4:
> > > > - reworked commit description [Jarkko]
> > > > ---
> > > >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> > > >  1 file changed, 11 insertions(+), 16 deletions(-)
> > > >

[...]

> > >
> > > I can pick this for 6.16.
> >
> > Great, thanks!
>
> Can you rebase this on top of my next branch and send one more version
> of the series (fake ancestor crap)?

I tried, but the last patch (this one) is based on the series merged
on the tip tree, where I introduced tpm_svsm.
I can see that series in linux-next merged with commit
16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
but I can't see it in your next tree [1].

How do we proceed in such cases?

Just to be sure, did I use the right tree?

Thanks,
Stefano

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=next

