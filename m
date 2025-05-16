Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A7E1B9831
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747413547; cv=none; b=uF9xMnsELXTs8+1UPzMp04q+C5bEaebPzMiR4hVi4BrB5Usa/YZFnJNQIZrc6Mt/n4a/8vvSSBZqjvvLCkJllu6qGtBxAA2PTWGesHCI3dBADpYWj8X5qxNBrx50DaD+KY+hZtzn0hdzUh9qd6I1dJeHORqbNWClwASMvWmgBrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747413547; c=relaxed/simple;
	bh=G/Cy+Bz6hayBNwZP3XSh3lfBwyeVvC/aasljpHJTH+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWUN7dveokgYKI/pvVW8A88tzrMd4+TTg8W7q9yUIHjGwRbhn1UGfAsVl6Rh+ReGVGpz2klTlM7y+XRmYC0sW+GHFmHBMfUzRq6P0OIgL3wk8xCWYngaR+w4XZThe3MD1+JQHkWjrwRKxQHm3Nys98pN/5Wf5Yh75Ep4Wq+P/yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aW7fRs3P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aW7fRs3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0ECFC4CEE4;
	Fri, 16 May 2025 16:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747413546;
	bh=G/Cy+Bz6hayBNwZP3XSh3lfBwyeVvC/aasljpHJTH+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aW7fRs3PNNcYzDaWOR4+i4b+ak2VmjQRQ0KxdIpxEqjBAGEtMBU67/nGRQ2OCnKK6
	 dUKJCdC3DBC4P+wI0u9gNs1fhOJ7v5w6NEWqaWkvq+mQdQVrMPABsoRXcV3DRz6OJk
	 cDL7cy8oS7DwFa0gMtAAOE3E3BCxPbSiVd7OaJXpdYNVBraf/b3qQlOW46XHvUWpqe
	 w6RAMcBY7ZmwgIxjNaR6WOGxzLiAXmdnsCO/AfyYfwhzrp/ECXD638Ch6W1vTyfVV0
	 THbCfKGq3rIbAXx7+lyFyU2H9rIFFZ1orQwiDBxkRLjhoiTskB51l8JBvrnwmV66Wx
	 38eCTwa/+ZSyw==
Date: Fri, 16 May 2025 09:38:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Bo Liu <liubo03@inspur.com>
Cc: xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] erofs: support deflate decompress by using Intel QAT
Message-ID: <20250516163857.GA1241@sol>
References: <20250516082634.3801-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516082634.3801-1-liubo03@inspur.com>

On Fri, May 16, 2025 at 04:26:34AM -0400, Bo Liu wrote:
> +config EROFS_FS_ZIP_CRYPTO
> +	bool "EROFS hardware decompression support (crypto interface)"
> +	depends on EROFS_FS_ZIP
> +	help
> +	  Saying Y here includes support for reading EROFS file systems
> +	  containing crypto compressed data.  It gives better decompression
> +	  speed than the software-implemented compression, and it costs
> +	  lower CPU overhead.
> +
> +	  Crypto support is an experimental feature for now and so most
> +	  file systems will be readable without selecting this option.
> +
> +	  If unsure, say N.

I recommend not including the word "crypto" in any user facing part of this.

Compression algorithms are not cryptographic algorithms.  The fact that the
interface to access hardware compression accelerators is currently the "Crypto
API" is an implementation quirk.  It could be a different interface in the
future.

Call it something clear like "hardware decompression".

- Eric
