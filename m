Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B5733991;
	Wed, 25 Jun 2025 21:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750886151; cv=none; b=Mp+CkMp4ggQz1w+UqVK2ykIIDCrMJ8APe61kU9WXOHg670EZMg/EkN4BNu/BiDFpjSC/qKP/apEtYiGI0SI6UiJb/WDO2HWwHa/oTGzFQzi1rffP29iPnOSO3gL50AydUrAkDLX/Hnjq7c1DNSImsb+5O4O5Jy3XHwQdBc1qjls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750886151; c=relaxed/simple;
	bh=bXZg1DWaBsQuVla/zsE7g5IR4g7xZypWGQLpWTzXwb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoeS4D6Q843lO6BnXsO4Ul8THSCtfCcL8i9FWHHBMNvfAPaFahG0CPuRvM70qGM/wD6D/HNitBhpl2lWB0T/+/TQPDPZA0cWAfjzvqXG+VQU3zGnDFnkWtoQdA7ob2/sx0hLeaSsVWyn2CyaM+2JZVeKKS8LBsSuuwc2Z7xSUIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dfu04wsF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dfu04wsF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146C2C4CEEA;
	Wed, 25 Jun 2025 21:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750886150;
	bh=bXZg1DWaBsQuVla/zsE7g5IR4g7xZypWGQLpWTzXwb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dfu04wsF5i3oasiuI4zBSLpXmpUhP6qanSmTqa7GO+vhkG6xFLbVRtvOrWT8phpZn
	 D2NrgjxCAYcJp6Zsb+MqG4Hxbj2l20VJHIdBjzUtjoILfYJeKPHiNF7JgOnnGS9nuu
	 Kq3Pw4RbUgEUbMQyji/2cx7dAreMB13b4s5HnteAXCekZEJdrGQ0OjmlxGTW1sBk1d
	 4yGiBoJ/u8hau8+IuxBtSPRGrAzrlw+BoJqrf/jnn7qT/zNGrp9PMSYj2QKbe0VOfE
	 TeZGXuEyHksmRAh1USC4YltBGyrY0yqtRG6t3vLElNt5uLRstTXdnXnaICeSMdgokG
	 agkqaxlYCFsqA==
Date: Wed, 25 Jun 2025 23:15:46 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/2] support large align and nid in Rust allocators
Message-ID: <aFxnAjUQ2n14D7Ya@cassiopeiae>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
 <20250625141022.e65e4a9b8377d4879ad7065e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625141022.e65e4a9b8377d4879ad7065e@linux-foundation.org>

On Wed, Jun 25, 2025 at 02:10:22PM -0700, Andrew Morton wrote:
> On Wed, 25 Jun 2025 08:29:17 +0200 Vitaly Wool <vitaly.wool@konsulko.se> wrote:
> 
> > The coming patches provide the ability for Rust allocators to set
> > NUMA node and large alignment.
> 
> Including a diffstat would be nice.
> 
>  include/linux/vmalloc.h        |    8 +++---
>  mm/nommu.c                     |    3 +-
>  mm/vmalloc.c                   |   16 ++++++++++--
>  rust/helpers/slab.c            |    8 ++++--
>  rust/helpers/vmalloc.c         |    4 +--
>  rust/kernel/alloc.rs           |   28 ++++++++++++++++++++-
>  rust/kernel/alloc/allocator.rs |   40 +++++++++++++++++--------------
>  rust/kernel/alloc/kvec.rs      |    3 +-
>  8 files changed, 79 insertions(+), 31 deletions(-)
> 
> What is the preferred merge path for this series?

I can take it through my Rust alloc tree, but I think it would probably be
better you take it through the mm tree, since I don't expect this to conflict
with anything else in my tree anyways.

The Rust changes gonna need some more discussion though.

- Danilo
