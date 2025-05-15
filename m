Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435281388
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747279034; cv=none; b=ftI6ktiR9GCVDYupwqX2vs+6Hj8+vKtAackerGq4RfYfOYX+0W+YMg23u7sCatSuHG4+L2ijZfCDgtr63cxkYQSWFrLrvncKKLmxKepqXUxBrlxTunmtfjZg1vTz2JRQRUHMl0s7g54r1f7zIOW+ZHYoWBitFhU6EGcGpIG8x8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747279034; c=relaxed/simple;
	bh=GpPD1pWeMUw5hdMo7y6NeVMNNQ1ffKPlANNOLm33LAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dy5ca5PRyXdQAntoKYUFvwbquihj7Ki8BGSwg/8pUvD8wd08qFp+NiPnU3ARK724iFC21r9uxAp97XAK0Lg8XLk3CMRbT5r0Rlz/SJuzNSCD7RRWrIn8juXKigvODeklEeiB1GfE4VLjkIF3lSlMORLXH2b8ukdr5kjKAlxsjlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=nnN5aVzR; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="nnN5aVzR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=37vLUDV55gOMPmuqoCCxFeVo7LOrqr7EQnasKI+eowE=; b=nnN5aVzR2W8QQHUvAX5943Y0/6
	xyUo7j/b9aVr2u7KDioRq4Q6QlNuRdyBsaHeTFO05dcoS3Trp65n9urCj2ME84lxmZwKZOiBnWSWw
	YfcML8hzei7Ufgj5qpmArj3N06angCmQOJsQswpCvYXjYAbtlKP+Ei5yyCxqjOACHjRyUhpgNMz2H
	/njPpLEqcKwvTRT73NJJqK2YaOPjzSqAFvWw6Buy74t7jE7Qe8TyMvrEiP+ZYmVX1I72azAUUi5ze
	syZBo1U9Y9NIxE3nE3AVP/uEIzRHBs95o0jTy6ecjX2yQ4IRKZ++Yhy8t5tqPD78t11jB0iTF5Q4p
	WU+af1Tw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uFP5k-006DDl-0k;
	Thu, 15 May 2025 11:17:05 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 15 May 2025 11:17:04 +0800
Date: Thu, 15 May 2025 11:17:04 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Zaslonko Mikhail <zaslonko@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Heiko Carstens <hca@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 2/2] zram: support deflate-specific params
Message-ID: <aCVcsB-M9cKdq8d4@gondor.apana.org.au>
References: <20250514024825.1745489-1-senozhatsky@chromium.org>
 <20250514024825.1745489-3-senozhatsky@chromium.org>
 <bec7391c-e40d-4633-a2d0-881eb6d18f19@linux.ibm.com>
 <ystv6cvrdllh64eqkislh47a3bnx5d2lk42ox4eiuuubioin6u@gmt5pwbkwiz3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ystv6cvrdllh64eqkislh47a3bnx5d2lk42ox4eiuuubioin6u@gmt5pwbkwiz3>

On Thu, May 15, 2025 at 12:14:38PM +0900, Sergey Senozhatsky wrote:
>
> Yeah, so in zram we can use only raw deflate (we decompress only what we
> have compressed earlier and the data never leaves the device.)  But in case
> of Crypto API I actually don't know, added Herbert to the Cc.

The Crypto API has only ever used the raw deflate format.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
