Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECF21C84AE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745553361; cv=none; b=T07x5R+2yAocTf6mrvypKnxFJI1XJf+GHWtnuy+N70rcQeOUH06XEtm5KUbQjgDL9DLCqLPvh+vWb/tVXPizfRo7e47cCKYjxILcdvQtuDZUh0x6zcXoUD1uGrp/DeRNkeSitSZn5ng+cABq1MgFuK7I6w4F9hrP2YH516Mtiss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745553361; c=relaxed/simple;
	bh=G0YI7JG7tgrmAp4+QMMK29Fb3O5aGpnXaNFPzGMBhes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F2Y9ONbzfk2Ghy+R6tkVM0u+0AjPhueVPAYJrM+0Ra2vYeoIa1Gm5CI/NhXrCHkEIXqORNEu5+AAVwQWTQExFVyumi3llKLd975M92iPZYq0V6dl7KKehoctHdt/yVzIIuyVPFsYaYr+U8CgIIRYc4KGGTgiwUJEMzABJR9OUac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=GAfE4lXf; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="GAfE4lXf"
Received: from [IPV6:2601:646:8081:1f93:ea4e:4f17:7bfa:1fa2] ([IPv6:2601:646:8081:1f93:ea4e:4f17:7bfa:1fa2])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P3tCDr2058181
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 24 Apr 2025 20:55:14 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P3tCDr2058181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745553321;
	bh=EWNAjFq7arbqFkiQR/chfn9kJ/Fk+c7GEOHNn2pEcP4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GAfE4lXfa6c70wUGYh56/End28SYtd5it3kMbJLKUJTmKLM8rIQhlcUaSS2d9v5vL
	 lQu8SmZhy1BnAeH0ttkPFgtDNojMjhHimz64pNGlM8cD1fVqKuJyX5y45CYYhoVW8g
	 sLglXciVEL6wJL5CykjO/9Q8yvg3Io2/yU/8k1+KNT/EBIuar0Ggg6SgSlW4iWU6S0
	 rpJGZ/d598XPI9ByuVjFgt6zNIeJ1VcEmZzw8MmQZXCr936eKyhCJQPytdMWkHNlHO
	 w71FqqitqWu8Q7+mkKlyCoBtwGcfl+SpxnxTjqrV1aT5EanykwYf+oyw8XehNrKy/q
	 UtWiRy4p8znjw==
Message-ID: <4632031c-fa17-48ac-a9ce-e6bbe1668da9@zytor.com>
Date: Thu, 24 Apr 2025 20:55:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/29] x86/boot/e820: Treat non-type-2 'reserved' E820
 region types as E820_TYPE_RESERVED
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        David Woodhouse <dwmw@amazon.co.uk>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-30-mingo@kernel.org>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20250421185210.3372306-30-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/21/25 11:52, Ingo Molnar wrote:
> Paul Menzel pointed out that ACPI specification 6.3 defines 'reserved'
> E820 region types as E820_TYPE_RESERVED (type 2):
> 
>   > Table 15-374 *Address Range Types* in the ACPI specification 6.3 says:
>   >
>   > > Reserved for future use. OSPM must treat any range of this type as if
>   > > the type returned was AddressRangeReserved.
> 
> This has relevance for device address regions, which on some firmware such
> as CoreBoot, get passed to Linux as type-13 - which the kernel
> treats as system regions and registers them as unavailable to drivers:
> 

... so we should handle 13 accordingly (and probably request that the 
ACPI committee permanently reserve it.  It would have been better to use 
negative numbers for OS-specific things.)

However, if we run into a value that we have never seen, say something 
like 84, we shouldn't assume that it is safe to do anything at all to 
it; in particular we really don't want to assume that it is safe to 
place I/O devices there.

Note that devices may be a priori set up in type 2 memory; it pretty 
much means "this device is treated specially by firmware, don't move it 
around or bad things will happen."

	-hpa

