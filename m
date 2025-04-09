Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D688F49
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 02:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744164730; cv=none; b=o/IsvmC8I12p4fC+RYKtCJLmTlgUlhVkJOWvMbbBmytpOLL7L0pZCOPB4Rm+H/SkDKYAuIFjSeyWJZW3uPZOPqGhDqfULlCX/8sa6HeKMQeS+TlwC1Le7whg5tv1ZYUo3Mfk+gxWbMSsDeLG1nSRFRCWCqCL/S/+9Ws37lKBAlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744164730; c=relaxed/simple;
	bh=qZk7AqXGuHfGw6+dwU4obXEpeZbsTQIME6ce5dZuP88=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VOg/bbyd5C9mpGjUUkTp++UmGvcMCdrTL1079Mbu2WAfrlLyjgABxcsS9VBXrAP3W0etr9AwgfAl5d1N4YmHPsk2v0dseR1UMORIgxIXQc4Pf/CfEp1++6VTwuo0S2+SD+S0HsMbzo8YTwVFzDJk8OQsymkhYiqiURPMYvKC8Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=OdzEgYCl; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="OdzEgYCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Fxf6dJYmNUkkFhIDC7PPKMmZCrTCwnAhzcAyZi0D0MA=;
  b=OdzEgYClgrcAosGBU9/R/3OYguMAQBwsEQKArdZAdTB9/7/v5Wb3Hqr6
   lWlBhej6Dnqfqya9k0DbQRs9c5jFyW+xMn3BCoRaiz5cKFuKOwEVLKCPc
   pLJ6qwUoe0zP4TDh/zmXV6DkgOdxzjcCZYxQSdwjlRCWqSSpVzQqnN1xY
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,199,1739833200"; 
   d="scan'208";a="217009814"
Received: from 74-95-99-105-richmond.hfc.comcastbusiness.net (HELO hadrien) ([74.95.99.105])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 04:11:58 +0200
Date: Tue, 8 Apr 2025 22:11:56 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Samuel Abraham <abrahamadekunle50@gmail.com>
cc: Andy Shevchenko <andy@kernel.org>, outreachy@lists.linux.dev, 
    gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
    dan.carpenter@linaro.org
Subject: Re: [PATCH v8 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
In-Reply-To: <CADYq+fanYZR1UNJVR0iapynQeXTVEe1xPMMJHXHHCGc-Sc3B_Q@mail.gmail.com>
Message-ID: <3878cce7-1a85-7f87-70ac-722cfa9d3e19@inria.fr>
References: <cover.1744126058.git.abrahamadekunle50@gmail.com> <Z_V70-9Bk-aZ914y@smile.fi.intel.com> <CADYq+fanYZR1UNJVR0iapynQeXTVEe1xPMMJHXHHCGc-Sc3B_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1061154757-1744164718=:4262"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1061154757-1744164718=:4262
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 8 Apr 2025, Samuel Abraham wrote:

> On Tue, Apr 8, 2025 at 8:41 PM Andy Shevchenko <andy@kernel.org> wrote:
> >
> > On Tue, Apr 08, 2025 at 03:41:55PM +0000, Abraham Samuel Adekunle wrote:
> > > The patchset adds spaces around binary operators, breaks long lines to enhance readability
> > > and provides clarity on sequence number wrapping by using a modulo operation % 4096u, in
> > > place of the bitwise AND(&) operation & 0xfff.
> > > The patches are required to be applied in sequence.
> >
> > You missed my tags I gave in a previous review round.
>
> Oh, I'm sorry I do not know how that works, please.
> Am I supposed to add them to the commit message?

Yes.

julia

> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
> >
>
--8323329-1061154757-1744164718=:4262--
