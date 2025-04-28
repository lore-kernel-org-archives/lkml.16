Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DB025E803
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745831276; cv=none; b=Hp75rsf8Spk9r4rzwE+UlAj+TDrhETzSEEyfHal3VCmZRW6paY3aZoy9hLthSmte1vROwc7m/Gqh/yFYnouFCc6lo5yJ39KvWGGCcMMirouSuaWfWGeeMvM8iGTlEYfws19yQj96tw8zA4pEJ7CaHsp4aJnJvBCGGYJQmIb0FRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745831276; c=relaxed/simple;
	bh=mmWGWyNu5GI9Xq1r/l6L2WkN5VluL5OW/zDyVIAd1us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=Gj8HSwYYQvtxv6s45ra2+mYB65p33tOXPusaf/T5Dara+zZeP08ZwmkK6tfwjpo4V1FrY6s/G9IhfgWps6QPeYA8FKccwa/GNewBzlE/Utn7H0gke+dGYN2ijfWevNkEgzYWIj+fsCfvyhCgGrxwg78ly3QttpHEItMO9uOHUhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=D/R04iqN; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="D/R04iqN"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250428090751epoutp026da7dc29947ee853da09063d50be6534~6cEqh4Bl-2573025730epoutp02H
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:07:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250428090751epoutp026da7dc29947ee853da09063d50be6534~6cEqh4Bl-2573025730epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745831271;
	bh=51/ZZ7aoRYnjl1i6DeK0bjOpfpPJs7RRD3ou2v+0554=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D/R04iqNIU6cKH0TGGBfw/sjzZv4eNuzf7T6oPYa8yP4g1UhwupUvoEMInbcpzt1R
	 /45wjXi+I8/z+SzaRJLjKqWuzsqnVJ5AMAVR01UYCQnh9hRsRBgysuJ0ETAdzdyH/n
	 O30QHyvMPEtseCAv8O7hD+b24K5rqGQRHPbkTjyY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250428090751epcas5p3c75c964b99c0d9b3378afd3835ff7602~6cEqSWWHv0827908279epcas5p3-;
	Mon, 28 Apr 2025 09:07:51 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.180]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZmHf92Z5Nz6B9m7; Mon, 28 Apr
	2025 09:07:45 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250428063537epcas5p1589b2e85cd0afa32b813fd2c76a6abc5~6Z-vv5oHw2684226842epcas5p1u;
	Mon, 28 Apr 2025 06:35:37 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428063537epsmtrp1b7ae5b0a7b662eb637f003e668f33292~6Z-vvPhUK1752217522epsmtrp1T;
	Mon, 28 Apr 2025 06:35:37 +0000 (GMT)
X-AuditID: b6c32a2a-d63ff70000002265-41-680f21b946c1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	49.93.08805.9B12F086; Mon, 28 Apr 2025 15:35:37 +0900 (KST)
Received: from green245 (unknown [107.99.41.245]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250428063536epsmtip2e94897597348f0785bac2cb2acc4289a~6Z-uolV-A2352323523epsmtip2o;
	Mon, 28 Apr 2025 06:35:35 +0000 (GMT)
Date: Mon, 28 Apr 2025 11:57:07 +0530
From: Anuj Gupta <anuj20.g@samsung.com>
To: Nitesh Shetty <nj.shetty@samsung.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton
	<akpm@linux-foundation.org>, axboe@kernel.dk, gost.dev@samsung.com,
	nitheshshetty@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iov_iter: Use iov_offset for length calculation in
 iov_iter_aligned_bvec
Message-ID: <20250428062707.GA26271@green245>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250426075310.6597-1-nj.shetty@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsWy7bCSvO5ORf4Mg6/3eS3mrF/DZrH6bj+b
	xc0DO5ksLu+aw2ax40kjo8W23/OZLc7/Pc7qwO6xc9Zddo/LZ0s9Tsz4zeLRt2UVo8fnTXIe
	m568ZQpgi+KySUnNySxLLdK3S+DKePtnGmvBfpaKKduusTQw3mXuYuTkkBAwkVjbf4K1i5GL
	Q0hgN6PEtas3oRISEqdeLmOEsIUlVv57zg5iCwk8YZR49DsCxGYRUJVY8XAXC4jNJqAuceR5
	K1i9iICmxIc/HSwgQ5lBhq54fIYNJCEskCSx9/QUsEG8AroSfW3T2SE29zJKrNt0jAUiIShx
	cuYTMJtZQEdi59Y7QM0cQLa0xPJ/HBBheYnmrbPBDuUUsJKYeXAb2HxRAWWJA9uOM01gFJqF
	ZNIsJJNmIUyahWTSAkaWVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwdGjpbWDcc+q
	D3qHGJk4GA8xSnAwK4nwLrXmzhDiTUmsrEotyo8vKs1JLT7EKM3BoiTO++11b4qQQHpiSWp2
	ampBahFMlomDU6qBKeL736N/Vy3n539t5R6uNuv9gznV35ZearScambCrq9laccyL2bXjRNv
	t51ze3fRZsnC0Nfsfg/cIn5rbL5m5RW7eOWhmoOuoqzJ+18m6exh/SRv4ifjVc59Rlc0bpHC
	W6lfE66nxC2QTG1pT9xZfn9Oz0M19VtT3317VfEkyX4H58zbUWZmnz3qZl0ovPbi3ellinz5
	zPn9X3lCpxesUrr8/EPi00e9PCfd9i2L0/TeYNZ1qLvjrlPdiSibhwvyT+bnB4W9vfmC/6k8
	lxf//dSgmZzZxpKMsf2qTEqndX1Y37KraJ0V+xE7MSdgxu/3mzROtty5PsMyzLAoarveo0Wl
	j9hPtid5c5YmyfW8V2Ipzkg01GIuKk4EAF4gKoANAwAA
X-CMS-MailID: 20250428063537epcas5p1589b2e85cd0afa32b813fd2c76a6abc5
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----phGwStdGrn.o.mGc.dCyK2i.8QRAbABCRe5GKllaKmyJLcXK=_2b59e_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250426080212epcas5p2d0c592a4bd539eed242d5ac31d23b323
References: <CGME20250426080212epcas5p2d0c592a4bd539eed242d5ac31d23b323@epcas5p2.samsung.com>
	<20250426075310.6597-1-nj.shetty@samsung.com>

------phGwStdGrn.o.mGc.dCyK2i.8QRAbABCRe5GKllaKmyJLcXK=_2b59e_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Sat, Apr 26, 2025 at 01:23:10PM +0530, Nitesh Shetty wrote:
> If iov_offset is non-zero, then we need to consider iov_offset in length
> calculation, otherwise we might pass smaller IOs such as 512 bytes, in
> below scenario[1].
> This issue is reproducible using lib-uring test/fixed-seg.c application
> with fixed buffer on a 512 LBA formatted device.
> Fixes â3639f96f24a121ec9f037981b81daf5a8d60a
> 
This needs a proper fixes tag format
Fixes: <12 characters of the SHA-1 ID> ("commit description")
With that
Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>

------phGwStdGrn.o.mGc.dCyK2i.8QRAbABCRe5GKllaKmyJLcXK=_2b59e_
Content-Type: text/plain; charset="utf-8"


------phGwStdGrn.o.mGc.dCyK2i.8QRAbABCRe5GKllaKmyJLcXK=_2b59e_--
