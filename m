Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C288F6E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750655516; cv=none; b=a+k56i+nzYgCgWUbEcrj5fPXyLVmmWHJ79SiYx1+Me09n7c1YXTKgRmKPw9IwyIJQhDdjRdUCu5biuTBvKmSPMOp4LMbObbPXFB0koHvRasK83Sez7ZLVddop2CvoIGhz420ByZMR4qt8SXX38FmabpEQN3tSk7vgunl2+oNX8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750655516; c=relaxed/simple;
	bh=imtjDLmHTyYtzjwOqDDYnnkmplPIv/la+cgpfPdQqqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K//qgFpkeaWIaMxHFwSspQqTyjCtv1+gHdbMOH0vRoWQ22F3HH8JiwaycajMSoXTLbDu6H3+USQZtt4zfYjoHC3VDvXW1GlKfUOyM04dkONFw8nqoaV87jCGtz7DX84jWNPBlEBessnt7s/X0GLs9rL5JiT9uL/SffSMsiEZDo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eztFYiUC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eztFYiUC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Kld/uITGF/u1zNJ3lTXiAZxc7BUp8iDuyP9wy6UrYpU=; b=eztFYiUCB/mKUUKIq6PM0W7pBA
	7ZBQowHztYmGRDKfXT6TOdxi635pfTP7NWCU9oGmtQFewK4rLoICSGUU2QrYbEJr7PCIYR6dF4wEy
	VoSyhbV6mDuFTQDiQ9nZKDmgrT/BLSujpl4rsh48DFTVTkHe7RfL9uG3k1/6VymcwGnnNhS25AHnY
	CxP9Bsxe+KlNHyYbSq/Ng6U+szBFk9GdiXFblyX1O1Dp3Dh1H3Jl8G0LM1qbtJMigJMzWHB3Ntr8E
	UJ/I5/4WabOq5esjTQGsdaOYKAA2A/af6qzmkGVj/mGegpQHBInSVXJtotWYJ68KMzKfgL/Y+HKp4
	vd/A1EQA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZTD-00000001asl-3QLs;
	Mon, 23 Jun 2025 05:11:51 +0000
Date: Sun, 22 Jun 2025 22:11:51 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Igor Belousov <igor.b@beldev.am>
Subject: Re: [PATCH] mm/zswap: export zswap API to modules
Message-ID: <aFjiF-OIDAmHhZNX@infradead.org>
References: <20250620193552.2772125-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620193552.2772125-1-vitaly.wool@konsulko.se>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Jun 20, 2025 at 09:35:52PM +0200, Vitaly Wool wrote:
> There is no reason to not let modules use zswap capabilies to
> densely store unused pages in RAM. This will allow to remove some
> homebrew solutions for e.g. GPU drivers in favor of plainly using
> zswap pool.

Well, right now there very much is - there is no user of them.  And any
such user should first have a careful review on the list if they really
should use zswap directly because that feels like a layering violation.
(Maybe it's not, but without a proper review that is impossible to say)

And this was the nice Monday morning after a long weekend reply.  The
short form is "don't add exports without a user", and everyone should
really know that.
