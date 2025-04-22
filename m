Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F077524C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307511; cv=none; b=sqNDN/e/zo6FeSLs7AIWW77oXnflKd8peHX7xchN08QE++GB92qV1cJaGM54Mg5V/YKuqqGD0viNV/uQTWsb0fi7iI5hArea+OLLAvOKUAAhQosjE81iri6imY3w5/fc92gV/Ut3NO3NCNKsI/A1FmZ0iv5fhS11sLi3uRYs2uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307511; c=relaxed/simple;
	bh=MPy2dmqKlCsrw5okIZFwkiGzwVi0bWXg1j0NfWvMFRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=USJF4PjIPA0vIyI4UXZwCiqLYvU69wL0RQ1WcGrEtCo0xvvcBrH2GbsnBlm4New89xfZDJzslZV7moCfCc+vD18F/Tx8nwqBLlsM7B+ilG6U8/hJed7bwqM5NHNups0+VgNCsI8TIAG4VZJW+e0+RaNg8vCMWboq8YIFaI1pfJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AitFprGG; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AitFprGG"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250422073826epoutp014fcfbffe36f201c88081e6c279367060~4k_4PLFh20228002280epoutp01W
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:38:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250422073826epoutp014fcfbffe36f201c88081e6c279367060~4k_4PLFh20228002280epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745307506;
	bh=MPy2dmqKlCsrw5okIZFwkiGzwVi0bWXg1j0NfWvMFRQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=AitFprGG79mLV4uXkvP/3UU65h45DzTZHAQDxAHdxZAZC/EmearSivYxf6jPqKiK6
	 7Sd1YF6S2acOTgnqf/mZ6YaeNaNfL8g33xRsbXbba2DNmiJx8Sn65Y9UpU9bxUWkv+
	 5VbPLBtN5a9aXbB/D+Y5+ZX05hex1uQ/Huv9F3Y0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250422073825epcas5p4c49fa59e7a7d256c869c7bf61902edfa~4k_3uLddJ2963329633epcas5p4d;
	Tue, 22 Apr 2025 07:38:25 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.180]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZhYxq4HP9z6B9mB; Tue, 22 Apr
	2025 07:38:23 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250422073822epcas5p1f236374806c4ed2f5403357800d6303d~4k_1F-2wA3032130321epcas5p1L;
	Tue, 22 Apr 2025 07:38:22 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250422073822epsmtrp2ce36107c0e9e4e4d0c2245281428d769~4k_1FUGEe1036710367epsmtrp2E;
	Tue, 22 Apr 2025 07:38:22 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-48-6807476e9b90
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	7D.12.19478.E6747086; Tue, 22 Apr 2025 16:38:22 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250422073821epsmtip2421a6fd931eeda0507550bb398e6545e~4k_z87bJg1922619226epsmtip2k;
	Tue, 22 Apr 2025 07:38:20 +0000 (GMT)
Message-ID: <8d55c7e6-c753-4cef-9f15-a1ef91281b22@samsung.com>
Date: Tue, 22 Apr 2025 13:08:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] nvme/pci: factor out nvme_init_hctx() helper
To: Caleb Sander Mateos <csander@purestorage.com>, Keith Busch
	<kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig
	<hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <20250421165525.1618434-2-csander@purestorage.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSvG6eO3uGwfQ2PYvVd/vZLP4vnMtq
	sXL1USaLSYeuMVpc3jWHzWL+sqfsFutev2dxYPc4f28ji8fls6Uem1Z1snlsXlLvsftmA5vH
	toe97B6fN8kFsEdx2aSk5mSWpRbp2yVwZZzasZSpwKji2tw+pgZG3S5GTg4JAROJo2+es3Ux
	cnEICWxnlOib+40JIiEu0XztBzuELSyx8t9zdoii14wSPVs/s4AkeAXsJN4f2wzWwCKgKvFq
	1lw2iLigxMmZT8BqRAXkJe7fmgHUzMEhLOAhMbkhEGSOiMA2RondH/Yyg9QwCzhIXLjaDdYr
	JHCcUWLP63KIuLjErSfzmUB62QQ0JS5MLgUJcwrYS5xZMZUVosRMomtrFyOELS+x/e0c5gmM
	QrOQXDELyaRZSFpmIWlZwMiyilE0taA4Nz03ucBQrzgxt7g0L10vOT93EyM4crSCdjAuW/9X
	7xAjEwfjIUYJDmYlEV7zIOYMId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzKOZ0pQgLpiSWp2amp
	BalFMFkmDk6pBqadbwq9E6MnLo02FRNskJLhNffa+zDw37+mK/83i4qor9ypmXu39r8Xq9sr
	85OTfeV/7vRq6GJIcqvYYMF5ze7D6aOPuaJn1MurL+HRunXdsXf+Kv6ZQmbVRSlJd39N2i5d
	zuzON8f88j+tBfcVzhcr5zb1yVsxyq50fDvD3MAx7XSU/ecZ7/lcG5beYruWd6PM884BraLf
	q+zXsby6KLh3VVB2xHHdy8eeBDH+UVOcEnZ6irEz59PvUk+Tv84yOMsSGBYifT+we87aC2Zn
	GY9kplnoWQaHsci7BHOK6P+MOL/81M3MGLO0Df3y13pvPXh9d7mp9tUdbp/P3HtUts3MV+ZZ
	25LlSeFhaq/90pRYijMSDbWYi4oTAXvXp4YLAwAA
X-CMS-MailID: 20250422073822epcas5p1f236374806c4ed2f5403357800d6303d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250421165556epcas5p156fef8877292ef2d395cf372aaa21721
References: <20250421165525.1618434-1-csander@purestorage.com>
	<CGME20250421165556epcas5p156fef8877292ef2d395cf372aaa21721@epcas5p1.samsung.com>
	<20250421165525.1618434-2-csander@purestorage.com>

Reviewed-by: Kanchan Joshi <joshi.k@samsung.com>
