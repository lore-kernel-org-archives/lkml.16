Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7772E54B8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252508; cv=none; b=OITX6pq+M/mP1IPU1KBAXBWSWHChTD7k0Hgeu3/7U8LGI9D3LW+GOi07o9eaEYcp7kvs3RJEVwNhgfiFtAJK7Uf9U7TBTDplfwgTO9ckmYOMmYMez54zZEjPIXaJVEfWrGtT2JPyC/EQGcYmxuzqiDLIoe/6rWhUMPAjIj2hLhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252508; c=relaxed/simple;
	bh=l7dK2s+tHt2VVkd90I7sqvan3K9gBnQs8sPn/1yFon0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ij6UDbQufAhxHB3ax5vXLOWu/9VCBK8yv/V0M7L89X+enQ36XPxqhUIdUWejsn87UZ/z9nrhDBDxrKBvnuEk/BXhyOQ99Co0XeMcyLriPtSn2lcJDN4hW8ZaL5jnHnThlKBwukyzmrsPb+iIH/KpMkBEmpR1SGwllfh6FzhUVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQs9qgWq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQs9qgWq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73704C4CEE7;
	Wed, 18 Jun 2025 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750252507;
	bh=l7dK2s+tHt2VVkd90I7sqvan3K9gBnQs8sPn/1yFon0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQs9qgWqR/zw9deq52GhNt+dLEwGGbzmZrvcBImHv4OAbz2u2HyI8ZjT3nX9tmpf9
	 QYE0F7kxd49UtFDCqGjxT/jZlksPToMqt0vlrK0wge4smQRetYqOc3rwKuOmQVWuga
	 Tu2uykgX3z4Zdzdbx2LLoma1x4c/Hqr6yBy49Cfc5FyWmzIH69NNSrb9pstOzs1RCa
	 tRko4MVlOx4C0vuDeyw+mGCPjx9nVeflcBQYDg0eJsife2rAZTQyDDKo8ZTyNsvyKV
	 s1yuGTNqDIuDJYbowkQftLS/U9WBHIwUZew166iFuus3X6xutZ3YU+nJSgBd/5IZmm
	 NZYfkukY1azUA==
Date: Wed, 18 Jun 2025 10:15:04 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	yangyicong@hisilicon.com, James Clark <james.clark@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ali Saidi <alisaidi@amazon.com>, Leo Yan <leo.yan@linaro.org>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	yangjinqian <yangjinqian1@huawei.com>,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
Message-ID: <aFK72GUlT-EStfU2@x1>
References: <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com>
 <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
 <20250617141810.GB794930@e132581.arm.com>
 <aFJ-Za6oRGKKASN1@J2N7QTR9R3>
 <20250618112440.GC794930@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618112440.GC794930@e132581.arm.com>

On Wed, Jun 18, 2025 at 12:24:40PM +0100, Leo Yan wrote:
> On Wed, Jun 18, 2025 at 09:52:53AM +0100, Mark Rutland wrote:
> > If we want to share headers between userspace and kernel, we should
> > refactor those headers such that this is safe by construction.

> > There is no need to update the userspace headers just because the kernel
> > headers have changed, so the simple solution in the short term is to
> > suppress the warning from check-headers.sh.
 
> Sure, makes sense for me.
> 
> @Arnaldo, as Mark suggested, do you want me to send a patch to remove
> cputype.h checking in check-headers.sh or it is fine to keep the warning
> until finish the header refactoring?

It is ok to have the warning, its just this one at this point and it is
serving its purpose.

When the refactoring gets done, it will go away. Think of it as a
reminder :-)

- Arnaldo
