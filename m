Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CE91D516F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747970891; cv=none; b=Er2/3O//1IfyMg77cXERWQj/xgwW/KyhJHkwjznbtZd6MEtQn3DBXmB46GSy2WaEowSShcT4yIyeHPjMS/C1d9YXnMTipU0EiNaVFrPLxqhzit1LYmKA6jlVb1/z7Ex8DzZfhlaz5AceyfmN6NylBP6LVX21DiMAHDrfoY4POik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747970891; c=relaxed/simple;
	bh=ZEVExl0k86L2T6dMkxdx4E8Dk/CUvSoYrDOnCWhZoCg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Idi/IKY9vs0sW8QL54c0QzPqhaeYrSdq008LhBfDC2PwakH+h3T3zSsh2Hnkcc2YzgNfSx+9NtffMNyhXKWU5aeZ1T72f4zkK0o4icRNUvLqh3z67JlUUZ1So2n6ZfqV4+jSWzDf8TTs39BCicC9JQJ0wwoqT38LL1s8Wco9TiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VmCNDU6R; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VmCNDU6R"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747970885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkBBGRiZvHopGFHqemEWcoi8ZXJj13K2xBFdk1g5S+M=;
	b=VmCNDU6ReO//kpfia09uvQ9HWShRmKAi1aepryhQ/5NqYAzKKISirb7T78Ee0+sC3DtLaD
	Hh8ae1Y0ugChF7y46eXppHgzx5DLbsF/RfaISMHTkCesJatFoMTb1bQHX20RAvFBOLQtc8
	mnBqQeCA4H7+twGAjYZrrbNfME9If1w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH] mm/hugetlb: fix kernel NULL pointer dereference when
 replacing free hugetlb folios
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <aC974OtOuj9Tqzsa@localhost.localdomain>
Date: Fri, 23 May 2025 11:27:18 +0800
Cc: Ge Yang <yangge1116@126.com>,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 21cnbao@gmail.com,
 david@redhat.com,
 baolin.wang@linux.alibaba.com,
 liuzixing@hygon.cn
Content-Transfer-Encoding: quoted-printable
Message-Id: <DF103E57-601C-4CBB-99CA-088E1C29F517@linux.dev>
References: <1747884137-26685-1-git-send-email-yangge1116@126.com>
 <644FF836-9DC7-42B4-BACE-C433E637B885@linux.dev>
 <aC63fmFKK84K7YiZ@localhost.localdomain>
 <ff6bd560-d249-418f-81f4-7cbe055a25ec@126.com>
 <aC8PRkyd3y74Ph5R@localhost.localdomain>
 <3B8641A1-5345-44A5-B610-9BCBC980493D@linux.dev>
 <aC974OtOuj9Tqzsa@localhost.localdomain>
To: Oscar Salvador <osalvador@suse.de>
X-Migadu-Flow: FLOW_OUT



> On May 23, 2025, at 03:32, Oscar Salvador <osalvador@suse.de> wrote:
>=20
> On Thu, May 22, 2025 at 08:39:39PM +0800, Muchun Song wrote:
>> But I think we could use "folio_order() > MAX_PAGE_ORDER" to replace =
the check
>> of hstate_is_gigantic(), right? Then ee could remove the first =
parameter of hstate
>> from alloc_and_dissolve_hugetlb_folio() and obtain hstate in it.
>=20
> Yes, I think we can do that.
> So something like the following (compily-tested only) maybe?
>=20
> =46rom d7199339e905f83b54d22849e8f21f631916ce94 Mon Sep 17 00:00:00 =
2001
> From: Oscar Salvador <osalvador@suse.de>
> Date: Thu, 22 May 2025 19:51:04 +0200
> Subject: [PATCH] TMP
>=20
> ---
>  mm/hugetlb.c | 38 +++++++++-----------------------------
>  1 file changed, 9 insertions(+), 29 deletions(-)

Pretty simple. The code LGTM.

Thanks.=
