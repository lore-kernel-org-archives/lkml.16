Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C134964E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745219386; cv=none; b=fuelFSiovcgYQtZCkmAg+pSfhwph00phofnOlna/0MxGKnJnfP3oKMG2F7zP/VYABPcr3wC/anOYSPaztMRISG4KywRQBxjKblJZX3uPYZjYWiF3HeTzRAIZR6upI6LHNnKPlhIK3nv4svAASfC3xtPBTbpDxt3WxbY5W/WXs24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745219386; c=relaxed/simple;
	bh=UQxXCWOQKtctXtE6FeZBi4J5Xx7jZNb0HMD4/ytZ9Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=XHpK5vIcuSp8iX4sQC0btzB1mKTzhd5PWgfzQMd3NwbQERgouACUnyzih1JnpjNZ5gzGlFnkOOXnFIAxNw0wz8Y7pSpJwSPFc1mMT0xK6D4q0ZQRwRTPN/tf9IvAp+8+ZetI1rot+tbUlJuNdDjcPJ6K63wHSkpQruOI9XnGjy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gPcj5Q5a; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gPcj5Q5a"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250421070939epoutp02492168ad197e2d04e3b843f19e55c01c~4Q8do3wjZ2566125661epoutp02M
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:09:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250421070939epoutp02492168ad197e2d04e3b843f19e55c01c~4Q8do3wjZ2566125661epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745219379;
	bh=9M8knapvAhU+6QfKbaIXib+N0ZVMGdHnsGWUU+mG8kM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=gPcj5Q5ao9gEmezDUAMs86BP5eCKM4pKQ+05rKp3nxEyIgzmrE9MDvlD+StabwUQ6
	 Khh5VO1ejwHqBNkt+l+zm5LsXrCx5ldQV2aGooy1hXckiLb1PR9Zc0mX0kycW699oc
	 JmxCwnU49yFbFC40WHQNz7H733Tv/wTubEQqHBKU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250421070938epcas5p419e7717b2a9e817ec66425c6c26acbd9~4Q8dFc57P2581825818epcas5p41;
	Mon, 21 Apr 2025 07:09:38 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.175]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZgxM52hPvz3hhTQ; Mon, 21 Apr
	2025 07:09:37 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250421070936epcas5p37a043a207dbd7e81baea9affc451a591~4Q8bXlsB92455624556epcas5p3o;
	Mon, 21 Apr 2025 07:09:36 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250421070936epsmtrp25fb82bc4d78fe7553186e3f93c76cb83~4Q8bW6BDN2454924549epsmtrp2s;
	Mon, 21 Apr 2025 07:09:36 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-58-6805ef30e1d8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D1.BC.07818.03FE5086; Mon, 21 Apr 2025 16:09:36 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250421070935epsmtip2b5b59bebdfdc4b946d67d78a6e74f797~4Q8aRLvOr0499504995epsmtip2Q;
	Mon, 21 Apr 2025 07:09:35 +0000 (GMT)
Message-ID: <ba40abc8-8b41-4e2c-a700-04e8e424bcc3@samsung.com>
Date: Mon, 21 Apr 2025 12:39:34 +0530
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
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSvK7Be9YMg+lnjSxW3+1ns/i/cC6r
	xcrVR5ksJh26xmhxedccNov5y56yW6x7/Z7Fgd3j/L2NLB6Xz5Z6bFrVyeaxeUm9x+6bDWwe
	2x72snt83iQXwB7FZZOSmpNZllqkb5fAlbHrQ2rBY6aKdQ0f2RoYpzJ1MXJySAiYSCy/dJi9
	i5GLQ0hgN6PE8bUTGSES4hLN136wQ9jCEiv/PYcqes0o0dGzEayIV8BO4vruPSwgNouAqkT/
	qcfMEHFBiZMzn4DFRQXkJe7fmgE2SFjAReLD72+sIINEBLYxSuz+sBesgVnAQeLC1W42iA2T
	GCXW3//HCJEQl7j1ZD7QrRwcbAKaEhcml4KEOQXsJTZtOAZVYibRtbULypaX2P52DvMERqFZ
	SO6YhWTSLCQts5C0LGBkWcUomVpQnJuem2xYYJiXWq5XnJhbXJqXrpecn7uJERxHWho7GN99
	a9I/xMjEwXiIUYKDWUmE1zyIOUOINyWxsiq1KD++qDQntfgQozQHi5I470rDiHQhgfTEktTs
	1NSC1CKYLBMHp1QDk0lG9ocdlVZLp18RFQjYlbv93JG6nVymUyMcuXZZH/t410o3dmHt41tv
	86fz/Yld51YU/El+x6xjx7dkdjCw9zw/VTN7dZT5mtL8u4dWyoom3nY5KXL/hMTcyqfrGm0+
	COofKmVmfW/FdSNCSPDYhIapJdqXkt1mXt1VM3m+mln+k8bodOcrBbtOR9y+ctq6orpQjaXw
	/8c31WLzXt+0dVA7Klq5Sj9ZsMylq+bbLoeX1xfOv9X0W9LRInSfYEnkpNwqhZWWBzS2Pbso
	HXRCcuKBaxu/pDjKSfZe89r1sn33QdlulYduUqEbZM/L7FXgnmEl9EroSHXd/Cgfc+53LGzc
	Oxcdv68jm8Ikah5dqMRSnJFoqMVcVJwIAIqnuJISAwAA
X-CMS-MailID: 20250421070936epcas5p37a043a207dbd7e81baea9affc451a591
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250420164653epcas5p10dba2c638655fd4b16c6553d5125a3a0
References: <CGME20250420164653epcas5p10dba2c638655fd4b16c6553d5125a3a0@epcas5p1.samsung.com>
	<20250420164450.1144416-1-csander@purestorage.com>

On 4/20/2025 10:14 PM, Caleb Sander Mateos wrote:
>   static int nvme_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
>   			  unsigned int hctx_idx)

Missing this handling for admin queue.

We may go to that case (i.e., admin command with data payload > 1 
segment) less often. But when we do, this code will give 
null-pointer-deference.


