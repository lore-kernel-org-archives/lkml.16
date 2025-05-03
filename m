Received: from mailrelay3-3.pub.mailoutpod3-cph3.one.com (mailrelay3-3.pub.mailoutpod3-cph3.one.com [46.30.212.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9827081C
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746297989; cv=none; b=UyweAGXNMNpvLXntBIQhvdU+1a5lYfeSnMjiJzQussqoljbL4H/b2vZSmwwGlh32U596qwOdCmaf8aCkqAWdqaW7uILSsHHx65QHu+anMyWSiLyu8hnhjqlGhTvZYaBQjF5j9ia6ywew4ZCY4qxfOd4b9E3kgFY4L98pPPJAuv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746297989; c=relaxed/simple;
	bh=mq5X6iFm3sj6rGvKJsuQOgjHMlGVeYO+zOKsnKvdjis=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tnJ4UjncuTfKhaOSPhMaeLppxoUcCrtYQgK6+Ehxt9CaKtHFqrR6V1mao/7Xvll4QTvBOLXzckcWA0VpgkEPzeT+OrxBc+cxN44j4SXpPfriATS1pxh91LFEsWN4NjrubT/EN/rOFTtJtab2bVgdcCPiE3Qh6XmFEp+0hfSQmBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=V/7LL8rs; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=QS4DoFWS; arc=none smtp.client-ip=46.30.212.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="V/7LL8rs";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="QS4DoFWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1746297978; x=1746902778;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=SgDQY5rPFVDOVTM0LSU4AZU6By/eM3JenPb1tAEbTQI=;
	b=V/7LL8rsdalGXRmDc7eeP2apUPbY+9JKdoItqiT4W9oNG4imy5XqC43VUYwhhJuLNllkyXk7Mmrbf
	 /pa3fhZzPdE8L0JRZ0MoxcIiwhhyrM689fzbbLBqQ3csTwKTVgsjBADhFBgjkfXav+AwaMXXdUAxDg
	 +ZGU5ByM9Mmd5tg5pyAoN3xTJ2dC0Dr8p2jJpXHtr6I8UjEg9FKC43Ev8p58fgN4xiif8yeQ8Dg4S8
	 4peH27EpUgEFRQ+G31XnPvGzKh7CxtLM0MltoNTmwNMzVxw8vCgiH5r7R0LASxkzxAyzNUW2Qj0tIb
	 4o2i+hjQevTcMibx4aH1DaR3+cc4ixA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1746297978; x=1746902778;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=SgDQY5rPFVDOVTM0LSU4AZU6By/eM3JenPb1tAEbTQI=;
	b=QS4DoFWSeTzdHRbJWED7Q3S92zeZ0LW1eHmdjFBQEogzhAwTxSWwEAdJZmikiEUUT3DYK20kNosVm
	 t7+0XVWAw==
X-HalOne-ID: e5ce362a-284e-11f0-923b-2b8368a4d5c5
Received: from smtpclient.apple (unknown [85.191.60.109])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id e5ce362a-284e-11f0-923b-2b8368a4d5c5;
	Sat, 03 May 2025 18:46:18 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <fddf0457275576c890d16921465cf473@beldev.am>
Date: Sat, 3 May 2025 20:46:07 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Nhat Pham <nphamcs@gmail.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Yosry Ahmed <yosry.ahmed@linux.dev>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <83CB359A-955E-48B6-B0D9-DD4F2E1146D4@konsulko.se>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <fddf0457275576c890d16921465cf473@beldev.am>
To: Igor Belousov <igor.b@beldev.am>
X-Mailer: Apple Mail (2.3826.200.121)



> On May 2, 2025, at 10:07=E2=80=AFAM, Igor Belousov <igor.b@beldev.am> =
wrote:
>=20
> On 2025-05-02 12:01, Vitaly Wool wrote:
>> From: Igor Belousov <igor.b@beldev.am>
>> Use vmalloc for page allocations for zblock blocks to avoid extra
>> pressure on the memmory subsystem with multiple higher order
>> allocations.
>> While at it, introduce a module parameter to opportunistically
>> allocate pages of lower orders via try_page_alloc() for faster
>> allocations whenever possible.
>> Since vmalloc works fine with non-power of 2 numbers of pages,
>> rewrite the block size tables to use that opportunity.
>> Signed-off-by: Igor Belousov <igor.b@beldev.am>
>> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
>> ---
>> Tests run on qemu-arm64 (8 CPUs, 1.5G RAM, 4K pages):
>> 1. zblock
>> 43205.38user
>> 7320.53system
>> 2:12:04elapsed
>> zswpin 346127
>> zswpout 1642438
>> 2. zsmalloc
>> 47194.61user
>> 7978.48system
>> 2:25:03elapsed
>> zswpin 448031
>> zswpout 1810485
>> So zblock gives a nearly 10% advantage.
>> Please note that zsmalloc *crashes* on 16K page tests so I couldn't
>> compare performance in that case.
>=20
> Right, and it looks like this:
>=20
> [  762.499278]  bug_handler+0x0/0xa8
> [  762.499433]  die_kernel_fault+0x1c4/0x36c
> [  762.499616]  fault_from_pkey+0x0/0x98
> [  762.499784]  do_translation_fault+0x3c/0x94
> [  762.499969]  do_mem_abort+0x44/0x94
> [  762.500140]  el1_abort+0x40/0x64
> [  762.500306]  el1h_64_sync_handler+0xa4/0x120
> [  762.500502]  el1h_64_sync+0x6c/0x70
> [  762.500718]  __pi_memcpy_generic+0x1e4/0x22c (P)
> [  762.500931]  zs_zpool_obj_write+0x10/0x1c
> [  762.501117]  zpool_obj_write+0x18/0x24
> [  762.501305]  zswap_store+0x490/0x7c4
> [  762.501474]  swap_writepage+0x260/0x448
> [  762.501654]  pageout+0x148/0x340
> [  762.501816]  shrink_folio_list+0xa7c/0xf34
> [  762.502008]  shrink_lruvec+0x6fc/0xbd0
> [  762.502189]  shrink_node+0x52c/0x960
> [  762.502359]  balance_pgdat+0x344/0x738
> [  762.502537]  kswapd+0x210/0x37c
> [  762.502691]  kthread+0x12c/0x204
> [  762.502920]  ret_from_fork+0x10/0x20

In fact we don=E2=80=99t know if zsmalloc is actually supposed to work =
with 16K pages. That=E2=80=99s the question to Sergey and Minchan. If it =
is indeed supposed to handle 16K pages, I would suggest that you =
submitted a full report with reproduction steps and/or provided a fix if =
possible.

~Vitaly

