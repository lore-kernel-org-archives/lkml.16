Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1445204C09
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743534108; cv=none; b=X2sdU8gH6FX48bciegj2TcWzbPG2O+19ezO5bcEBsjRQxFNXdNtIrg9UBKkZpKrTtlx++370F8P+q6HEjiu9899irxunCjN0xyuBaQc0rbxo502lxFET8COpLn46biJGk3MmKj0adIser8tR33bbu/6JJ+VtGwvb5gGCXLK9zN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743534108; c=relaxed/simple;
	bh=K8GGUKRabMKEZ6JIjw4NI8sc8Kkbl/+8n/DuS+E9OEI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BmINQF6dUz4gcb6faP+iM5UNxTWza0rSU6lmAdJzMhl5dKF+7PDx7FGjBfrYZR/DS129Ec4GL25iCGFjEnS01joAtenqQ38AK4A/C1r+fNR8xnBTgCg3KxAJQ2bhQqzpIFE/7DZmEDZl57w0IKkpRzh36mObP+OUKwc7R88fXzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vWXGk2nz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vWXGk2nz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084FFC4CEE5;
	Tue,  1 Apr 2025 19:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743534107;
	bh=K8GGUKRabMKEZ6JIjw4NI8sc8Kkbl/+8n/DuS+E9OEI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vWXGk2nzNovEl3MYhCqn6avIVAfboZsR0yYlEP5JK2SfnqDJTtMp/lbJYKpQbLLmK
	 VoLLhkulpjZ4HJfy5nvs5374iZZwqX1MFHGp/tv1Mtk45WlYO0yap0iK/zz9RD8XRG
	 Nz5B16yXQeISba3TU8bMJx3JVMZsxxeSBHKXBrXA=
Date: Tue, 1 Apr 2025 12:01:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: hannes@cmpxchg.org, yosryahmed@google.com, yosry.ahmed@linux.dev,
 chengming.zhou@linux.dev, linux-mm@kvack.org, kernel-team@meta.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] page_io: return proper error codes for
 swap_read_folio_zeromap()
Message-Id: <20250401120146.8d3533b39968df5e0712acb3@linux-foundation.org>
In-Reply-To: <CAKEwX=Njxjg+G6H4X77YPnZ=mQJaR-K8du1VP6voDLZ55ZaepA@mail.gmail.com>
References: <20250306230015.1456794-1-nphamcs@gmail.com>
	<CAKEwX=Njxjg+G6H4X77YPnZ=mQJaR-K8du1VP6voDLZ55ZaepA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 1 Apr 2025 11:55:31 -0700 Nhat Pham <nphamcs@gmail.com> wrote:

> On Thu, Mar 6, 2025 at 3:00 PM Nhat Pham <nphamcs@gmail.com> wrote:
> >
> > Similar to zswap_load(), also return proper error codes for
> > swap_read_folio_zeromap():
> >
> > * 0 on success. The folio is unlocked and marked up-to-date.
> > * -ENOENT, if the folio is entirely not zeromapped.
> > * -EINVAL (with the follio unlocked but not marked to date), if the
> >   folio is partially zeromapped. This is not supported, and will SIGBUS
> >   the faulting process.
> >
> > This patch is purely a clean-up, and should not have any behavioral
> > change. It is based on (and should be applied on top of) [1].
> >
> > [1]: https://lore.kernel.org/linux-mm/20250306205011.784787-1-nphamcs@gmail.com/
> >
> > Suggested-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> > Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> 
> Hi Andrew, I think Yosry and Johannes signed off on this patch (with
> the fixlet). Looks like it was not merged for 6.15-rc1 - let me know
> if there is something I need to do.

Thanks, seems it fell through a crack.

> It's mostly a clean up with no (intended) behavioral change, so no
> rush of course.

Yup, I'll toss it onto the after-merge-window pile.
