Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51A18BC36
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258052; cv=none; b=XXPfz9TURCpLb0mkasX4+BL4sNTSzdycWoQVp4a9riNeD8HnL1Un8flzRbM0c8m8w0few60hb6B9DBDsJW+tkaZCqxmf4vuFtZEqr1OBxKzSG+/k6SL7jxN95J4lBFb6CcXT0zj64KsfTWIAuO/PumtJEb1KnJQeRkKX+oEMfPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258052; c=relaxed/simple;
	bh=f9NlCcrXBwqbHg+asT3zxxRiHlO7Ohc3gfh8eM/VBRY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=u/uxPtiIEBTqva5yF4nX//m9oMmoxxNR123IzKYKxkG1EzZFuoLWp9dPE7eAftCi9FJSX5AcM4HF4iNjn0hdFtyuEJ4XL316lK2PJkAP3j1RL4jTqABbzozPkqsST+x2fnltR2Y9V7/Ejr8sM3m1X+5tiwLKQ7YoIgaorFCxuig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=uRgsMHEC; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="uRgsMHEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6Ea+hkfblOLDYoYVHQ2SSkGvRe5JH09Qr/4YX9bFHnw=;
  b=uRgsMHEC200fyDEbvNldlNOW76II7dmps4Nf14NZaEg0Yrl5k8Gocf32
   uGOkrtGEc0xId77aYjYhOXIuMYoq8sbXFOtBNxDrsBp0QwRklVA8Wf00m
   MZSBkGCOPzUdV9N03WspQvselhHGQyjszyy75jc0tXg2fW71jDmehq0Ix
   g=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,285,1736809200"; 
   d="scan'208";a="215400782"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 15:20:48 +0100
Date: Sat, 29 Mar 2025 15:20:47 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Samuel Abraham <abrahamadekunle50@gmail.com>
cc: outreachy@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary type encoding in
 variable names
In-Reply-To: <CADYq+fYizY_eRozZkKYzsD00biQMTGfhOcuqiQ0RzXApXiAF6A@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2503291515080.58211@hadrien>
References: <Z+fTJRBOZ+66zmsh@HP-650> <alpine.DEB.2.22.394.2503291210090.58211@hadrien> <CADYq+fYizY_eRozZkKYzsD00biQMTGfhOcuqiQ0RzXApXiAF6A@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-411688748-1743258047=:58211"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-411688748-1743258047=:58211
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sat, 29 Mar 2025, Samuel Abraham wrote:

> On Sat, Mar 29, 2025 at 12:13 PM Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> >
> >
> > On Sat, 29 Mar 2025, Abraham Samuel Adekunle wrote:
> >
> > > type encoding in variable names are not a standard in Linux kernel coding
> > > style.
> > >
> > > Remove redundant type prefixes (e.g, `b`, `p`) in variable names,
> > > as explicit type encoding is not necessary in Linux kernel code which
> > > uses type definitions rather than variable name prefixes
> >
> > You seem to have also gotten rid of capitalization.
>
> Hello Julia, thank you for your review
> Yes, I should have added that to my commit message. Thank you.
>
> > It's also not clear how you have chosen which variables to update.  Mostly
> > it seems to be pDM_Odm, but there is also pRFCalibrateInfo in some
> > comments.  But you haven't updated eg bMaskDWord.
>
> I chose to update the boolean and pointer variables which have been
> declared in the source files
> I was working on. pDM_Odm, declared in the source file, is a pointer
> of type struct dm_odm_t,
> which has been declared in a header file, so altering the pointer name
> would have no compiler errors since
> it is declared in the source file I modified.
> Some function prototypes have been declared in header files, so
> altering their names in their definition in the files
> I was editing would result in compiler errors too if the headers were
> not modified.
> I could have modified the variables in those header files too in
> drivers/staging/rtl8723bs/include
> but I was not sure how many files would be affected by the change and
> how long my patch would be,
> considering the three files I modified already made my patch over 3000
> lines long.
>
> RFCalibrateInfo(without the p) is a pointer that is a member of the
> struct dm_odm_t, which has been
> declared in the header file, so altering that in the source file would
> result in compiler errors too, since the header file
>  was not modified in drivers/staging/rtl8723bs/include/
> >
> > I don't know what the r represents in rOFDM0_XATxIQImbalance.
>
> The bMaskWord is a macro defined in the
> drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h
> as `#define bMaskDWord 0xffffffff and also rOFDM0_XATxIQImbalance is a
> macro defined as
> `#define rOFDM0_XATxIQImbalance 0xc80` in the header file; these two
> values are not boolean values and are
> also declared in the header, so altering them in the source files will
> result in compiler errors
>
> However, other Boolean variables declared in the source files were modified.

OK.  It shows how confusing the code is.  Normally in the Linux kernel
things defined with #define are fully capitalized, unless they refer to
some name from a hardware spec.

I'm a little surprised that there isn't some generic macro defined as
0xffffffff in the Linux kernel, but indeed I don't see one, and I see lots
of masks being defined as that.

julia



>
> >
> > julia
> >
> > >
>
> > >
> > > -     struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
> > > +     struct odm_rf_cal_t *rf_calibrate_info = &dm_odm->RFCalibrateInfo;
>
> Example of RFCalibrateInfo (with the p ) being declared as a pointer
> of type struct odm_rf_cal_t
> and also a member of the struct dm_odm_t
>
> So the declared variable(with the p) was modified, but the
> member(without the p) was not modified.
> With these, please what suggestions do you have?
> Thanks
>
> Adekunle
>
--8323329-411688748-1743258047=:58211--
