Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926F72673AF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744943940; cv=none; b=U3LdIwwwOFWkgdxmJKMzN0uhWXio/0AsdWjAyGj68qg+coANNZcg2elbO5sTrGWSsnzZcMYLiZ18vQ6IHaLUh+LY+rJPEE35y702XWHRWnTd+6ObERe6CyR2h2ZUfuYYhuKtp4gllihQDnIepKyQknoyGRQ9HtPmbrABPD61+Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744943940; c=relaxed/simple;
	bh=qV1odNb6L0lGUDLMPzAp+dLpmFc6+O5QpFjH5I0hzos=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bi8qKsAud1HvRKZsu9AhEfCVwdFFzWv4KQWK1lmIRdHGAXlfGoG0qpfbFN/zWLEF4qKDl/I0/d+d5SAiHFvqSS1Qd5Yw8FD76/OWpJsENwCXsawGek7whYoDhvso4sqzvtU22x3LwDF0Zv6C/vqXfkATbQvMLhqZr4QvVEOOsdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sze9aXEi; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sze9aXEi"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744943935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3T5feFtMm9osiqs4YoVP8jsIW7MLQcBFz0h+GbzCeOU=;
	b=sze9aXEi7pXJRNYM0HR3oAbpsg50yYWuYiYEjWnQFJglSUh3bULKkNzrb6DIRlm1WdF8JT
	P3BA5uj0f0oiW0FLFQl5Qkq+0GSOa0MSLfF6D6gffcOl1bYRz4Sy3QWuP4MNmi/ZJPrP6t
	nW1+WXYjbeEqYSIKeFlEDUqE0jCkyxc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH RFC 02/28] mm: memcontrol: use folio_memcg_charged() to
 avoid potential rcu lock holding
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20250417144835.GE780688@cmpxchg.org>
Date: Fri, 18 Apr 2025 10:38:10 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 mhocko@kernel.org,
 roman.gushchin@linux.dev,
 shakeel.butt@linux.dev,
 akpm@linux-foundation.org,
 david@fromorbit.com,
 zhengqi.arch@bytedance.com,
 yosry.ahmed@linux.dev,
 nphamcs@gmail.com,
 chengming.zhou@linux.dev,
 linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org,
 linux-mm@kvack.org,
 hamzamahfooz@linux.microsoft.com,
 apais@linux.microsoft.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <CD857422-95FD-477D-809A-C7ED0780E188@linux.dev>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
 <20250415024532.26632-3-songmuchun@bytedance.com>
 <20250417144835.GE780688@cmpxchg.org>
To: Johannes Weiner <hannes@cmpxchg.org>
X-Migadu-Flow: FLOW_OUT



> On Apr 17, 2025, at 22:48, Johannes Weiner <hannes@cmpxchg.org> wrote:
>=20
> On Tue, Apr 15, 2025 at 10:45:06AM +0800, Muchun Song wrote:
>> If a folio isn't charged to the memory cgroup, holding an rcu read =
lock
>> is needless. Users only want to know its charge status, so use
>> folio_memcg_charged() here.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> mm/memcontrol.c | 11 ++++-------
>> 1 file changed, 4 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>> index 61488e45cab2..0fc76d50bc23 100644
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
>> @@ -797,20 +797,17 @@ void __mod_lruvec_state(struct lruvec *lruvec, =
enum node_stat_item idx,
>> void __lruvec_stat_mod_folio(struct folio *folio, enum node_stat_item =
idx,
>>      int val)
>> {
>> - 	struct mem_cgroup *memcg;
>> 	pg_data_t *pgdat =3D folio_pgdat(folio);
>> 	struct lruvec *lruvec;
>>=20
>> - 	rcu_read_lock();
>> - 	memcg =3D folio_memcg(folio);
>> - 	/* Untracked pages have no memcg, no lruvec. Update only the =
node */
>> - 	if (!memcg) {
>> - 		rcu_read_unlock();
>> + 	if (!folio_memcg_charged(folio)) {
>> + 		/* Untracked pages have no memcg, no lruvec. Update only =
the node */
>> 		__mod_node_page_state(pgdat, idx, val);
>> 		return;
>> 	}
>>=20
>> - 	lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
>> + 	rcu_read_lock();
>> + 	lruvec =3D mem_cgroup_lruvec(folio_memcg(folio), pgdat);
>> 	__mod_lruvec_state(lruvec, idx, val);
>> 	rcu_read_unlock();
>=20
> Hm, but untracked pages are the rare exception. It would seem better
> for that case to take the rcu_read_lock() unnecessarily, than it is to
> look up folio->memcg_data twice in the fast path?

Yep, you are right. I'll drop this next version. Thanks.

Muchun,
Thanks.



