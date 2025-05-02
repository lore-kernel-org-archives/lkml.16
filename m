Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8562566E1
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197058; cv=none; b=hj4UPN1+CjMZOsY7u6bogr3NYz3yOaPcWOc8AAIfXTt7QUXwAsps/umRc/nkLQ22Aq5XmgZZp0ObvR0WRfRIWyW8K3k5CrrennY/QwVuokOzknGO0AhhJof4e6/1iZhDx5+Nn3A2p3Cq1bS6mGgZbRUdhF12dupU2SZP3/WPGpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197058; c=relaxed/simple;
	bh=YM4nxjGPM82cBAL4PTrSn6HY1CBpx/x5i09S17FY5OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+Ai9w3lQPzKntdxw6rv3lPDHyNAyA+SN57BEIzKLYOmkwn9K2OL4zCFuxBvwN5e3Oymjq03ph8wOEDGz7fT8kRQnb4RPycJMmqkwFATzRaJ5K2jIbX6Lb48TQKuEyifcdXbuUSjAAZZaEf1tJDMlZpHThnmUr+fGzLglf77h+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=UNTorgAf; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="UNTorgAf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-309f26c68b8so250847a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746197055; x=1746801855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHJMmFhWBAYHhFK9RzSHB8nkJipHNujcMDYDDiWaOvo=;
        b=UNTorgAf/qmSMD7O6j5Y2Ra6DA3YUVhnKAHqH1dYeG4HmAL2R8t6nDmfbt7+kj+ahJ
         B/9yggX9i4bRQu0yjUD5LZAFb2khyYvTxVBdd29hC1GTw/kGaPq7mJxx7V+n61IPOHJj
         ApS2p2wXxHuduXytWzYnSZcfIVs+hgOvMXut0CjSuVpVuBsseDNa7Yh94Ea8K4e5x3dm
         LBqUGE20zABTt30rnQjvMiWzCuDgIHHqSmYmzbGQbwqpV+gxDOp4PfQwNBwuUKmHADiS
         VmZFyqpkxYFabcXD5V/RiRwFQ8CklxSs54bWbliwVE4vYiIjcEPUucdjf0+9lXU1sWZ8
         dYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197055; x=1746801855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHJMmFhWBAYHhFK9RzSHB8nkJipHNujcMDYDDiWaOvo=;
        b=qPmfqAHXVd4C6WwH/6F2ohxDPN6SRkzDi4QyhTU0N/5U+FM0NiOCAIkPUeQdO+1V83
         LqP6dq98aw8Wa+e4PD4ZUzlTZJYX7oGkc41RGe1K3lLFpzz9BzNJTYEFgGZYty+sXlLA
         +GgPz+dp55nNij9u4ugN7hzA03vjrD/UZxMUT0dp12zChTlIExRMwD69OEsy8tIZHdQp
         37HrIZT1bf77s4hDNa/cTY78+MbROM/83HJyBVrP/nCOGmPVEGhLe4CB0mXS3ML+IHO6
         810ayzr3nTvTJqdRyLcE5t4kjplYNB/xzl2/HgRg4fn46cEG2iq56mwgwMy8bX2qAAER
         +1aw==
X-Forwarded-Encrypted: i=1; AJvYcCXU067G3SIQ6I7j6yCjfWzYElGn7BRklrhGjlxZPj/MduzSiV3cWuT/OhSQQfNxGYxbKa6kFV7r3uROqyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZRVYQfLAKggIRGz6VxaOR44NrC2ah4t5o50ovolE4Y9l+S8w
	E1sgWZP3wWv8xmnViFLXako4toSs6vUgnPwe53/OcQCRtHvLo9yCnrtVvv4SEUTBJCta8dWF7O5
	8A/vzLK2EX1OFr1b87iRxWcbFYgs68DbQ3yunmA==
X-Gm-Gg: ASbGncvR8hXcOdIn+uY1Z5T9INTVzTnq/4PS41UqtDUfCTG9ZZ2mAUk8sM40mS+ea4C
	8+a0120T/+8eBr3HsWf7YmckXvJW3VLboGrU9+w8fblgj/cJSbbps+5suHicPNuU0LOqMGlslgF
	WlAC0km9xMg0aRe/AkAZBv
X-Google-Smtp-Source: AGHT+IFl0inJgS/yeEgPzKt0JdBYw8YwsH3yKlEbg2EjHzlsz5lARVOHJjj/0pA+2oUAPwhkj56tuNJXuuBKO+AOaGs=
X-Received: by 2002:a17:90b:4d10:b0:2fe:a747:935a with SMTP id
 98e67ed59e1d1-30a4e6beca4mr1964031a91.4.1746197055246; Fri, 02 May 2025
 07:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426011728.4189119-1-csander@purestorage.com>
In-Reply-To: <20250426011728.4189119-1-csander@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 2 May 2025 07:44:04 -0700
X-Gm-Features: ATxdqUHs8vyPK-Db2sBcRK85cf37jk2QFZvL-ryJRX27GGq9LbBC89_UfkXgsd8
Message-ID: <CADUfDZq54SYfc6XNa6b3i7oktLfL+T-C-DSfka5wyh1WafbowA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] block: avoid hctx spinlock for plug with multiple queues
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jens,
Christoph has reviewed this series. Would you mind queueing it up for 6.16?

Thanks,
Caleb

On Fri, Apr 25, 2025 at 6:17=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> blk_mq_flush_plug_list() has a fast path if all requests in the plug
> are destined for the same request_queue. It calls ->queue_rqs() with the
> whole batch of requests, falling back on ->queue_rq() for any requests
> not handled by ->queue_rqs(). However, if the requests are destined for
> multiple queues, blk_mq_flush_plug_list() has a slow path that calls
> blk_mq_dispatch_list() repeatedly to filter the requests by ctx/hctx.
> Each queue's requests are inserted into the hctx's dispatch list under a
> spinlock, then __blk_mq_sched_dispatch_requests() takes them out of the
> dispatch list (taking the spinlock again), and finally
> blk_mq_dispatch_rq_list() calls ->queue_rq() on each request.
>
> Acquiring the hctx spinlock twice and calling ->queue_rq() instead of
> ->queue_rqs() makes the slow path significantly more expensive. Thus,
> batching more requests into a single plug (e.g. io_uring_enter syscall)
> can counterintuitively hurt performance by causing the plug to span
> multiple queues. We have observed 2-3% of CPU time spent acquiring the
> hctx spinlock alone on workloads issuing requests to multiple NVMe
> devices in the same io_uring SQE batches.
>
> Add a medium path in blk_mq_flush_plug_list() for plugs that don't have
> elevators or come from a schedule, but do span multiple queues. Filter
> the requests by queue and call ->queue_rqs()/->queue_rq() on the list of
> requests destined to each request_queue.
>
> With this change, we no longer see any CPU time spent in _raw_spin_lock
> from blk_mq_flush_plug_list and throughput increases accordingly.
>
> Caleb Sander Mateos (3):
>   block: take rq_list instead of plug in dispatch functions
>   block: factor out blk_mq_dispatch_queue_requests() helper
>   block: avoid hctx spinlock for plug with multiple queues
>
>  block/blk-mq.c      | 110 +++++++++++++++++++++++++++++++-------------
>  block/mq-deadline.c |   2 +-
>  2 files changed, 79 insertions(+), 33 deletions(-)
>
> v2:
> - Leave unmatched requests in plug list instead of building a new list
> - Add Reviewed-by tags
>
> --
> 2.45.2
>
