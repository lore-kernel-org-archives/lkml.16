Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D2B239090
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 20:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747166814; cv=none; b=hZvsx0torgiJbsz5Md77O/lrd7N13aiy5L68LZfj8IVVVST7vU8z0xTg7haHr22CxNiL5lEGmkbAm2SlWhy+gylTiwN6LZRo+V7REO6zlBD7fPP2eGEwldBUP8OacSIuyJF06+L+ftbgUkmQCXkm5lyBPglfeOiYMU/P/DuqczI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747166814; c=relaxed/simple;
	bh=o52Shuc72gvRTkEZy8IOLE/KGJmtn5JqlpBzMqM9G8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/IkIAhgB2SbkFMn8xLZDyreKHRwzOtx/gIy8VsMfkJJkaHAQR5552mQUtcLfCJEaJb2N6+iLXeFz+gJqRTJNS23HdcBo/uD+9R9XOx2/fGEBYEzQgSb+GJB8uN2dewq3RHSqRsFXpy14fpL/aV5LR30TjnA0O+0qQAdIUy/qbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eRguNqVL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eRguNqVL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e39fbad5fso2685ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747166812; x=1747771612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rPCmAarNPsWzOsNBR4e67cSe75uc4M7DiWlF0eW5QM=;
        b=eRguNqVLuSyEKmUSFzjwOh35ZDOJ9a0XJdycEUVqe7/ybq9GpIp9r8azRkCtE9j7Q1
         N4CXurt9YcArkf1BjAoqEY9Cljp2s7HiujnCyNtMdTVSSKYIjEwnekdW5dYeil4tIzv/
         7RiUWkdxgTS5rwqEiv4hmIRAraoUmaxkTCeUSo2Mo9qjmEqiq6O/PwmjeN+D8+8udfYy
         BxtytAHqoIg+0Cx7gXt2Pl36jYYadfxpKPvobkXzZF4CCIaj3Tjow571ry78SQc7T09+
         cd0QlDg1mKTwlXF5Kh7gmQBq5TZSkOxmt02UZUvckaxh1bjctz8woOhp5EibwYR9oWm5
         yXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747166812; x=1747771612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rPCmAarNPsWzOsNBR4e67cSe75uc4M7DiWlF0eW5QM=;
        b=uAfLAnhxZ458fVCPsAxQ/0pFy9g/Uj4Ej4Jb4l5PV1VJP+0V5Q4CYSF4WOwcCWM206
         ryIx4b6+sWI84x0m2bAaGt/e5RsH2zdltT9rznTzT5RNEfsw4tGsUYBCOEkNRD3kuugk
         irL/5y+a0Nv3iUHrD2VwMLXTaREOkZOZ2/8buIGaFB3dEB0OEyMhuXl60j7qxJqhKGT1
         U1Dy2y6tcjK+AaEuXiXV+6a3aSEdDKOeaeip0Re6aqb77eGtkjCzxmhUzU2YezcSdbvI
         wjsIZzQN6rPL57VGAf0psKfS0z2rMnxMDuCKEJaecWWRHbCdpyAxBIinYEEjyH8t9nWc
         zouA==
X-Forwarded-Encrypted: i=1; AJvYcCV7XcOGTdxjzSbFY6pv2+Zq5yiTE1IrnYJB7z7AIUuStEzy4xPG6p009rmSQdlazCWLigl5LcVskeh+7JM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm7hYSZU7Z2UodTsBP6pXpZDwrUgLM17AtgC7tA6dY78wMO4fY
	Wrwp6ENUyF0h7W7TpUUrM8ctKg4dR6Momu9VMMZN53k+d224IXUApM8deQlpL7V+oV6koJa/mly
	RSwGqK/xZxoxG8wmkvq7aJLYkX5IGs6LGUCI7oqnh
X-Gm-Gg: ASbGncvdt47iCNrx7qMRpfu3pLv9Ppwco+rikTTK9pRzO7EhIhvK6YYSqNCSrallDEh
	uvUK+dN97VqZm32Ejq6dxgePl9wAsmaefEXEv1dYxE3NmoMeNYgs+rBf1eclOMa+fQalOn1wbb5
	G10fbRSSj2cd8FEihllRhiPvhdv6t/dQc9YA==
X-Google-Smtp-Source: AGHT+IGhZjk4b6G4kZV3NH5EzKI4MlUpU1dAA24xo7WpnnIHfHSJHgngBwC2SeRSa6VXICqza/ELFFsipbqOEvdH9S8=
X-Received: by 2002:a17:903:1109:b0:215:f0c6:4dbf with SMTP id
 d9443c01a7336-2319909c216mr753825ad.14.1747166811908; Tue, 13 May 2025
 13:06:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513083123.3514193-1-dongchenchen2@huawei.com>
In-Reply-To: <20250513083123.3514193-1-dongchenchen2@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 13 May 2025 13:06:38 -0700
X-Gm-Features: AX0GCFs7Cbg_8YTasAUImURj1C3OFTGIiIpdUn50jxt5gDQdmG7hQgrG_-KfSqE
Message-ID: <CAHS8izOio0bnLp3+Vzt44NVgoJpmPTJTACGjWvOXvxVqFKPSwQ@mail.gmail.com>
Subject: Re: [BUG Report] KASAN: slab-use-after-free in page_pool_recycle_in_ring
To: Dong Chenchen <dongchenchen2@huawei.com>
Cc: hawk@kernel.org, ilias.apalodimas@linaro.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	zhangchangzhong@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 1:28=E2=80=AFAM Dong Chenchen <dongchenchen2@huawei=
.com> wrote:
>
> Hello,
>
> syzkaller found the UAF issue in page_pool_recycle_in_ring[1], which is
> similar to syzbot+204a4382fcb3311f3858@syzkaller.appspotmail.com.
>
> root cause is as follow:
>
> page_pool_recycle_in_ring
>   ptr_ring_produce
>     spin_lock(&r->producer_lock);
>     WRITE_ONCE(r->queue[r->producer++], ptr)
>       //recycle last page to pool
>                                 page_pool_release
>                                   page_pool_scrub
>                                     page_pool_empty_ring
>                                       ptr_ring_consume
>                                       page_pool_return_page //release all=
 page
>                                   __page_pool_destroy
>                                      free_percpu(pool->recycle_stats);
>                                      kfree(pool) //free
>
>      spin_unlock(&r->producer_lock); //pool->ring uaf read
>   recycle_stat_inc(pool, ring);
>
> page_pool can be free while page pool recycle the last page in ring.
> After adding a delay to the page_pool_recycle_in_ring(), syzlog[2] can
> reproduce this issue with a high probability. Maybe we can fix it by
> holding the user_cnt of the page pool during the page recycle process.
>
> Does anyone have a good idea to solve this problem?
>

Ugh. page_pool_release is not supposed to free the page_pool until all
inflight pages have been returned. It detects that there are pending
inflight pages by checking the atomic stats, but in this case it looks
like we've raced checking the atomic stats with another cpu returning
a netmem to the ptr ring (and it updates the stats _after_ it already
returned to the ptr_ring).

My guess here is that page_pool_scrub needs to acquire the
r->producer_lock to make sure there are no other producers returning
netmems to the ptr_ring while it's scrubbing them (and checking after
to make sure there are no inflight netmems).

Can you test this fix? It may need some massaging. I only checked it
builds. I haven't thought through all the possible races yet:

```
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 2b76848659418..8654608734773 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -1146,10 +1146,17 @@ static void page_pool_scrub(struct page_pool *pool)

 static int page_pool_release(struct page_pool *pool)
 {
+       bool in_softirq;
        int inflight;

+
+       /* Acquire producer lock to make sure we don't race with another th=
read
+        * returning a netmem to the ptr_ring.
+        */
+       in_softirq =3D page_pool_producer_lock(pool);
        page_pool_scrub(pool);
        inflight =3D page_pool_inflight(pool, true);
+       page_pool_producer_unlock(pool, in_softirq);
        if (!inflight)
                __page_pool_destroy(pool);
```
