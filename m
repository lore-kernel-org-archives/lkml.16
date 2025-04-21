Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAF6FC08
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745228132; cv=none; b=CAd2xJpRp7qmMGLMUUSJoZ0GQiu6dqL5k0+kwbZAz658Rm+4ezqelMtD6tPHI1tGPM+xTgpLifU52dtoxz4oIYHdypOEZczfNOBhkLdMlzl74Uvr3ilNf3Puz8ZeG9SGoSX9lQCFNedfRnkJT+zi2ZmWx9x7/ekxQgaijF27SCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745228132; c=relaxed/simple;
	bh=bUKfKjum813rPN4vzZFzmrYZkvGsU7gI7x8EL6azOkQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lcTvDlpPi+k++8HyYOrlPFSKfAcirhVgdipectvrnjSWzLLFR6gfFSy6ehVTnl3+uJxQuZbVnmtDRlVU/JQuT8e/dT8uUloT8IDO+RK3UdxrXzKSBuoh5cG3U9rKHoqtYdwVJZFjZkXMaPqHLWKPSy19YGzak+/VDmZ4FTEDbmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lidvml90; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lidvml90"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745228127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUKfKjum813rPN4vzZFzmrYZkvGsU7gI7x8EL6azOkQ=;
	b=lidvml900hH8Avhw1iFfdjq39Gjf+wb19CFUBfv3KviezRu9fhjsJ975KCje+KSIvdmBJh
	nVt7FmEC+mI8n7yQwiESEUpeuRFoEvkUYQnD6GmOiQW/OxzItmTtypgX6Q6ivNRUc84Sts
	pqgP9AF0UjsUwNAS32eetj7ladT+V9k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH V4 1/4] mm: add swappiness=max arg to memory.reclaim for
 only anon reclaim
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <519e12b9b1f8c31a01e228c8b4b91a2419684f77.1745225696.git.hezhongkun.hzk@bytedance.com>
Date: Mon, 21 Apr 2025 17:34:50 +0800
Cc: akpm@linux-foundation.org,
 hannes@cmpxchg.org,
 mhocko@suse.com,
 yosry.ahmed@linux.dev,
 yuzhao@google.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <972CD38C-9084-4CC0-8AD7-127745CACCDF@linux.dev>
References: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
 <519e12b9b1f8c31a01e228c8b4b91a2419684f77.1745225696.git.hezhongkun.hzk@bytedance.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Apr 21, 2025, at 17:13, Zhongkun He <hezhongkun.hzk@bytedance.com> =
wrote:
>=20
> With this patch 'commit <68cd9050d871> ("mm: add swappiness=3D arg to
> memory.reclaim")', we can submit an additional swappiness=3D<val> =
argument
> to memory.reclaim. It is very useful because we can dynamically adjust
> the reclamation ratio based on the anonymous folios and file folios of
> each cgroup. For example,when swappiness is set to 0, we only reclaim
> from file folios.
>=20
> However,we have also encountered a new issue: when swappiness is set =
to
> the MAX_SWAPPINESS, it may still only reclaim file folios.
>=20
> So, we hope to add a new arg 'swappiness=3Dmax' in memory.reclaim =
where
> proactive memory reclaim only reclaims from anonymous folios when
> swappiness is set to max. The swappiness semantics from a user
> perspective remain unchanged.
>=20
> For example, something like this:
>=20
> echo "2M swappiness=3Dmax" > /sys/fs/cgroup/memory.reclaim

We already have this kind of style (mixing numbers and strings) within
io.max under cgroup v2. As a result, I'm okay with this change.=20

>=20
> will perform reclaim on the rootcg with a swappiness setting of 'max' =
(a
> new mode) regardless of the file folios. Users have a more =
comprehensive
> view of the application's memory distribution because there are many
> metrics available. For example, if we find that a certain cgroup has a
> large number of inactive anon folios, we can reclaim only those and =
skip
> file folios, because with the zram/zswap, the IO tradeoff that
> cache_trim_mode or other file first logic is making doesn't hold -
> file refaults will cause IO, whereas anon decompression will not.
>=20
> With this patch, the swappiness argument of memory.reclaim has a new
> mode 'max', means reclaiming just from anonymous folios both in =
traditional
> LRU and MGLRU.
>=20
> Here is the previous discussion:
> =
https://lore.kernel.org/all/20250314033350.1156370-1-hezhongkun.hzk@byteda=
nce.com/
> =
https://lore.kernel.org/all/20250312094337.2296278-1-hezhongkun.hzk@byteda=
nce.com/
> =
https://lore.kernel.org/all/20250318135330.3358345-1-hezhongkun.hzk@byteda=
nce.com/
>=20
> Suggested-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.=
