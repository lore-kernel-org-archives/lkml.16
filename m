Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363A0280A21
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534348; cv=none; b=sU0PRm2yklkCvyIxPxGT0sKCEJRLWRJ2vAe1Nu1pWv96gfarVW/ByAdP+IJB23TeLZWa+mrSN8+Jo9BMLA/ckhQeAHfbWPyNGLK5NB2PpcRKBV2tMICInwN+43+L8wi5m267FO5l0yis59K7VDMTr0TloWoAApCslPWEyA+XnD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534348; c=relaxed/simple;
	bh=UtIHtwimS87wBISqHycmaSw4ya7wBNI9V90q0Hg2LBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mqZbctYAitV1OeL8aiFrwXzMUZJr3qTgYBuJ6CkUmCbbWaXUo/B3ZNQxDCr2c/zsojQEMw2MkPDoBEHYlWw+bmWvN9VpJCQN7V29Qda6+gDL4xRBFKyKdDUmX4sWMat9xX9EwL45qRfYe/tCM5xkoynBu4uIEMiYAIDYaFKQHyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZsHfD2FR2z2TS7j;
	Tue,  6 May 2025 20:25:08 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 8AE301A0188;
	Tue,  6 May 2025 20:25:41 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 6 May 2025 20:25:40 +0800
Message-ID: <2f8c960b-7d0b-4aa2-bade-4668d753757f@huawei.com>
Date: Tue, 6 May 2025 20:25:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] dma mapping benchmark: add support for dma_map_sg
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, <baohua@kernel.org>
CC: <yangyicong@huawei.com>, <hch@lst.de>, <iommu@lists.linux.dev>,
	<jonathan.cameron@huawei.com>, <prime.zeng@huawei.com>,
	<fanghao11@huawei.com>, <linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>
References: <20250506030100.394376-1-xiaqinxin@huawei.com>
 <fd0dfb53-127f-4529-adf8-db03269d5798@oracle.com>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <fd0dfb53-127f-4529-adf8-db03269d5798@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemj200003.china.huawei.com (7.202.194.15)

Okay, I'll fix this in the next version.

在 2025/5/6 20:20, ALOK TIWARI 写道:
> Could we make them consistent
