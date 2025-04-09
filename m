Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD4325A2CF;
	Wed,  9 Apr 2025 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184428; cv=none; b=sU+TS2JFB1O+DkZpBz5eCQs0PCr03l6n3tuqdykzZML1zxspTe0tdcCa+yy3hTMfrm3zFfWSWH+EIhnkkDmdo5e6HCgPrO4E1lP13EszFRP0d9OdBuIOiLlAdPPs0shSZ/q5flJK1hhlxC8P6W0wJYzH7ifEb6XQJnEQJRFgvoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184428; c=relaxed/simple;
	bh=5A4/mVtb50kDqC+fC4moBuZWkZin2xvhttRQZOHCkWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h05mYgwhKahJD5dv+zI9VAAKElg1T6TKZQqzn3ZDJ/D6hULaERp0FtI/1rc1TA6DkxEtvxTrXGb9J/UpNYpIw80fYNH6p3AFh6Rb7yOax2tl0nuBv6zwLH03VbkUC4RhcMLQz67GpSKT2SwNrA3xlyrRz95gXun9bdfZNVAn4gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l1WJTwoH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l1WJTwoH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4893C4CEE3;
	Wed,  9 Apr 2025 07:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744184427;
	bh=5A4/mVtb50kDqC+fC4moBuZWkZin2xvhttRQZOHCkWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1WJTwoHZc3qjvmjY79LDqVw8yNPc7fXVIUSnszBy/x4qMn/nUHuqpBM3yPeH/6c9
	 hnEYfp9IjOqRmoM1eNivkI2JXhsZVibeFB4LgGY6tT6aTdhPS8L0O+V0Gmh8PGRVBk
	 cfWBpBRob3BewkrYvHs01eNtHjklIjGNUNHlurb4=
Date: Wed, 9 Apr 2025 09:38:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn,
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu
Subject: Re: [PATCH v5 4/4] rust: Add warn_on macro
Message-ID: <2025040954-prenatal-enamel-373f@gregkh>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
 <20250409065802.136971-5-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409065802.136971-5-fujita.tomonori@gmail.com>

On Wed, Apr 09, 2025 at 03:58:01PM +0900, FUJITA Tomonori wrote:
> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
> for x86_64/arm64/riscv.
> 
> The current Rust code simply wraps BUG() macro but doesn't provide the
> proper debug information. The BUG/WARN feature can only be used from
> assembly.
> 
> This uses the assembly code exported by the C side via ARCH_WARN_ASM
> macro. To avoid duplicating the assembly code, this approach follows
> the same strategy as the static branch code: it generates the assembly
> code for Rust using the C preprocessor at compile time.
> 
> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
> generate the assembly code; objtool's reachable anotation code. It's
> used for only architectures that use objtool.
> 
> For now, Loongarch and arm32 just use a wrapper for WARN macro.
> 
> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
> BUG/WARN functions implemented in C works.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

I don't object to this change, but I would STRONGLY recommend never
using this in any driver if at all possible.  Only use this if the
system is in such a state that the only way out is to reboot the kernel,
which is what both WARN() and BUG() will do.

Note, any way that a user can trigger either of these code paths will
result in a CVE, so don't do that either.  Almost always just properly
handle the issue and propagate up the error to the caller.

thanks,

gre gk-h
