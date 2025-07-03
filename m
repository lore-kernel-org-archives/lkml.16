Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0C42DE6FC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751522595; cv=none; b=LK6xitPabFPBJtFZp5EbUmucYFQVJcySQxtk+X5XASCiZWAS2fNQvQpCJ7FS+uWHcmpo07HF+lg1eAoS5vnjmm538zct3Ut6j/wKbrpvmfjPFIUd9hlT1xr2Q5Is2ZpPCeO2HW7npzR3SawJS4F730Sp/z6TthglmwyY6Qz/H1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751522595; c=relaxed/simple;
	bh=ynaMprbr/DSk7Dkt3k87E6gZAMRkXioAAlMhDAoda0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=uxMQRMORXrXrwGomIp0ynpGJuXNNBx8PmHo2Q3VM1Ag3SBTqYnFwPwH3cO0144+65s0ffEF89DOMNKo8NBtAp53ynURGaoZRDlVn56qBHt48ll7BFI4NaWvmsWbAO3xlCwc9DWkOPNQcpHFCIctWCXgKlXjUpVTwOOACzEnjHqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cF84dpmr; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cF84dpmr"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250703055425epoutp04c42af8671188d7e8458b5dfeb76bc930~OqAncM7iW0808208082epoutp04g
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:54:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250703055425epoutp04c42af8671188d7e8458b5dfeb76bc930~OqAncM7iW0808208082epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751522065;
	bh=NxhRoGxQMDU6ikoL0AvSCUO26Gv9OAsjIwBiwwpSKio=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=cF84dpmrmzWjHNPHxPkL0xB6K1V3QiXx3h7tlMt4iX8M/BNaSyagHwwh1asL4iu0R
	 ELj/u+7lSrDb2UM9h/bFQRtnqqN8vowfJOnAsJLaeA1EGtSgbNL576G91cETjbvs1q
	 lahDNWO+uKGcP7sPDMBIrpcM5IE3ISpVGEBInEkw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250703055424epcas5p1f09110c8969685ee00f9025484fee311~OqAm-TMbr1811418114epcas5p1g;
	Thu,  3 Jul 2025 05:54:24 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.176]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bXmDb2qvPz2SSKg; Thu,  3 Jul
	2025 05:54:23 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250703055422epcas5p2e210090b98d77bd394c7cd9e67bf0a04~OqAlHBl3V1762917629epcas5p2g;
	Thu,  3 Jul 2025 05:54:22 +0000 (GMT)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250703055421epsmtip29b9ecb294e8afd118e03a01b6b09faaf~OqAj0L1Ch3089030890epsmtip2E;
	Thu,  3 Jul 2025 05:54:21 +0000 (GMT)
Message-ID: <07c07d1f-2eb6-437f-931c-0f04b129eb08@samsung.com>
Date: Thu, 3 Jul 2025 11:24:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next-20250627: IOMMU DMA warning during NVMe I/O completion
 after 06cae0e3f61c
To: Ben Copeland <ben.copeland@linaro.org>, linux-kernel@vger.kernel.org,
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
	linux-nvme@lists.infradead.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>, kbusch@kernel.org,
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me
Content-Language: en-US
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <CAL0q8a6pOBZbWYdwKzC1U-PuH4rgf2miv0jcF=fWVZt_dUZHmw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250703055422epcas5p2e210090b98d77bd394c7cd9e67bf0a04
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250630075218epcas5p1f3d467fffa468cac0ccd012c193e94df
References: <CGME20250630075218epcas5p1f3d467fffa468cac0ccd012c193e94df@epcas5p1.samsung.com>
	<CAL0q8a6pOBZbWYdwKzC1U-PuH4rgf2miv0jcF=fWVZt_dUZHmw@mail.gmail.com>

On 6/30/2025 1:20 PM, Ben Copeland wrote:
> # first bad commit: [06cae0e3f61c4c1ef18726b817bbb88c29f81e57]
> nvme-pci: merge the simple PRP and SGL setup into a common helper

this patch had the problem [0] of not setting 'iod->first_dma' which can 
trigger that IOMMU warning on unmap.
But problem was transient as a subsequent patch removed the 
iod->first_dma and made unmapping work without that.

[0]
-static blk_status_t nvme_setup_prp_simple(struct nvme_dev *dev,
-               struct request *req, struct nvme_rw_command *cmnd,
-               struct bio_vec *bv)
+static blk_status_t nvme_pci_setup_data_simple(struct request *req,
+               enum nvme_use_sgl use_sgl)
  {
         struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
-       unsigned int offset = bv->bv_offset & (NVME_CTRL_PAGE_SIZE - 1);
-       unsigned int first_prp_len = NVME_CTRL_PAGE_SIZE - offset;
-
-       iod->first_dma = dma_map_bvec(dev->dev, bv, rq_dma_dir(req), 0);
-       if (dma_mapping_error(dev->dev, iod->first_dma))

iod->first_dma does not get set, and that can cause unmap on invalid 
address during teardown.


