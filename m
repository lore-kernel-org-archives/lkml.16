Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F3B259CB9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560780; cv=none; b=Gi4hJ+5Kcxwiw9EQvzc4RCkOakBl1PcSyIYWlea99ppF0pPtYPDxJR2RgRRl3DbbNDksuxwIlBMWwalAO6uDx5JYUH/0JPEHa0AhRw3E8/Aq0G8qeGwNfgW377xKgm9/xmGIcu3X9akMOY8uVOWm/RcFTC2v9478TTsF8hxkWiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560780; c=relaxed/simple;
	bh=WdgPxngTX8VmRp7AvbeAk+y0bbhMCt+pYEZaff3TjUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgI9roebIArwWYBxVbRay6NZDaO8aWBOCp/KtU8CQqF88BvRb/H/bQVzC2vg0VNH4XEWYbE7TBVBRAkwpYDWRqOoTl+TWAczSY6uRItEgszjHL+t8f0NcXbk6Fjrst6j9ou1bsf8NYy25tqWZMhES3dhbRfh10Haw0MjYJdBSf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0mYxwTW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0mYxwTW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADE2C4CEED;
	Thu,  3 Jul 2025 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751560778;
	bh=WdgPxngTX8VmRp7AvbeAk+y0bbhMCt+pYEZaff3TjUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0mYxwTWgqT/SaprqM4Hz6+4OMFs+JMUZzMUJ60f95xXTdHt51yfk6ZV5y6Wsoro0
	 xKbmUKPPH8SNta23aMCBepvlF+5wcnHxa71GVF27dLN52/3dkFpIDddZGvS4+Qg9uf
	 LCPifV0I7r/wDTcJsJxYhoJKdbQ89wkENODISw5LymzTgQvBrOio2pecjBs1fCJmWL
	 Tl3QKoV7sjPJw8qhSF/87Ow5rfgkdM+yDX4HmIzH7P9KdMMDH2yKmaOs8LxnaDJq9l
	 B7gxoPs/KGpSlCDmDd3P0ljdicWj1tG32DJ19q2M9j5+z76T38wwJNJRTY17wmLaro
	 EzNXDdVlBZmqQ==
Date: Thu, 3 Jul 2025 06:39:37 -1000
From: Tejun Heo <tj@kernel.org>
To: Dennis Zhou <dennis@kernel.org>
Cc: Jeongjun Park <aha310510@gmail.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	akpm@linux-foundation.org, vbabka@suse.cz, rientjes@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm/percpu: prevent concurrency problem for
 pcpu_nr_populated read with spin lock
Message-ID: <aGaySZ-CO4l9PrC_@slm.duckdns.org>
References: <20250702082749.141616-1-aha310510@gmail.com>
 <7b7d353f-f38b-3205-8fd4-1072dbf69cb6@gentwo.org>
 <CAO9qdTEidRnO4O_D7Z1jKZTyJadFyEyWBnfitTz8t1CdBaM1nw@mail.gmail.com>
 <aGYaXcB1CaA3BKEa@snowbird>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGYaXcB1CaA3BKEa@snowbird>

On Wed, Jul 02, 2025 at 10:51:25PM -0700, Dennis Zhou wrote:
> > However, since pcpu_nr_pages(), which performs a read operation on
> > pcpu_nr_populated, is not protected by pcpu_lock, races between read/write
> > can easily occur.
> > 
> > Therefore, I think it is appropriate to protect it through pcpu_lock
> > according to the comment written in the definition of pcpu_nr_populated.
> 
> You're right that this is a race condition, but this was an intention
> choice done because the value read here is only being used to pass
> information to userspace for /proc/meminfo. As Christoph mentioned, the
> caller of pcpu_nr_pages() will never see an invalid value nor does it
> really matter either.

This isn't an actual race condition. The value can be read atomically and an
unprotected read can't lead to a result which wouldn't be possible when
reading under the lock. ie. Whether the lock is added or not, the end result
doesn't change. It's just that syzbot can't tell the difference.

Thanks.

-- 
tejun
