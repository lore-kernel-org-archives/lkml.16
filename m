Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B4274653
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067605; cv=none; b=YMUamdqdNmjLbIsDzb8VpfXK8CfYWD1lXd5NNw10W7YveEcLgXcv0D66h9WehpjfwxBRJYNaOU5Vp5N3BVnuHDlG8YuP/T7T0VyIlZxlIjOCBlzxdyIN/JaBkn0wW0DmPc6C7uZ/ige9HWQahThIkgDlIVI5i24vPfXIswjpvo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067605; c=relaxed/simple;
	bh=4cv8uE6pGypsCSgH3uyNQBvUvH0nntwDkgEVp1CQBYI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObdfMXohFjJB1FyVGMdSPL+lpzoc/x8lRsjtMJqoM9x1FEEB6LOtCSiLvH7eY7qoKYhlifgMdy4OddsqYZtxZ968HuX5m3jAR1Lbb8bSysWjtalVzlmQp0WBouOMvtsu0mDk5uzbYXvZNvcP1tsEX5LpWLu085Yl41ROl+X83+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLQHk0HX0z6L5JK;
	Mon, 16 Jun 2025 17:51:14 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id DC218140119;
	Mon, 16 Jun 2025 17:53:20 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 16 Jun
 2025 11:53:20 +0200
Date: Mon, 16 Jun 2025 10:53:18 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
CC: <21cnbao@gmail.com>, <m.szyprowski@samsung.com>, <robin.murphy@arm.com>,
	<yangyicong@huawei.com>, <hch@lst.de>, <iommu@lists.linux.dev>,
	<prime.zeng@huawei.com>, <fanghao11@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>
Subject: Re: [RESEND PATCH v4 1/4] dma-mapping: benchmark: Add padding to
 ensure uABI remained consistent
Message-ID: <20250616105318.00001132@huawei.com>
In-Reply-To: <20250614143454.2927363-2-xiaqinxin@huawei.com>
References: <20250614143454.2927363-1-xiaqinxin@huawei.com>
	<20250614143454.2927363-2-xiaqinxin@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Sat, 14 Jun 2025 22:34:51 +0800
Qinxin Xia <xiaqinxin@huawei.com> wrote:

> The padding field in the structure was previously reserved to
> maintain a stable interface for potential new fields, ensuring
> compatibility with user-space shared data structures.
> However,it was accidentally removed by tiantao in a prior commit,
> which may lead to incompatibility between user space and the kernel.
> 
> This patch reinstates the padding to restore the original structure
> layout and preserve compatibility.
> 
> Fixes: 8ddde07a3d28 ("dma-mapping: benchmark: extract a common header file for map_benchmark definition")
> Cc: stable@vger.kernel.org
> Acked-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>

FWIW I checked the patch above indeed accidentally dropped the padding and the structure
is copied to userspace so this fix is correct.  Given it's not in a uapi header this
only really affects the selftest I think this is mostly a case of there possibly being
out of tree tools with a local copy of this structure definition.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
