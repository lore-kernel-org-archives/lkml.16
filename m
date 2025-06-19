Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E74E266580;
	Thu, 19 Jun 2025 13:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339578; cv=none; b=trJz0NjDkP5AZXiVGrpqWkd+CSOdm+P9egw84Jawzeb5/HW7U4b4VxGH4CqqHfq5u+zNfWmiKkITvwkpUJzjpW/FQIjzBy93CrtiDLu5RfRHExS1yyDxBdYSbj9BALPAZh5/ISLfgamCb7hy0n1dNp+pD/dIOD9Ogniv7P48XWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339578; c=relaxed/simple;
	bh=KGEyud7L2TQo6xGQ56ztqBTO8TL7Cn2i0cLKJZ5YetI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izwqQ86FkwkH8aHxFsL+UUhMKX8Ce5l5VGBkIQGe5b9iVCyAspkAcuYNPkc/R+P/8zMz7eXg3oc+i3KXWfv8q7ym9W8lI2EnimDBjFudBLCTHNaWwWdfhfFJ74l/HxMRRMeWhnC5xe+ZgAJJxyI3Upd9w5XGEaMDABfgbyoXakU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=H+XuEpV5; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="H+XuEpV5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mUtH47jkNHTUfdWVtm4j/G1WRt46Af+dgwGJAdSFHtQ=; b=H+XuEpV5mXnE+WB6V7UySKtgBl
	jqlZGGTOTkFX1Hbpt4yp+nmMHmGCWmKd0DiFq93xPfzIs3qKQBKIbfnSZ1KEsxoQWFzCmqv3KObQe
	Rcoh9gz8uQYxkLVVe7rvm+q5C7K1eqkqeS9cOB2ePUwQJugdCPVGtRGRhILFu1twhnzr3lqfaccvY
	ElgkuMCMyfpfOyDqYaESt0G6UlcGlKQ3JYo3RjG9LUfXV0WPRGyQnMhUAeREXObQ7KenW44HnFqN/
	jGL+tnqNBWTiGWQV6TWSKY1NwF8ThwNrQIoWW5SIQ4jQTlAiCrOnAtKg8lNvUuV0fonmpm1lKmvLL
	BkKgnqeQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFHM-00000008p7G-1NVS;
	Thu, 19 Jun 2025 13:26:08 +0000
Date: Thu, 19 Jun 2025 14:26:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <aFQP8LzVMctf6XH5@casper.infradead.org>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618041235.1716143-2-anshuman.khandual@arm.com>

On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:
> +++ b/mm/memory.c
> @@ -522,9 +522,8 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
>  	mapping = vma->vm_file ? vma->vm_file->f_mapping : NULL;
>  	index = linear_page_index(vma, addr);
>  
> -	pr_alert("BUG: Bad page map in process %s  pte:%08llx pmd:%08llx\n",
> -		 current->comm,
> -		 (long long)pte_val(pte), (long long)pmd_val(*pmd));
> +	pr_alert("BUG: Bad page map in process %s  pte:%ppte pmd:%ppte\n",
> +		 current->comm, &pte, pmd);

Unfortunately, the one example you've converted shows why this is a bad
idea.  You're passing a pmd_t pointer to a function which is assuming a
pte_t pointer.  And a pmd_t and a pte_t are sometimes different sizes!
(eg sometimes one is 64 bit and the other 32 bit).

So no, NACK.

