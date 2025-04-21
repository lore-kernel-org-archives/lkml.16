Received: from pku.edu.cn (mx18.pku.edu.cn [162.105.129.181])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A45CFC08
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.105.129.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745228167; cv=none; b=VlQk4vhgzXDRlb4g24kq7j8xLJ9/UnxxwNCYy9bkjUyOeEgLBiw9d1OMRJp93HzbYm63WvpVdcrNaCUbEAH6gaiU6gtaXKRETbfTnk7he5vmkgnOYO5uoN+RLTbHXYE98dwMTBS5Vb+Wmksi4NwMhDLGFfg88O5N6xX2Y/pfivA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745228167; c=relaxed/simple;
	bh=l50qTUJeKCFAz3iATzvIzd6Rf6l8XRdYB0lBCJhUUN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+j6goUB0ft1x9zJEIAAW8JUjMcrFpFboM6l4cbjgKCuTlahdrNuMVHH2W9S/0/kYZSlXN8WiBgGYa+KR+2gTFqSZaQ/5d8OgvKh1DRtvBKugGFDah1Xv/RZM7ZkxkPfVwMMIDclG7sgJz4QWVTOPvQkpDNAMvfgPDaC8uhU/wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn; spf=pass smtp.mailfrom=pku.edu.cn; dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b=V78K4p4h; arc=none smtp.client-ip=162.105.129.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b="V78K4p4h"
Received: from pku.edu.cn (unknown [10.4.225.203])
	by mtasvr (Coremail) with SMTP id _____7Dwq6p4EQZo7f85AQ--.6923S3;
	Mon, 21 Apr 2025 17:35:53 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:
	Content-Disposition:In-Reply-To; bh=5Ai8f9MeggrfRLqhBIbrDp0fdwTf
	dFbgBB4ylUfNRGI=; b=V78K4p4h/lDCtik8Bvz040YILEeGoM48ZkZ4H+fC17bM
	3wHnVu2u944E1xBRMJ3KI3WBOKse3e3PevvLFX+6mxC48xnLnjx6iFuNYk7dnl+r
	Oc3Ln1HXE/Q29rRp1TS0RyVE325t07R6SedH5Wt1UFlRSUYPxIDWX6YGDLTetpo=
Received: from localhost (unknown [10.4.225.203])
	by front02 (Coremail) with SMTP id 54FpogC36oRyEQZopzRfAA--.30840S2;
	Mon, 21 Apr 2025 17:35:50 +0800 (CST)
Date: Mon, 21 Apr 2025 17:35:46 +0800
From: Ruihan Li <lrh2000@pku.edu.cn>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v2] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
Message-ID: <7eunuizzdfpgskxrfmngklrq632szzgscp6agwxsl7wsodpdqn@vnyg7d3v6tmh>
References: <20250419122801.1752234-1-lrh2000@pku.edu.cn>
 <20250420135709.732883ee775ad8b41fb668ca@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420135709.732883ee775ad8b41fb668ca@linux-foundation.org>
X-CM-TRANSID:54FpogC36oRyEQZopzRfAA--.30840S2
X-CM-SenderInfo: yssqiiarrvmko6sn3hxhgxhubq/1tbiAgEIBWf35XUDOwAYsu
X-CM-DELIVERINFO: =?B?e7M+XaaAH6dYjNjDbLdWX9VB7ttaQFyXTaecYZzOeDisy/krtsX5TsLkpeAzENeCPc
	0+BDdXjm5Mlm64oODP/CxX7Cf2JIhgSgyACdMUW+7z6NjTyzqRnhhfG2Fy/TDcNc2v3qRm
	vOLh3hF4Q3MRpa5gnRFIj2rOMEQnOcipZfzoYUAV81A49P3JdCzVwLiTrUlRWg==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Hi Andrew,

Thanks for your review and for taking the patch in the -mm tree!

On Sun, Apr 20, 2025 at 01:57:09PM -0700, Andrew Morton wrote:
> On Sat, 19 Apr 2025 20:28:01 +0800 Ruihan Li <lrh2000@pku.edu.cn> wrote:
> 
> > If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> > kernel is used as a library and loaded at a very high address), the
> > pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> > long time, and the kernel will look stuck at boot time.
> > 
> > This commit sets the initial value of pfn_hole to ARCH_PFN_OFFSET, which
> > avoids the problematic and useless iteration mentioned above.
> > 
> > This problem has existed since commit 907ec5fca3dc ("mm: zero remaining
> > unavailable struct pages").
> > 
> > Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
> > ---
> > Link to v1:
> >  - https://lore.kernel.org/linux-mm/20250418162727.1535335-1-lrh2000@pku.edu.cn/
> > Changes since v1:
> >  - Removed the unnecessary Fixes tag.
> 
> Why was the Fixes: considered unnecessary?  It seems to be useful
> information?
> 

To clarify, I only removed it because I got comments saying that this
patch doesn't really fix a BUG (well, that statement depends on how one
defines a BUG: it's a real BUG in my scenario, but maybe not a BUG for
many other scenarios):
https://lore.kernel.org/linux-mm/aANN0rwxcajUtFXs@kernel.org/

Since I don't know if there are other rules that apply here, I followed
the review comments to remove it.

Another possibility is that I misunderstood Mike's original comment?
Sorry if that happens.

Thanks,
Ruihan Li

