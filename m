Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F71275856
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911806; cv=none; b=J8LPDs1tH4IY/C+j5SumEGYHTmz5+YVI+snSqKveqJMDqQoz7zRihfzug4VCekfk20NjbKT6B58OQO0nbrY3LdudRf64ceqxXtbP/T9vLBiVvgN0OBLNEFOvXrOZ5kPQfqlgREBgJamv91eernB0RGCxSK3JYGLIG7f2Qz7VqzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911806; c=relaxed/simple;
	bh=DdqW1DSi43i5j7MIc7NAsvx6XJOuH9J0WeUBO3yn7+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=padyXAohPXWPlIMHSpaH1PTDuQt65OtuRdcIwNnYQ7DPnYu5zLYceNHZZATqt6N/FMmCcuEkcaQOA/zW01Bzi4yoMai3ZCLBud2wIOUTuXkh91/mWxFHNJBNUToVMfYxqZnwk26XhxO30O1H/UGtdHGvy8m8EkEs1r9ukaXuELA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGFpLDyj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGFpLDyj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E6CC4CEE3;
	Tue, 29 Apr 2025 07:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745911805;
	bh=DdqW1DSi43i5j7MIc7NAsvx6XJOuH9J0WeUBO3yn7+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGFpLDyjQZSIcRLtlySHs5HUpYJh6aGm6SjGsEz2wkX2sVOuscJjh5kOLb/oeXRYI
	 l8IDQz7K9Zjw7sgcQdzXYkVLt3S2lXR/81f8Rz3Aamu6A7LKlbrDUexz+StM+mCMAk
	 y5LxM68R/KxJGoxvMl3moLFkAe5pBt+urWf9Vbz8oMbl19ZwAql1CJS7NvpY/9CVmx
	 NJxa8Gpe7crYdEJKrIkVyORrmT4mDtiUREubS69hhPGRw2/IUsFXQVBaoiJEZu/jPM
	 sbOFGImnmQbs4GtprZu8e8Cq4kOY1vLczZALemyC904SflMPqZ2tCW+SNYz1P48I3A
	 z1uFPMO5E5Fwg==
Date: Tue, 29 Apr 2025 10:29:58 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, david@redhat.com, harry.yoo@oracle.com,
	riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
Subject: Re: [PATCH 2/3] mm/debug_page_alloc: improve error message for
 invalid guardpage minorder
Message-ID: <aBB_9lCUGpD1uKif@kernel.org>
References: <20250427100442.958352-1-ye.liu@linux.dev>
 <20250427100442.958352-3-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427100442.958352-3-ye.liu@linux.dev>

On Sun, Apr 27, 2025 at 06:04:41PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> When an invalid debug_guardpage_minorder value is provided, include the
> user input in the error message. This helps users and developers diagnose
> configuration issues more easily.
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/debug_page_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/debug_page_alloc.c b/mm/debug_page_alloc.c
> index d46acf989dde..6a26eca546c3 100644
> --- a/mm/debug_page_alloc.c
> +++ b/mm/debug_page_alloc.c
> @@ -23,7 +23,7 @@ static int __init debug_guardpage_minorder_setup(char *buf)
>  	unsigned long res;
>  
>  	if (kstrtoul(buf, 10, &res) < 0 ||  res > MAX_PAGE_ORDER / 2) {
> -		pr_err("Bad debug_guardpage_minorder value\n");
> +		pr_err("Bad debug_guardpage_minorder value: %s\n", buf);
>  		return 0;
>  	}
>  	_debug_guardpage_minorder = res;
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.
