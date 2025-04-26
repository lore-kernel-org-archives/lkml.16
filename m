Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDAD29B0
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 05:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745644755; cv=none; b=HoVHSAqBUDIU12sX1SCh3+/5bFe3ntHjsNy9qkIjrVL8g9z01LdWKM/NsAbhUykXruVMZI7MD0POgZy+rMzpyYqWotVIN1pvc6HW5WNdSICWEl9YP+wCOLH2yGirrH9yuI0y6izzMWQ2LZABk9nZmC5CPZKPd0Dx7wb+QI8OMAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745644755; c=relaxed/simple;
	bh=bB5XztPcwhGgq0w4hFRaWniz6quIVBbnVp/gaAwzoUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kouo57jRwfWzXQFFdyX81vCpHJNsvHdMzriWOOxysM1s+hqYxKXlTNxc492Ge+LncSZE7QHNyiKp6eEGatYqSYF+1AcRujtVTPhcPUV97kPK3ZDv9sXwmV7igWXAarkUodpeZ2lPd89dP3zzoraFNMuHNFzhQI4mwicPy6fECLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FIcO4hed; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FIcO4hed"
Date: Sat, 26 Apr 2025 01:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745644750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SjzGeYFc1rskazNUv+0k9pTt5tEX8drK3NYo3dasRKw=;
	b=FIcO4hed44HoGLxPSgpaJvSf1ptubwjR9rqYAtdw2qjVS1zIq7sNNsTGgBP8qTUa95PuqF
	Iv+PZc5ATuScTNaECA0S6Frr9TZQwZpAkZcY+bpcHpCqMoGnPQfORx9yfP0ganteyY92hW
	1r/WOPBmva/atfnOb7fMaBNFCObk3zQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
Message-ID: <tu2cvzmxdhqtzaoykggbksosqziaghoyswokpvfyy4iv4okdyy@cpis5wvp3msy>
References: <q3thzkbsq6bwur7baoxvxijnlvnobyt6cx4sckonhgdkviwz76@45b6xlzvrtkr>
 <CAHk-=wh09TvgFu3WKaeLu8jAxCmwZa24N7spAXi=jrVGW7X9ZA@mail.gmail.com>
 <mlsjl7qigswkjvvqg2bheyagebpm2eo66nyysztnrbpjau2czt@pdxzjedm5nqw>
 <CAHk-=wiSXnaqfv0+YkOkJOotWKW6w5oHFB5xU=0yJKUf8ZFb-Q@mail.gmail.com>
 <lmp73ynmvpl55lnfym3ry76ftegc6bu35akltfdwtwtjyyy46z@d3oygrswoiki>
 <CAHk-=wiZ=ZBZyKfg-pyA3wmEq+RkscKB1s68c7k=3GaT48e9Jg@mail.gmail.com>
 <opsx7zniuyrf5uef3x4vbmbusu34ymdt5myyq47ajiefigrg4n@ky74wpog4gr4>
 <CAHk-=wjGiu1BA_hOBYdaYWE0yMyJvMqw66_0wGe_M9FBznm9JQ@mail.gmail.com>
 <rn2bojnk2h3z6xavoap6phjbib55poltxclv64xaijtikg4f5v@npknltjjnzan>
 <CAHk-=wiLE9BkSiq8F-mFW5NOtPzYrtrXsXiLrn+qXTx4-Sy6MA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiLE9BkSiq8F-mFW5NOtPzYrtrXsXiLrn+qXTx4-Sy6MA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Apr 25, 2025 at 10:01:20PM -0700, Linus Torvalds wrote:
> On Fri, 25 Apr 2025 at 21:49, Kent Overstreet <kent.overstreet@linux.dev> wrote:
> >
> > And you never noticed that the complaints I had about the dcache bits
> > didn't make sense and how I said it should work was how it actually does
> > work? Heh.
> 
> That's a funny way of saying
> 
>   "Oh, Linus, you were right in the first place when you called me out
> on my bullshit"

You started out going off about how filesystem developers don't know how
Unicode works, and when I brought up the dcache all you had to say was
how wrong I was.

Sorry, I'm not going to give you credit for being "right" when you're
just trying to play gotcha.
