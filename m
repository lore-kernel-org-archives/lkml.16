Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C625EFBD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413606; cv=none; b=JZ6hPvinWmnXpCoGFokUQOs9BTawaoQPGuHWqiKjBVemN01eZ6EPKmwBrpVJbkMdOaxEqS8hVi5JlmGEiv6vPrOxxvvy3xF7J5AKvHAYcOPZHpyIQUa1zZlcAdKxV1o3Lhut4IMlmDYZV/csJrJLzf5/Sg2KW/N7eW3LbRG3w10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413606; c=relaxed/simple;
	bh=J8v50XXcHs2LqKAUBjBc6/S9CP1OrS9SIRED0TDTwp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ISA0XNcGS9lXERAkbPFkYwiYZ4qjmCxjbem4bm2MngqybkvVdR72h+MJvX2F/jBzcahjjheiMJ4UQ4ekqrfebpYqpCEzKcn7kL5xGWf7KeZSvJbSEajLPunTTFcjiQ2PMMENInizzMS1wAvvmVCyZH6ymCt0WhGFQPcTNvCW04U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=MHtOtQFC; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="MHtOtQFC"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750413595; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=4cnI0OaEuBfKBwhMYC30kL+gQC7VbBBAf/kqL/GN16A=;
	b=MHtOtQFCAbRUjsomsb2aMTx5aXehYrCsh124XQREz2TkRczC5oOi0SGOVr5pt/d+MKJudV6MmYK/xL/VfopFQ4gUkt+JJKkXnJOEEg4Rqcz+YTKpGFlIxv/Aj9nkBz22Tl3LgMrBz6MpIxIktuOXcA2mAHriNGUOW5WMbAqlJ9M=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WeKSK1H_1750413592 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Jun 2025 17:59:53 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Bharata B Rao <bharata@amd.com>
Cc: linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  Jonathan.Cameron@huawei.com,  dave.hansen@intel.com,  gourry@gourry.net,
  hannes@cmpxchg.org,  mgorman@techsingularity.net,  mingo@redhat.com,
  peterz@infradead.org,  raghavendra.kt@amd.com,  riel@surriel.com,
  rientjes@google.com,  sj@kernel.org,  weixugc@google.com,
  willy@infradead.org,  ziy@nvidia.com,  dave@stgolabs.net,
  nifan.cxl@gmail.com,  xuezhengchu@huawei.com,  yiannis@zptcorp.com,
  akpm@linux-foundation.org,  david@redhat.com
Subject: Re: [RFC PATCH v1 0/4] Kernel thread based async batch migration
In-Reply-To: <cc947beb-2b4c-459a-a388-fe020856f523@amd.com> (Bharata B. Rao's
	message of "Fri, 20 Jun 2025 14:28:33 +0530")
References: <20250616133931.206626-1-bharata@amd.com>
	<87bjqi3ohx.fsf@DESKTOP-5N7EMDA>
	<cc947beb-2b4c-459a-a388-fe020856f523@amd.com>
Date: Fri, 20 Jun 2025 17:59:52 +0800
Message-ID: <87zfe220o7.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Bharata B Rao <bharata@amd.com> writes:

> On 20-Jun-25 12:09 PM, Huang, Ying wrote:
>> Bharata B Rao <bharata@amd.com> writes:
>> <snip>
>> 
>> I don't think page flag + scanning is a good idea.If the
>
> If extended page flags is not the ideal location (I chose it in this
> version only to get something going quickly), we can look at maintaining
> per-pfn allocation for the required hot page metadata separately.
>
> Or is your concern specifically with scanning? What problems do you
> see?
>
> It is the cost or the possibility of not identifying the migrate-ready
> pages in time? Or something else??

We may need to scan a large number of pages to identify a page to
promote.  This will waste CPU cycles and pollute cache.

---
Best Regards,
Huang, Ying
