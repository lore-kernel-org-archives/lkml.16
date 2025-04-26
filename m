Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF093C0C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745633122; cv=none; b=HSdW7UYNBn9OmIRwD4VZhXtpbOyOTFK9qook3eW0AB/qLW8qbbum5AWug+c0K5ZtnmtRLflMbN3fHDCjhQou4YV3gMqgcmFeEHjvxg4bRFe4Ce7cmOjxdX0wDNXxfxErTxIyWQFATDVcPnRxs3ELyJy46p4lAG84NnYXAc71nHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745633122; c=relaxed/simple;
	bh=+MYToG7EccjfFHrEZpf+eIg2lqSQxzzC4596A+uDudg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eb0h3Lb+WdS7qKqxNsu5TuoHKQzmFIcKEGL2B6ULl9AmMouzG8VZzV9Jask0f4W+CfGoD3FtvJCAi/Lsbyh7MgHU2DxFg+6itJUMG+aIw5hg/UQl9V/pZxJvIE15xWZDG+SkPyOjprGe8wgWmaJP0ginT2+ltYI8RqlTPovjZ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JlQuz80c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JlQuz80c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22DEC4CEE4;
	Sat, 26 Apr 2025 02:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745633122;
	bh=+MYToG7EccjfFHrEZpf+eIg2lqSQxzzC4596A+uDudg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JlQuz80cv10Y3QL76aIeeLqpD+uU9jubW7G68l6Dq6e5KcEyNvZ/9HwMjup1VqJcq
	 0l0++/wEpJt74biPZNL4CWOpSJEGQN7vL5bWc9Dc7H+rrtJKNRo7KqLOvAyxvwosmt
	 d9cqpSSCz0wohmIkDTBdb9yMLc5qmzAzx6Na6IRs=
Date: Fri, 25 Apr 2025 19:05:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-mm@kvack.org, yuzhao@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: vmscan: apply proportional reclaim pressure for
 memcg when MGLRU is enabled
Message-Id: <20250425190521.63ba5b25afcb938102b69335@linux-foundation.org>
In-Reply-To: <20250404141118.3895592-1-koichiro.den@canonical.com>
References: <20250404141118.3895592-1-koichiro.den@canonical.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Apr 2025 23:11:18 +0900 Koichiro Den <koichiro.den@canonical.com> wrote:

> The scan implementation for MGLRU was missing proportional reclaim
> pressure for memcg, which contradicts the description in
> Documentation/admin-guide/cgroup-v2.rst (memory.{low,min} section).
> 
> ...
>

Could we please have some review of this proposal?

Thanks.
