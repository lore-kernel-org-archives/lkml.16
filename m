Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420F25DCFE
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619571; cv=none; b=p024Heqir6MMYQg/LiiWxhqT+R6SzdH1VPZwu7HYxqhMBhjqRO2kl2uj+esk46zLFAxjCE9ycWxqv2wLqidTa9BaIlNSvfDbl6Jcns0jCApD5AevcaGaknlPvOCh270vIJfmtU7zUTiAA5lkK6T9aFNxRWts+Yx05orbKmXZVZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619571; c=relaxed/simple;
	bh=5PYQq9flUB/B85ax7GJ6DVCpLppA6FUrBFrM0euAV0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yjq1CoWbdUJMavu4qvWdKTyOqp0ACyNKWDQeatQYYgjr+MacBRhJ8dYMbr1ov4YBI2MYYObuHgaXjLqF+RTpl4MwxdMy4UdLYp/Lf/kCBufJYr+6y2Ilf6Ix3ttKTszvYyz07A6W2yrCMkJ9x2M5wRkiHZ1kpzayZSIonEqMXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TEovlvPC; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TEovlvPC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Wfi8zDqJeKm+TpJFOzJJcwP0H7sHmszS6OiiTXY8kN4=; b=TEovlvPCjbkfdh/+tLVWTQwbRY
	kQ6i1GdRE7WE6IewFS72g+H4B6BNlD7y0NAtdrnPJTTc5ZC0JeXYgBzdcJXsu1brvVcCaRQpr8Ri9
	Z+eEaStCh/OvbXKsJJE7JhVPrYqcZoKZVOoA7H4GzalUQ7uafP8Ia0LUSc+4I7UjViQji14tKVHus
	52KOSEJqfrSe2fkVh6S53jeJYufx7iZHL1VfENbpAGg06W1m5hh7wpdnt0IKenKXK0eQjCFq8H8H/
	1b/pcJ0av3AfPF0g3odG8hHVmDIqVLdm2WBy97VwqMDICugvPaxouA63S3NkewiwtWsVp7iOoiwyY
	+nhSvoiw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdW4-00000004E8Y-2h7R;
	Wed, 07 May 2025 12:04:48 +0000
Date: Wed, 7 May 2025 13:04:48 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@redhat.com, hannes@cmpxchg.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	ziy@nvidia.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: khugepaged: convert set_huge_pmd() to take a
 folio
Message-ID: <aBtMYHE9BgiT8nT-@casper.infradead.org>
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>

On Wed, May 07, 2025 at 05:26:12PM +0800, Baolin Wang wrote:
> @@ -1476,13 +1476,13 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
>  		.pmd = pmdp,
>  	};
>  
> -	VM_BUG_ON(!PageTransHuge(hpage));
> +	VM_BUG_ON(!folio_test_large(folio));

I don't think this is aterribly useful assertion to keep in a static
function with one caller, do you?

