Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232C922D9EF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 05:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746770173; cv=none; b=du8bSswT9scOcEicnKMAH7wb35T8EQHylW1ODSEaGya834KY+gbSDGcqizL7bmQmTJdsWF+8YtaCi770/eeaD4ztHfYpzJ2leEXxhYSXqnXujAc7Jc0wbafqg9TBxAn4+8lelDSd4m8/SHgQ+xfNX6VuOAmCzGJO/GeQ5kwwyeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746770173; c=relaxed/simple;
	bh=9Zprc0Y8fd00gD3Cwnj8oJhsjRG7Bjkmu4tpcaZJ4HU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Zsu3UMZxCbnqFcrPb+D1rOOlysOyLTOCa0Dl50EsR+l39WpIYpIp339F6eyjPLorcTEgY9Kh40vX9siDRgyWPbDWuWpg45/KRryL1FUc39gkGh0M0UhOrT+Irts/o8x3apxkPJZtKrrEZTAF9G/jPKGqqJXDqGdX59xHKCDcs7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lte/5JpA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lte/5JpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746770168;
	bh=9Zprc0Y8fd00gD3Cwnj8oJhsjRG7Bjkmu4tpcaZJ4HU=;
	h=Date:To:Cc:From:Subject:From;
	b=lte/5JpAIPoIfwdWCRBIHV4wDSGRmTYY1DVQdB2Y8K74IzEZuChluAckTxW1nyOMu
	 9oeLaEfHAu0W/vMPIPTIL4YYJj8+/qCjqZ5Zg3g8TbQGVXzuwLd+aEiN6jGUiTRa6T
	 N7kjyiIVCRZF2RmBdGIKPvyf9rxeT4uQvo+mxaewWHrtjVyl82NxNHCoZjIDiJuD27
	 Xd9tv7CnwNbuETVwWTFg8+0TpGsJCgve1CxgI1VXCCi0E2v5FWW4KfB9we+3pz5azO
	 1QztPZ3HN+aleoQqIK/C1dJFBeQh3TICuz0aaglZdloHCfMijHbaaewaKIai2w+Fj3
	 5b1bs063SEc2A==
Received: from [192.168.50.250] (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C972E17E05A6;
	Fri,  9 May 2025 07:56:05 +0200 (CEST)
Message-ID: <a8638f85-1cc2-4f51-97ba-7106a4662885@collabora.com>
Date: Fri, 9 May 2025 11:26:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dmukhin@ford.com, mingo@kernel.org, mingo@redhat.com,
 andriy.shevchenko@linux.intel.com, x86@kernel.org
Cc: daniels <daniels@collabora.com>, Daniel Stone <daniel@fooishbar.org>,
 robdclark <robdclark@gmail.com>, lumag@kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: x86: Boot failure on select chromebooks with v6.15-rc5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

With v6.15-rc5, the below chromebooks were not booting with the 
following message. These tests were run in drm-ci.

Starting kernel ...
[    1.843801]  ? __pfx_kernel_init+0x10/0x10
[    1.909838]  ? __pfx_kernel_init+0x10/0x10

https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1420485

Failing jobs:
amdgpu:stoney (AMD Stoney Ridge chipset): 
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76000926

i915:amly (64 bit Intel Whiskey Lake): 
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76000929

i915:whl (64 bit Intel Amber Lake): 
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76000931

These tests were passing till v6.14-rc7, and the issue was seen starting 
in v6.15-rc1. This issue is seen only with these 3 boards and does not 
affect other chromebooks (the pipeline log shows the other i915 driver 
tests).

On bisecting the commits, the commit which introduced this issue is,
3181424aeac2f6596534bf43021a10eae294a9b0 x86/early_printk: Add support 
for MMIO-based UARTs

After reverting the below commits in v6.15-rc5, the board boots and 
tests are executed:
3181424aeac2 x86/early_printk: Add support for MMIO-based UARTs
996457176bb7 x86/early_printk: Use 'mmio32' for consistency, fix 
comments (this fixes 3181424aeac2)

pipeline after reverting the commits,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1420493

Please could you look into this issue. Thank you.

Regards,
Vignesh
