Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B257DA6D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307511; cv=none; b=fLI2tLEPMaeUeid4xjzK4iIQ3DAHFtZcM0q8eyaZX3pxn8FHlqQ/JjaGPJodkBSJW7NGYYgV57XB3zqCXeQyG65DDomPLx1Dvf1wGBkYe57zwtoulexBdqJt7MVzvXvyiwfja5fcS6yVb3YG9OBNQwl99attefm5iY/1a1OzKAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307511; c=relaxed/simple;
	bh=8e2DXXJCwsmYrX37EtEelEiTlVLYeH6RToWNmMzfDLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=b+2+uoNsp2CXY1fKqdqmc9BDDExMKzeqczlDokQpU95xtL6AG7RCNSHUMN/UWVevzJaQ+gsIA/Iu1zsq/LgeK35EQJJljUrJ3ex0l8z33syzU7luDHicwcdOQrUJJn/DF4+XR0dcrZqltX5YJl0Mb4k9zuq09ac9WbU68BdrBbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PrrjEgHQ; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PrrjEgHQ"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250422073820epoutp03b7a8a4c3d5dfdfc767f449ea95231775~4k_y5wsEq1056610566epoutp03h
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:38:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250422073820epoutp03b7a8a4c3d5dfdfc767f449ea95231775~4k_y5wsEq1056610566epoutp03h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745307500;
	bh=IsoLIq4WePyRYtX7QbmOwDdzfqlU/Tak/bxwhwxrhDg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=PrrjEgHQnnCwW8DN383Jymyy1ILwO2mtaGoPTUTh1mNf10Mk9Ux9ynJ/g3kWQuebf
	 lrg8Vr30hTqGxbXmOmfyvwaN2+xg1ZpIPu9+jgH53UNkY/wXJbaMQWju3gKBcvZpmU
	 tsOrKJNA5x4J3S75CijQ2iHxE9KYKd4KEYMJ3Zic=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250422073820epcas5p278a7dc220a17e59ac3f02bc959a28043~4k_yjQrRP0661506615epcas5p24;
	Tue, 22 Apr 2025 07:38:20 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.180]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZhYxk1wF3z6B9mB; Tue, 22 Apr
	2025 07:38:18 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250422073817epcas5p3ede778f39029e874aaf3c7f6538b34e9~4k_wUbKnv0299202992epcas5p3h;
	Tue, 22 Apr 2025 07:38:17 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250422073817epsmtrp20dbbe055a92bcca4bac310be3cf8f62d~4k_wTuDZK1036710367epsmtrp28;
	Tue, 22 Apr 2025 07:38:17 +0000 (GMT)
X-AuditID: b6c32a2a-d63ff70000002265-34-6807476965ac
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FF.42.08805.96747086; Tue, 22 Apr 2025 16:38:17 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250422073816epsmtip2f7c0fd07dfa8a4afdac43aea1ae86d83~4k_vKHH3b1940319403epsmtip2k;
	Tue, 22 Apr 2025 07:38:16 +0000 (GMT)
Message-ID: <d6437a1d-8bee-4655-a7bf-e9254b2d881f@samsung.com>
Date: Tue, 22 Apr 2025 13:08:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] nvme/pci: make PRP list DMA pools per-NUMA-node
To: Caleb Sander Mateos <csander@purestorage.com>, Keith Busch
	<kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig
	<hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <20250421165525.1618434-3-csander@purestorage.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgkeLIzCtJLcpLzFFi42LZdlhJXjfTnT3D4N1hNYvVd/vZLP4vnMtq
	sXL1USaLSYeuMVpc3jWHzWL+sqfsFutev2dxYPc4f28ji8fls6Uem1Z1snlsXlLvsftmA5vH
	toe97B6fN8kFsEdx2aSk5mSWpRbp2yVwZZycuZa94AlTxYG/W9kaGOcwdTFyckgImEjcWXeW
	sYuRi0NIYDejRPPNk1AJcYnmaz/YIWxhiZX/nrNDFL1mlHhz7zALSIJXwE7izrYNrCA2i4Cq
	xMaZLxkh4oISJ2c+AasRFZCXuH9rBtggYQFviTOrX4MNEhHYxiix+8NeZpAEs4CDxIWr3WwQ
	G44zSqyfs4gdIiEucevJfKCTODjYBDQlLkwuBQlzCthL3DzexgpRYibRtbWLEcKWl9j+dg7z
	BEahWUjumIVk0iwkLbOQtCxgZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcSVpa
	Oxj3rPqgd4iRiYPxEKMEB7OSCK95EHOGEG9KYmVValF+fFFpTmrxIUZpDhYlcd5vr3tThATS
	E0tSs1NTC1KLYLJMHJxSDUwx/J05RUs656Su7a86dbBCYd2TPRHbS2RmfLvIlWu2+c0kPv2T
	p18p3NbdGnaPT2ETq7tr8jvBwwnT6vLqguVn6LKmy5TOnmd1Mr1/qbhxkF6RukPd8vuKC7cW
	tmybGVnhqv9QZ8KyzhdHjFbGGeXL+pj6r7EoffxJ5bv1K7etyyJk96yNW7d+9ZqPitb3Mkw2
	K/OKyPUrft6T+7+1PWf6gSd5v0sFDA3cWm+wq2tvuXLw/LOwsO3bVcW1ilZf6911X2XqjKn2
	9QYPr1Ytel7FOvvtrgUGh+/kF0TrnHi8/WNZ6N2b//6HbJoxOdR5JSdT8AQvnpb+MvlgOVWr
	AIfewjo+foX1pTutlgq8fKTEUpyRaKjFXFScCABHZlahEwMAAA==
X-CMS-MailID: 20250422073817epcas5p3ede778f39029e874aaf3c7f6538b34e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250421165557epcas5p3defaf797e86f5edfafd6dcdd59cff709
References: <20250421165525.1618434-1-csander@purestorage.com>
	<CGME20250421165557epcas5p3defaf797e86f5edfafd6dcdd59cff709@epcas5p3.samsung.com>
	<20250421165525.1618434-3-csander@purestorage.com>

On 4/21/2025 10:25 PM, Caleb Sander Mateos wrote:
> +	prp_pools = &dev->prp_pools[numa_node < nr_node_ids ? numa_node : 0];

Numa node values are always in the range [0, nr_node_ids - 1], so is 
this condition "numa_node < nr_node_ids" really required?

The patch looks good to me though.

Reviewed-by: Kanchan Joshi <joshi.k@samsung.com>




