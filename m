Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3D28A3F9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423301; cv=none; b=rc+8bY1k3g3y8qSQFAOHBjPTAlXMt7wuKj2zZZhMq8gz0cq3MF6nKYnW8N7WgCNsL0cvy+rRA3wzLcnWVA8of/XUId+GRwlXknWNe3/XwxYDyilO8xLygkhzAWeKsRzjXWVWE4LQ3bR2HsH2n9Ucj3KNrh528GHxT6wy85BajQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423301; c=relaxed/simple;
	bh=TMWxvRwLgAuk7MEXyPeTN9k9WqrUYKuo8TciIrD4hzE=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=GdyELC5jUnTfQ5yWbsfpU/Uqd41BHG895AgPgV65t38v7zWAUBQ2BHcQmb5g7CKukJ2vt0GD4kOP45k82osGOvQHXoJ28GfJBlJBP/3ENcvQudL15RMlhus7kPJFX80b9PmDEpbYXiD6a+LY+xSvJAMlRQ+y6F3hNugpAf2jlr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p+8Ilk4t; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p+8Ilk4t"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745423297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ff17WZFxu67PNkbJBO+JX+8St9CljDp4X4Y65eqRDE=;
	b=p+8Ilk4t6h5IJzadE4De6H7iPNqW7gb4OE3/s5bmrg3JBbnoZ+eEAmABRW4J9J7gOdz2Qa
	qrFIw+onyja499qrar2C9ewy2gsZww5AmgzKrgs214kpIF9CwwQd0A/zXvuTEwp1eHuJKl
	UgXEaVayJ7ZUkC2K7lu7/pMz/GWeMCk=
Date: Wed, 23 Apr 2025 15:48:14 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jiayuan Chen" <jiayuan.chen@linux.dev>
Message-ID: <a89746d8897c81ed6e55c99d8ba71223ef3e318c@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v1] workqueue: annotate data-races around pwq->stats
To: "Tejun Heo" <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, mrpre@163.com, mkoutny@suse.com,
 syzbot+01affb1491750534256d@syzkaller.appspotmail.com, "Lai Jiangshan"
 <jiangshanlai@gmail.com>
In-Reply-To: <aAkHrjU22pCSkWif@slm.duckdns.org>
References: <20250423125341.503659-1-jiayuan.chen@linux.dev>
 <aAkHrjU22pCSkWif@slm.duckdns.org>
X-Migadu-Flow: FLOW_OUT

April 23, 2025 at 23:30, "Tejun Heo" <tj@kernel.org> wrote:



>=20
>=20On Wed, Apr 23, 2025 at 08:53:41PM +0800, Jiayuan Chen wrote:
>=20
>=20>=20
>=20> Suppress warning by annotating these accesses using
> >=20
>=20>  READ_ONCE() / WRITE_ONCE().
> >=20
>=20>=20=20
>=20>=20
>=20>  Reported-by: syzbot+01affb1491750534256d@syzkaller.appspotmail.com
> >=20
>=20>  Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> >=20
>=20>  ---
> >=20
>=20>  kernel/workqueue.c | 2 +-
> >=20
>=20>  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
>=20>=20=20
>=20>=20
>=20>  diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> >=20
>=20>  index cf6203282737..d78640b5d188 100644
> >=20
>=20>  --- a/kernel/workqueue.c
> >=20
>=20>  +++ b/kernel/workqueue.c
> >=20
>=20>  @@ -3241,7 +3241,7 @@ __acquires(&pool->lock)
> >=20
>=20>  * point will only record its address.
> >=20
>=20>  */
> >=20
>=20>  trace_workqueue_execute_end(work, worker->current_func);
> >=20
>=20>  - pwq->stats[PWQ_STAT_COMPLETED]++;
> >=20
>=20>  + WRITE_ONCE(pwq->stats[PWQ_STAT_COMPLETED], READ_ONCE(pwq->stats[=
PWQ_STAT_COMPLETED]) + 1);
> >=20
>=20
> The function acquires pool->lock down below. Can you move it down insid=
e the
>=20
>=20locked region instead of adding READ/WRITE_ONCE()?
>=20
>=20Thanks.
>=20
>=20--=20
>=20
> tejun
>
Thanks, I can do that.
Previously, I thought it was for performance considerations that the
metrics calculation is out of the lock's scope...
