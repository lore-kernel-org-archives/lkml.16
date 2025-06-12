Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866BB235070
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749772056; cv=none; b=nsGjX90jy6HMHb4W31FVpfVRXxzPUtwNbNq6ug37Yu7dnSOMwd3M2JlrhKdef4zOi8MhrlvWuAFVouuJTXVUwo/vlKk0hkOkkpmiAb0BC8GOWtBptzTgmKP8DDdv7E/OBiwa50sg4aF7Fs0iIxBHX3jWRV6c47ifsAC/yz1Zh+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749772056; c=relaxed/simple;
	bh=YUChF49bAYlJOpP0WqVyLSRATHcO/9CPEgcMbqtKARw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Rttmljw0QupyN+i97cdlurymQeM34C2bUJjDSiv6kSfpBUa3AgZVeOxpXK1OD3tgDqLKkdQ9ZPr+CpZre3M1cLtLpPluMg6ARLRNaPgP1S4SkrtJaF9jCjSxaqp5lSWFB0jI6I19ArMtUxCxILN55MfGHXrfT3hKsNVnv/1bwmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XR4I488A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XR4I488A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D951C4CEEA;
	Thu, 12 Jun 2025 23:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749772056;
	bh=YUChF49bAYlJOpP0WqVyLSRATHcO/9CPEgcMbqtKARw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XR4I488AZIuD5wUchz+ZxH9y0yZjE8wvKVuscwaBAauVpw9jrrXNa73Dyj71GKWvV
	 r9ouV0lLueOOIN9f4uYhzrbLLIwkhRBFWpUPSFE0vP2uldYj4e0JWrbEr7HPOoVW2C
	 4n9FTeAs6nvAA0MghkEuEce3eKDI/r1nKw6kYmxs=
Date: Thu, 12 Jun 2025 16:47:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jiri Bohac <jbohac@suse.cz>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Dave Young
 <dyoung@redhat.com>, kexec@lists.infradead.org, Philipp Rudo
 <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>, Pingfan Liu
 <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <dhildenb@redhat.com>,
 Michal Hocko <mhocko@suse.cz>
Subject: Re: [PATCH v5 4/5] kdump: wait for DMA to finish when using CMA
Message-Id: <20250612164735.76a1ea9a156cd254331ffdc4@linux-foundation.org>
In-Reply-To: <aEqpgDIBndZ5LXSo@dwarf.suse.cz>
References: <aEqnxxfLZMllMC8I@dwarf.suse.cz>
	<aEqpgDIBndZ5LXSo@dwarf.suse.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Jun 2025 12:18:40 +0200 Jiri Bohac <jbohac@suse.cz> wrote:

> When re-using the CMA area for kdump there is a risk of pending DMA
> into pinned user pages in the CMA area.
> 
> Pages residing in CMA areas can usually not get long-term pinned and
> are instead migrated away from the CMA area, so long-term pinning is
> typically not a concern. (BUGs in the kernel might still lead to
> long-term pinning of such pages if everything goes wrong.)
> 
> Pages pinned without FOLL_LONGTERM remain in the CMA and may possibly
> be the source or destination of a pending DMA transfer.
> 
> Although there is no clear specification how long a page may be pinned
> without FOLL_LONGTERM, pinning without the flag shows an intent of the
> caller to only use the memory for short-lived DMA transfers, not a transfer
> initiated by a device asynchronously at a random time in the future.
> 
> Add a delay of CMA_DMA_TIMEOUT_SEC seconds before starting the kdump
> kernel, giving such short-lived DMA transfers time to finish before
> the CMA memory is re-used by the kdump kernel.
> 
> Set CMA_DMA_TIMEOUT_SEC to 10 seconds - chosen arbitrarily as both
> a huge margin for a DMA transfer, yet not increasing the kdump time
> too significantly.

Oh.  10s sounds a lot.  How long does this process typically take?

It's sad to add a 10s delay for something which some systems will never
do.  I wonder if there's some simple hack we can add.  Like having a
global flag which gets set the first time someone pins a CMA page for
DMA and, if that flag is later found to be unset, skip the delay?  Or
something else along these lines?

