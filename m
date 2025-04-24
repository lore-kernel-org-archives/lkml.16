Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C38655E69
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501565; cv=none; b=haJrmWMzuhIMoQdEGBvHQRr74roK2nAlJUpoNFyDDPWzqTR75VRkkD0IHZ4ZNqNm7jHjYAsJHlBryMDJF8DGQ5aEFTrSVvMOKR+d3f79khbz16DmkrSNsvQCRzKwFdWgJBweuNGYOf8lQtmtZf8peEZSAFPjWVPkg5r64jK2oRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501565; c=relaxed/simple;
	bh=pMokBX/SJspPVL9c/puXig2K4MbcBlDx+WeybZQZew0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t+cr7xuKnEqeVH1czz+7J8qlpzGv4uO40HRygCFl57XDDJQp8lJdOS3PWcS0PcY2X/rP0Uoaq71z+lDdzNFMRtaxEGX5ksmUcHDUtx9G7Q2U4jkaXI9zs9qCs9xJAw0HxJv+ABm0/9J7lpw0wmCrSqd5eyR+iIBRmFcxJ3yd594=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZjxgD2r52z1R7Xh;
	Thu, 24 Apr 2025 21:30:32 +0800 (CST)
Received: from kwepemg200012.china.huawei.com (unknown [7.202.181.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 9AE3B1402CD;
	Thu, 24 Apr 2025 21:32:32 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemg200012.china.huawei.com (7.202.181.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Apr 2025 21:32:31 +0800
From: xieyuanbin1 <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <liaohua4@huawei.com>, <lincheng8@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nixiaoming@huawei.com>, <sfr@canb.auug.org.au>, <wangbing6@huawei.com>,
	<wangfangpeng1@huawei.com>, <will@kernel.org>, <xieyuanbin1@huawei.com>
Subject: RE: [PATCH] ARM: spectre-v2: fix unstable cpu get
Date: Thu, 24 Apr 2025 21:31:33 +0800
Message-ID: <20250424133133.40122-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aAoQwsldwmxAKA0A@shell.armlinux.org.uk>
References: <aAoQwsldwmxAKA0A@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200012.china.huawei.com (7.202.181.63)

From: Xie Yuanbin <xieyuanbin1@huawei.com>

>> From: Xie Yuanbin <xieyuanbin1@huawei.com>
>> 
>> When a user program accesses the kernel address,
>
>Please see
>https://lore.kernel.org/all/795c9463-452e-bf64-1cc0-c318ccecb1da@I-love.SAKURA.ne.jp/T/
>
>As I see it, this can't be fixed - certainly not in this way due to the
>reasons I set out in the above thread.

Oh, I'm sorry that I haven't noticed that someone has submitted similar patch before.

I've actually thought about a similar problem. In areas other than put_cpu/get_cpu, tasks may be scheduled to other CPUs, this cpu actually does not execute the spectre code. 
However, in this case, a context_switch must be happended. Inside switch_mm, the spectre code is still executed, so I didn't think of it as a problem.
But there is a situation, if we switch to another thread of **this** process, we will not execute switch_mm, which is so sad.

As mentioned in the previous patch discussion, this is only an alarm. However, I do not think so. On heterogeneous CPUs, the spectre code of different cores may have different implementations.
If another cpu's fn is executed, there may be illegal instruction and panic.
User processes can attack this point, which is very dangerous.
