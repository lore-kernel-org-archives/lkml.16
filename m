Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9C82980B9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362605; cv=none; b=fCYqk2/shOmYzT27U8BEv/17aL1i8DkXZpKZp7EfsQm+4IK+UYndF1AvPoFQACPOONGIt9Wn9cpRGo3upzOnJ89Dg9DHMGtoPvtyRYXj6a4lYgYk2FQWLLTOs73EQzsE1XU6ggVASc5+oFKnmGOfLemsMMnwqpHtWuB0mQpl8xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362605; c=relaxed/simple;
	bh=8Zf1l8FhhOvmDcUrwydoQzHxR+9Hs6zytjuZjgAOCFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4hB1boguEZuA2JdiLBDNrT6zkRRMzJZYoZme1QJlrUKSqocXytAlwI4tv25OP9uFakeh3jRo41atsJh0GpfhCaA6786xNdjHCVf6vWFjU8Cy1d6HayXa2ZCbqd5Bi03DC+V4XS/V8Tfo3ErntcowOZhbb9BmTI9yMBsKBpu/KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpaUQ7D7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpaUQ7D7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED85FC4CEE2;
	Fri, 11 Apr 2025 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744362605;
	bh=8Zf1l8FhhOvmDcUrwydoQzHxR+9Hs6zytjuZjgAOCFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpaUQ7D7fXnA5CFSGpmPhrBob5/1s31V2Xekejj1hAORbvFeQbeIf8k7X2YJa4p4+
	 BiTxwRcHep9f5AZNUoEb0/k1GrbpavmRGU5KhbJgEXGSXTge/P/F3u/kkd4oKPTHFf
	 61EeLOenMgRZdkUnnNjVnao6HH9jNc6eScn7ZrfBcKgNdFi4Aou6YKVLHJ3eJhgm2Y
	 fEXDXXKA5tCoVYbZhtnSv6RWHciOO3GYEduGiKLpBDdznMarlfpaXG3uE79VVJcqFA
	 U6CATX8gDE7XYNOJRzrNfygVtr9kGiU1vi5fZAGt0HzNkMHc4ovCN6KV5Ij2WF+80C
	 Zed1ahSEbtH5w==
Date: Fri, 11 Apr 2025 11:10:00 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH v14 00/11] Support page table check on PowerPC
Message-ID: <Z_jcaCdMFENW8KSG@gmail.com>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>


* Andrew Donnellan <ajd@linux.ibm.com> wrote:

> Support page table check on all PowerPC platforms. This works by
> serialising assignments, reassignments and clears of page table
> entries at each level in order to ensure that anonymous mappings
> have at most one writable consumer, and likewise that file-backed
> mappings are not simultaneously also anonymous mappings.
> 
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, separate set_pte_at()
> and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.

>  arch/x86/include/asm/pgtable.h               | 22 +++----

For all the x86 <asm/pgtable.h> function parameter extensions changes:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
