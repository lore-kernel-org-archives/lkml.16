Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5FD1805E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739236223; cv=none; b=jtr2lKdeYQYqqXC1hNKtaSyibZpyWUNENRQlGfjZ1XSOzbeVDM1YErcuXb2RP+PjBLfa15j97n6rBkSRt3+H/Nv2PsGSOCUWcjxILNQeUcfukLwDdwuS6rAzXKBpIF7tFk4+brTkikegOAvw1ubGHkauzoc6kUMvu8kDihm+6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739236223; c=relaxed/simple;
	bh=6ZnD12+pw5XtWqBAV1nvIjBS3WXN9iny4Hba1svLY5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXul6NbOAHMu7BVOcifTPUlswe1s62eDKtoRi0hPc/AXc1ktBnb7vdSlnmUx0yNGcn+zBJ0xhKUA/qezZR4Eg32py20k3XnbrVNfX1hjuz+o0pSJU8C87h49AKHFnXsyP3zNjPcPkd3jcOx+Oxr8pIA8qDOct42kqZDi1EWivCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pw+ZPIxd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pw+ZPIxd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D00C4CED1;
	Tue, 11 Feb 2025 01:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739236222;
	bh=6ZnD12+pw5XtWqBAV1nvIjBS3WXN9iny4Hba1svLY5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pw+ZPIxdIPj8cwdvB+Uw1LlwVkf+n625bnJPx6uKHCmHA2Oc+geGVa3XF01Qg32lr
	 t3jjRWExypk/xiThqUM7vR52FJLTD3+Jx1eZXkXQ+JPdWjRuHYSiejAteimKGvn1Us
	 WO6n10JL6HFLKVxwmggytYrE7vmDKlCoXP6/gO35uGO3Uml7uU39lcPaxRy26+kdrF
	 8pX/Jx+UjbWbFGLcgXXiP78sUxy3LNPB2z0FsF+b7kanr8/IB9FIdbIXv8noZZyhYm
	 VHBJSpJn7Fib6en3W6NgOQDobLxZOrXDyJG1SZl+og5dDNQwxc40hmxZGmQ5BeYStL
	 sgn8Urqys3tkA==
Date: Mon, 10 Feb 2025 17:10:20 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/35] x86/bugs: Restructure ssb mitigation
Message-ID: <20250211011020.2aopcvfav7nrshft@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-17-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-17-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:56PM -0600, David Kaplan wrote:
> @@ -2272,15 +2280,6 @@ static enum ssb_mitigation __init __ssb_select_mitigation(void)
>  		}
>  	}
>  
> -	return mode;
> -}
> -
> -static void ssb_select_mitigation(void)
> -{
> -	ssb_mode = __ssb_select_mitigation();
> -
> -	if (boot_cpu_has_bug(X86_BUG_SPEC_STORE_BYPASS))
> -		pr_info("%s\n", ssb_strings[ssb_mode]);
>  }

Extra whitespace at end of function.

-- 
Josh
