Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4574A78F5E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 02:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744080696; cv=none; b=L78rqam2SOw/kCs93rGwiw3SIsQW7LWjq+IqP5pdNKzi6BVAbMIHOPUbjI7l5Rz+/mQW2dv0oGiHOCQ8YrVgs8EFWXukv+5qXB0bmcTpXZoPF6J8mwPnNtK40a0jfV/MzX+4pMHuIA1sCVveeyW0X1gA5uuG/hVkOBBVDesbyAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744080696; c=relaxed/simple;
	bh=Ik+LdWMaF8o8H1avWZeByXTNmquKpNLMRhUEWBst4T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rflcerpuXwaF7KwAGQVmK6DgTcNx1PSTU27tPGm0ntpdzOEzeL3t3VOwTddu1lBSnbbiyBsRUDxtaUH+e5H/8mW42ES/OP8WYsrscMXwef5dAFzjm5af2nw/tRdX63UQlz2QKIAcT+xMrsCPsp+t4XmyQd9oarF89f6YglWwxHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PC1fIXQC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PC1fIXQC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4357EC4CEDD;
	Tue,  8 Apr 2025 02:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744080695;
	bh=Ik+LdWMaF8o8H1avWZeByXTNmquKpNLMRhUEWBst4T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PC1fIXQCXYEacT6zxhs1TsW0HQYiirNw6s54m4/dQyebZkf8hUrQ7mT1HkOKH45IM
	 O0mmAPJYVU9bWJnvg5UpDr9MvfNvDbkydxtNnDrOeCJInLJE3064POSnk3n5SQdrUd
	 B1fFKS+SXB2yffVEiJQ4XTIixi8OHTUQVXphmhqOJj2NI1LoXRQJEo+CPPs/O1ev2F
	 v4ii/2/gDkpYGt9naptpUIcXVtxOdCpNf6RAmFHj+0EIsKQYJedd39T5+0QYIe8AfC
	 41dYtUL6yDFnvxkdclZIEZFG/vTMeoN2Rkror3f6YI4PSjFRR2O74YM1nnuYmR/x+E
	 mTQRD5CmKqlxg==
Date: Mon, 7 Apr 2025 19:51:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] x86/mm/pat: (un)track_pfn_copy() fix + improvements
Message-ID: <20250408025129.GA1168636@ax162>
References: <20250404124931.2255618-1-david@redhat.com>
 <Z_K5uW2eu7GInRxs@gmail.com>
 <630caa8e-2ee2-4895-9e4e-8bf2fa079100@redhat.com>
 <Z_QCYzEJXTnd97Sf@gmail.com>
 <4961949a-75db-4071-a478-fdc543c1dd28@stanley.mountain>
 <Z_QgoB381ltKBdbG@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_QgoB381ltKBdbG@gmail.com>

On Mon, Apr 07, 2025 at 08:59:44PM +0200, Ingo Molnar wrote:
> Good, although why is this compiler option named so weirdly in Clang:
> 
>   CC_AUTO_VAR_INIT_ZERO_ENABLER := -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
> 
> Hopefully it is named thusly because Clang has adopted GCC's 
> -ftrivial-auto-var-init=zero?

Clang did -ftrivial-auto-var-init first, where the original author added
both pattern and zero but intended to remove zero once pattern has been
optimized enough compared to zero (if I remember and understand
correctly), so the "enabler" flag was added to try and make that clear.
Eventually, Kees leveraged both Linus's stated desire for initializing
stack variables [1] and GCC 12 landing -ftrivial-auto-var-init=zero
without a separate enable option to deprecate the "enabler" flag in
clang 16 [2] and remove it altogether in clang 18 [3].

[1]: https://lore.kernel.org/CAHk-=wgTM+cN7zyUZacGQDv3DuuoA4LORNPWgb1Y_Z1p4iedNQ@mail.gmail.com/
[2]: https://github.com/llvm/llvm-project/commit/aef03c9b3bed5cef5a1940774b80128aefcb4095
[3]: https://github.com/llvm/llvm-project/commit/00e54d04ae2802d498741097d4b83e898bc99c5b

Cheers,
Nathan
