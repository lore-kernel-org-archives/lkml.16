Received: from server4.hayhost.am (server4.hayhost.am [2.56.206.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38C22A4DA
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=2.56.206.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173243; cv=none; b=cRpvx2zRWEUI119wCY1C7UXYhsfIf8pIYjC71n1MednVL1cDuExBLd+mzADfkz1ccbZfqqCopc3oS7dDZ/EV+a+wSH8PJ/tnd9H0pvnCQDrpwkBrGj8hPkASNsdIN4iLhAJfzaOdCkHiijZP+1mIdczdeSpF7eT4fq5j9Qyrz14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173243; c=relaxed/simple;
	bh=p6gq58eX77BP4a7rUQlS11PJUzySHzbhlRVFL37G/54=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=HYjMNPHcGAmlYAmvq03aw7pCDQnDBx9oqYUT9k5WprAPCfFgpD7/U0BNwMwU+m8sxA4KFAsRFFflvl/SBdynu0toa9/RfY1zJV2qoy/P3dmSBY1FNdOX6R+/yWUPfqkHT6rL9KoIGYbAMLiT8jDtSIU0w+X9TysINkatzOWPNeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am; spf=pass smtp.mailfrom=beldev.am; dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b=wXbVmrS3; arc=none smtp.client-ip=2.56.206.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beldev.am
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b="wXbVmrS3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beldev.am;
	s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CzAe5vMF8DS129Xc2GhqJXava5yjYwD2XhZYo1+/ldA=; b=wXbVmrS3cwkVGldE2bVysmhXis
	0MYUB4PGq+coRIJbrSRA2r/yyfG018voOZiV7ev8rcsWV9zS0zaSKCvOpOfSx5bL1UnnrD/79MeK6
	G02sIDz2oSee4RtjvXcxZoQK5qF8ZaX9dSdw4zNm2PdVJQ/gbA3wdTutKva5k5wkxla9Y7oRR4WI7
	QEgSOo0uQslDIwfLqIf5ADC0xVWCaCs6msHWS388FcTui6NN9KQ8MtYY25EXZNU799SUKvjgwAz+P
	X+TP9FeXKd/umE3SnZGQkygfJ5XtpeA1T44whQIC0oMzmWsp3vdJ9eAG5NowFmXF+YzG1D5lbReRF
	PeRNsjXw==;
Received: from [::1] (port=55676 helo=server4.hayhost.am)
	by server4.hayhost.am with esmtpa (Exim 4.98.1)
	(envelope-from <igor.b@beldev.am>)
	id 1uAlQg-00000000AWg-0ZND;
	Fri, 02 May 2025 12:07:30 +0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 02 May 2025 12:07:27 +0400
From: Igor Belousov <igor.b@beldev.am>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, Shakeel Butt
 <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed
 <yosry.ahmed@linux.dev>, Minchan Kim <minchan@kernel.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
In-Reply-To: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <fddf0457275576c890d16921465cf473@beldev.am>
X-Sender: igor.b@beldev.am
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server4.hayhost.am
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - beldev.am
X-Get-Message-Sender-Via: server4.hayhost.am: authenticated_id: igor.b@beldev.am
X-Authenticated-Sender: server4.hayhost.am: igor.b@beldev.am

On 2025-05-02 12:01, Vitaly Wool wrote:
> From: Igor Belousov <igor.b@beldev.am>
> 
> Use vmalloc for page allocations for zblock blocks to avoid extra
> pressure on the memmory subsystem with multiple higher order
> allocations.
> 
> While at it, introduce a module parameter to opportunistically
> allocate pages of lower orders via try_page_alloc() for faster
> allocations whenever possible.
> 
> Since vmalloc works fine with non-power of 2 numbers of pages,
> rewrite the block size tables to use that opportunity.
> 
> Signed-off-by: Igor Belousov <igor.b@beldev.am>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> ---
> 
> Tests run on qemu-arm64 (8 CPUs, 1.5G RAM, 4K pages):
> 1. zblock
> 43205.38user
> 7320.53system
> 2:12:04elapsed
> zswpin 346127
> zswpout 1642438
> 
> 2. zsmalloc
> 47194.61user
> 7978.48system
> 2:25:03elapsed
> zswpin 448031
> zswpout 1810485
> 
> So zblock gives a nearly 10% advantage.
> 
> Please note that zsmalloc *crashes* on 16K page tests so I couldn't
> compare performance in that case.

Right, and it looks like this:

[  762.499278]  bug_handler+0x0/0xa8
[  762.499433]  die_kernel_fault+0x1c4/0x36c
[  762.499616]  fault_from_pkey+0x0/0x98
[  762.499784]  do_translation_fault+0x3c/0x94
[  762.499969]  do_mem_abort+0x44/0x94
[  762.500140]  el1_abort+0x40/0x64
[  762.500306]  el1h_64_sync_handler+0xa4/0x120
[  762.500502]  el1h_64_sync+0x6c/0x70
[  762.500718]  __pi_memcpy_generic+0x1e4/0x22c (P)
[  762.500931]  zs_zpool_obj_write+0x10/0x1c
[  762.501117]  zpool_obj_write+0x18/0x24
[  762.501305]  zswap_store+0x490/0x7c4
[  762.501474]  swap_writepage+0x260/0x448
[  762.501654]  pageout+0x148/0x340
[  762.501816]  shrink_folio_list+0xa7c/0xf34
[  762.502008]  shrink_lruvec+0x6fc/0xbd0
[  762.502189]  shrink_node+0x52c/0x960
[  762.502359]  balance_pgdat+0x344/0x738
[  762.502537]  kswapd+0x210/0x37c
[  762.502691]  kthread+0x12c/0x204
[  762.502920]  ret_from_fork+0x10/0x20

Thanks,
Igor
