Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCFF1F9F7A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 01:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751679577; cv=none; b=adwot0KHHCqHQgkjLQYmqt4fhyq50KO2Ujh/XcXv6pzGqxYc4TZ4ZC7F5gtDRYVpmg0SVl8V+8znNvVwT64Dbtz/K+xkkQ1YjUz7RCuRHUd4HFXd91rICIkw9+mB8Rwj1vxC5/rzuE5cR3PwiBi9xYW2dRT4dUJ95qBTQzYmVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751679577; c=relaxed/simple;
	bh=uH9S2pPCQJFX9E3mNc5caYjMHInEJ7ICA5XUVJSFYyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfzAlF57ydTSbvbBfhvyqGpUzH5jYkfVsbbI1kMCHc1ucUVLu2jEORmogax3Wl57BKELm577XRDCCYPg4ds0uuEkOLT4zlEeJcNjERBisYyC5b/Xkb7jLO/bOIVYTmz0kFly54hgE29cs7JjpxN3AYL+Sic7TlLdjN3SS/FPe+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+M5vxPU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+M5vxPU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0BBC4CEE3;
	Sat,  5 Jul 2025 01:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751679577;
	bh=uH9S2pPCQJFX9E3mNc5caYjMHInEJ7ICA5XUVJSFYyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+M5vxPU782BsefXjAhMD8ivCZEsgOuiG3H3mZh9sfSZoVjG6hCnvYAmYweMKosxL
	 ZIPgVcRL4CM2O69uJ4Yj0sy1KZ7eQVZquvgqmro1zTsqMCgHJBz+DxUQC8A8bxj6Sk
	 tMRg4I87cZiNSNDb9/+hYk+wpd/TPMWlMsoN++NQJn5p6G6XsLZ1FqMBDeToOQ7Puu
	 fyR5FWSYCJDJEjWTvZq5NpSBZEcpNOtWYGw2phzFUbb0OqOldeu7mSOlvNtdaB2FP3
	 ZrM1FcNfFBo31uRG2aEUs81zCqRlOiQU9V8Ls3ZBV2tKnxZFXgwWWQDzqedNYIIoLw
	 edvo3KnB/nKKw==
Date: Fri, 4 Jul 2025 18:39:35 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware_loader: prevent integer overflow in
 firmware_loading_timeout()
Message-ID: <aGiCV5Vgz00ODrw4@bombadil.infradead.org>
References: <62c63afc-5d56-46fc-aac4-87081498602d@omp.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62c63afc-5d56-46fc-aac4-87081498602d@omp.ru>

On Thu, Jul 03, 2025 at 11:38:33PM +0300, Sergey Shtylyov wrote:
> In firmware_loading_timeout(), *int* result of __firmware_loading_timeout()
> multiplied by HZ might overflow before being implicitly cast to *long* when
> being returned. Rewrite the function using check_mul_overflow() and capping
> the result at LONG_MAX on actual overflow...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Cc: stable@vger.kernel.org

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
