Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B351A0BE0
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747837508; cv=none; b=K9eFE+4GKoLIvEiY3j0E2ciy2LbImE1VhPP0IcE/51mdrUboIXUYSRh3xGBKLxPB+6qsjPskbMu3h1k9MDzANa0uDpBMhvnZ+wklRWMh7uuJNgzKp8vNVxTkNCZd+S3Imbm0saeDRjaQt8hcCvoSwlCpTFr/q58DutJ1tMdc7GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747837508; c=relaxed/simple;
	bh=dGwumfjerIdNUT+ZWre17rwws9aXIHeRWCUz04oVeYs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SATCFz8wwaTGHB2o6DyyvWHu/dIb0sNuLFYT3yRbusw9aTDyf+vW2+L0/8tS0LmDZASpH+8R1Ximgk8YdMpEjOhoxuOySrt0TlKD4ngyzcpm2350+7aIHGFblDJFG+XL5fwet0t4RfrYkekUoWK6G2VTbOzZAz5mzJLMd1znBn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OqMwCyTJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OqMwCyTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747837505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zgFUH6Mk2Tk3iZDN9fsX7d3b+mQtNEFvHxIiCpWP5nk=;
	b=OqMwCyTJjkDSp9GPYkPHvXHUFhfhni4dsK1EYsaE6C5Aqjf4NFXZuAEbvHAS7oeRcKqIpc
	Iw3jCngXlM8pDVc+3IR0U8dsG/oqMzlRSJ2reShGq5NWgFz4/+yb2J8TSC5HRYE0Cuhr8e
	DoxrOe1Uq6mJ1is9/7mVur9JW1Rn6gI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-X96c0DJAO4-HyDbQHHAXrQ-1; Wed, 21 May 2025 10:25:04 -0400
X-MC-Unique: X96c0DJAO4-HyDbQHHAXrQ-1
X-Mimecast-MFC-AGG-ID: X96c0DJAO4-HyDbQHHAXrQ_1747837503
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so51102345e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747837503; x=1748442303;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgFUH6Mk2Tk3iZDN9fsX7d3b+mQtNEFvHxIiCpWP5nk=;
        b=gfqtRYnl2TM/aDjNFjQI2dEZcxJiioXAB4cC44DAiDu/0/peatfW3/9vKxMi7B4Swb
         NU1hBwtMfe5+6zg/Nv084nlUE3rkLQ7Ovzg8P+UfPRXIA3ALUrkUCIWdghblFfiVSSaN
         yY4MMeQE01HPs1m5LoZ8/7VVA8sCqmseqLllyqLOsIlWaqYN7HMOQvrYvxGf/fV1shnD
         ihwGMjZRhF4i6lmBY+ES5ZE/ua+DbPVmOLbPFKtj0Myd8nR60tBJgkIxddr5ZIW4w2PI
         SNHlehykuwwtFRI8ensrBfUl8NYesyw+byTEYmBJwEv5RYX0FSf9QmDwRqVQPl2sFt9i
         3YPA==
X-Forwarded-Encrypted: i=1; AJvYcCW5WqF+X2ftl5uF/pXHggJHXJPFTMjys+b+cIEZPHNBx/TuTS3Niundjm3ANFgJZH0vzlhEG/C5XzHydFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI82afJMFDIZTTJ0jm3jDKeGfai8YkgAkwWle+C3i+qykAAuaz
	KD/mgXaAi/3IvusDxHjdVglekdoje9SxYHcYpATJX4oD5rlPGURlmlvzDRvAQb67X7tq+M7rk2w
	FtP4PetmX9bUH2MjeiDW8RAJqWJtXeFEwXsLu6pXUUDIHHCLb83T/hgrPEGuVUPoHUQ==
X-Gm-Gg: ASbGncstSs5hxJYPCaDCDEZo39LbCbH5QUn+TaoL5dyiD3JTCejwMJ82sDWSkYZVhfH
	CSZ9v0xGyhhPJUa8kU8/gWzYSBcKcKds/+N7B6EboetyKBaFbWo/jITEHHnh5o4ZogvHa7+ijWX
	97Okf2DKRDWesoi3J7XbxWERmRhFSPARrKjaCNEe+A/BIwrqqe2BFGVa9lag28iK3ajRET6KVzk
	QJGjpPSrZa/RloqjR8zQHlozc8G+HMF8oAxCafVUhbu0CZo54SFixRXh1MhQrJseSEowKphIcRt
	lZq8I71LkPvMAtwyxBAknKQbJcEbuwYnc5MEYkIYB7JJ2iSAZfC9rVGRk1CFkaIn7MYH5Jvb
X-Received: by 2002:a5d:6702:0:b0:3a3:62c0:ff2 with SMTP id ffacd0b85a97d-3a362c010eemr15257835f8f.55.1747837503046;
        Wed, 21 May 2025 07:25:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/QB/m/PaAE/NQF15UKfuoxKAy6eEZT5rwMLl3Ovj5Sqrsob4y4T/qN2qBBMxZXcSFJxkoRA==
X-Received: by 2002:a5d:6702:0:b0:3a3:62c0:ff2 with SMTP id ffacd0b85a97d-3a362c010eemr15257810f8f.55.1747837502559;
        Wed, 21 May 2025 07:25:02 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88978sm20266010f8f.65.2025.05.21.07.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:25:01 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 John Ogness <john.ogness@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-rt-users@vger.kernel.org, Joe Damato
 <jdamato@fastly.com>, Martin Karsten <mkarsten@uwaterloo.ca>, Jens Axboe
 <axboe@kernel.dk>
Cc: Nam Cao <namcao@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH] eventpoll: Fix priority inversion problem
In-Reply-To: <20250519074016.3337326-1-namcao@linutronix.de>
References: <20250519074016.3337326-1-namcao@linutronix.de>
Date: Wed, 21 May 2025 16:25:00 +0200
Message-ID: <xhsmh8qmq9h37.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 19/05/25 09:40, Nam Cao wrote:
> @@ -136,14 +136,28 @@ struct epitem {
>               struct rcu_head rcu;
>       };
>
> -	/* List header used to link this structure to the eventpoll ready list */
> -	struct list_head rdllink;
> +	/*
> +	 * Whether this item can be added to the eventpoll ready list. Adding to the list can be
> +	 * blocked for two reasons:
> +	 *
> +	 *  1. This item is already on the list.
> +	 *  2. A waiter is consuming the ready list and has consumed this item. The waiter therefore
> +	 *     is blocking this item from being added again, preventing seeing the same item twice.
> +	 *     If adding is blocked due to this reason, the waiter will add this item to the list
> +	 *     once consuming is done.
> +	 */
> +	bool link_locked;

Nit: IIUC it's not just the readylist, it's anytime the link is used
(e.g. to punt it on a txlist), so how about:

        /*
         * Whether epitem.rdllink is currently used in a list. When used, it
         * cannot be detached or inserted elsewhere.
         *
         * It may be in use for two reasons:
         *
         * 1. This item is on the eventpoll ready list
         * 2. This item is being consumed by a waiter and stashed on a temporary
         *    list. If adding is blocked due to this reason, the waiter will add
         *    this item to the list once consuming is done.
         */
         bool link_used;

>
>       /*
> -	 * Works together "struct eventpoll"->ovflist in keeping the
> -	 * single linked chain of items.
> +	 * Indicate whether this item is ready for consumption. All items on the ready list has this
> +	 * flag set. Item that should be on the ready list, but cannot be added because of
> +	 * link_locked (in other words, a waiter is consuming the ready list), also has this flag
> +	 * set. When a waiter is done consuming, the waiter will add ready items to the ready list.
>        */
> -	struct epitem *next;
> +	bool ready;
> +
> +	/* List header used to link this structure to the eventpoll ready list */
> +	struct llist_node rdllink;
>
>       /* The file descriptor information this item refers to */
>       struct epoll_filefd ffd;

> @@ -361,10 +368,27 @@ static inline int ep_cmp_ffd(struct epoll_filefd *p1,
>               (p1->file < p2->file ? -1 : p1->fd - p2->fd));
>  }
>
> -/* Tells us if the item is currently linked */
> -static inline int ep_is_linked(struct epitem *epi)
> +static void epitem_ready(struct epitem *epi)
>  {
> -	return !list_empty(&epi->rdllink);
> +	/*
> +	 * Mark it ready, just in case a waiter is blocking this item from going into the ready
> +	 * list. This will tell the waiter to add this item to the ready list, after the waiter is
> +	 * finished.
> +	 */
> +	xchg(&epi->ready, true);

Perhaps a stupid question, why use an xchg() for .ready and .link_locked
(excepted for that epitem_ready() cmpxchg()) writes when the return value
is always discarded? Wouldn't e.g. smp_store_release() suffice, considering
the reads are smp_load_acquire()?

> +
> +	/*
> +	 * If this item is not blocked, add it to the ready list. This item could be blocked for two
> +	 * reasons:
> +	 *
> +	 * 1. It is already on the ready list. Then nothing further is required.
> +	 * 2. A waiter is consuming the ready list, and has consumed this item. The waiter is now
> +	 *    blocking this item, so that this item won't be seen twice. In this case, the waiter
> +	 *    will add this item to the ready list after the waiter is finished.
> +	 */
> +	if (!cmpxchg(&epi->link_locked, false, true))
> +		llist_add(&epi->rdllink, &epi->ep->rdllist);
> +
>  }
>
>  static inline struct eppoll_entry *ep_pwq_from_wait(wait_queue_entry_t *p)

> @@ -1924,19 +1874,39 @@ static int ep_send_events(struct eventpoll *ep,
>                        * Trigger mode, we need to insert back inside
>                        * the ready list, so that the next call to
>                        * epoll_wait() will check again the events
> -			 * availability. At this point, no one can insert
> -			 * into ep->rdllist besides us. The epoll_ctl()
> -			 * callers are locked out by
> -			 * ep_send_events() holding "mtx" and the
> -			 * poll callback will queue them in ep->ovflist.
> +			 * availability.
>                        */
> -			list_add_tail(&epi->rdllink, &ep->rdllist);
> +			xchg(&epi->ready, true);
> +		}
> +	}
> +
> +	llist_for_each_entry_safe(epi, tmp, txlist.first, rdllink) {
> +		/*
> +		 * We are done iterating. Allow the items we took to be added back to the ready
> +		 * list.
> +		 */
> +		xchg(&epi->link_locked, false);
> +
> +		/*
> +		 * In the loop above, we may mark some items ready, and they should be added back.
> +		 *
> +		 * Additionally, someone else may also attempt to add the item to the ready list,
> +		 * but got blocked by us. Add those blocked items now.
> +		 */
> +		if (smp_load_acquire(&epi->ready)) {
>                       ep_pm_stay_awake(epi);
> +			epitem_ready(epi);
>               }

Isn't this missing a:

                list_del_init(&epi->rdllink);

AFAICT we're always going to overwrite that link when next marking the item
as ready, but I'd say it's best to exit this with a clean state. That would
have to be before the clearing of link_locked so it doesn't race with a
concurrent epitem_ready() call.

>       }
> -	ep_done_scan(ep, &txlist);
> +
> +	__pm_relax(ep->ws);
>       mutex_unlock(&ep->mtx);
>
> +	if (!llist_empty(&ep->rdllist)) {
> +		if (waitqueue_active(&ep->wq))
> +			wake_up(&ep->wq);
> +	}
> +
>       return res;
>  }
>

