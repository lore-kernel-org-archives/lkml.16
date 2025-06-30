Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A7A1D5ACE;
	Mon, 30 Jun 2025 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751314849; cv=none; b=LvFpTjU+cZZ9phJUlLdMy/DBjhYMbwxd0mDgI8dIFKEwaId1ZnT0RS2JYur91fEOs6BD1+ycsXf2Rt0lkSLE25l8FlTIBoVBCgmbceywZQPa9ZZvWZWvAA9SANrUu5EjXqy8LztaSL9WgJHotKFHLbT/YLBk9+OqsCzLdnoDD1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751314849; c=relaxed/simple;
	bh=S2IH6KjIm/4LuZF1gHkxEj+ipI+Fs4C7NraSYfjDgS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0ksur25QE9kU3X7oE9ot5eU3W3DLvGo5Y89qOyB5BE9TUOdZXTxWQcrLkRiBO1hSgQj5Sa3UL4NhqnIJtp+uJJx61PXKhf4b01M5V4Iy8Ia0mBBQeH0H/UIIBRTxK/afD4vkkbiQ7LWh7EMDUd8xsiwfnr/3AytGzgL030ds4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UB85TXtI; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB85TXtI"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87ec5e1cd4aso820464241.0;
        Mon, 30 Jun 2025 13:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751314846; x=1751919646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc+90tprg0y+vgJUk7gGeUz39prtDolc690nnHVfeHE=;
        b=UB85TXtIESdMgyGE7FLpW3VBpdAmo/bwVO2grDLeSMGqNvgYxcTcV58q/9Ad+jmE55
         b+I2dqHODUWo6LECdJUNa8memLxUBfyZRUc9OkMhiireZ4zyJLNeMEerz3YlUx4T7R9J
         Tq+/wBW2hHXfL7nCrBcTf1GQNx06WfSZ4MBQNTYP24VY51HCIjr9zEKtxuX/Cpl6UEzw
         d6zZC6PAy0iUj5L4duynBMtVzfXfGNuYKTQFHAQEyvPrkPniWrlPEeajhpD5LoNRMN0g
         SN38sle8RUbp+K9KZlTi8aeM/F/DlZSwVYCDhp+/LsZ50QObOUvz1wKwxEauNGm95oh1
         5pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751314846; x=1751919646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qc+90tprg0y+vgJUk7gGeUz39prtDolc690nnHVfeHE=;
        b=HBjLzM9VBxGKV1M5StboEjbtbWxSfESBk7fZxSnVgxet1uP//88LM9zy9keEojxHFL
         /V8HMb9rzafYgKKD8P06cJHKeHAY9cDx3/OkA200rYL7TaymL+JzPyg2xYt+tIl+6WyO
         86akdAHXTEqCeLtifBApYknNCY+dhkdupopkwncChonkbWqKoxTbRaMAKJKFhMfEYVaJ
         tj10gju2Kxlit6hOA3XJabrMsmEsaxXHypJGktc3k08WyyNkIhPXy0d4OehTL8EFTNrF
         ahd07kHUmmNCY/BlJf1qi4zA3711rrChyhbgCNBj1UdwyyNZaaS7dgQHWZfGqW9+ftlc
         bHOg==
X-Forwarded-Encrypted: i=1; AJvYcCVPqZytePMCA/8OlzNCPZZHZt+sanOHLj7v4C8jT5r3eGPYQuylQramb1nSjC1cfkrHIdrun4q9uKu2@vger.kernel.org, AJvYcCXMf9jJPbDFVl6ek5LDLjUl4iMwwbYX8zmhkxxjJP2gIYteHJjC8ojNSA0g5ikDlWIrfga6Xx/YKju5txE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/sT3ngJmHHMvSBLVBc7CIfVXsgROLcqhR/voXaWaSlmnPjmWm
	qHV2prrfI8Sx8Zct6rASV0vgDLWBuiy4LUEX1hNKVFa3f7cP7wctElwnb/kpMq/udM/9Az3aNa7
	DLcoxqhgVxVE8ViBCq2e8J1QxTMnciZU=
X-Gm-Gg: ASbGncvidW3UhAWS8xaWcF7Y03iHk+sEBGbn0aPAz3JuaA6ctY8TRkd4PPONK4NsatH
	raFoMYeWV/62JZ7QJwXs/kG8wpd7bhQCHJYsTcd7eOpTsXqC31bwP+V6J6La9DUR2/r9pOREb0t
	NRCl8C6YQrmtgjRt5MVFJ+3+zasRSBXsTvavSsVzNFHISQldOJvy/Uq5goNDPnParDkApiiUQoX
	tUA
X-Google-Smtp-Source: AGHT+IEayYG4e2wKK0bX3ynrI0zopvwL0MJfOacs5i7fxmnOeVKHly04X/sXF4JVSfDE7ZGNHZeIp502W+AvgkQfZBU=
X-Received: by 2002:a05:6102:5a94:b0:4e7:7787:1cf8 with SMTP id
 ada2fe7eead31-4ee4f51fd28mr9511558137.7.1751314846544; Mon, 30 Jun 2025
 13:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627060125.176663-1-sperezglz@gmail.com> <2025062834-botanist-crop-4aec@gregkh>
In-Reply-To: <2025062834-botanist-crop-4aec@gregkh>
From: =?UTF-8?Q?Sergio_P=C3=A9rez?= <sperezglz@gmail.com>
Date: Mon, 30 Jun 2025 14:20:35 -0600
X-Gm-Features: Ac12FXwAra0T6lIhtYOGlZlss7cI2Oo40Q8m5vxGWM0YoR60ugXuZAhBDQsLrpA
Message-ID: <CAMCbnubpfO0y9oMnJnYHQ3ALTPmF1W80sPhbNPzaR59hy+cDQQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc-xilinx: validate ep number before
 indexing rambase[]
To: Greg KH <gregkh@linuxfoundation.org>
Cc: michal.simek@amd.com, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

> On Fri, Jun 27, 2025 at 12:01:22AM -0600, Sergio Perez Gonzalez wrote:
> > Issue flagged by coverity. The size of the rambase array is 8,
> > usb_enpoint_num() can return 0 to 15, prevent out of bounds reads.
>
> But how can that happen with this hardware?  As the array states, this
> hardware only has that many endpoints availble to it, so how can it ever
> be larger?
>

Hardware will likely behave and not report more endpoints than it
supports, but I thought that there is still a possibility that this
can be exploited, taking into account this patch:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7f14c7227f342d9932f9b918893c8814f86d2a0d

and this CVE:
https://www.cvedetails.com/cve/CVE-2022-27223/

However, looking more closely the above patch, the endpoint number is
extracted from a struct different than the "usb_endpoint_descriptor":
"epnum = udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;"
in contrast with the code that I'm touching. The CVE does not add more
details to understand if the part of the code that I'm changing is not
subject to the vulnerability.


> > Link: https://scan7.scan.coverity.com/#/project-view/53936/11354?selectedIssue=1644635
> > Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
>
> What commit id does this fix?

The last commit that touches this code is : fd2f928a5f7bc2f9588 ("usb:
gadget: udc-xilinx: Use USB API functions rather than constants") ,
although, I think the previous code gives functionally the same
behavior.

>
>
> > ---
> >  drivers/usb/gadget/udc/udc-xilinx.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
> > index 8d803a612bb1..0c3714de2e3b 100644
> > --- a/drivers/usb/gadget/udc/udc-xilinx.c
> > +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> > @@ -814,6 +814,12 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
> >       ep->is_in = ((desc->bEndpointAddress & USB_DIR_IN) != 0);
> >       /* Bit 3...0:endpoint number */
> >       ep->epnumber = usb_endpoint_num(desc);
> > +     if (ep->epnumber >= XUSB_MAX_ENDPOINTS) {
> > +             dev_dbg(udc->dev, "bad endpoint index %d: only 0 to %d supported\n",
> > +                             ep->epnumber, (XUSB_MAX_ENDPOINTS - 1));
> > +             return -EINVAL;
>
> Any hints as to how this was tested?

I don't have access to such xilinx hardware, given that it was marked
as a high severity defect in coverity and it is basically extending a
validation that was already added in other parts of the code, I
decided to propose the patch without runtime testing.


Thanks,
Sergio
>
> thanks,
>
> greg k-h
