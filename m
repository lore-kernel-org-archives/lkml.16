Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0109326ACC
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747280313; cv=none; b=G6ZQOzjGhBSP56l3KNAiy2IXs/E+mTuvltNw6mTPpsB8zmvDN9lj7ZhU49UStkVqM1lHdSpbqUZ5plqDZKtQqd+c7+l8VWYXw77CagoQxmpuIWDzkb/vzmgR/qNbDRurdR45cUVOQdKJlgnxxXaVKdPbkOE7PzXmvWJrrxRqBbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747280313; c=relaxed/simple;
	bh=DOGAkysXSwlLDYwvelSMGth8yExrN3Q1t3k4OCAaHyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfT13CvQXsm61x7BwxEX4JsweRYR+8Ab1GnaCw3b0q+n8SZYofaqQdq4s31ZhxFDJ4b+Pmr5LbZiEVqG7mu2H6f1NwtvSbK82HeIVY3PeUuqVBCxmbDMH/kKvX8wLoRUthl8Qg9Czo5MjLl9sC9pjZ68Oczd0Vm/s1X4E3BB5Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=r5K6nCCe; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="r5K6nCCe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lcKSi+6b7yk8tzjb4aEVxT5mS7sILzFJ1AgsL9YQ3KI=; b=r5K6nCCe3e24Vx0CsAp4RIKpBI
	kRth2DlMH7ykQkqEAKTvC4jRJf8fy3aKqf0epb1RhHOM0WArIeRl0Cy2WYNt5Sy+iTA6uBraztBAh
	nTtfoeXXBtWLsevv89kllmSXS6xKt1m0eaMaOKkc2eGXIYqbH4grFIMAm3gLc4yRyVF8dcoNAdfPr
	tMIS6NSezbqh+EnCK+EC0q6Rf7sFyuON2tfcQ5ymGpkXd8l9F6G8v454WGr0CQGJELn9LmeKi2v+2
	1217VF4DO/wX5lyubXit9buVxjKtIWII6DrcNChxQmAl1sZQinhiCmDb52drNh9GFWGqWgvTsrEA8
	brIA/5yA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uFPQN-006DQd-0P;
	Thu, 15 May 2025 11:38:24 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 15 May 2025 11:38:23 +0800
Date: Thu, 15 May 2025 11:38:23 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Zaslonko Mikhail <zaslonko@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Heiko Carstens <hca@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 2/2] zram: support deflate-specific params
Message-ID: <aCVhr6fKFnZklcM1@gondor.apana.org.au>
References: <20250514024825.1745489-1-senozhatsky@chromium.org>
 <20250514024825.1745489-3-senozhatsky@chromium.org>
 <bec7391c-e40d-4633-a2d0-881eb6d18f19@linux.ibm.com>
 <ystv6cvrdllh64eqkislh47a3bnx5d2lk42ox4eiuuubioin6u@gmt5pwbkwiz3>
 <aCVcsB-M9cKdq8d4@gondor.apana.org.au>
 <2bnnkkwhqor73ls7dvsxlt57tp2u3xf2o27opkveuqwgh3xf2j@5kzgq4eej3cw>
 <aCVeeWCawIETqkfG@gondor.apana.org.au>
 <qddzdpkjsi6plu7jih5vau3xq5kjucnocoeoz7ewqbrzoiwgt6@zio43bbj5r2z>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qddzdpkjsi6plu7jih5vau3xq5kjucnocoeoz7ewqbrzoiwgt6@zio43bbj5r2z>

On Thu, May 15, 2025 at 12:32:39PM +0900, Sergey Senozhatsky wrote:
>
> This is not exported yet.
> 
> I lean toward not filtering/limiting anything and just permit
> what include/linux/zlib.h promises [1].  Would that be OK for
> Crypto API?

I don't have a problem with that.

It just makes the hardware implementor's job a little bit harder,
because the Crypto API requires every implementation of a given
algorithm to be equivalent.  So if the software zlib supports
a full level specification, then so must the s390 version of zlib.
If it cannot support a parameter, then it must provide a software
fallback.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
