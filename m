Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5325D43146
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698981; cv=none; b=mBIuUFodGM27exvRijc3vFoZMTWfmV70ZABlD/9zPp3epMuTJIZhDzAhNrsa5Z48OSmliIin8TnnLxCFvfp9tikQkWhH2oQMbEtyB4j01XtgLYSMrGFfmR5NtLYG3zhgDwnaWQK91ixfdQPJsva+oFAf0MYaXogozs2a65EX2BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698981; c=relaxed/simple;
	bh=SywP8t9wqOOU/8ix1gqduSsYqPmyq/rtNdkMj6TjcXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I27cbouC90A6xHe8nRNEr/wW9ox64FrAmoMnSFDv4oFtAan+B/KBrn84Fl3hvfLF8DDoMlXAgfU4mQJ8tjP929rfgQ2rQS4g44CsolR0DzqVr6pCnCOLCA075DE6xAmuf75JEvkQh33m05TfGb1IYOe99fp4Oky5X4EQcPopcsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k00gBR3r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k00gBR3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8D5C4CEDD;
	Tue, 15 Apr 2025 06:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744698976;
	bh=SywP8t9wqOOU/8ix1gqduSsYqPmyq/rtNdkMj6TjcXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k00gBR3rr2VN5htvNnFsTKuaPzBEF3nmYk9+S8n8OaMZLoVgO7xH2lvyB2cJE2Pgt
	 YkXCx92F1xTG71gOEbqOy54C4f1fKAOGVSM3D6VOxjjGJMM5W/U5uYlI/5Sar03ePq
	 yDlKOFabvRYQk6MkxFzAW8R2YKbWlo+iI/dWGC0W571Ugmq4KSLQKxZZhT/NdyVY1A
	 ISeCamnd8mY3dT1dZmwP8mxUAPjcil4UVFqgYCZfQbmaiusm58XTiweGxw8zPbuFaR
	 cixDdH7qEcTv1MbGsDRKNXwr8Ebjw6Ng2IrUCwsYDXH65G8cJGPFs5iBkwIlalewKn
	 S1eIrr6S9uq2A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4Zu1-0000000040P-1Y3Q;
	Tue, 15 Apr 2025 08:36:13 +0200
Date: Tue, 15 Apr 2025 08:36:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Reformat code in
 gb_operation_sync_timeout()
Message-ID: <Z_3-XS2DHEbqkSdx@hovoldconsulting.com>
References: <20250413104802.49360-2-thorsten.blum@linux.dev>
 <Z_yztGweLAfJgwXh@hovoldconsulting.com>
 <BF2CF4C6-5381-4266-9E49-9C81E9604007@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BF2CF4C6-5381-4266-9E49-9C81E9604007@linux.dev>

On Mon, Apr 14, 2025 at 05:00:41PM +0200, Thorsten Blum wrote:
> On 14. Apr 2025, at 09:05, Johan Hovold wrote:
> > This just makes the code *less* readable.
> 
> I guess you prefer the code with curly braces?

Around multiline statements yes, but the proposed if-else here also
obscures the logic for no good reason.

> What about the Linux kernel coding style [1]? Specifically "Do not
> unnecessarily use braces where a single statement will do."
> 
> My patch just removes any unnecessary curly braces, resulting in less
> lines of code and no line break in the memcpy() arguments.

I really don't care, the code is more readable as it stands which is
what matters.

If you want to practise sending patches you can send all the "cleanups"
you want for code in drivers/staging where churn like this may be
accepted (and where the core greybus code no longer lives, contrary to
what your Subject suggests).

Johan
