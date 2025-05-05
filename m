Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26111FBC94
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441400; cv=none; b=EbU6mHmb1+wsb0XAdB5PL5IGnVd2+B84puolDSEC0J4QTfELgC5z0ZVRWVccyjD9Kp0B/aZMfVAX8dXNL4M1C4KWkIlYBaaEL8htxbdI4rM3AIuIkgUQPX2GoItr1QU6aXNFgb25/8Y1zN51kgmniWHGjJSCASz57PzIIA61qaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441400; c=relaxed/simple;
	bh=MPy2dmqKlCsrw5okIZFwkiGzwVi0bWXg1j0NfWvMFRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=JkCv30uw+B/fKcKjwe+FRu/xIqKZ1P77kgSovhfJ1i6udMXh89w5kYKHz36SllFEYi6tATF8T2hz1FiZ7/zHQTC8upcfEFoURssLVYtopoGu0WuiXeH3Wh/ap/nppqHmKQD1go62UDf9lCjnlr0NUsWmKtpVnftPZeba6RM+lNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=E9wpWJoQ; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="E9wpWJoQ"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250505103629epoutp0444d5fa7658a93117b551698c97a7e58f~8mzDYXa-X1366513665epoutp04q
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:36:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250505103629epoutp0444d5fa7658a93117b551698c97a7e58f~8mzDYXa-X1366513665epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746441389;
	bh=MPy2dmqKlCsrw5okIZFwkiGzwVi0bWXg1j0NfWvMFRQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=E9wpWJoQden2vOwQw51YNjmTXEiRBr3KZ+SaMz6SG7eJNJoliQk7TCFjWZbRurqsS
	 wBhlUUnmVvvcq9fo20wAgewWlAk3uYIybwv+d5gHTuRsuuoHKGayf78GCKwJE3lTFf
	 AIr03QsArPjyBAKhNIA4n5zoIxFdLCbvnODkz3GA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250505103629epcas5p2cebdec83246112bd0d618da720615dc2~8mzC6NrOm3077230772epcas5p2S;
	Mon,  5 May 2025 10:36:29 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.181]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZrdHJ35VTz3hhT3; Mon,  5 May
	2025 10:36:28 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250505103627epcas5p1321c559fa1d43e6ba3bc1987ebb8fd26~8mzBtX5qd1445214452epcas5p1u;
	Mon,  5 May 2025 10:36:27 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250505103627epsmtrp1e1065657d498c1112dcd9b1cf10f2f61~8mzBssUsg2818828188epsmtrp1K;
	Mon,  5 May 2025 10:36:27 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-05-681894abe4ee
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	96.D7.08805.BA498186; Mon,  5 May 2025 19:36:27 +0900 (KST)
Received: from [107.111.89.174] (unknown [107.111.89.174]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250505103626epsmtip2ad9941614a8c1952e2de724a5c9e89fb~8mzALBqRt2714027140epsmtip2q;
	Mon,  5 May 2025 10:36:26 +0000 (GMT)
Message-ID: <cf6cda9b-bbbd-43c2-b67b-297cc64e671d@samsung.com>
Date: Mon, 5 May 2025 16:06:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dmapool: add NUMA affinity support
To: Caleb Sander Mateos <csander@purestorage.com>, Keith Busch
	<kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig
	<hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Andrew Morton
	<akpm@linux-foundation.org>
Cc: linux-nvme@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <20250426020636.34355-2-csander@purestorage.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSvO7qKRIZBiuvaVrMWb+GzWL13X42
	i/8L57JarFx9lMli0qFrjBaXd81hs7i35j+rxfxlT9kt1r1+z+LA6XH+3kYWj8tnSz02repk
	89j0aRK7x4kZv1k8Ni+p99h9s4HNY9vDXnaPz5vkAjijuGxSUnMyy1KL9O0SuDJO7VjKVGBU
	cW1uH1MDo24XIyeHhICJxK2J19i6GLk4hAR2M0psf/ibHSIhLtF87QeULSyx8t9zMFtI4C2j
	xLf/fCA2r4CdxJSzHWBxFgEViYNfH7FBxAUlTs58wgJiiwrIS9y/NQOsRhio/sz7Tcwgy0QE
	HjNK7Dr9jRkkwSwQJtHybykjxBWHGSV+/1vADpEQl7j1ZD5TFyMHB5uApsSFyaUgYU4BW4mb
	F96yQJSYSXRt7WKEsOUltr+dwzyBUWgWkjtmIZk0C0nLLCQtCxhZVjFKphYU56bnFhsWGOWl
	lusVJ+YWl+al6yXn525iBMealtYOxj2rPugdYmTiYDzEKMHBrCTCG2MgnCHEm5JYWZValB9f
	VJqTWnyIUZqDRUmc99vr3hQhgfTEktTs1NSC1CKYLBMHp1QD04z8pV91+DmPu9VV72mrtbL0
	fyIVXR+s/n3P06T3S3YujtSVCNY5ybEoqqCUby2nzhpJqyWHndz/vvtpuq35tMDaz5v2b/bR
	u1nRlN0kZ8bR5b38lXloW8HugJLk5JfOa+Yu17Y/w5q5YvWjB50+gsIsbWoF15P+HDmy0T+d
	d1J8lgjvzA9ZbQXFrCkhnf92rbDVv1ucfH+JfP8MgQleCxrU1uoLrJ2genTjr5PaPWzsqtsO
	Xct4z3uRobZ06VnPkhPcq9s13l6f871f6mqubetT2ywDTmmBi2s6TqV3lx/cOL3bh8Mloior
	pqzMcsXWl3Gq+3tmvPAsuWqpahR1IDZ429SOcO7JvRPsf9UpsRRnJBpqMRcVJwIAKTObNiQD
	AAA=
X-CMS-MailID: 20250505103627epcas5p1321c559fa1d43e6ba3bc1987ebb8fd26
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250426020759epcas5p1f4717e48a5969fc951c17e22bb02b32f
References: <20250426020636.34355-1-csander@purestorage.com>
	<CGME20250426020759epcas5p1f4717e48a5969fc951c17e22bb02b32f@epcas5p1.samsung.com>
	<20250426020636.34355-2-csander@purestorage.com>

Reviewed-by: Kanchan Joshi <joshi.k@samsung.com>
