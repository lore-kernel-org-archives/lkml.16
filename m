Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBFB3398B
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748675307; cv=none; b=ZcL8oHrojaWLaK5g9CCJOkeqzVFrpxWUOBlRT78X+aU+GsamlTK88Uiua45kmMvfexK0ocsIhMRGB6cRgkh1emgtlZcFcaqCB01ldoEJPBHFdNv/J/FbyBeVMMxcMW+d53jrapWFcQCR3e+yc6/5DrGnUepV8JyxNqy0G+SdAdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748675307; c=relaxed/simple;
	bh=3iv8tjgA6PQWzf83ghqnVbIpO85Y32KhCeYeRAz0230=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmBgU6HY/ck3PB4oXRHJyOjYEnYzfQ8XDat4bHBudO59LIzTA0tnx2hkrEQMJxPLkdxHjooctBWflsr/iwfvN6k0PmArAuhRdHWyFPrb/0wvv1yBpxvKB5232ZJtyRhuB6bzQ1G6+T481z0MhRPMFnDvwyV3Utix/4Bv6HPnD04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=h9U02AGT; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="h9U02AGT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Kj6igAYGrkkdzGQffS7B/xzIRhHcDJxtG3KLUNcCcqw=; b=h9U02AGTFjGVZEVshIuun0zH/F
	qB+WcCCtvQUq6DbyIQiIdBlrvm6Vw+oYB4hibfaDHSy0wa8TTa14HpkPYZZn+nQHTdV7FppHGMfOu
	PS4Qg04GhnQBgLxWM/ohCj9lhdAq0Kg4V7GrX23RQwmqgkuG1GfEptgLZ4NBIjFDrsFZpYOfaNc5A
	+rcQ8E6UN2lSZ9gutisNbIKiEPc2gs55Ctu6Rse8fLMPqD8Fj7WHKiHnm7cOhhnK+BnRcarx1wpDc
	bXhxqvABSm6NrWS/VZDh1Z2kwCOw7JFD8DlXASylXKgziEmBiigQQc+bnUbs9jz1gqggnzuiZK2Vn
	WLfskK5A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uLGKI-009woI-2o;
	Sat, 31 May 2025 15:08:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 31 May 2025 15:08:18 +0800
Date: Sat, 31 May 2025 15:08:18 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] userns: Add forward declaration of struct seq_file in
 user_namespace.h
Message-ID: <aDqq4rg9rTKRur8Y@gondor.apana.org.au>
References: <aDlty06JvlGwTfKk@gondor.apana.org.au>
 <87ldqegrf1.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldqegrf1.fsf@email.froward.int.ebiederm.org>

On Fri, May 30, 2025 at 08:27:14AM -0500, Eric W. Biederman wrote:
>
> That description seems to be lacking something.  The code as has been
> fine since 2014 and there is no conditional compilation involved.

I'm happy to drop the fixes header.  There is no need to backport
this.

> Did some other change cause a declaration of seq_file not to be present?
> Did user_namespace.h get included somewhere new and that new location
> doesn't wind up declaring seq_file?

The seq_file forward declaration is currently being provided by
linux/sched.h.  I tried removing it and found this issue.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
