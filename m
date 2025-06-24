Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF4C20EB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747152; cv=none; b=tjMtTvRmLQvD5+UH4sBKrDV+AiEyBbMZSIeyDwttxicZMexFbbXP0sePuJvF7xQlPiR2K+faTgzsOsWxTc6YZ0UhyO63eveia9Opl8iYbM0FJUAtMUz+n5l1MU0MmOAGjD41azuQXW3uEz8n6Dghs5PUqg7ygCHRBUbq7g6tKnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747152; c=relaxed/simple;
	bh=ju2oYNEca8czLSm6f8d7inxZ2xaRc61DoUM3sWxfQ4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhWA3OyVUqKbIzvutRDuodJ3NFrvGKMk6del2es9klAPvZwCdYf4kwGgxbPlR1MRyNL40ibXJsSxNn/sFzvw+KyD5ZMkAszgEpguTgZZesckmqGdBwK8EZjxmpSP31fuMCHBVhpnUS0ei80hajVcj9snvteYaRI2rLFlSDr72hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e6aa22a850c511f0b29709d653e92f7d-20250624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2770484f-b5c1-4961-aa8b-578c6852cd52,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:aba587da02c5fb17bde4a91304be5992,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e6aa22a850c511f0b29709d653e92f7d-20250624
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 619643263; Tue, 24 Jun 2025 14:38:55 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 7B3E6E008FA5;
	Tue, 24 Jun 2025 14:38:55 +0800 (CST)
X-ns-mid: postfix-685A47FF-413388651
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 43B17E008FA4;
	Tue, 24 Jun 2025 14:38:52 +0800 (CST)
Message-ID: <06b01251-cb87-4ca7-8cb1-6c90a17ed46d@kylinos.cn>
Date: Tue, 24 Jun 2025 14:38:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/fair: Fix memory leak in
 alloc_fair_sched_group()
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com
References: <20250623061909.13480-1-zhangzihuan@kylinos.cn>
 <d99ce13a-3b27-46c8-9d65-99cf979f537f@amd.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <d99ce13a-3b27-46c8-9d65-99cf979f537f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Prateek,
Thanks a lot for the careful review and clarification.

=E5=9C=A8 2025/6/24 12:31, K Prateek Nayak =E5=86=99=E9=81=93:
> On 6/23/2025 11:49 AM, Zihuan Zhang wrote:
>> alloc_fair_sched_group() allocates per-CPU cfs_rq[] and se[] arrays
>> for a task group. However, if either allocation fails, or a per-CPU
>> allocation fails during the loop, the function may leak memory.
>
> alloc_fair_sched_group() is only called by sched_create_group()
> which does a sched_free_group() on failure that calls
> free_fair_sched_group(). I don't see the memory leak in this scenario.
> What am I missing?
>
You're absolutely right =E2=80=94 I missed the fact that

`sched_create_group()` will always call `sched_free_group()` on failure,
which makes my concern about memory leaks in `alloc_fair_sched_group()`=20
invalid.
>> This patch fixes the memory leak by:
>> - Using sizeof(*ptr) instead of sizeof(ptr) for correctness.
>> - Using the existing free_fair_sched_group() function to clean up
>> Note: Calling free_fair_sched_group() unconditionally in the failure
>> path is safe, as kfree(NULL) is a no-op in the kernel. This avoids
>> duplicating cleanup logic and improves robustness.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>> =C2=A0 kernel/sched/fair.c | 10 +++++-----
>> =C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 7a14da5396fb..920174245517 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -13372,12 +13372,12 @@ int alloc_fair_sched_group(struct=20
>> task_group *tg, struct task_group *parent)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct cfs_rq *cfs_rq;>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 int i;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 tg->cfs_rq =3D kcalloc(nr_cpu_ids, sizeof(c=
fs_rq), GFP_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 tg->cfs_rq =3D kcalloc(nr_cpu_ids, sizeof(*tg->cfs=
_rq), GFP_KERNEL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tg->cfs_rq)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
>> -=C2=A0=C2=A0=C2=A0 tg->se =3D kcalloc(nr_cpu_ids, sizeof(se), GFP_KER=
NEL);
>> +=C2=A0=C2=A0=C2=A0 tg->se =3D kcalloc(nr_cpu_ids, sizeof(*tg->se), GF=
P_KERNEL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tg->se)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free_rq;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tg->shares =3D NICE_0_LOAD;
>> =C2=A0 @@ -13387,7 +13387,7 @@ int alloc_fair_sched_group(struct=20
>> task_group *tg, struct task_group *parent)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cfs_rq =3D kzal=
loc_node(sizeof(struct cfs_rq),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KE=
RNEL, cpu_to_node(i));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!cfs_rq)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to err;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to err_free_rq;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se =3D k=
zalloc_node(sizeof(struct sched_entity_stats),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL, cpu_to_node(i));
>> @@ -13402,7 +13402,7 @@ int alloc_fair_sched_group(struct task_group=20
>> *tg, struct task_group *parent)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
>> =C2=A0 =C2=A0 err_free_rq:
>> -=C2=A0=C2=A0=C2=A0 kfree(cfs_rq);
>
> This will actually introducing a memory leak. If allocation of "se"
> fails, the "cfs_rq" won't be linked to "tg" and needs to be freed here.
>
>> +=C2=A0=C2=A0=C2=A0 free_fair_sched_group(tg);
>
> free_fair_sched_group() doesn't NULL out the "tg->cfs_rq" and "tg->se"
> after freeing them which now introduces double-free via
> free_fair_sched_group() on failure in alloc_fair_sched_group().
>
Also, thanks for pointing out the potential issue of leaking the
locally allocated `cfs_rq` if `se` allocation fails, and the risk of
double free if `free_fair_sched_group()` is called too early.

I will drop this patch and look deeper into the call chain next time
before proposing such cleanup.

Thanks again for your time and detailed feedback!

>> =C2=A0 err:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>
Best regards,
Zihuan Zhang
