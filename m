Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C97C2EBB9F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751058573; cv=none; b=tImk5vN/vF0nr0ctAwtPNr4waKu3FM8RpN3Xo+2ZeOMbbLozwPEeqYGIw2PKJG1iH7R9eq8wDX0VEWmwuVnVL69nfkaK91SNiSKgWvF3Xyw7UJ+flaQ/70eZ/+E9ZI7fNJtDky0hYdytYWoPPWbc7Vp+CLrsSQKTPcvXqXtbGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751058573; c=relaxed/simple;
	bh=pIB7dbUg5YiC8wZop1hSiIBUgou3FUP2dBBIURZS/q0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KA6Z7RK6fjDPoRMAKa/kcVujW7fJ8uEa6QJcqZzKZtLgj+iHjV79QnpxGe+CyAUBQGN/4C/dEN2yOfZtat6OigKhFn7sSpTnkk6QmSQj1WYA+UJ2ICR7nSy4kbWRtHUyEiGFeMVAsalbPjVBPATgU7RtPMjky4CJF0Nx2IOZ2Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uruW/Syz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uruW/Syz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0C9C4CEE3;
	Fri, 27 Jun 2025 21:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751058572;
	bh=pIB7dbUg5YiC8wZop1hSiIBUgou3FUP2dBBIURZS/q0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uruW/Syzqdc+hsDCq7ULTgKSNYLRLjzUUC7iu8inxYx4+v2Oiekd+j/oIz0iJDnDP
	 +gzxtwuPEMer5swmRyFmFNiOigEZ9VUrntl/SMGRpOvLorWSduONlMsMJpb3uFWok9
	 ZRyCxewEZonmC2T9HE60xPSd6v+1S19SHskA+qIg=
Date: Fri, 27 Jun 2025 14:09:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <zhongjinji@honor.com>
Cc: <linux-mm@kvack.org>, <yuzhao@google.com>,
 <linux-kernel@vger.kernel.org>, <yipengxiang@honor.com>,
 <liulu.liu@honor.com>, <feng.han@honor.com>, Axel Rasmussen
 <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Greg Thelen
 <gthelen@google.com>
Subject: Re: [PATCH] mm: vmscan: Page scanning depends on swappiness and
 refault
Message-Id: <20250627140932.1278169c50ba873937444599@linux-foundation.org>
In-Reply-To: <20250627162606.30609-1-zhongjinji@honor.com>
References: <20250627162606.30609-1-zhongjinji@honor.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 28 Jun 2025 00:26:06 +0800 <zhongjinji@honor.com> wrote:

> From: z00025326 <z00025326@hihonor.com>
> 
> The current MGLRU aging strategy isn’t flexible enough. For example,
> when the system load and pressure are low, reclaiming more anonymous
> pages might be better. But when the system is under heavy pressure,
> enough file pages are needed for quick reclaim. Right now, when MGLRU
> is on, changing the swappiness value doesn’t really let you prioritize
> reclaiming certain types of pages in different situations.
> 
> This patch changes the aging strategy to adjust the reclaim ratio based
> on swappiness and refault values, allowing anonymous and file pages to
> age separately. and it can prioritize reclaiming certain types of pages
> and doesn’t have to wait until all the oldest pages are reclaimed before
> moving on to the next aging generation.
> 
> ...
>
>  include/linux/mm_inline.h |  19 +-
>  include/linux/mmzone.h    |  13 +-
>  include/linux/swap.h      |   1 +
>  mm/vmscan.c               | 797 ++++++++++++++++++++++----------------
>  mm/workingset.c           |  10 +-
>  5 files changed, 494 insertions(+), 346 deletions(-)
> 

(replying to https://lkml.kernel.org/r/20250627162606.30609-1-zhongjinji@honor.com)

That is one big patch!  I'll avoid it at this time, see what the
reviewers say.

Have you reviewed Documentation/admin-guide/mm/multigen_lru.rst to see
if any updates are appropriate?

I expect people are going to want to see a lot of detail about the
runtime effects of this change.  What sort of workloads are being
targeted, what were the effects on testing results.  What sort of
workloads might be harmed by the change and what were the effects on
testing results for those, etcetera.

