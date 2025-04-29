Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8C9270EB8;
	Tue, 29 Apr 2025 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929528; cv=none; b=dwN5+uRtVFuvekuUieJjp1PEjGUWy4kZAfGdEh3k2bRbjpNgJ/3oVBuJvbm08gH/uz83peFEvRVezGFru90ZtYCCQLv1sqOK+k/6Y67Lf1oBpy8Za+0mOM0O3ls5ZB9UGkedz8n9Jfdpj3SmZBEXVfKux0kHkEm4lgxJHLT+s00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929528; c=relaxed/simple;
	bh=YZUhHEfjoZhIah5DME9KXqceefsXX+y0KXU3wNjY1ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p87Fqlk4wqCjAaxuwUU4xp7792pHlTJYjEjVKXRXiseA4R/naTEmBT0HjMasS7KKyHiI0ZmR+i5Lum21Ja8fU29pv9T7gvLv2nuxztZJIXbpfrnPzOJd6Xl2w0nEnIcznToLsnUlQdF8Jesv+mO2NloTP5W/r/csJ2mlpr9zAI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tklvIq23; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tklvIq23"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A62EC4CEE3;
	Tue, 29 Apr 2025 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745929528;
	bh=YZUhHEfjoZhIah5DME9KXqceefsXX+y0KXU3wNjY1ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tklvIq23gzAWCyn3jQmkzKvwp4hxM+vvJV0M6C2zEYHzxUQeTTXNOZatzYc6ZFq2W
	 3drpb9MG0h9vKtw+8rvOaVlKDuprwZi+I4cdfF5y8mSXnqTrjrqTWwPdOxfl2vzVOj
	 txGzBFPiLzoYLnLsx/lYUZVnNcOiADM0o/A2dn0g=
Date: Tue, 29 Apr 2025 14:25:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: julia.lawall@inria.fr, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace manual mutex handling with
 scoped_guard()
Message-ID: <2025042905-enunciate-sixfold-bd3f@gregkh>
References: <20250429120513.168674-1-karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429120513.168674-1-karanja99erick@gmail.com>

On Tue, Apr 29, 2025 at 03:05:13PM +0300, Erick Karanja wrote:
> This refactor replaces manual mutex lock/unlock with scoped_guard()
> in places where early exits use goto. Using scoped_guard()
> avoids error-prone unlock paths and simplifies control flow.

Again, for new code, this is fine.  But don't add it to old stuff unless
you really have a good reason to do so.

Unless you have the hardware and can test that your change was correct.
Do you have such hardware and was it tested?

thanks,

greg k-h
