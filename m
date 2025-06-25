Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824C52DECC3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869764; cv=none; b=tmroHlTXH4DZcyRFUhRAnIbHY5jpRYfZpqE5pbExOUg1MgWviwwwDGuvseGPJOFqUvKPSl4ooXHA6cLTaIqL4s3BIIThTNwX01x1wV9I5o/TzboDcCjcOreOa0R66h76DWl428PA25cqhNIPAD3YHdBXrr+gydLv76Hmrpq2yZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869764; c=relaxed/simple;
	bh=/817u73cJlijuCNnTFqpxxNzpiOhWbk5zHg40bxCtMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3b1IWMumGi/u8DzunUJxVxx773HNVqJqD/dd+gHG0XmxeixT0jgnfqhyrnH+ypidA9y36SfrrpoGHUs++nJIOz3F6JCFbyFtIyYsB+OEvRh404Ku5QPIDOfAXs9ZquBO+LNXlo7UboObIuvXIuEC3OG8e3mQ87mu7eZwebaLTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NHhUfIjy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NHhUfIjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750869761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nlfl0HvL6p5C9wiWXuv3ZyT8srkPY79gCbVcPY25wgE=;
	b=NHhUfIjy+vymNAZbtLRn1Ikl01bUsNPsJHdAeGAxiimlgIXD6f+R9F7txrf+4gMMg7J9Af
	G2rxh3VbCVqvtnbgob46IMPKkR6samGocSiBjtA/GpNQyvcZiBeyyGDw2WpDghwVnMendR
	aX/I14JT5zKWuBnt7nxyctGdqD5qLnE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-ACQ_ut1_O6WB5qxZUHl4yA-1; Wed, 25 Jun 2025 12:42:39 -0400
X-MC-Unique: ACQ_ut1_O6WB5qxZUHl4yA-1
X-Mimecast-MFC-AGG-ID: ACQ_ut1_O6WB5qxZUHl4yA_1750869759
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7111ff9f2d4so1378727b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869759; x=1751474559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nlfl0HvL6p5C9wiWXuv3ZyT8srkPY79gCbVcPY25wgE=;
        b=TnxL8RYRHLkt2Qvp0jlOnkchPeU8UG9+xjMDIzQDljvMHJFIu96UCQAwb6iGD1ejTo
         maOS7rk5YlyI2M/JGfEJbAQnBvXKXo/RditN6+lkeClbJXhihKH0jWsp9IQfkaH4kqkz
         0K1nF6CtSo67NV6DteL1X/sazKRxDW4inT6W4RMrS1vG29+GtoZSikrgs3t8qDrnxIFG
         rPmbeWs1OSF2PlsAb7Vpx8JM4Ko4NXKPW3EOML40FjC2mCJzdiq2hoAQoAF9MRZyabL+
         PIsi5/dowfkD25ZNzOcQy7BlyczYpr+zLicZH7Da03WgQdGdkzjQeEttSOWdAHdVas8z
         4Scw==
X-Gm-Message-State: AOJu0YwBkv3xF3q871VNCnz7oalaITyOwdYrJ1GtlC2U8xbyPjxrha+S
	vOUdfkvQ2St9M1yN78lv97mA2fc+/ibWVzv3wH0/lM/AkhBwvtwo7m9UivUiShijd8qDsQjSGd/
	WT4cxB/TE2AUXOm9gpaZJ5Qgl36C1410wVxf5ZS0SDeoA1I31tBkHQm5OLm94Qu78TEx2tUlAIk
	SgRFFUfm2knv+t1Bk2GBjWOsTB5rexkHpa7RCsxxsf
X-Gm-Gg: ASbGncuLO6sBqS8pV/SKpQqx92dCR/cnhTnv56JMAuraNTG8f4P5uTLrGLnrmhI+0wI
	J+NlFNFsnvYZWU6J7wTUiMWOQ0vuXRTXLqzBk0faFirvNdLKDMPEoY1//A8LIXx8plqwqFYlNAd
	0QsGdkmA==
X-Received: by 2002:a05:690c:6b0c:b0:70f:8913:ed66 with SMTP id 00721157ae682-715087c70bdmr10121997b3.38.1750869759023;
        Wed, 25 Jun 2025 09:42:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFieNmTUGgh1wCgADlrPL5JDmEvLuKpDHJRUgQ2djJiYYhZb7UVT6EWDckb5lNTgx4pKSPLhXjmzcMJTZ3XZMc=
X-Received: by 2002:a05:690c:6b0c:b0:70f:8913:ed66 with SMTP id
 00721157ae682-715087c70bdmr10121207b3.38.1750869758423; Wed, 25 Jun 2025
 09:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620130810.99069-1-sgarzare@redhat.com> <20250620130810.99069-5-sgarzare@redhat.com>
 <aFvlaY0BNjaGxU1D@kernel.org> <aFwQ129i_HYzG3aY@kernel.org>
In-Reply-To: <aFwQ129i_HYzG3aY@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 25 Jun 2025 18:42:26 +0200
X-Gm-Features: Ac12FXxEB7j1Pqu364HQDxXaTieTzsNMquFeCJO9Pw5PNZpgUTeipi1JP5Ohhks
Message-ID: <CAGxU2F4q_UyBiNqWfQMVAXqsWQbtu5ety9MTpg35eRcE=eVqjg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Naveen N Rao <naveen@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jens Wiklander <jens.wiklander@linaro.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 17:08, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, Jun 25, 2025 at 03:02:54PM +0300, Jarkko Sakkinen wrote:
> > On Fri, Jun 20, 2025 at 03:08:10PM +0200, Stefano Garzarella wrote:
> > > From: Stefano Garzarella <sgarzare@redhat.com>
> > >
> > > This driver does not support interrupts, and receiving the response is
> > > synchronous with sending the command.
> > >
> > > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > > ->send() already fills the provided buffer with a response, and ->recv()
> > > is not implemented.
> > >
> > > Keep using the same pre-allocated buffer to avoid having to allocate
> > > it for each command. We need the buffer to have the header required by
> > > the SVSM protocol and the command contiguous in memory.
> > >
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > > v5:
> > > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > > v4:
> > > - reworked commit description [Jarkko]
> > > ---
> > >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> > >  1 file changed, 11 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> > > index 0847cbf450b4..f5ba0f64850b 100644
> > > --- a/drivers/char/tpm/tpm_svsm.c
> > > +++ b/drivers/char/tpm/tpm_svsm.c
> > > @@ -26,37 +26,31 @@ struct tpm_svsm_priv {
> > >  };
> > >
> > >  static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> > > -                    size_t len)
> > > +                    size_t cmd_len)
> > >  {
> > >     struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > >     int ret;
> > >
> > > -   ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> > > +   ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
> > >     if (ret)
> > >             return ret;
> > >
> > >     /*
> > >      * The SVSM call uses the same buffer for the command and for the
> > > -    * response, so after this call, the buffer will contain the response
> > > -    * that can be used by .recv() op.
> > > +    * response, so after this call, the buffer will contain the response.
> > > +    *
> > > +    * Note: we have to use an internal buffer because the device in SVSM
> > > +    * expects the svsm_vtpm header + data to be physically contiguous.
> > >      */
> > > -   return snp_svsm_vtpm_send_command(priv->buffer);
> > > -}
> > > -
> > > -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> > > -{
> > > -   struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > > +   ret = snp_svsm_vtpm_send_command(priv->buffer);
> > > +   if (ret)
> > > +           return ret;
> > >
> > > -   /*
> > > -    * The internal buffer contains the response after we send the command
> > > -    * to SVSM.
> > > -    */
> > > -   return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> > > +   return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
> > >  }
> > >
> > >  static struct tpm_class_ops tpm_chip_ops = {
> > >     .flags = TPM_OPS_AUTO_STARTUP,
> > > -   .recv = tpm_svsm_recv,
> > >     .send = tpm_svsm_send,
> > >  };
> > >
> > > @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
> > >
> > >     dev_set_drvdata(&chip->dev, priv);
> > >
> > > +   chip->flags |= TPM_CHIP_FLAG_SYNC;
> > >     err = tpm2_probe(chip);
> > >     if (err)
> > >             return err;
> > > --
> > > 2.49.0
> > >
> >
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>
> Applied.

Great, thanks!
Stefano

