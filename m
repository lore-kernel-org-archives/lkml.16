Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6389175AB
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738900065; cv=none; b=cnsb8QtJ4KOB/S9FPSRN3cuSXum0YbGbHjnLAljY7CUxMvkvXsDxuVtaco8MFSYPK4pYVg2ckO3PHxuYQq4CDJHdCA58qBZGKNun4os4Y4IWqasKqHAjm9kmcpfH7kiNBQpt1011dvfLvd9GgLJikhjjjjZ8hgXN//sKyPM4XvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738900065; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S65aPhWPzmxcZXXi2/OpTc0+f1DZ+40EoJA9tF4PYU1+Yws3FIPJgUMZHzl602kUnsbiV6amWng7e6Sbv9HoyOOXCO+qpEmjHru8zhgVHZa+W3+IOBdIxhxAG2z6VXO/P9J0Bzp5U5GGE8VCloRXXxm5CIuBBZzWTUa9VgEwa2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id ED11268C4E; Fri,  7 Feb 2025 04:47:38 +0100 (CET)
Date: Fri, 7 Feb 2025 04:47:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 05/33] locking/mutex: Change the
 atomic_dec_and_mutex_lock() return type
Message-ID: <20250207034738.GA4793@lst.de>
References: <20250206175114.1974171-1-bvanassche@acm.org> <20250206175114.1974171-6-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206175114.1974171-6-bvanassche@acm.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

