Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1847C296169;
	Fri, 27 Jun 2025 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020866; cv=none; b=n7fMTjErXDhGS78Yqwhfmlc0uqLGfXQ83AG8MVc+pv+uiVpfESmONLrT7w1ANKVQM7xgf+CKdpDr3d1KPf5sNU1SZEU/6ByFgcft0cPyFl2I6PLJZAuh8h3j+PRvJa6ZW5yK4mfHQ4PT27qLpl1WfNDZyCJOV7fCq2qmXq8RPco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020866; c=relaxed/simple;
	bh=rzLraCNuwTpuf/DUAb7YKc3FNpCiMSkIclVF2DPCAuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9A3S2asQzcHXgG2sSisq+v5ZMvQHFWQFP6wFbL5A1gdyufxvvVe6bgSYxSvjxxIVZLeqRZgZMT/VMvZBFed7Lxb6ttBhccwVf9R0yHhU9u/gWHFZV6/slcmYXEHdEqtfZ351pPPbj6SP+RESa02KeC7jjiwhCLoUZMoetJzcK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M306hN6G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M306hN6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB27C4CEE3;
	Fri, 27 Jun 2025 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751020865;
	bh=rzLraCNuwTpuf/DUAb7YKc3FNpCiMSkIclVF2DPCAuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M306hN6Gbd1Gc0eJnFzf0djXisEUIKObApc/k5J1CV4qprjUwcg+Mz59+LP32KFL3
	 GYVIZADFbzS4qNopkBV8ktDgDogH1TqLRM1y/MZk9sPQhCUyZQsr4KvyaZHIvKqWFN
	 mhl7oc484C7kjweoDcz2qstW5s7qei8lNxdyaOZ3rdRft4GLVL086ncZw5xoGqJTjo
	 x35XKN5ZczLLlGin5ck3EhmjsUO/iqt3BbCXNyL4Y1dmvs+tXU2w2oSzlYFfTJ00bO
	 TFAUnUQc1kVBoYoxsusUX2G7iCw6Ssi1np9NmON3IZ6ATy9v3fhbAcFvfzf08x/yqD
	 3QMnYXhiNHz4w==
Date: Fri, 27 Jun 2025 12:41:01 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/4] mm/slub: allow to set node and align in k[v]realloc
Message-ID: <aF51PTZh0gRVFuYu@pollux>
References: <20250627092901.356909-1-vitaly.wool@konsulko.se>
 <20250627093714.402989-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627093714.402989-1-vitaly.wool@konsulko.se>

On Fri, Jun 27, 2025 at 11:37:14AM +0200, Vitaly Wool wrote:
> Reimplement k[v]realloc_node() to be able to set node and
> alignment should a user need to do so. In order to do that while
> retaining the maximal backward compatibility, the following rules
> are honored:
> * kmalloc/kzalloc/krealloc remain unchanged
> * kvmalloc/kvrealloc/kvcalloc remain unchanged
> * kvrealloc remains unchanged
> * kvrealloc_node is implemented as a new function taking align and
>   NUMA id as extra parameters compared to kvrealloc.
> * krealloc_node is implemented as a new function taking NUMA id
>   as an extra parameter compared to krealloc
> * kvmalloc_node/kvzalloc_node/kvcalloc_node get an extra parameter
>   (alignment)

I see what you're doing here:

You created vrealloc_node_noprof() in the previous patch, taking the following
arguments:

	vrealloc_node_noprof(const void *p, size_t size,
			     unsigned long align,
			     gfp_t flags, int nid)

And now you're aligning the newly introduced krealloc_node() and
kvrealloc_node() with that.

The idea for having an align argument on krealloc_node() simply is that it
fails if the alignment requirement can't be fulfilled by the corresponding
kmalloc bucket, such that we can fall back to vrealloc_node() in
kvrealloc_node().

Generally, this makes sense to me.

However, now you consequently have to add the align argument to kvmalloc_node(),
kvzalloc_node(), kvcalloc_node() as well.

This is what creates this huge diffstat changing all the users.

IMHO, the problem here was introduced already with vrealloc_node_noprof() taking
an align argument in your previous patch, since now you have to adjust
everything else to logically follow the same naming scheme.

Instead, I think you should introduce vrealloc_node_align(),
kvrealloc_node_align(), etc. This way no existing function signatures, such as
kvmalloc_node() have to be changed and no users have to be adjusted.

- Danilo
