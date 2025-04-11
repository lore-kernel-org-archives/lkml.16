Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C513E27BF9A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744338745; cv=none; b=RiCiBTL/BjLrWuK71eB62hQr+ytk4CIvuCaSPh9s16Z2RNA/lWG6nuLNWy2yWINEXEjUZ16iVrRe/7utvKKCSJ6kkidTmo6RzKcmNxiq839HKmf5AiiWNKdhMj5b43BHb2+Su/p8fYAHf60lj1NCyXhv8QfoyMKX3WafVuRYahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744338745; c=relaxed/simple;
	bh=UB8LKThtVBnJDF+n48L8Fijl+lGomrgoYCRKp/i8I0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBJUw6NCQZ2NG+DHUg0sTxvxepCZzaq/oRDUyDLxPPZTGz+NjaDPIlg/tWSGOCrndv0JfRp4R7sTPNUXlRPcHE9zjOj7GcF8bKqAhBqolQIMwOolqz7NWvtFTS5uA6HhHfrldhMo8m4PS52SoQKUxau/2QX1erKWgX9hWkrQwAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVf0cNqL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVf0cNqL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491EBC4CEDD;
	Fri, 11 Apr 2025 02:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744338745;
	bh=UB8LKThtVBnJDF+n48L8Fijl+lGomrgoYCRKp/i8I0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVf0cNqLzQpmeldSV8ZJgCdK8HXbWR947tl8x5sgLQVNGnBr0pXC/trqNlrNOjm8b
	 yv1cgdNrBpUFA3oHFKhYXMNFWi2MYLMuyYprzMep1X9eCIOEFLhIrU7qEffrVvYs6h
	 /dVjI1GOmXaG9B0FWEnR/Sdo5IWsWhxvuShAACk7xZFO++Sb1nSEUWiSt93yHh+5o6
	 wnwiMfyRj2AWiFyGCAX8nkPzqdg0feTICxvIFeWE8vuS7XE7670cI+1RF1jFSx8RiM
	 Kxy1f6EbOv5Kir/ILiFbBU3Xv84KdcTezrbFux1aA9tFRzQx1HDkX8A0HyCYRSWymq
	 K8D0rdvlmv8MQ==
Date: Thu, 10 Apr 2025 19:32:22 -0700
From: Kees Cook <kees@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: dave.hansen@linux.intel.com, Nikolay Borisov <nik.borisov@suse.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] devmem: Block mmap access when read/write access
 is restricted
Message-ID: <202504101926.0F8FB73@keescook>
References: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
 <174433455090.924142.10859114556652046264.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174433455090.924142.10859114556652046264.stgit@dwillia2-xfh.jf.intel.com>

On Thu, Apr 10, 2025 at 06:22:30PM -0700, Dan Williams wrote:
> Back in 2022 Kees noted that he is able to mmap System RAM below 1MB
> even with CONFIG_STRICT_DEVMEM=y [1]. That is allowed for x86 legacy
> compatibility reasons for userspace that wants to read BIOS data
> resident at that address. However, the expectation is that when
> devmem_is_allowed() returns 2 that the access is redirected to return
> zeroes.
> 
> That happens for the read()/write() case, but by code inspection for
> mmap(), there is no restriction.
> 
> Now, the confidential x86 VM (CVM) use case wants to depend on
> "devmem_is_allowed() == 2" guaranteeing that no mapping to potentially
> encrypted memory is established [2]. The options to enable that are
> teach mmap_mem() to meet the "zeroed buffer" implication of
> devmem_is_allowed() returning "2", or return -EPERM for that case.
> 
> Return -EPERM on the hope that userspace does not actually depend on the
> legacy behavior of being able to reliably map the first 1MB of memory on
> x86. I.e. that all legacy cases are using read()/write() to safely read
> zeroes. If that turns out not to be true then either a "map zeroes"
> scheme can be added, or the CVM case can return 3 from
> devmem_is_allowed() to hide the CVM restriction from legacy
> environments.
> 
> Link: http://lore.kernel.org/CAPcyv4iVt=peUAk1qx_EfKn7aGJM=XwRUpJftBhkUgQEti2bJA@mail.gmail.com [1]
> Link: http://lore.kernel.org/fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com [2]
> Suggested-by: Nikolay Borisov <nik.borisov@suse.com>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  include/linux/io.h |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/io.h b/include/linux/io.h
> index 0642c7ee41db..564934f7e70d 100644
> --- a/include/linux/io.h
> +++ b/include/linux/io.h
> @@ -191,7 +191,12 @@ static inline int range_is_allowed(unsigned long pfn, unsigned long size)
>  	u64 cursor = from;
>  
>  	while (cursor < to) {
> -		if (!devmem_is_allowed(pfn))
> +		/*
> +		 * Any restricted access is treated as "no access", i.e.
> +		 * handle devmem_is_allowed() returning "2" to indicate
> +		 * restricted access.
> +		 */
> +		if (devmem_is_allowed(pfn) != 1)
>  			return 0;
>  		cursor += PAGE_SIZE;
>  		pfn++;

Looking through the 16 page of Debian Code Search results for
`open("/dev/mem")`, I find a LOT of mmap() use. Some random examples:

https://sources.debian.org/src/i810switch/0.6.5-7.1/i810switch.c/?hl=413#L402

https://sources.debian.org/src/radeontop/1.4-2/detect.c/?hl=91#L88

https://sources.debian.org/src/libdebian-installer/0.125/src/system/subarch-x86-linux.c/?hl=113#L93
Which includes this gem of a comment, implying that it uses mmap
_specifically to bypass the devmem restrictions_:
	/* Please note that we don't use mmap() for performance reasons here,
	 * but to workaround problems many people encountered when trying
	 * to read from /dev/mem using regular read() calls.
	 */

I don't think we can just fail the mmap. :(

-- 
Kees Cook
