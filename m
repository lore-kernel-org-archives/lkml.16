Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D147C28936A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512190; cv=none; b=T/4lBAoDg66AgMA6Nx9Ar3TcFi9PUGFgNjQgyCNrtKU9TAnE5XIWuMKF1bXvjwcLVccqXs5ZmIFHf38hjPXQmiLhkXOn8bgta4hHPZSOPFUkN2f1+IZqiPlfcUMm6vMeZXvrs5N5H3s7KXzvcnn+ejFtafwqzoxRPybPCZQ1OWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512190; c=relaxed/simple;
	bh=ila73NDsaFxKFuhn/f9V3LdkrSpdRPd9KYG26wymKyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXxeR3wbRyxoLrpEfLtWZxqWYMh1yOwKgaSz1QKQ1QtiJ7Lj56bxDaEim5be4eaUK8IqhxhfMyKNYrJHCanaJBJ+yTbYdrdxh9SDV7nbIp54iD4XMdon+DTvMTNuDK9aXCCXSxUqHspbkuc+V/LC+oF5eM2uI26v0G1r0mMOLBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWvcHrUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWvcHrUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D907C4CEE3;
	Thu, 24 Apr 2025 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745512190;
	bh=ila73NDsaFxKFuhn/f9V3LdkrSpdRPd9KYG26wymKyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWvcHrUrHmpIBeVhBnzWJ2mhwRuZqxdNMNfzNVZp5jAOHmRY7oqeOgw3r1l6isg1Z
	 ExjJwJqaIH+rnH0TuGMwFPmCHFOOgNvLpjE/HJm1qg+kEueuGWSXzZxSRqgCsAc9Cm
	 4YhwnaFM38W89Gvnw6UsiTLZRaPd48ou3T0BdDQMSF5KcXONGFGNWIbsvr201xtVzy
	 jesUUstWt+mgeVp4w6CIoRPnCmupCGGDW9aEUqyl+0WPszLtyWPrqLVYajsu7nC26I
	 EQOSAli4FdtHyeFzChRZ9MGnjqTg7Xzdo96w/+J/ownwCFX0zYWi3MJUhmJzv3Ry+i
	 jbsPlEHqImvaA==
Date: Thu, 24 Apr 2025 18:29:46 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, phasta@kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] x86/boot: Work around broken busybox truncate tool
Message-ID: <aApm-lvBjREPOW47@gmail.com>
References: <20250424101917.1552527-2-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424101917.1552527-2-ardb+git@google.com>


* Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The GNU coreutils version of truncate, which is the original, accepts a
> % prefix for the -s size argument which means the file in question
> should be padded to a multiple of the given size. This is currently used
> to pad the setup block of bzImage to a multiple of 4k before appending
> the decompressor.
> 
> busybux reimplements truncate but does not support this idiom, and
> therefore fails the build since commit
> 
>   9c54baab4401 ("x86/boot: Drop CRC-32 checksum and the build tool that generates it")
> 
> Work around this by avoiding truncate altogether, and relying on dd to
> perform the padding.
> 
> Reported-by: <phasta@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> I personally think using a busybox environment for building the kernel
> is a terrible idea, and does not satisfy the build tool requirements
> listed in the documentation. But apparently, it used to work and now it
> doesn't, and the workaround is rather straight-forward.
> 
> IOW, I don't care whether this gets applied or not, so I will leave it
> to others to make the argument.

>  quiet_cmd_image = BUILD   $@
> -      cmd_image = cp $< $@; truncate -s %4K $@; cat $(obj)/vmlinux.bin >>$@
> +      cmd_image = (dd if=$< bs=4k conv=sync status=none; cat $(filter-out $<,$(real-prereqs))) >$@

So the workaround isn't too terrible, and since someone did trigger the 
bug, debugged it and reported it to us, it costs us very little to 
apply the workaround and (re-)enable someone's Linux build environment.

Also there's almost no existing usage of 'truncate' within the kernel 
build system. Found one only:

   drivers/firmware/efi/libstub/Makefile.zboot:			 truncate -s $$(hexdump -s16 -n4 -e '"%u"' $<) $@

Thanks,

	Ingo
