Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C9D33062
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 01:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746147784; cv=none; b=KhYtsjTKiszyPYSc4TIHjWasxUCotTEuf3vZstUBuEdrtvkCYukx5GfAb+JuXcl+F1NRxo38N0FYZoa+EyLN8lftkGTxffATZeCl79wFew1Aw+OvhsMTh1GBFjAzr5nscWEzOCZqP0WYTOjJDbvzc9WRf7luxZBRc6FzzcgZLjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746147784; c=relaxed/simple;
	bh=pZ6oKDCA5Kf7RJiXDZG6hIiEfrnTuH/Cfd/Y1mQ1UU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bfCEPDposwStKQkiJSamHVIf6x3MPN4CcIZO4mw7VlpL9E3HGPtjJvozvQJKX5pQ6BV0j0BiShmZNKF/fwb2ymmwdAHYNyeKK/3AE5077xq+kvECqk4cQEjqPQJSLW+NB8Nb8+UzT+DC6YDHYx7b0OBBU547vDnYlScmVZ6okAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=fNeRE9nU; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="fNeRE9nU"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746147772; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5wOtn7+0eH5S9Osa2VOzYdwINzoQRtielagFITbsLqQ=;
	b=fNeRE9nUs1hI46BwO2txo00v+lHCRLoSUH4B4l+PRoUxhQwGkLxtqIQlSzgiMVVN/c/7nop0SBj2eCv4niWTasLO3jrMktFbVQTE2iNjD9fQVYJTvDdws4ch3F+CtSKli31P7PnOAjvbHWuzpaUKygdtFP8YQ0yPSVSPEVt3wnE=
Received: from 30.0.191.233(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WYtQLJQ_1746147769 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 02 May 2025 09:02:50 +0800
Message-ID: <57dc4929-268b-4f3f-a0f8-43d6ec85974f@linux.alibaba.com>
Date: Fri, 2 May 2025 09:02:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [PATCH v3 3/6] mm: shmem: add large folio
 support for tmpfs
To: Daniel Gomez <da.gomez@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: akpm@linux-foundation.org, hughd@google.com, willy@infradead.org,
 david@redhat.com, wangkefeng.wang@huawei.com, 21cnbao@gmail.com,
 ryan.roberts@arm.com, ioworker0@gmail.com, da.gomez@samsung.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Eero Tamminen <eero.t.tamminen@intel.com>
References: <cover.1732779148.git.baolin.wang@linux.alibaba.com>
 <035bf55fbdebeff65f5cb2cdb9907b7d632c3228.1732779148.git.baolin.wang@linux.alibaba.com>
 <aBEP-6iFhIC87zmb@intel.com>
 <ac8cbd8d-44e9-4a88-b88b-e29e9f30a2fd@linux.alibaba.com>
 <aBIHYqzar5J8uxGO@intel.com>
 <cxwpgygobg6wleoeezbowjhmid4mdhptzheqask44ew37h2q24@kryzkecuobbp>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <cxwpgygobg6wleoeezbowjhmid4mdhptzheqask44ew37h2q24@kryzkecuobbp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/30 21:24, Daniel Gomez wrote:
> On Wed, Apr 30, 2025 at 02:20:02PM +0100, Ville Syrjälä wrote:
>> On Wed, Apr 30, 2025 at 02:32:39PM +0800, Baolin Wang wrote:
>>> On 2025/4/30 01:44, Ville Syrjälä wrote:
>>>> On Thu, Nov 28, 2024 at 03:40:41PM +0800, Baolin Wang wrote:
>>>> Hi,
>>>>
>>>> This causes a huge regression in Intel iGPU texturing performance.
>>>
>>> Unfortunately, I don't have such platform to test it.
>>>
>>>>
>>>> I haven't had time to look at this in detail, but presumably the
>>>> problem is that we're no longer getting huge pages from our
>>>> private tmpfs mount (done in i915_gemfs_init()).
>>>
>>> IIUC, the i915 driver still limits the maximum write size to PAGE_SIZE
>>> in the shmem_pwrite(),
>>
>> pwrite is just one random way to write to objects, and probably
>> not something that's even used by current Mesa.
>>
>>> which prevents tmpfs from allocating large
>>> folios. As mentioned in the comments below, tmpfs like other file
>>> systems that support large folios, will allow getting a highest order
>>> hint based on the size of the write and fallocate paths, and then will
>>> attempt each allowable huge order.
>>>
>>> Therefore, I think the shmem_pwrite() function should be changed to
>>> remove the limitation that the write size cannot exceed PAGE_SIZE.
> 
> To enable mTHP on tmpfs, the necessary knobs must first be enabled in sysfs
> as they are not enabled by default IIRC (only THP, PMD level). Ville, I
> see i915_gemfs the huge=within_size mount option is passed. Can you confirm
> if /sys/kernel/mm/transparent_hugepage/hugepages-*/enabled are also marked as
> 'always' when the regression is found?

The tmpfs mount will not be controlled by 
'/sys/kernel/mm/transparent_hugepage/hugepages-*Kb/enabled' (except for 
the debugging options 'deny' and 'force').

> Even if these are enabled, the possible difference may be that before, i915 was
> using PMD pages (THP) always and now mTHP will be used, unless the file size is
> as big as the PMD page. I think the always mount option would also try to infer
> the size to actually give a proper order folio according to that size. Baolin,
> is that correct?

Right.

> And Ville, can you confirm if what i915 needs is to enable PMD-size allocations
> always?
