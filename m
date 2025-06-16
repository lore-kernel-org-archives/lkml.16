Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8932221FF5E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 23:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750116245; cv=none; b=KxI9szBNM4iZebOqJ38NRJV08tgU59DyjJFVGKXPVGKt3kiXZyx4bHDBQy+mA0v+MXL4t6HrISCseQiHBKocu7HGtzqudqciH4p5pWTji8eew/wR7RmTzc7+Af6xSKYENfFsKhnWZjsmscXiMwUHhfH2psNJbtYvNi24iIfLI+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750116245; c=relaxed/simple;
	bh=vU+stT+fx5E1pSEiQKKM/2DQByxEBmbUwdP6uNowKV4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Oj+Wj9zHZ+XxRjipyw9t90Q/+7FxX0ZWiXJalxdUp15AXtiPDVm/NaFLtYfPyPxSLFnbziy45al5KaK0igjZhkW2rbqiN/Drm5SSjn2guQF7fldm7XzjD7uHVYKRm+mhJuW3yEf8Uq5y3y02T8hfO92t7Y9f+fapBmk1ePcmsjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vQnV9gQc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vQnV9gQc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDB6C4CEEA;
	Mon, 16 Jun 2025 23:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750116245;
	bh=vU+stT+fx5E1pSEiQKKM/2DQByxEBmbUwdP6uNowKV4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vQnV9gQc8uu3VdhKkqSLKKQILxIsFok7SheBjKPEbscqy5qcMmAfMXQwIH0hxjDiB
	 05hrSsiSyUyiCiHVNs54KpWxZGD1nKHEQjQl3/lA3CC8XXDtRBLGvjENRGsl0kcePA
	 0p9Of/GhrZ5M//5F/3sIbmr2/3eDikCS5zYDETag=
Date: Mon, 16 Jun 2025 16:24:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@kernel.org, Suren Baghdasaryan
 <surenb@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Hailong
 Liu <hailong.liu@oppo.com>, zhangpeng.00@bytedance.com, Steve Kang
 <Steve.Kang@unisoc.com>, Matthew Wilcox <willy@infradead.org>, Sidhartha
 Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH 0/3] Fix MA_STATE_PREALLOC issue
Message-Id: <20250616162404.9f37908a11f5bd46f2362fb9@linux-foundation.org>
In-Reply-To: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
References: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Jun 2025 14:45:18 -0400 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> Address the issue of reusing the same maple state for multiple
> preallocations calls caused by MA_STATE_PREALLOC, and add a test for
> this use case.
> 
> Included is a change to the testing code to reduce false positives in
> the rcu race testing on faster machines.

I split this series into

- a standalone fix for 6.16-rcX and -stable.

- two standalone selftests patches for 6.17-rc1.

Is that OK?
