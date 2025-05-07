Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E421A436;
	Wed,  7 May 2025 11:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616392; cv=none; b=Y4tLPbJ84HrAbLI9IogdQN2xpAz3C54yMCCBrzhnXowzpDEOTyHIFiMPH1UrLDY5qt+RHJ4x7Eyb1Dx/B5OKRzTqeBArg7WEnvyZNVTxszuiOyUFL6fs3zE2tBw8i+VNmqz8rd8UgeF3RlIxadeTPYnwzwyqqJDD/2dZt+XG4dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616392; c=relaxed/simple;
	bh=GvIJDk2Foeu8lwcV7oYMR6YwsKfgA6jO/J16A00CLLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2slvg1AyHmvFfuxpvvVuev5EJa8V4LZuRj+i2dBgrIrnmNu1pHbDQlZO7cjCaMZx1JlIXTnBdhUuXRgbkohkqB6xGTBhsUQUn5lCY3RLzeMoAImhiV3gRyGXfk3nUyfA+b2DHz7Fnx1sbrGdcOE+D6s2wsw1nRRFgPuP3mwPQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XwfZzT+K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XwfZzT+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1331DC4CEE7;
	Wed,  7 May 2025 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746616391;
	bh=GvIJDk2Foeu8lwcV7oYMR6YwsKfgA6jO/J16A00CLLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XwfZzT+K76LY0Cqh9bF8BL7bZC+ZCLnJXCxHEnxi8z475iImcKxS3H8khMwGO8/Up
	 iuA8YgBcnpk7G8ZSuWfw3vLrPoS51YkKYLVcaC6Po37LZ+RUmjQ/QcvZjBV75vnQjN
	 O15bG+2oJeBWZW2kFp9NEI72bWE08YaznkuxiqHM=
Date: Wed, 7 May 2025 13:13:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] staging : gpib : agilent_82350b :
 agilent_82350b.c re-checked the sizeof structure, also checkpatch.pl has
 shown wrong error, hence now applied the right option and commited the
 changes, this will be PATCH V2. earlier have applied void pointer only so it
 will take only 8 bytes, and not the whole structure size.
Message-ID: <2025050747-swizzle-factual-33a3@gregkh>
References: <aBs5MeEdCCwiGE0B@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBs5MeEdCCwiGE0B@brak3rDesk>

On Wed, May 07, 2025 at 04:12:57PM +0530, Rujra Bhatt wrote:
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> ---
>  drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Something went really wrong with your subject line :(

