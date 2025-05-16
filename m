Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFEF215F56
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381155; cv=none; b=Ox7cgXSauu0XcreLVz8xCsBSLjWKFSfuS1JkvcfoKrEYW7p+bPnDzOrJpjyGesmmcHLmYBIFALcEW0SahOvkKzP/zd6IyBiLF4ukTJG9dKtoz+YaLobKmIX/B0Ifur9kfQcshl3fv6iiUrqQMH/Bgg0hJwDWgzLgw5BHOS6EQdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381155; c=relaxed/simple;
	bh=wnWlK+EQ1GSDiKWvq0g6lbjwNO0xVbvCTgg3diz/eiI=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=YJ8jernSfBP3Kxu6hVkrgImZJp4BbSjy63qA9werNNOane1W0Lkobinxt+IwfMh963KAF374W1vjPaKHAksewZhFZ55DxXDTbdbhbtbicbk5YZ+MOmIzOOXSMnLs0qiwln2HsbAuk17E9dFuKYCn8NzSIhSpTTgsfFMP2UhdpO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZzJqW5x5jz4x5q1;
	Fri, 16 May 2025 15:39:03 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 54G7cnLQ019998;
	Fri, 16 May 2025 15:38:49 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 16 May 2025 15:38:51 +0800 (CST)
Date: Fri, 16 May 2025 15:38:51 +0800 (CST)
X-Zmail-TransId: 2afa6826eb8bffffffff962-72fda
X-Mailer: Zmail v1.0
Message-ID: <20250516153851884Sc0xPVbcP_BcHDTnQzjHH@zte.com.cn>
In-Reply-To: <20250515190404.203596-1-lorenzo.stoakes@oracle.com>
References: 20250515190404.203596-1-lorenzo.stoakes@oracle.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <lorenzo.stoakes@oracle.com>
Cc: <akpm@linux-foundation.org>, <david@redhat.com>,
        <chengming.zhou@linux.dev>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gTUFJTlRBSU5FUlM6IGFkZCBtbSBrc20gc2VjdGlvbg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 54G7cnLQ019998
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6826EB97.001/4ZzJqW5x5jz4x5q1

>  MAINTAINERS | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 314007e2befd..8859357122eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15577,6 +15577,21 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
> 
> +MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Xu Xin <xu.xin16@zte.com.cn>
> +R:	Chengming Zhou <chengming.zhou@linux.dev>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	Documentation/admin-guide/mm/ksm.rst
> +F:	Documentation/mm/ksm.rst
> +F:	include/linux/ksm.h
> +F:	include/trace/events/ksm.h
> +F:	mm/ksm.c
> +
>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0

Acked-by: Xu Xin <xu.xin16@zte.com.cn>
