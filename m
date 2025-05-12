Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03A0231839
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 01:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747014378; cv=none; b=rY+I+qbaRHUXqbRahQw3QiVFHAuAl49Z6b0CqmsydlHhewCnKDkxEhh12g39m7eW5JFUok5mWG/edqvIDHVc92pJKLEEEgiaaQlv/8HE9tipVWWaM5g4oz30IL83487QPPrrm3Ue3DdYyaR1i2oC5e8NDOJhYJRakZ7iOhkNiZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747014378; c=relaxed/simple;
	bh=Ak4dzELf5kEsukPxNB4VDMA9t4KUdN4WRnwZznKNFYI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=N5DVoavKzyshcs/lDHT6Tv4Ftnk2sj6IxzZf+svBYhpNLyoQuMKkAgWSkvHs09v+/I5X8bvEBrs9/05K6EzkhG2jBZBWpDiaB1xJ6OE4rKTLReigTVGz0xafgvqFJKQPNOrCUTiK3H4bFNyTt2XklunalesyIhThlYPa+/OeQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=q+fcA6mu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="q+fcA6mu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F06C4CEE4;
	Mon, 12 May 2025 01:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747014378;
	bh=Ak4dzELf5kEsukPxNB4VDMA9t4KUdN4WRnwZznKNFYI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q+fcA6muJawGYbXd5twcfC0AtVQQbBKAJIs9kjHD5Xgfb2k898Qe1hQs3iwTtszh9
	 Vc9oIXc8R//WCcAFHGfJ4+kbfzfHeWQuMkiU29QVufqXl+kHuYaRG4Hj1/ZaQPADdr
	 2iUVmiQh+sJbUXDHYqkRz2M0MnzIip+g65qsl32Q=
Date: Sun, 11 May 2025 18:46:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org,
 mhiramat@kernel.org, llong@redhat.com
Subject: Re: [PATCH v1 0/3]  generalize panic_print's dump function to be
 used by other kernel parts
Message-Id: <20250511184617.85d5fe22fde831c1edb8321c@linux-foundation.org>
In-Reply-To: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 May 2025 16:52:51 +0800 Feng Tang <feng.tang@linux.alibaba.com> wrote:

> When working on kernel stability issues, panic, task-hung and 
> software/hardware lockup are frequently met. And to debug them, user
> may need lots of system information at that time, like task call stacks,
> lock info, memory info etc. 
> 
> panic case already has panic_print_sys_info() for this purpose, and has
> a 'panic_print' bitmask to control what kinds of information is needed,
> which is also helpful to debug other task-hung and lockup cases.
> 
> So this patchset extract the function out, and make it usable for other
> cases which also need system info for debugging. 
> 
> Locally these have been used in our bug chasing for stablility issues
> and was helpful.

Truth.  Our responses to panics, oopses, WARNs, BUGs, OOMs etc seem
quite poorly organized.  Some effort to clean up (and document!) all of
this sounds good.

My vote is to permit the display of every scrap of information we can
think of in all situations.  And then to permit users to select which of
that information is to be displayed under each situation.

As for this patchset - sounds good to me.  For now I'll await input
from reviewers.
