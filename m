Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86BF4964E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745219614; cv=none; b=tt6HVhT0d9Td06f7371s22Gg0gU+jqTx8+bzUNMSK1XjYRDpQhzCvvNBfJru+Coono8KOv88aD3Wk+8iTRc6Y3+cpAoP4FAWPQHe3lWWcYAbSnt0hyaKIPKW6EINrS+pM+86CO9AaHXCmyuqGvjbJdXlNprCMxKAQMPrxYW4cM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745219614; c=relaxed/simple;
	bh=cxRUUFPYZ0L3zWK9J/yMHeoMMjOBp0jHH539/En/8jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ukDCOtJuwaund7wYikfYpW+iGNrAQZMWztJN4MFXtxzXWTYIxWftLeVBimzvVEEu317VIUSNGB9MIzEXFmncZDSKZnBHMGfCWcaf/c9QTzgGUwFLWwDRUrzqJXZTbFWx0rg9y3rv7TJzWWI5x+Q0BO0hdUMjMcmZLZgGIgGTdps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lAypoYcl; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lAypoYcl"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250421071329epoutp025a8bb77692682af0e8a61c38e5df1b49~4Q-z7l0Ql3094030940epoutp02p
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:13:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250421071329epoutp025a8bb77692682af0e8a61c38e5df1b49~4Q-z7l0Ql3094030940epoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745219609;
	bh=2u87TOECjawntY7D5V86pdK95+lTCeMUL6C9Y3hUsCw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=lAypoYclbmkjPS7BnD7H0W5YI88PM/klJBB85seET587K9o6Ow+bXA8IZSQ53DbNK
	 4BODLTA7hmriZBpFFT+ZamdiowUgjD3nYI+W7cT6pU9w0OJLM7zlE2ZQNV9Da4bD7B
	 4OkQJtGgtZn4/gbuZeRNPMBvQleJFQungu9XFdW0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250421071328epcas5p13cf33f8bb7005e69360f837d4411d236~4Q-zXJfkp2319223192epcas5p1x;
	Mon, 21 Apr 2025 07:13:28 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.180]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZgxRW2FdSz2SSKX; Mon, 21 Apr
	2025 07:13:27 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250421071326epcas5p156047242a96a1f25825071656349095e~4Q-xboPty1355113551epcas5p1k;
	Mon, 21 Apr 2025 07:13:26 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250421071326epsmtrp26fe4e6a180a50e347c7f4ac2f170cf81~4Q-xa6JzZ2685026850epsmtrp2K;
	Mon, 21 Apr 2025 07:13:26 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-0f-6805f0164222
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	53.6D.08766.610F5086; Mon, 21 Apr 2025 16:13:26 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250421071325epsmtip19ee977189641d5b401f31de93c7e73c8~4Q-wLOHHi1816518165epsmtip1J;
	Mon, 21 Apr 2025 07:13:25 +0000 (GMT)
Message-ID: <be873f40-d3c4-4f0e-8b36-dc6e4f5bcf48@samsung.com>
Date: Mon, 21 Apr 2025 12:43:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme/pci: make PRP list DMA pools per-NUMA-node
To: Caleb Sander Mateos <csander@purestorage.com>, Keith Busch
	<kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig
	<hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <20250420164450.1144416-1-csander@purestorage.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSnK7YB9YMg+knVS1W3+1ns/i/cC6r
	xcrVR5ksJh26xmhxedccNov5y56yW6x7/Z7Fgd3j/L2NLB6Xz5Z6bFrVyeaxeUm9x+6bDWwe
	2x72snt83iQXwB7FZZOSmpNZllqkb5fAlXFt73umgvXMFfPOrWZuYLzB1MXIwSEhYCJxvVG1
	i5GLQ0hgN6PEv6unWLoYOYHi4hLN136wQ9jCEiv/PWeHKHrNKLH8w0Q2kASvgJ3Eor2zGEFs
	FgFViQ37prFCxAUlTs58AjZIVEBe4v6tGWCDhAVcJD78/sYKMkhEYBujxO4Pe5lBEswCDhIX
	rnazQWyYxCix/v4/RoiEuMStJ/PBTmUT0JS4MLkUJMwpYC+xacMxqBIzia6tXVC2vMT2t3OY
	JzAKzUJyxywkk2YhaZmFpGUBI8sqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgONLS
	3MG4fdUHvUOMTByMhxglOJiVRHjNg5gzhHhTEiurUovy44tKc1KLDzFKc7AoifOKv+hNERJI
	TyxJzU5NLUgtgskycXBKNTB5/2/65i1bLNO9/OxmN/Xreu+TYwpNT6X1LZ379vnT7sbswpCz
	9eXqjFrNjyaV8m1cX9T57toTDZFztrW39iUu3GDyU32r851oFdYPL37lvQ/Y0xuxZ83hhVZK
	R39wyDtrSnGIN745wia4xW2NfkYDo9rGgusftdo+tnQcqORTY9n+e81LwWvup//+0Y08e8Qg
	xjRvX4TSmRO6dbOULmsHrY958P2SicZ3ARWtpGm5Ci/T7VcLy2zj+jXVfa1MnrDdjiPHWg+u
	ffje4Cl3SKlQuKj0wmWrY/Ym1V45Vx626F7bo+bn0X6TDj9YKFD3u4nr+5nvvZ6Saw/rO13T
	3CzFe7xZy23KbO0Ek2jO8D4lluKMREMt5qLiRAAhQ28iEgMAAA==
X-CMS-MailID: 20250421071326epcas5p156047242a96a1f25825071656349095e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250420164653epcas5p10dba2c638655fd4b16c6553d5125a3a0
References: <CGME20250420164653epcas5p10dba2c638655fd4b16c6553d5125a3a0@epcas5p1.samsung.com>
	<20250420164450.1144416-1-csander@purestorage.com>

On 4/20/2025 10:14 PM, Caleb Sander Mateos wrote:
> struct nvme_dev {
>   	struct nvme_queue *queues;
>   	struct blk_mq_tag_set tagset;
>   	struct blk_mq_tag_set admin_tagset;
>   	u32 __iomem *dbs;
>   	struct device *dev;
> -	struct dma_pool *prp_page_pool;
> -	struct dma_pool *prp_small_pool;
> +	struct nvme_prp_dma_pools prp_pools[MAX_NUMNODES];

I wonder if it is worth to make this dynamic using nr_node_ids?
