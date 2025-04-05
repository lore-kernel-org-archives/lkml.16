Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9C1C5D55
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 08:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743842989; cv=none; b=J3AlIvtxJZI0JkwsD5mc/s/voYskv50N7+nO4hQrhWPbjKast8q1qaITdavLkjQYlTMDtoDsYSK3jP57Q0WlLVWJgNRJoduDpitAlzFdXd02J5OfaA5p2u6kYx/h7M0meGMwACBcud/Bff7fIfzRnqwBDmx4U43iiZg1suto4wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743842989; c=relaxed/simple;
	bh=wxV2W5YIp9ltZ3GEiBdclhXdQYAr9mjLSw6dsWprZd4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B8cJeOG6urhEXH10wbgKSuWU/JgRTIL0TX3QX+ukVwBmN8+PGIEBsWXlUo+rgffgCFohclNfvjIi082sT7og/lwNoUE80ggGZErQAhRqRIUk+NOnVzKYdFZ03LUgyj/xi0rKLJrhlXh7db+nVmyUt44YX69HEKS/030hVJPexI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=rnI8ufSI; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="rnI8ufSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TSJBqbxyvDsQAq29NufHt8S3MtMowfbbsQmyb3exGYc=;
  b=rnI8ufSIvqn4crtq2rt2u0fvouwdUN864nnKFgHtGPTu09u0idKEIZ2p
   WF4hxqtB9X48P/E3ZfWoVQ68dkW7qErH9DiqXEKjz3dx6pUEZpg5Cdin4
   J2Q0u92w76ALlJUjEQUrxo5cxHIaGf5mZ5Hb8h7Xb20KMC3q+Uj6rmDOX
   g=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,190,1739833200"; 
   d="scan'208";a="216488092"
Received: from unknown (HELO hadrien) ([50.225.219.62])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 10:49:44 +0200
Date: Sat, 5 Apr 2025 04:49:43 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, 
    outreachy@lists.linux.dev, julia.lawall@inria.fr, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    andy@kernel.org
Subject: Re: [v3 0/1] Unnecessary code cleanup patches
In-Reply-To: <2025040505-blip-mower-bab6@gregkh>
Message-ID: <69c335ea-dbeb-4c9-135e-2312a77e9ac6@inria.fr>
References: <cover.1743723590.git.abrahamadekunle50@gmail.com> <2025040505-blip-mower-bab6@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 5 Apr 2025, Greg KH wrote:

> On Fri, Apr 04, 2025 at 01:02:19AM +0100, Abraham Samuel Adekunle wrote:
> > The patchset modifies unnecessary duplicate NULL test on a
> > value in an expression, when the value has been NULL tested in a
> > previous expression.
>
> Nit, the subject line does nto have "staging:" in it, so I don't know
> where this goes.
>
> Also, it really reads as "this is an unnecessary patch" :)

Technically, in English, if you have a noun that is being used as an
adjective and that noun is itself modified in some way, you should use a
hyphen:

Unnecessary-code cleanup patches

But something like

Remove unnecessary code

would have had no ambiguity at all.  Also everything you are doing is a
patch, so "patches" in the subject line doesn't seem very necessary.

julia


>
> And finally, for a single patch, there's usually not a need for a 0/X
> email to describe it, everything should be in just the single patch
> itself.
>
> thanks,
>
> greg k-h
>
>
