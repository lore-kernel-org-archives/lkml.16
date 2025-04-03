Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94E024BBF3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679238; cv=none; b=paWqWfO0rAZfnG0gosBlah1/tq4K90Wzb21s0qYRp0aDzNCBRuYydbeoE7lYGgjuJ5GRXe52ydlBfLmgI+Lt6Da4R12NQRC5EUjMvw1MqARog661xwmcR951GGg6jwVkRaXrybBI4fW4AWxLJTm2vj+P2siTuo1YDO2ayupH3Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679238; c=relaxed/simple;
	bh=X/SyLeoANS34g/lp3+J2DRXD5Yj4/2j5Lj036FqX+QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+1i+WNhvmjogjvW/SQOERKZiwfubQ4y/LGW7O+6nab1Eg028PQmmj+GxzpvTNUnp9nP4rgJNMgT0XGoSjnyUBQwLps65+o0VhEqmPMNHLbXZpnDhjn+breqKTRd2Plw1vULEJYBvVy/4YpE5G3rPnWyxrBF0BlXfgMRSgDxZLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pzz7TVXC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pzz7TVXC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A3EC4CEE3;
	Thu,  3 Apr 2025 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743679238;
	bh=X/SyLeoANS34g/lp3+J2DRXD5Yj4/2j5Lj036FqX+QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pzz7TVXCtDisn5XSDpv4qUcrtcQgka6oDMMDGzrDg5mDLydxLlsxESyjlm/6GNCzl
	 MlBafeoctKlhoVavlXN0LMzrrxzL5lkUuJmJKvAQcYXppEMHBFv5iB0jqdgfL/lerP
	 bXf0aF9kB+PWZmzlehiON6NZQXrwhh0AyhU5dfdcRErF1eYTd4DePqLAOE3ipRiakO
	 Z0sZ6+aDfQTVQWpKaawt2GK+hbv6vqkyEy8Ka6oEGqjNgAXvY/NV6Jd2y9exlLHfCR
	 aviJ0ZB7qfi0e8KnAiAOeEUpeY0hn0oV9ZQI9ON78O/17a0MNtfaa3X4ZkhQTuMP7f
	 YFlMYidZjCN0Q==
Date: Thu, 3 Apr 2025 13:20:33 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -tip v2] x86/idle: Work around LLVM assembler bug with
 MONITOR and MWAIT insn
Message-ID: <Z-5vAThgDL9gts35@gmail.com>
References: <20250403091737.344149-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403091737.344149-1-ubizjak@gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> LLVM assembler is not able to assemble correct forms of MONITOR
> and MWAIT instructions with explicit operands:
> 
>   error: invalid operand for instruction
>           monitor %rax,%ecx,%edx
>                        ^~~~
> 
> Use instruction mnemonics with implicit operands to
> work around this issue.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Fixes: cd3b85b27542 ("x86/idle: Use MONITOR and MWAIT mnemonics in <asm/mwait.h>")
> Reported-by: kernel test robot <lkp@intel.com>

So I've zapped cd3b85b27542 instead - let's re-try it again and
see if there's any code generation tradeoffs vs. the byte encodings?

Thanks,

	Ingo
