Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B8B248F69;
	Wed, 30 Apr 2025 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019447; cv=none; b=JZyJ0zqZrag/ANXyYzO249JqKoc+tNARG1ZxkTpsANSXGgY3x2XensE6Kix2bBD97SyCSZKUYeQoztQNlN3NkyW2KAI+RNdUVufgHiUasnFnMqNSZ6DCfoyY5MEv+un2BolXpq9F1X9+LscRV0m8OonzngMAG45vNjUCBBQ0aqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019447; c=relaxed/simple;
	bh=4Nc6GDztxDnf1w4KqVdi+LzpveRRgp4sfrwZ+0SHHS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMuwAHbmFshrPzQtXdhAaD/1NgnpZypphzzL2YU2AxQB9jjxBUsI+KiYfZvL2/xCKGuXVVk8yDVDT/31yelZSILYUhk66UoaHOkcZqz5UTjyfnSytV2aMzUMFyS2gX72MJX4hisMrbzYpWGqtha/adtzRF1dhQBVOVLtFVpGzrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vjd0LIB0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vjd0LIB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D40C4CEE9;
	Wed, 30 Apr 2025 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746019446;
	bh=4Nc6GDztxDnf1w4KqVdi+LzpveRRgp4sfrwZ+0SHHS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vjd0LIB0sgnkdhpcz4kpRBtnO+wtfuCiN5i4BEnIynkhHoW8goJk9P83j2stkksMJ
	 g3zYhaQhOeihgkEd6GcpZOV0jW/TB9ubFWPBi4caCRtCQpzXA2ONW9/it5zJkamFH3
	 phDIOZOi6HIXsOWDQa6wYWAAhd9z3A7+iUVgbNF7NDNyKOi/CQFWcjhg7TWDeuZeK3
	 rqfxQpJIZYfRYLcGYKbYDhlSPjfgvG6+LyZVfNIWKSvpMhFUbzPdP9N8UYqq51IKaM
	 ZT+rLuVYi2BZHHU2K19J5ywKPO9w7pZxLKtvTGTqplHPDevcjuqhSmtlp9fmxM4TPJ
	 Ux5DDc86qPSJg==
Date: Wed, 30 Apr 2025 15:24:03 +0200
From: Daniel Gomez <da.gomez@kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
	hughd@google.com, willy@infradead.org, david@redhat.com, 
	wangkefeng.wang@huawei.com, 21cnbao@gmail.com, ryan.roberts@arm.com, ioworker0@gmail.com, 
	da.gomez@samsung.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	Eero Tamminen <eero.t.tamminen@intel.com>
Subject: Re: [REGRESSION] Re: [PATCH v3 3/6] mm: shmem: add large folio
 support for tmpfs
Message-ID: <cxwpgygobg6wleoeezbowjhmid4mdhptzheqask44ew37h2q24@kryzkecuobbp>
References: <cover.1732779148.git.baolin.wang@linux.alibaba.com>
 <035bf55fbdebeff65f5cb2cdb9907b7d632c3228.1732779148.git.baolin.wang@linux.alibaba.com>
 <aBEP-6iFhIC87zmb@intel.com>
 <ac8cbd8d-44e9-4a88-b88b-e29e9f30a2fd@linux.alibaba.com>
 <aBIHYqzar5J8uxGO@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBIHYqzar5J8uxGO@intel.com>

On Wed, Apr 30, 2025 at 02:20:02PM +0100, Ville Syrjälä wrote:
> On Wed, Apr 30, 2025 at 02:32:39PM +0800, Baolin Wang wrote:
> > On 2025/4/30 01:44, Ville Syrjälä wrote:
> > > On Thu, Nov 28, 2024 at 03:40:41PM +0800, Baolin Wang wrote:
> > > Hi,
> > > 
> > > This causes a huge regression in Intel iGPU texturing performance.
> > 
> > Unfortunately, I don't have such platform to test it.
> > 
> > > 
> > > I haven't had time to look at this in detail, but presumably the
> > > problem is that we're no longer getting huge pages from our
> > > private tmpfs mount (done in i915_gemfs_init()).
> > 
> > IIUC, the i915 driver still limits the maximum write size to PAGE_SIZE 
> > in the shmem_pwrite(),
> 
> pwrite is just one random way to write to objects, and probably
> not something that's even used by current Mesa.
> 
> > which prevents tmpfs from allocating large 
> > folios. As mentioned in the comments below, tmpfs like other file 
> > systems that support large folios, will allow getting a highest order 
> > hint based on the size of the write and fallocate paths, and then will 
> > attempt each allowable huge order.
> > 
> > Therefore, I think the shmem_pwrite() function should be changed to 
> > remove the limitation that the write size cannot exceed PAGE_SIZE.

To enable mTHP on tmpfs, the necessary knobs must first be enabled in sysfs
as they are not enabled by default IIRC (only THP, PMD level). Ville, I
see i915_gemfs the huge=within_size mount option is passed. Can you confirm
if /sys/kernel/mm/transparent_hugepage/hugepages-*/enabled are also marked as
'always' when the regression is found?

Even if these are enabled, the possible difference may be that before, i915 was
using PMD pages (THP) always and now mTHP will be used, unless the file size is
as big as the PMD page. I think the always mount option would also try to infer
the size to actually give a proper order folio according to that size. Baolin,
is that correct?

And Ville, can you confirm if what i915 needs is to enable PMD-size allocations
always?
