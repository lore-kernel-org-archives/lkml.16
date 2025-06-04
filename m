Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A89111BF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749072044; cv=none; b=YjXy9jT/PVuKfV3lVR+N4xzyI7ieC9KTJJeY3Ga4e0IAyDtn+B5v87K1xS4cS+QTnMvTNpk6MYerFBCHlYQ7YZkgm2kgdpTlKiknG7ywmkMUO0i2Rp2XXDaaMZlUPQ5vi7BA7y9s2AmOJlXVLyjhAJLioqY3DvWmS2oBjhxKnX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749072044; c=relaxed/simple;
	bh=/apZxI8yjQIUYPM0hx5/EK/wgVk2YNwjbyetEn0vZgc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Y6FxtZ4RQHKoTV4UISlOxCaWR6SVagfrTu/q9Oy+u+ihxzMj7nkQ5fNAa10Jqwm5pmrYG9V2gH2XNG/+mnyVtYMhEns26FLpTLzM6DnQA0vvy/Cam3OtiKCaE4skaV9BMdiITTbEgoo0QChn0CkBWn3rs5D4L6M9SslgC4GYnQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FLmgmfnU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FLmgmfnU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC13C4CEE4;
	Wed,  4 Jun 2025 21:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749072044;
	bh=/apZxI8yjQIUYPM0hx5/EK/wgVk2YNwjbyetEn0vZgc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FLmgmfnUs6GrZhYrEeKHhABEzJMZMeiIl+qQP/uaZzZVn8bzUAiR8H+OaNVg9ahEs
	 56DIojzHSx0Gpz/xDigHqYYCCVLek9JhBC6sKeSI2q959OGsubtrhK3KJiv2yWc3ic
	 55mii2V1oZGnNM0vV2qhO2AwZs/TD+j2q79yOtu8=
Date: Wed, 4 Jun 2025 14:20:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, David
 Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Konstantin Khlebnikov
 <koct9i@gmail.com>
Subject: Re: [PATCH] mm/vmstat: Fix build with MEMCG=y and
 VM_EVENT_COUNTERS=n
Message-Id: <20250604142043.bdfdf4f9a6a6cbb57946f1a5@linux-foundation.org>
In-Reply-To: <6fffd2fe-0cee-405f-af78-b57b5e5d02e8@suse.cz>
References: <20250604095111.533783-1-kirill.shutemov@linux.intel.com>
	<6fffd2fe-0cee-405f-af78-b57b5e5d02e8@suse.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Jun 2025 11:56:42 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:

> > There is no need to backport this fix to stable trees. Without the
> > strict BUILD_BUG_ON(), the issue is not harmful. The elements in
> > question would only be read by the memcg code, not by /proc/vmstat.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Fixes: ebc5d83d0443 ("mm/memcontrol: use vmstat names for printing statistics")
> 
> Well in that case I think we should put Fixes: to the BUILD_BUG_ON() change.
> And if it's not yet a stable sha1, squash that together with this?
> It doesn't seem ebc5d83d0443 alone needs this fix.

I shuffled things around.

I moved "mm: strictly check vmstat_text array size" from mm-hotfixes
and back into mm-new for the next cycle.

I reworked "mm/vmstat: fix build with MEMCG=y and VM_EVENT_COUNTERS=n"
so it precedes "mm: strictly check vmstat_text array size".

I reworked "mm/vmstat: utilize designated initializers for the
vmstat_text array" so it comes last.


So the applying order is now

mm-hotfixes:
mm-fix-vmstat-after-removing-nr_bounce.patch

mm-new:
mm-vmstat-fix-build-with-memcg=y-and-vm_event_counters=n.patch
mm-strictly-check-vmstat_text-array-size.patch
mm-vmstat-utilize-designated-initializers-for-the-vmstat_text-array.patch

and everything should land nicely.
