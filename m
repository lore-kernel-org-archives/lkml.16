Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58122635
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 04:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747370701; cv=none; b=mticmJBzzahFIXf+QADuFp+DwLVnZXY6pz+afiNHhdRrSGPB4NA1NZVYcsBFugPdAFofjXuULjRYOKSQzd9QKg7aELuiJnDDZwxBbzk/3pnDMN2cvKukwg/RbTOw3LP87jZ6vb7Md/Qz8NugzxKvZZ1w8Lvk0Qhq84XkbuagQWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747370701; c=relaxed/simple;
	bh=WSpzODpV4dJWy/J5dEH9vbYqEWoBxCuasvmRptIrYNA=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:To:Cc; b=KlaI7iBj3lnBUoq/YNg5COV4lAxPpz9ptSMSferHvVy9HwQEEkJBTV5vv/Kv+lLWLxanZiIJBT+6klY9pekNiBPFSWoatZO/rBtIPGDWSZEM7ZT1j4USJMrFNV808J60eK68VbTEyukuO67EuF05lqtWljbKwQraAm6TUO8YpGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fnOanZqk; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fnOanZqk"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747370696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bf8BD4LEhzFGD3sMsBfuBuusPKPc5rowAvEBihUw1v0=;
	b=fnOanZqkBDFdlWMxADgGrlTABQieTPSxlvwkOOOMIYMxxR0XYGG0Nc3qSs8IccxylQFIZO
	I5eAMoHGMCNbh/AZnyAkvMM1b0zoa1ST26PssFvhy4ZBKhzHIU2RqMmaBn3vPKD67U6JZK
	2mtk/n3RMp+0yoljoCRlInVRqopzH1I=
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] workqueue: show the latest function name in /proc/PID/{comm,stat,status}
Message-Id: <8A1F225D-714C-427C-A0ED-1DE5D93DEAD1@linux.dev>
Date: Fri, 16 May 2025 12:44:19 +0800
To: Tejun Heo <tj@kernel.org>
Cc: Muchun Song <songmuchun@bytedance.com>, jiangshanlai@gmail.com,
 linux-kernel@vger.kernel.org
X-Migadu-Flow: FLOW_OUT

=EF=BB=BF

> On May 15, 2025, at 23:53, Tejun Heo <tj@kernel.org> wrote:
>=20
> Hello, Muchun.
>=20
> On Thu, May 15, 2025 at 12:05:23PM +0800, Muchun Song wrote:
>> Workqueues, such as system_unbound_wq, are shared across the system,
>> making it difficult to determine which tasks are being executed by
>> each worker. This patch improves clarity by displaying the latest
>> function name associated with each workqueue worker in the
>> /proc/PID/{comm,stat,status}. For example:
>>=20
>> Before:
>>  # ps 64 67 68
>>  PID TTY STAT TIME COMMAND
>>  64  ?   I    0:00 [kworker/u34:0-events_unbound]
>>  67  ?   I    0:00 [kworker/u33:1-events_unbound]
>>  68  ?   I    0:00 [kworker/u33:2-events_unbound]
>>=20
>> After:
>>  # ps 64 67 68
>>  PID TTY STAT TIME COMMAND
>>  64  ?   I    0:00 [kworker/u34:0-events_unbound:flush_memcg_stats_dwork]=

>>  67  ?   I    0:00 [kworker/u33:1-events_unbound:flush_to_ldisc]
>>  68  ?   I    0:00 [kworker/u33:2-events_unbound:idle_cull_fn]
>>=20
>> This change provides a clearer view of the tasks being performed by
>> each worker, enhancing system monitoring and debugging.
>=20
> One worry I have about this is that these will likely be stale most of the=

> time as kworkers are just sitting and waiting, and there's no connection
> between what a kworker ran before and what it's going to run next, so I'm
> unsure how useful the extra information is.

Hi Tejun,

Monitoring tools like atop can indeed record comm of processes. When we
encounter issues such as high CPU usage, these tools can help us identify
the problem. For instance, if kworkers are consuming most of the CPU, we
can use this information to pinpoint which specific function is using
the most CPU.

Another use case is when we use the isolcpus=3D command line option
to isolate CPUs, we want to make sure that no kworker threads run on
those CPUs. But sometimes, kworkers might still get scheduled there, causing=
 latency
issues. By using this information, we can figure out which module's
function ran on the CPU before and then dig into the code to see how to
stop it from happening.


Muchun,
Thanks

>=20
> Thanks.
>=20
> --=20
> tejun


