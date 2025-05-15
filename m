Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FD428F53B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747279492; cv=none; b=KLL3rOUs5Bif7LvbbcuXn2S02sozrfNbgBJuujmzo9R9jEZVqhEVlXFsZ5yQWmOmG26iHVePFJo3iaZ5gFXDIEbJ+v6OZT3+46lZO3V5piGNlq4o/Egm8Vf0X6bo8dywTN7XCTsy+zoBGGIRc89CaPzK+HCd8Yy82mHJoZTzsZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747279492; c=relaxed/simple;
	bh=oX05t+xRsWZEqJMmUDVQLVF5e7rsaSv9sjtjrv9MTno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlyQsF7kK/uoU2EZywfU3Zz2oQdLI+HPfFqlN1EYbC8XK03hOMqYjKgq/xQsJbZbSx9qE+w3wz0iCH1wl3eAMyCBK9JN+S8le0osYDWuoyqzFk7GgALeeSUZv9VSouNLcrXFlL0q8fDOp5ZuShEARmnBK+oR8izf7qO4P4/HXY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=TPX8JyRh; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="TPX8JyRh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7R6K/ai1nrk//L6Z8X0cid/jGJ8XHuu3DWVDwEsYrjI=; b=TPX8JyRhccw1Yck8Khwaqz42LI
	p0+ff/qqlhvHdjU0Nor6TZ7qNL5JaKMRIoOCLL9ASTCQhME02GtH2nrhsJUv8m1Kuf9S2X/7GYRpP
	AYRbzYDFxJaYXJbgu2m72rpctDlRioxONAIJSWmLGoFW8YqDKtCAz4zsjPShxQsYSNQlwWxgq8y+g
	J8qD11tLAlbUOfJKZQ1yoXw1zJIMaHdVwgpl6XoGCYQlTCap6SKDQXhdaxvBG0QmwvqBE/8LloExM
	UoYapu3Q/vt9CHezo72Xb3GRU2SZUijxSMaeqZCFfWYpP94IPnkRUgqel3cbqAbvYfgEb6PBX25/f
	8BhVe8Uw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uFPD7-006DL4-2e;
	Thu, 15 May 2025 11:24:42 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 15 May 2025 11:24:41 +0800
Date: Thu, 15 May 2025 11:24:41 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Zaslonko Mikhail <zaslonko@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Heiko Carstens <hca@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 2/2] zram: support deflate-specific params
Message-ID: <aCVeeWCawIETqkfG@gondor.apana.org.au>
References: <20250514024825.1745489-1-senozhatsky@chromium.org>
 <20250514024825.1745489-3-senozhatsky@chromium.org>
 <bec7391c-e40d-4633-a2d0-881eb6d18f19@linux.ibm.com>
 <ystv6cvrdllh64eqkislh47a3bnx5d2lk42ox4eiuuubioin6u@gmt5pwbkwiz3>
 <aCVcsB-M9cKdq8d4@gondor.apana.org.au>
 <2bnnkkwhqor73ls7dvsxlt57tp2u3xf2o27opkveuqwgh3xf2j@5kzgq4eej3cw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bnnkkwhqor73ls7dvsxlt57tp2u3xf2o27opkveuqwgh3xf2j@5kzgq4eej3cw>

On Thu, May 15, 2025 at 12:19:25PM +0900, Sergey Senozhatsky wrote:
>
> OK, so do we want to limit user-space and permit only "raw deflate"
> winbits values. that is only negative ones (either explicitly or
> implicitly (by negating the value before zlib API calls))?

I would suggest that we stick with the zlib values, but filter
out the ones that we don't support/use currently.  If you've already
exported this to user-space then obviously you'll need to decide
on how to maintain compatibility but that should be specific to
zram.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
