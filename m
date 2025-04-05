Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928081F94C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743856262; cv=none; b=Y7VdOUJrbYvruzKQWLiqMaE4rGZT9MxvUSJLhFJv3YZ0OSqyPi7h/o/Pjli4DMp1Gnj2uZ1HImBaF29sloUeKd+v38PturuDXdcLMWIeg4F/rjXMyEYYpLoMP5SIHDX19a9Lm+LvkVGVx6J3QZm26eFuN3yzmQzX9Sj2YDzGfD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743856262; c=relaxed/simple;
	bh=81plf3/w6quAlw7/zz3YblJKNJguEXCh6bbRvciU79w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=F9WvvJod6eL0of9uOEjveNiQpTt88oybw9atafUZKSEDwPUbPMcLTiaW1HWzM64+64SezTd1oPROBD+1ZFIjVBaPLZSD3uokkEqAZvLU1pkdZnDlxEhXDgMFJjw9bAIflbzP5JMTBVTGPbNeTAlBZI9m3igomLkHQFVVOUghVHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=kv5EXRRp; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="kv5EXRRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=z/G7qa+fQsWq4iFFgwBbIjTn3Bug/NzKd2K5h+dOShM=;
  b=kv5EXRRpNpOfo8tjU+QRWHW4GKqLoSU0HqhPDShDqyk+0Hh+igCk8ZT5
   a0JFFPFF7u4OufcYBfeJJKeYszJIkowj0oUEfJG8DzaIt+4TKkcdkMmz5
   HUlozvmJwYWHACy9zlPXY1p5hgygvlugp5anITrIfbIcc3PZ5+b9+kpdc
   k=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,191,1739833200"; 
   d="scan'208";a="216498276"
Received: from unknown (HELO hadrien) ([50.225.219.62])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 14:30:57 +0200
Date: Sat, 5 Apr 2025 08:30:55 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, 
    julia.lawall@inria.fr, andy@kernel.org, dan.carpenter@linaro.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
In-Reply-To: <CAHp75Vc0vOB1nDLrV+wmYeshxTsDwYq0xBkmJiOH=d5HONRpNQ@mail.gmail.com>
Message-ID: <d3b4e3b4-b5cc-5b5f-26b6-1d726f5e57c@inria.fr>
References: <Z/B019elTtKG/PvD@ubuntu> <2025040547-vagrancy-imagines-384b@gregkh> <CAHp75Vc0vOB1nDLrV+wmYeshxTsDwYq0xBkmJiOH=d5HONRpNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-663152129-1743856257=:3184"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-663152129-1743856257=:3184
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sat, 5 Apr 2025, Andy Shevchenko wrote:

> On Sat, Apr 5, 2025 at 11:23 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Sat, Apr 05, 2025 at 12:09:59AM +0000, Abraham Samuel Adekunle wrote:
> > > Replace the bitwise AND operator `&` with a modulo
> > > operator `%` and decimal number to make the upper limit visible
> > > and clear what the semantic of it is.
> >
> > Eeek, no.  We all "know" what & means (it's a bit mask to handle the
> > issues involved), and we all do NOT know that % will do the same thing
> > at all.
>
> And that is exactly the purpose of the change. The % 4096 makes it
> clearer on what's going on, i.e. we are doing indexes that are wrapped
> around the given number.

Ah, OK.  Samuel, indeed, the log message was going in that direction.  But
probably it should be more clear.  Why is 4096 the upper limit in this
case, for example.

Thanks for the feedback Andy,

julia

>
> > So this just made things more difficult to maintain over time.
> >
> > What tool suggested this type of change to be made to this driver and
> > these lines?
>
> It's not a tool, it was me. I read the code and suggested that change.
>
> --
> With Best Regards,
> Andy Shevchenko
>
--8323329-663152129-1743856257=:3184--
