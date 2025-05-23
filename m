Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8126223338
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991794; cv=none; b=u0A5FaqqLFM3rwMI1Zgh+xjZVQlXgPXuKLc+lzQbVnsFhrzOo3yYzvgsA+MUyMGGlhctXkINf0bcgqCe9v83XcP2Ig6mbYsWw3l36VGkUn+EDKuaTHOhUjm4Lpl0vButnoM38YCXbZHdP/wxIXK8Czfy8xoVQUGCam8LBz++9qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991794; c=relaxed/simple;
	bh=vL9xiQyaqTcBSYY/w7En11UOo/roA4GtozLLtwoJd5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ocp5ch4f30GLBUnvfYp53cA+W3Kt0ZKSXAt5AAaBYroLLZGK9nolNgQpMyqAswK04MWsaub1mN0wR2KES1s+RQ4EtS5A5az9ZoMP9Ru4e8//IfDxawMHLAQBTjsQ0vLZ+Hou1LQo0G9BBwGSnVGr3yBdqvgaxGk5GNQvUQtYjco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAyvzm5l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAyvzm5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747991791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4h+Yy62ZlA2qwCk7aDUUsgmb3Ggi1tOTOzIVVOOKlg0=;
	b=XAyvzm5laLirS/Z7eO44n3PD10k/j24L65VhCKZ2bSSaTRheS7HT+/BWoLSa2cWnzco1fV
	9NVYs28mvS6Q25YQSXqzV4/N6QCPPlKmiXXs/pn8MtkaBJ6zr6vELJqd2ztH6XPFviNknb
	IBkCow3WQKytgwyv4Iwd9C68ONHG1+8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-IYn3_tWUM3Wytp9m3w3z1w-1; Fri, 23 May 2025 05:16:29 -0400
X-MC-Unique: IYn3_tWUM3Wytp9m3w3z1w-1
X-Mimecast-MFC-AGG-ID: IYn3_tWUM3Wytp9m3w3z1w_1747991788
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-550ea994962so3694846e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747991788; x=1748596588;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4h+Yy62ZlA2qwCk7aDUUsgmb3Ggi1tOTOzIVVOOKlg0=;
        b=ggCTzaffA5YHUc7/blZeodR23c2WqyBFSYBLMk2z0XPOmSwmgLnGsry/QRXV7XPKQ6
         K4Jkke1kE4krPQqw/qyrsnxZPa8i/2yFWF/d4nOJK+Nif66/VjqvN9MLwsk2ffvx5B8R
         sbISvVARcT3W2ToAD/K4SaOiWsLI2Mtc0jgFq3e6ypQP0LY0OZyGLW4qnJBqpNbfzC5/
         ZW0dKpv1faawbsZ6Bs9jZpcHiyWsoAydf5T/Rwucw7rJJB6Hvp4Wc+8SOG2TaKjyqm9f
         XKICkZKqhXnIEzw0Ta9fKfFdD0VFxVZQPCo00K0Njybj8eNtlZS+2ipGKz10nChn572B
         4PlA==
X-Forwarded-Encrypted: i=1; AJvYcCVClXuMP7Z7iemoGxk/Jp4ST2sihNwGhIn6XJJSPn6GxfC+qm2eFBXoA33J+dykjvxrs/KZ12+NobebHOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY9eWt8hqmnE1kkG1YCvTlhN3cwoLjMgrOmmq2/0xXl5IONHFu
	f9keoTDkzGPdprdeTEStJ1uJAsD4QgagdBMyYuY8SwzcZN/WHJxK8OjotzvD/+C8dO5O1972T+2
	FZoeMEYxcQGhdWN2KkZFAh1JRvjL6VETOexLNODfI23SC4UAByMajkHELjPktjbW61w==
X-Gm-Gg: ASbGncsTwQkyfijAdxdwjo8YF5NwKALStM5y+quzfARtbU4eGrqgv4MHX3mZwqgVeB5
	dqstFGF+txphD60chRXItqt21yVPLykRGTLYP2AHf91Jdf/8orwEPE3gDqdGctYHPq5IAK5dzJY
	z5tlqPrd/SMNCohNp7G5vxxr7L3XUHTMO4VuKYZq7DEIAyEcGpcPQ4a0K+tByspaAJ7zZVjB4Iy
	P9yMscNUmBuXwLzPqui3bUribf1kwoX2MeI91beBo5D3YnMFuT8R1Jchq4V1q+xF16KIiI6IGEY
	bETrDXRf
X-Received: by 2002:a05:6512:3e02:b0:54f:c049:4a5b with SMTP id 2adb3069b0e04-550e7250abfmr9351890e87.47.1747991787857;
        Fri, 23 May 2025 02:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaQ8huunxoEwtFAoZuCgaFT5mLEdvGiJVduPobo6lkNXw2BcUK9t7VQv5UbiSdEGhNk4eBJA==
X-Received: by 2002:a05:6512:3e02:b0:54f:c049:4a5b with SMTP id 2adb3069b0e04-550e7250abfmr9351877e87.47.1747991787407;
        Fri, 23 May 2025 02:16:27 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550eb6c7155sm3573232e87.22.2025.05.23.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:16:26 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id B2C911AA3B94; Fri, 23 May 2025 11:16:25 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Dong Chenchen <dongchenchen2@huawei.com>, hawk@kernel.org,
 ilias.apalodimas@linaro.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 almasrymina@google.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhangchangzhong@huawei.com, Dong Chenchen <dongchenchen2@huawei.com>,
 syzbot+204a4382fcb3311f3858@syzkaller.appspotmail.com
Subject: Re: [PATCH net] page_pool: Fix use-after-free in
 page_pool_recycle_in_ring
In-Reply-To: <20250523064524.3035067-1-dongchenchen2@huawei.com>
References: <20250523064524.3035067-1-dongchenchen2@huawei.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 23 May 2025 11:16:25 +0200
Message-ID: <878qmnn0uu.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dong Chenchen <dongchenchen2@huawei.com> writes:

> syzbot reported a uaf in page_pool_recycle_in_ring:
>
> BUG: KASAN: slab-use-after-free in lock_release+0x151/0xa30 kernel/lockin=
g/lockdep.c:5862
> Read of size 8 at addr ffff8880286045a0 by task syz.0.284/6943
>
> CPU: 0 UID: 0 PID: 6943 Comm: syz.0.284 Not tainted 6.13.0-rc3-syzkaller-=
gdfa94ce54f41 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 09/13/2024
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0x169/0x550 mm/kasan/report.c:489
>  kasan_report+0x143/0x180 mm/kasan/report.c:602
>  lock_release+0x151/0xa30 kernel/locking/lockdep.c:5862
>  __raw_spin_unlock_bh include/linux/spinlock_api_smp.h:165 [inline]
>  _raw_spin_unlock_bh+0x1b/0x40 kernel/locking/spinlock.c:210
>  spin_unlock_bh include/linux/spinlock.h:396 [inline]
>  ptr_ring_produce_bh include/linux/ptr_ring.h:164 [inline]
>  page_pool_recycle_in_ring net/core/page_pool.c:707 [inline]
>  page_pool_put_unrefed_netmem+0x748/0xb00 net/core/page_pool.c:826
>  page_pool_put_netmem include/net/page_pool/helpers.h:323 [inline]
>  page_pool_put_full_netmem include/net/page_pool/helpers.h:353 [inline]
>  napi_pp_put_page+0x149/0x2b0 net/core/skbuff.c:1036
>  skb_pp_recycle net/core/skbuff.c:1047 [inline]
>  skb_free_head net/core/skbuff.c:1094 [inline]
>  skb_release_data+0x6c4/0x8a0 net/core/skbuff.c:1125
>  skb_release_all net/core/skbuff.c:1190 [inline]
>  __kfree_skb net/core/skbuff.c:1204 [inline]
>  sk_skb_reason_drop+0x1c9/0x380 net/core/skbuff.c:1242
>  kfree_skb_reason include/linux/skbuff.h:1263 [inline]
>  __skb_queue_purge_reason include/linux/skbuff.h:3343 [inline]
>
> root cause is:
>
> page_pool_recycle_in_ring
>   ptr_ring_produce
>     spin_lock(&r->producer_lock);
>     WRITE_ONCE(r->queue[r->producer++], ptr)
>       //recycle last page to pool
> 				page_pool_release
> 				  page_pool_scrub
> 				    page_pool_empty_ring
> 				      ptr_ring_consume
> 				      page_pool_return_page  //release all page
> 				  __page_pool_destroy
> 				     free_percpu(pool->recycle_stats);
> 				     free(pool) //free
>
>      spin_unlock(&r->producer_lock); //pool->ring uaf read
>   recycle_stat_inc(pool, ring);
>
> page_pool can be free while page pool recycle the last page in ring.
> Add producer-lock barrier to page_pool_release to prevent the page
> pool from being free before all pages have been recycled.
>
> Suggested-by: Jakub Kacinski <kuba@kernel.org>
> Link: https://lore.kernel.org/netdev/20250513083123.3514193-1-dongchenche=
n2@huawei.com
> Fixes: ff7d6b27f894 ("page_pool: refurbish version of page_pool code")
> Reported-by: syzbot+204a4382fcb3311f3858@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D204a4382fcb3311f3858
> Signed-off-by: Dong Chenchen <dongchenchen2@huawei.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

