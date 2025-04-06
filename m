Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C952185A6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743944407; cv=none; b=gOfo7UOXXdekBlRU0QxxYnGSElWLD/ORkadB2juzZ/iFWnLOg530lXSMxoMuxLUTsx67Dwn4RK9ZP4qwBmTzT6s103+LYz8n3PD9aCXhuN+yYqodqRS4xEDd2w9L28I4/86OaSZ/E5C7GCSW56vqolos/oxj5lw7KJZ6ZEnKIc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743944407; c=relaxed/simple;
	bh=I275HjFLFd3xtDc4X9CdvdH6RS36LejZaw+xpOqo0w4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aiTyrLHOCmRT+En7Q/ZS2q4ThL3VptIe9LtQFx8dOQzmI8LjFAIMeqRnMLNSN4tMLucmuDnn3zBT5RD28uoT2hNCHSOPq3TAWkXE1R68qGllXCs9mFG4ebxcTelKtUmj+FAbcegViFz/XHtkReZ9jj4YBHfpxm/SaHGiuD7gT18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=N7ekiixN; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="N7ekiixN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=M/JM7I3zXyWVovfjIytpqHO1g6cAFai96OoX/P6cQqU=;
  b=N7ekiixNa9kraHD97U29R4h1gGGgyiXDaPfrVQxryYe9/KRsY/zv1QY6
   du/gAwi/HkwlzF9QFwejr60njqMgdPDdgjVWAMiyOZ22GPdprWmWzbiZs
   IG/uC8FXXEiLBk51ff4DPBnieryTm0tFETUc17ElwNlKgiBGUxffF87q4
   o=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,193,1739833200"; 
   d="scan'208";a="113562744"
Received: from unknown (HELO hadrien) ([4.26.64.170])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 14:59:54 +0200
Date: Sun, 6 Apr 2025 08:59:52 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Samuel Abraham <abrahamadekunle50@gmail.com>
cc: Julia Lawall <julia.lawall@inria.fr>, 
    Andy Shevchenko <andy.shevchenko@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, andy@kernel.org, 
    dan.carpenter@linaro.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
In-Reply-To: <CADYq+fYMPGFdFvNPyo_XoNdMhh6qu=h10Gb2EDc2Jw=JK9iXig@mail.gmail.com>
Message-ID: <7f48a42-1921-77d7-1cf4-fb6ea8f6fb7e@inria.fr>
References: <Z/B019elTtKG/PvD@ubuntu> <2025040547-vagrancy-imagines-384b@gregkh> <CAHp75Vc0vOB1nDLrV+wmYeshxTsDwYq0xBkmJiOH=d5HONRpNQ@mail.gmail.com> <d3b4e3b4-b5cc-5b5f-26b6-1d726f5e57c@inria.fr>
 <CADYq+fYMPGFdFvNPyo_XoNdMhh6qu=h10Gb2EDc2Jw=JK9iXig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1226635281-1743944395=:3229"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1226635281-1743944395=:3229
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sat, 5 Apr 2025, Samuel Abraham wrote:

> On Sat, Apr 5, 2025 at 1:30 PM Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> >
> >
> > On Sat, 5 Apr 2025, Andy Shevchenko wrote:
> >
> > > On Sat, Apr 5, 2025 at 11:23 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > > On Sat, Apr 05, 2025 at 12:09:59AM +0000, Abraham Samuel Adekunle wrote:
> > > > > Replace the bitwise AND operator `&` with a modulo
> > > > > operator `%` and decimal number to make the upper limit visible
> > > > > and clear what the semantic of it is.
> > > >
> > > > Eeek, no.  We all "know" what & means (it's a bit mask to handle the
> > > > issues involved), and we all do NOT know that % will do the same thing
> > > > at all.
> > >
> > > And that is exactly the purpose of the change. The % 4096 makes it
> > > clearer on what's going on, i.e. we are doing indexes that are wrapped
> > > around the given number.
> >
> > Ah, OK.  Samuel, indeed, the log message was going in that direction.  But
> > probably it should be more clear.  Why is 4096 the upper limit in this
> > case, for example.
>
> Okay thank you Julia.
> So I can add something like this to the commit message?
>
> "Replace the bitwise AND operator `&` with a modulo
> operator `%` and decimal number to make the upper limit visible
> and clear that we are doing indexes that are wrapped around the given number"?

No.  First say what the upper limit is.  Then explain that a module
operation is thus more appropriate than a bit mask.  People need to
understand the reasoning behind the change.  By saying "make the upper
limit visible" you are asking them to trust your reasoning, or more likely
requiring them to reconstruct it.  You need to make explicit all the
information that is needed to understand the change, so people will know
what to look for to verify it.

> You also said I should add a patch for the white space around binary operators.
> I did it together because the changes were on the same line.
> Should I still add a second patch for that change?

It's quite a different issue.  So a second patch seems reasonable.  YOu
can do it before yours.  Then if someone still doesn't unlike the modulo
patch, the spacing patch can still be accepted.

julia
--8323329-1226635281-1743944395=:3229--
