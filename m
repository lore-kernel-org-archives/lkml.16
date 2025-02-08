Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C57117B506
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 02:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738983017; cv=none; b=iXYfLwN2V0eDo/P4MCC/KRBV4ZIFDKqoR318afVynsfNGvqtaWBRqNa/PNOZdWC63xpQJ78qM4RGbGuQ7KXvCaga7nisH+NcHci8ip/aivDn+WzlvRicmeIzqOSJOq9iMtcum6BMtw7IW25LTeYqpQdNUAKTUZN7Iij9kHhPpho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738983017; c=relaxed/simple;
	bh=pDRzqpp8fUS1lYlC2zVt4ipLm46EmEyYzyuHUVJ7uDA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MNHFhG34btb2JOgLUo7/HVPzv6oYj9PpXZar2b3TB/rIzqCP8fLNmjYRBH22BS0DXtGnVO/lwJce7l0GcUGdRq7alLbRDng4OS7gJ+x4G4FVwFk0w3UOBBwzOhwejbdmS9OSJlaW6zspPoAHOpvp4QVli0ofaDghvBTzds6/yRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0fOTGxYe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0fOTGxYe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B8CC4CED1;
	Sat,  8 Feb 2025 02:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738983015;
	bh=pDRzqpp8fUS1lYlC2zVt4ipLm46EmEyYzyuHUVJ7uDA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0fOTGxYeUAMW+cSH/0d9eI5mMBIljHmvTCF64i/LBiommBfR1v0tHDtj4i6bNZ4BK
	 juCTFccDEGJb9hnjFjwxi19z3NxzTpVXssuoPRPwZfWcUltE86E6dDOlH3+IdZROB7
	 204bQVNPBSLEv/GtIxxQGnxnevGHPsx15YtyD6DA=
Date: Fri, 7 Feb 2025 18:50:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: use READ/WRITE_ONCE() for vma->vm_flags on migrate,
 mprotect
Message-Id: <20250207185014.c5d9f8f3e7065c11a4825125@linux-foundation.org>
In-Reply-To: <20250207172442.78836-1-lorenzo.stoakes@oracle.com>
References: <20250207172442.78836-1-lorenzo.stoakes@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  7 Feb 2025 17:24:42 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> According to the syzbot report referenced here, it is possible to encounter
> a race between mprotect() writing to the vma->vm_flags field and migration
> checking whether the VMA is locked.
> 
> There is no real problem with timing here per se, only that torn
> reads/writes may occur. Therefore, as a proximate fix, ensure both
> operations READ_ONCE() and WRITE_ONCE() to avoid this.
> 
> This race is possible due to the ability to look up VMAs via the rmap,
> which migration does in this case, which takes no mmap or VMA lock and
> therefore does not preclude an operation to modify a VMA.
> 
> When the final update of VMA flags is performed by mprotect, this will
> cause the rmap lock to be taken while the VMA is inserted on split/merge.
> 
> However the means by which we perform splits/merges in the kernel is that
> we perform the split/merge operation on the VMA, acquiring/releasing locks
> as needed, and only then, after having done so, modifying fields.
> 
> We should carefully examine and determine whether we can combine the two
> operations so as to avoid such races, and whether it might be possible to
> otherwise annotate these rmap field accesses.

Thanks.

If some poor person reads this code and wonders "why is it using
READ_ONCE", what's our answer?  I guess it's "poke around with
git-blame".

And I guess we can live with that - it doesn't seem practical to paste
changelog text into every READ_ONCE() site.

Probably most people won't bother and READ_ONCEs of ->vm_flags will get
pasted into other places where unneeded.

I do wonder if we can do better.

