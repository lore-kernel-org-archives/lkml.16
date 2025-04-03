Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF372E62A2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743717656; cv=none; b=GdNcWdAJHnBFZbtR1v1Fc8cpnYPLXUSceEq6EjB8vTSZqkrNvBskYarD50arDYXOllWUHdOtTivC5a4RvJgPdGP7YjZcxIiS1+YKWpFgazz/7GZf3PK7wEEpQP7VqOIUAwbnzKjJl/Q4olYJsyijFeW2xs61zpZ+XgqCNuA1wAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743717656; c=relaxed/simple;
	bh=Tu+ZNuiLiCyjWa2d1JIJdAvGebtmEsHMaFbfHhaPxkw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=i0QHSxJJRyaHS9sAlHqobEF+f0OwpyXRyfzU+hLAkdvGgGLquSajfVgRio4RUMFaRBGiAQVXgfJmYzdZJK2CXHXo0NkqRAUAtaBtKISE9IMTjWBwmSGHF3d0YKhEHIiOtljMSgdR2eBBX9mi8ULKZKzusWPrdb5lzxR02jcfUyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FDvOoiT4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FDvOoiT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C29C4CEE3;
	Thu,  3 Apr 2025 22:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743717656;
	bh=Tu+ZNuiLiCyjWa2d1JIJdAvGebtmEsHMaFbfHhaPxkw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FDvOoiT495XTRGDVrFyuAeNU15WsyzV4yvBFsarf41CLypwwA2C7tzitZnevG9rRn
	 K2Jey7ZWZXta1iFbZesEm7zhQ5EwLK1bekxB9thGCc11m9jjc7DLsQ9dV0vbRGbih7
	 C0sOlX44zD8uk09nA7RyayFYfqfgCdtZDdBpWQVM=
Date: Thu, 3 Apr 2025 15:00:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Rik van Riel <riel@surriel.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Vinay Banakar <vny@google.com>, liuye <liuye@kylinos.cn>, Hugh Dickins
 <hughd@google.com>, Mel Gorman <mgorman@techsingularity.net>, Yu Zhao
 <yuzhao@google.com>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2] mm/vmscan: batch TLB flush during memory reclaim
Message-Id: <20250403150055.94a38bc7e6e3f618fbc23ddd@linux-foundation.org>
In-Reply-To: <20250328142055.313916d1@fangorn>
References: <20250328142055.313916d1@fangorn>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Mar 2025 14:20:55 -0400 Rik van Riel <riel@surriel.com> wrote:

> The current implementation in shrink_folio_list() performs a full TLB
> flush for every individual folio reclaimed. This causes unnecessary
> overhead during memory reclaim.
> 
> The current code:
> 1. Clears PTEs and unmaps each page individually
> 2. Performs a full TLB flush on every CPU the mm is running on
> 
> The new code:
> 1. Clears PTEs and unmaps each page individually
> 2. Adds each unmapped page to pageout_folios
> 3. Flushes the TLB once before procesing pageout_folios
> 
> This reduces the number of TLB flushes issued by the memory reclaim
> code by 1/N, where N is the number of mapped folios encountered in
> the batch processed by shrink_folio_list.

Were any runtime benefits observable?
