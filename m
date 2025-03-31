Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633652E3395
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743405697; cv=none; b=LNdb75xKM5xszdiF8qYCX9gvEOxMn37cy9ZsYZNpTTvnPz5vhVZu4KBF/8wCoU6qt+/ohrEoZoljwU/lL3Lw0x3K374eqkgZIBuDZeHyLOxnjrl1JB3FAET8oXf5QHYAgrXgdlBJpz93pcCuynNpeqSxsp/IGzG2bX4w5c6j1aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743405697; c=relaxed/simple;
	bh=OMRAr/uZdCl/CK6uMpbxvPDVPTdIBItm0ubOyEc78I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DUFWQUZsJNe6WizrrVM/ZBXmKO9I4UNxZV9BCoQ6Zj443C0HwLVE4w7Mv7HgroL4WL3xF0FdxbREA9mCF7fr4Zc7013yW5WIphkUj1WY+glZYZ7e7kyf03XHaVLRq9Q/qjzGYbTdGXciPm/eks5oSQqqMobQ62w+/lv+06hKk60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZR2by4vRDz1d18Q;
	Mon, 31 Mar 2025 15:21:02 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
	by mail.maildlp.com (Postfix) with ESMTPS id 92768140383;
	Mon, 31 Mar 2025 15:21:31 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 31 Mar 2025 15:21:30 +0800
Message-ID: <6f13db31-4af9-4e97-a85d-b72bf4773c36@huawei.com>
Date: Mon, 31 Mar 2025 15:21:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector info
 and EDID by using AUX channel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
	<chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
	<shenjian15@huawei.com>, <shaojijie@huawei.com>,
	<jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250320101455.2538835-1-shiyongbang@huawei.com>
 <20250320101455.2538835-6-shiyongbang@huawei.com>
 <7giy3wpm4xyth6ol7wvfg5r446lmmdftw656vwdhbyzs6xrewh@25etguysdhqh>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <7giy3wpm4xyth6ol7wvfg5r446lmmdftw656vwdhbyzs6xrewh@25etguysdhqh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd500013.china.huawei.com (7.221.188.12)

>> dp->aux.name = kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");
> As being discussed in the feedback for v7, this is a memory leak. Can
> you simply assign the string here?

Alright!

