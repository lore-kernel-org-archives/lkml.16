Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164CD33991
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750886154; cv=none; b=tYDt3r9R6QcNSPxDz0Ia4KF9OZMa187qHCE1vux8CsHCbJy92gbmlNgtEg+QbAfAAR0U0L6qc+WjCMa1SgmClu5LbXhKV3YMGMpEfmYlydOpXZtfTUzR6wMuKvVMXFA35nHCopFvMHIR+FHx9umqFwP9qZN4HPZkPJ+efpCgeV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750886154; c=relaxed/simple;
	bh=tLD1fgkMwIEuaveK57lBAd2AzhKGL8baxviM3xdt1eY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DmPwbbyupocRoPyTjfst4CHUlIz5FoSxyjRvc4v5eGUQq8pT+bQKrp4PKpjF6P/vnNis9Ma+8/HfqOFi1RrfDcHFeq24Frj1XGaeo/cg4juebkw2zEd1k7X0TQ9zU0Qrq/9esvqmUUbpJRw5BtcOSEnvH89BWCQtbcFxcO1mrx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PaikpPjc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PaikpPjc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2196AC4CEEA;
	Wed, 25 Jun 2025 21:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750886152;
	bh=tLD1fgkMwIEuaveK57lBAd2AzhKGL8baxviM3xdt1eY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PaikpPjciEQ1W0WlgHRzbTUF9K64d0INQvR8RUdhqjy3ZwYVrOmW2Cwk+tSW/wZi9
	 KJrBD4aRKe6VdDCm91Dn5Cx8yGRKQDuAIo8fi0Y2mcnPkE52ZT7VhkwgqNkkOyP1RP
	 FMDNwxeWmXQyh4RHtNzn43TuS+XOhtUiF1q4a+Mg=
Date: Wed, 25 Jun 2025 14:15:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Berg <myon@debian.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Matthew
 Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory
 Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION"
 <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix do_pages_stat to use compat_uptr_t
Message-Id: <20250625141551.ca068f6bc901943559df6bdf@linux-foundation.org>
In-Reply-To: <aFxltX73iZLT2HGx@msg.df7cb.de>
References: <aFrBhyHQFffJ4xgX@msg.df7cb.de>
	<d42cc185-b774-4d5e-9a51-0581dd5f3962@arm.com>
	<aFwUnu7ObizycCZ8@msg.df7cb.de>
	<20250625133909.1a054c24d933cd97afd0027d@linux-foundation.org>
	<aFxltX73iZLT2HGx@msg.df7cb.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Jun 2025 23:10:13 +0200 Christoph Berg <myon@debian.org> wrote:

> Re: Andrew Morton
> > I'll update the Subject: as David suggests and I'll add a cc:stable,
> > thanks.  I'll also add a note that David suggested an alternative, so
> > please let's advance that option.
> 
> Sorry, I'm new here. Do I have to do anything now? The above sounds
> like the alternative coding by David would be preferred, but the other
> mails say the patches have already been pushed to a hotfix branch? Or
> are we doing both, i.e. stable gets the simple fix and next the pretty
> one?

Well I added the v1 patch for testing and so it doesn't get lost -
fixing the bug is the most important thing.

But if a nicer v2 patch is sent in the next few days, I can switch to
that version.

