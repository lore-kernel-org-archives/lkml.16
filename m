Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC5205E34
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743944439; cv=none; b=lUP3OfRHgJ3WfU9gJBqlNiRXMyvPm4LN+xLMUOgkjJrThR1LDOdZNTfUEHRSX21ZfDTXy0lsYxF3FYoWQ47+SqCsEsiGEWwg6FWfXZNWtM85RbRiUT7yqWYVPNG9u7KjhpnBDs0iGO+ZVuqkkcZ2xw4jTB40DvVdEGmBbcmEhaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743944439; c=relaxed/simple;
	bh=50qO6sVUfKAlI+7EUCxJ4nD+K4J+wHh506yW07OR7sI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FL3R8z+wjY8NPIpUxp5xztzgT6iTONSErbDH8PJz9gH2lClNm44BXXjgklXYewLsVrzLUNoZRWZ9z2lrJtcB/m/+fbtfKEqlQxdynMX6KXYCog5LD29hBJgfoktywzDTOIzoshUGrfRU29g2zp6jCvcn4FqW5jjUqajROw8abiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=VhE1fQ15; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="VhE1fQ15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=M0MxkMRo0M4835eTLeTOq0SONIFwc0TfKLoSPL6VqDw=;
  b=VhE1fQ15yXHl9Bt5653ESC73LWP9Z5MP0mcTmxq2yIUb13VRz4RCwmFK
   ClZgcy8xG4X3KQUdLSusnEpSfzaozs/V2BD0zE+1KuQeSN+PYc9q+ctnT
   pxZqwXm731gtva+8rJErGoaL1RaSKjQ0EUNgmifDis+SC8Tznn5AXSC6w
   M=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,193,1739833200"; 
   d="scan'208";a="216547472"
Received: from unknown (HELO hadrien) ([4.26.64.170])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 15:00:28 +0200
Date: Sun, 6 Apr 2025 09:00:26 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Samuel Abraham <abrahamadekunle50@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: rtl8723bs: Prevent duplicate NULL tests on
 a value
In-Reply-To: <CADYq+fb+L9_S6WDJYKdugCVNCd9kT2QvEURimPHb+_3r-PoADg@mail.gmail.com>
Message-ID: <8efaafd9-b01-c52f-4969-31628aa839a7@inria.fr>
References: <Z/EuZuvGyQ9QBl6z@HP-650> <7e94b75e-6959-75c-ab4f-58147fc37dc@inria.fr> <CADYq+fb+L9_S6WDJYKdugCVNCd9kT2QvEURimPHb+_3r-PoADg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-664567108-1743944428=:3229"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-664567108-1743944428=:3229
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sat, 5 Apr 2025, Samuel Abraham wrote:

> On Sat, Apr 5, 2025 at 2:30 PM Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> >
> >
> > On Sat, 5 Apr 2025, Abraham Samuel Adekunle wrote:
> >
> > > When a value has been tested for NULL in an expression, a
> > > second NULL test on the same value in another expression
> > > is unnecessary when the value has not been assigned to NULL.
> > >
> > > Remove unnecessary duplicate NULL tests on the same value
> > > that has previously been tested.
> > >
> > > Found by Coccinelle.
> >
> > The changes are found in the same way, but the code patterns are overall
> > quite different.  It could make sense to make separate patches for them.
> > Then you could make a log message that is really specialized to the code
> > in each patch and it would be easier for the reviewer to be convinced that
> > you have done the right thing.
>
> Thank you for the feedback Julia.
> Okay how about the versioning. Should I make it like a Patchset?
>
> Like [PATCH v6] with the cover letter and two patches, one for each code
> pattern?

Yes.  Just explain what you are doing.

julia
--8323329-664567108-1743944428=:3229--
