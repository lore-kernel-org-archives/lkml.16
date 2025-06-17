Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965182FA62C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750179812; cv=none; b=i+em/e6MkwJ3OJ+Vl0GY+5YMu9OYBybCYkKuOziW++KyU7PdyutHtRNWgveA8hfs5bUN2ulgDH0h3HJvCYRh27UqlZ9fCHlygscRsdDNxTNzZ6uf8ebr4gWGeRkJB1Ym8iPSCo5/nXRpj8BMRMej4roZ8Zi/wfYyV4i4nAdmLXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750179812; c=relaxed/simple;
	bh=CLoPaA6/HQfEqXaM6ZJwnEHxVfvfjI29P7UP4aefeAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QwfGb6A+9VodHQ1lOIBnXcMsU+m4BLmX55pdXFJL4cT4SNMaclVxwINgceIprCrAKGELXOcvz8IWCYtInMWd+8ms57KmJOwukCDtZZBlRPqgn88HFua2G2p7YOSD5pJT94c9zkabZC2/lfhusBMDxTj+BBsSuQ0I+G6q7NBLD1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+nfcrKU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+nfcrKU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB47C4CEE3;
	Tue, 17 Jun 2025 17:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750179811;
	bh=CLoPaA6/HQfEqXaM6ZJwnEHxVfvfjI29P7UP4aefeAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+nfcrKUq16T04ccjymWVdIivF1CFPxFBhmlN8Ue8G/zN2ltEVtkMDon24Z5YcnBm
	 c65S3rqtiID52/clFW5YfuKQIEcR3Cumn/G82wj7jirfa20UCBdBIIIibcoCb8Ol0K
	 P07Mm6+C+Yg9gOyK3bb9tod7IMgtdkyg8LqoTxstnVpzqMncHeVFmygEhMOAPJg+P+
	 1jEdo+nqjIxhM0NaxO26Nwg6KaFl7pF5UFEho/LaV/mYkyUWAOX4n9fYWS5gKkJLUw
	 CpB8pkPqpZS6z4yO2bgQrhN5B1/GKPlnfqDmrxnRIDoTi4Wf/oiDmODmL3sfqE8t6x
	 nADu35N7zGFig==
From: SeongJae Park <sj@kernel.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH] mm: add OOM killer maintainer structure
Date: Tue, 17 Jun 2025 10:03:28 -0700
Message-Id: <20250617170328.57089-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617085819.355838-1-mhocko@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

On Tue, 17 Jun 2025 10:58:19 +0200 Michal Hocko <mhocko@kernel.org> wrote:

> From: Michal Hocko <mhocko@suse.com>
> 
> Acked-by: David Rientjes <rientjes@google.com>
> Signed-off-by: Michal Hocko <mhocko@suse.com>

Acked-by: SeongJae Park <sj@kernel.org>

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0c1d245bf7b8..5e339c1457ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15841,6 +15841,14 @@ F:	mm/numa.c
>  F:	mm/numa_emulation.c
>  F:	mm/numa_memblks.c
>  
> +MEMORY MANAGEMENT - OOM KILLER
> +M:	Michal Hocko <mhocko@suse.com

Nit.  The closing '>' is missed.

> +R:	David Rientjes <rientjes@google.com>
> +R:	Shakeel Butt <shakeel.butt@linux.dev>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	mm/oom_kill.c
> +
>  MEMORY MANAGEMENT - PAGE ALLOCATOR
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Vlastimil Babka <vbabka@suse.cz>
> -- 
> 2.49.0


Thanks,
SJ
