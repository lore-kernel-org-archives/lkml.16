Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AA12BF01D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082713; cv=none; b=LFLlLmM5T13L0IMyqBPhjBA0ks0EFnbnkdD1utYL5XMVckVfFJH1tH3nl2D7G4QrqnVvEWqp3mpe6jRFDGD5P9Kd4IQLJZvhQCgDxpa8+rLDdjEbQol1oH5/wzEg8KEnAfOpbbY92agcmTcJzeyjA2rcLy14CGFj5Wjiq4GKagc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082713; c=relaxed/simple;
	bh=L8vQ3I4VJGuwWWHA+MJLP7s0du2smcuCkpmuJZ0wJJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7bT3ufCmxw91s/qHwm+cdTGJD+gRUlrU9jzRVL5nthYpJFnJrDZGg+ndaUBf2bDiQxfNcNC3fR4qAHNCclpDzTbwsFOe6em8qDRlijfgsm0Rl95SDnaADDwLeq+k66vL6gJxFwGtTKwfB2vcza/Nw8l0Az1ZQno0fMAwrxFZ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NW13Dbds; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NW13Dbds"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XS3V7730bTf/a5ZGqsr+M+19qnFS58dfuOB9on14iuw=; b=NW13DbdsF9a7Njdxel60Ea3I6h
	rGVtFsZxqY78aLCQHPfu1+dFP0ZMzRDUVmjVVV0hoan7eRs1yTtLQTv5Jmr+AEMvUrIh1DqJCN4zV
	KWIMRZxGtpwNr6Q9qV/0vdTpVm3SEhVnq+auaorFxjpTSU2JfcwJ822fLvUGRlZgj/fhivoyadvlN
	Bv9jdujO/YMuGkOFgr4L42WfElZWZsRpOL4/JmS1bvHGzm1S88DIptceg6Y/fddPo2WIBXjPMr7y8
	BkbfQNORSwKrjdSb+ShLM8F1fDgKvMwtXwMNl89fNLMHAilHX5oce1OQHexjdWtOc1pFxmrKyGqbT
	jPrtMXnw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRASO-0000000G1Xl-1KQa;
	Mon, 16 Jun 2025 14:05:04 +0000
Date: Mon, 16 Jun 2025 15:05:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Bharata B Rao <bharata@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
	gourry@gourry.net, hannes@cmpxchg.org, mgorman@techsingularity.net,
	mingo@redhat.com, peterz@infradead.org, raghavendra.kt@amd.com,
	riel@surriel.com, rientjes@google.com, sj@kernel.org,
	weixugc@google.com, ying.huang@linux.alibaba.com, ziy@nvidia.com,
	dave@stgolabs.net, nifan.cxl@gmail.com, xuezhengchu@huawei.com,
	yiannis@zptcorp.com, akpm@linux-foundation.org, david@redhat.com
Subject: page_ext and memdescs
Message-ID: <aFAkkOzJius6XiO6@casper.infradead.org>
References: <20250616133931.206626-1-bharata@amd.com>
 <20250616133931.206626-4-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616133931.206626-4-bharata@amd.com>

On Mon, Jun 16, 2025 at 07:09:30PM +0530, Bharata B Rao wrote:
> diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
> index 76c817162d2f..4300c9dbafec 100644
> --- a/include/linux/page_ext.h
> +++ b/include/linux/page_ext.h
> @@ -40,8 +40,25 @@ enum page_ext_flags {
>  	PAGE_EXT_YOUNG,
>  	PAGE_EXT_IDLE,
>  #endif
> +	/*
> +	 * 32 bits following this are used by the migrator.
> +	 * The next available bit position is 33.
> +	 */
> +	PAGE_EXT_MIGRATE_READY,
>  };
>  
> +#define PAGE_EXT_MIG_NID_WIDTH	10
> +#define PAGE_EXT_MIG_FREQ_WIDTH	3
> +#define PAGE_EXT_MIG_TIME_WIDTH	18
> +
> +#define PAGE_EXT_MIG_NID_SHIFT	(PAGE_EXT_MIGRATE_READY + 1)
> +#define PAGE_EXT_MIG_FREQ_SHIFT	(PAGE_EXT_MIG_NID_SHIFT + PAGE_EXT_MIG_NID_WIDTH)
> +#define PAGE_EXT_MIG_TIME_SHIFT	(PAGE_EXT_MIG_FREQ_SHIFT + PAGE_EXT_MIG_FREQ_WIDTH)
> +
> +#define PAGE_EXT_MIG_NID_MASK	((1UL << PAGE_EXT_MIG_NID_SHIFT) - 1)
> +#define PAGE_EXT_MIG_FREQ_MASK	((1UL << PAGE_EXT_MIG_FREQ_SHIFT) - 1)
> +#define PAGE_EXT_MIG_TIME_MASK	((1UL << PAGE_EXT_MIG_TIME_SHIFT) - 1)

OK, so we need to have a conversation about page_ext.  Sorry this is
happening to you.  I've kind of skipped over page_ext when talking
about folios and memdescs up to now, so it's not that you've missed
anything.

As the comment says,

 * Page Extension can be considered as an extended mem_map.

and we need to do this because we don't want to grow struct page beyond
64 bytes.  But memdescs are dynamically allocated, so we don't need
page_ext any more, and all that code can go away.

lib/alloc_tag.c:struct page_ext_operations page_alloc_tagging_ops = {
mm/page_ext.c:static struct page_ext_operations page_idle_ops __initdata = {
mm/page_ext.c:static struct page_ext_operations *page_ext_ops[] __initdata = {
mm/page_owner.c:struct page_ext_operations page_owner_ops = {
mm/page_table_check.c:struct page_ext_operations page_table_check_ops = {

I think all of these are actually per-memdesc thangs and not per-page
things, so we can get rid of them all.  That means I don't want to see
new per-page data being added to page_ext.

So, what's this really used for?  It seems like it's really
per-allocation, not per-page.  Does it need to be preserved across
alloc/free or can it be reset at free time?
