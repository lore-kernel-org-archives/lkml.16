Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0082722B5AA;
	Mon, 12 May 2025 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061720; cv=none; b=mfm8JxwCdahXxK4idSrcdLNLjVerGO/wKuUUzylTCmtPh9ydekoxGmidsXXPecCy8XKVRkXMGOJq79KkNRb1xZqg6SdPKFFiiv4Pu8GxTDyIq/s1ITmfDn4H7ONiTzDaj5+c04ucFKMSwruPJ9zuWyl4/5CMZkHwyFnZWsXzGOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061720; c=relaxed/simple;
	bh=bIXGnFUp3r/ltoiwYlUED+Cv66IJZeza+vWr9Tzoz0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFnaOzJY9XEF8rQJU6oC8jDtwiVsb14cPES1RjKH5bA9WpdPE9NXF7UCvPAmTCSYMSXD9b9NRRRBu9RK71MxWumyawzFAp14Eib9cDyZ6J27N2M7DQqBq6O3FCGVzdZkwNzTsqFkkNwmvY1gyaDsF9vic7899/iH1PEFADs4sVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HyvkWqEq; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HyvkWqEq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3ZO7qs2cIM2wnLnq8b3WSje6dMXJly5sAUWvWi9DxZQ=; b=HyvkWqEqYVYc5FQibEj54dloH/
	91znqrDukN3dTr6R1ifa98LxwzQSoHEG3BF/OCsQOFPdrgloHcqaevNEV5Y6ESD/KY3HdiqG813XJ
	nK7lQsMKHgHBWUBdG5HgHCQDZGcyHaltpzobjIlsdVMcecKCd2kE+2PVdBB7eLRu0mv9ji2DAdgJr
	ImD6F6U3H2miCSGkazAnFK4sf04/FVTUBCRmb6gqGIPX8bcIQaaNE8fJ9BiRy8b5KLq/qb/u6hfwb
	XGbg7BDe2WvahNTYiNy2lb4mRHmfVDb16BqqAl8FLUoEnbpuVqAP87Gq7irB7PgmQS3q0Q8LwhBb4
	tSCGexYg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUYl-00000009oCw-1zAN;
	Mon, 12 May 2025 14:55:15 +0000
Date: Mon, 12 May 2025 07:55:15 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jason Xing <kerneljasonxing@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux@treblig.org, viro@zeniv.linux.org.uk,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
Message-ID: <aCIL0zZvf1fvTahk@infradead.org>
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCGR4EOcWRK6Rgfv@smile.fi.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, May 12, 2025 at 09:14:56AM +0300, Andy Shevchenko wrote:
> Also note, we usually do not care about the out-of-tree users. The main Q here
> why are they out-of-tree for so long time?

We do not care.  If some of this ever gets submitted it can add the
needed helpers back.

This entire discussion is silly.

