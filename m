Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D641C860C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174831; cv=none; b=R2pmtmAH8Wqmr0RiHW8WSnwrUQ5HukDd81t0MVqp3nk75Bjo1n6cxieM27/qEwbU0viyxMueUhQ4SqAMXHRsjbK7X/jMDn6f63qhobqFOA6nhgWXfojwxKPhTcMdKwC3OUxJmJlkR6FKsfFetYKk7zdNSYyXnFITgJ2uc+f6ob0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174831; c=relaxed/simple;
	bh=/MWcKXPXZBHCkUeZbUbXxhAaTdNtWBMw+Aqv7bq2O7k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ibT2ouox2qdjJQa3TdkJSnqfG6ITe6mhz7otm22LZUr2nqstkcI02/OLKPuPIYI8scIYshEuhGszK3nuM0+vAYIr7J10rFvnhhATb3QxBGzHJoceVqyGLAHJhvkbuS9a6M6gmBY+wghYF1mWjSJ4hwb/GdlG2Nslt14anOhYOh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=C0uBOsKx; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="C0uBOsKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=skXxQghNrPMcq7AjXNel2fgneVU1MxGzFFP/8gDVgNo=;
  b=C0uBOsKxwzc7r3mAT3ZE5x7FImeNper5Ge3QuKTpWSSPr7vQg28/8TwN
   qDKNc6iDixUeLFl4oc+WJFs7V5GaUSV5KihMfI9TLNzPZtrfjZxJyrUSF
   czj0K8fMGmTcV3W8d2PZJcgbLqIIICj0Qr1OczKZZNVjg5/p22zgNuJH8
   8=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,283,1736809200"; 
   d="scan'208";a="215321499"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 16:13:41 +0100
Date: Fri, 28 Mar 2025 16:13:41 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Samuel Abraham <abrahamadekunle50@gmail.com>
cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: rtl8723bs: modify variable names to comply
 with kernel naming convention
In-Reply-To: <CADYq+fZd=C-EydjBmkP6Rh6XAJS6Kg1nM7zGhyLrGYiLGkZ8mw@mail.gmail.com>
Message-ID: <acd2df4b-6865-d2c0-7bc2-babcc930d03d@inria.fr>
References: <cover.1743163800.git.abrahamadekunle50@gmail.com> <dd32dfe6c837d88dd13a546aadcb0bc207b997d6.1743163801.git.abrahamadekunle50@gmail.com> <21e624e7-c18f-6aa2-2a16-7cd46e706d47@inria.fr>
 <CADYq+fZd=C-EydjBmkP6Rh6XAJS6Kg1nM7zGhyLrGYiLGkZ8mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-356947522-1743174821=:4458"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-356947522-1743174821=:4458
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 28 Mar 2025, Samuel Abraham wrote:

> On Fri, Mar 28, 2025 at 3:55 PM Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> >
> >
> > On Fri, 28 Mar 2025, Abraham Samuel Adekunle wrote:
> >
> > > The variable names use the camelCase naming convention which is not consistent
> > > with Linux kernel naming convention.
> > >
> > > Modify the names to use snake_case in adherence to the Linux kernel approved
> > > naming convention for consistency with the codebase.
> >
> > There is another naming issue that checkpatch perhaps doesn't warn about
> > which is the encoding of types in variable names.  You can see some
> > variables with names that start with b for boolean and p for pointer.
> > Those letters shouldn't be used in kernel code.
> >
> > julia
>
> Hello, and thank you very much for your review
> Do I send that as a different standalone patch?
> Or should I send a v2 after attaching the patch to the patchset?

Perhaps find some different files than the ones affected by your patchset
and send a standalone patch.

julia
--8323329-356947522-1743174821=:4458--
