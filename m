Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A371F3D6F;
	Mon, 30 Jun 2025 03:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751253962; cv=none; b=r9GNOcN64Yb0by1981esp4c/Gom6Dyq4zhxFL27OdtWYKUWrs1/rnZCUOm5NZr3WSBozmvDfVdkFmg7z2fdJWbvKpHTlSI2Y4P3pLAJNkFaaSd3kIV1FBCxPaB/ERjMO9Z261AOBMFUnuDIZclXymDbaoBAk89g1ADTz3ptxd5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751253962; c=relaxed/simple;
	bh=nkFNFydvDXG5Ba98QcGrP++oQAGa50jqGrB/mKVqye8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GR0ZXixyHXz4914jjAVAEGxsoNyu4jDvCX8BMTPlql0901nkGDamphOt/Jc3AoEq6eDxwT5yQWe9V3JOOOCNDK5SqWHGbHIKJTnl8CvfhJaVwM3bIl83aJDm0BgSvbpkM4TfntXfuMYBEaOJyfa0wQrt8zk8/oRiJXX67EmaUts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eRPZO0o+; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eRPZO0o+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D9LHEGOvi+nMfrnlGssRdeQGgsXaJ7B/FFOO9D5QlG4=; b=eRPZO0o+rSjHzXopMavWA2E04J
	wtgEXuammFqYthm4EMJqoaLEUuWIL5aGcyYGWcRFu3D3aWWXW7eg6CRv+/8vOFJbe5WhWAyDlwQfF
	ksKpmDZoW+ZR3bLWctyj6iGITlfiGiDB5q/j4fdexykDj6svdU7fvmzTcKzPDiHv1S/4eWU0ZpKHb
	LfcPyVaBfhsk+4XrSoR6MHhFp2dbyxqRVVuxFTcQl4eR1uN25hx2ipCTqebrEd7iAar4ysuzg9msZ
	4qT1Iktw8DvJtjwOJOD9fSdqz2nf2UP0E9842VYnHP0Y1d/1dy5w7HYIYXUet3yzyDnI4GRrVY65V
	V9EP5fXg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW59J-00000006iaf-050U;
	Mon, 30 Jun 2025 03:25:43 +0000
Message-ID: <cc2207e4-2118-41be-bd35-97cbdbe85521@infradead.org>
Date: Sun, 29 Jun 2025 20:25:36 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/2] arm64: refactor the rodata=xxx
To: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net
Cc: patches@amperecomputing.com, cl@linux.com, yang@os.amperecomputing.com,
 akpm@linux-foundation.org, paulmck@kernel.org, rostedt@goodmis.org,
 Neeraj.Upadhyay@amd.com, bp@alien8.de, ardb@kernel.org,
 anshuman.khandual@arm.com, suzuki.poulose@arm.com, gshan@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250630030228.4221-1-shijie@os.amperecomputing.com>
 <20250630030228.4221-2-shijie@os.amperecomputing.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250630030228.4221-2-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/29/25 8:02 PM, Huang Shijie wrote:
> As per admin guide documentation, "rodata=on" should be the default on
> platforms. Documentation/admin-guide/kernel-parameters.txt describes
> these options as
> 
>    rodata=         [KNL,EARLY]
>            on      Mark read-only kernel memory as read-only (default).
>            off     Leave read-only kernel memory writable for debugging.
>            full    Mark read-only kernel memory and aliases as read-only
>                    [arm64]
> 
> But on arm64 platform, "rodata=full" is the default instead. This patch
> implements the following changes.
> 
>  - Make "rodata=on" behaviour same as the original "rodata=full"
>  - Make "rodata=noalias" (new) behaviour same as the original "rodata=on"
>  - Drop the original "rodata=full"
>  - Add comment for arch_parse_debug_rodata()
>  - Update kernel-parameters.txt as required
> 
> After this patch, the "rodata=on" will be the default on arm64 platform
> as well.
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  2 +-
>  arch/arm64/include/asm/setup.h                | 28 +++++++++++++++++--
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index ee0735c6b8e2..e0cd6dac26d3 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6354,7 +6354,7 @@
>  	rodata=		[KNL,EARLY]
>  		on	Mark read-only kernel memory as read-only (default).
>  		off	Leave read-only kernel memory writable for debugging.
> -		full	Mark read-only kernel memory and aliases as read-only
> +		noalias	Use more block mappings,may have better performance.

Add space after comma, please.                 ^

>  		        [arm64]
>  
>  	rockchip.usb_uart
> diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
> index ba269a7a3201..6b994d0881d1 100644
> --- a/arch/arm64/include/asm/setup.h
> +++ b/arch/arm64/include/asm/setup.h
> @@ -13,6 +13,30 @@
>  extern phys_addr_t __fdt_pointer __initdata;
>  extern u64 __cacheline_aligned boot_args[4];
>  
> +/*
> + * rodata=on (default)
> + *
> + *    This applies read-only attributes to VM areas and to the linear
> + *    alias of the backing pages as well. This prevents code or read-
> + *    only data from being modified (inadvertently or intentionally),
> + *    via another mapping for the same memory page.
> + *
> + *    But this might cause linear map region to be mapped down to base
> + *    pages, which may adversely affect performance in some cases.
> + *
> + * rodata=off
> + *
> + *    This provides more block mappings and contiguous hints for linear
> + *    map region which would minimize TLB footprint. This also leaves
> + *    read-only kernel memory writable for debugging.
> + *
> + * rodata=noalias
> + *
> + *    This provides more block mappings and contiguous hints for linear
> + *    map region which would minimize TLB footprint. This leaves the linear
> + *    alias of read-only mappings in the vmalloc space writeable, making
> + *    them susceptible to inadvertent modification by software.
> + */
>  static inline bool arch_parse_debug_rodata(char *arg)
>  {
>  	extern bool rodata_enabled;
> @@ -21,7 +45,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
>  	if (!arg)
>  		return false;
>  
> -	if (!strcmp(arg, "full")) {
> +	if (!strcmp(arg, "on")) {
>  		rodata_enabled = rodata_full = true;
>  		return true;
>  	}
> @@ -31,7 +55,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
>  		return true;
>  	}
>  
> -	if (!strcmp(arg, "on")) {
> +	if (!strcmp(arg, "noalias")) {
>  		rodata_enabled = true;
>  		rodata_full = false;
>  		return true;

-- 
~Randy

