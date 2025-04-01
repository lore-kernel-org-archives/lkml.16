Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF1928E0F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743541779; cv=none; b=aHex7eArtVrcDnzumnLIDsLLjoaIln99OrE4BMQOy3XQTvcsHc/PfmkHAtARgJRYgzqd/O/qiJNjG9aPACREkI9E3DAIobVUfMihajnVg85tFdrVvobFUFhb9ViBoZgzRSj2TgHk5gpWomZ6FzFseeo+t6KU4wlz/HgUWx22KkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743541779; c=relaxed/simple;
	bh=g/G+eELwpWY77gtLoCFC2tBGw0PqTU+QAnrfU5ji81E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DB+06XkHcRLn/1UbGsayPXOCGk1StUW8jV6KYseqrAdekDjzC8v5YJrSzaIXEr+JM2yTCEj/ITSNmfKG2eaWBrAmqzf1WjpcD3zh9zFbkhUFmT6K5h+x8Give9Ozwth72e4WdVZfWFR4RXM7QzVj5xc2RVLa1ZJHLjgxxXNgmBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=U9FAPaRP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U9FAPaRP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25B0C4CEE4;
	Tue,  1 Apr 2025 21:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743541778;
	bh=g/G+eELwpWY77gtLoCFC2tBGw0PqTU+QAnrfU5ji81E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U9FAPaRPiRo/5rzbNux9QLswWSjCfjH+EmFPZS8VFR8N3kL6gUsAZuvgFagXWMbEs
	 hd50Zv8mX9t+0nE/iCJRnycm/PyaBvPL7ZX1i5iAfsaq28KCgZURpCq9E0ORSe1sIm
	 CCAG8x/QiYuAZxaYIbSnDNwTzp5UC16sFCdLXb58=
Date: Tue, 1 Apr 2025 14:09:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/khugepaged: fix a tracepoint for error cases
Message-Id: <20250401140938.34993d9922eb1e71ba2b2ff8@linux-foundation.org>
In-Reply-To: <20250401202354.103501-2-sweettea-kernel@dorminy.me>
References: <20250401202354.103501-2-sweettea-kernel@dorminy.me>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Apr 2025 16:23:53 -0400 Sweet Tea Dorminy <sweettea-kernel@dorminy.me> wrote:

> Fix a potential NULL pointer dereference in trace_mm_khugepaged_scan_pmd()
> when folio is NULL. This is possible if vm_normal_page() returned a NULL
> page -- which is unlikely, but was hit in testing.
> 
> (The tracepoint in include/trace/events/huge_memory.h can already deal
> with a NULL page.)
>
> ...
>
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1435,8 +1435,9 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
>  		*mmap_locked = false;
>  	}
>  out:
> -	trace_mm_khugepaged_scan_pmd(mm, &folio->page, writable, referenced,
> -				     none_or_zero, result, unmapped);
> +	trace_mm_khugepaged_scan_pmd(mm, folio ? &folio->page : NULL,
> +				     writable, referenced, none_or_zero,
> +				     result, unmapped);
>  	return result;

Confused.  If folio==NULL then &folio->page==NULL also.  The patch
appears to be a no-op?

Do you have the messages from that oops?
