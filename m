Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F2E259CB2
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130680; cv=none; b=t0EOcuiBBFk9846velvywQtLNUttvM2VQXM8YLW2xX1SvCW7LngIomA+9jJ68yVK9Z5n1UeCLxWO2q9es8HAtXA3s+Y9UFB3GB8M1Npcdx4bfDpLnjJDgrdedp59vk5DG6BhXYZ4UWI3DrguoRP7kDo0z8KQk4xiQ2qz6Q+m+MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130680; c=relaxed/simple;
	bh=jcgKiSFvCa0PFJyLSGeoIEUVzTD5YbVTUv1foZ6p06k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgpOBnXPr8losba1TStq08featW66x2yT+bMRlskpnmw1KsZGm9COO1/5Wzo7HSlpRaR+1cPBVfhWC/yiQrEf+ZvR0SGxgsPebdt1YUQ5sm0vNSzWjwNy5UU8noB2+k9E58Ms9f0bZTlxCSNnCuv2pGGrq51FwxqleGD1NnOJAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E160168F;
	Thu,  5 Jun 2025 06:37:40 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57A603F5A1;
	Thu,  5 Jun 2025 06:37:56 -0700 (PDT)
Message-ID: <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com>
Date: Thu, 5 Jun 2025 14:37:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Daniel Stone <daniel@fooishbar.org>, Rob Herring <robh@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
 <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
 <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2025 8:41 am, Tomeu Vizoso wrote:
[...]
>> In fact this is precisely the usage model I would suggest for this sort
>> of thing, and IIRC I had a similar conversation with the Ethos driver
>> folks a few years back. Running your own IOMMU domain is no biggie, see
>> several other DRM drivers (including rockchip). As long as you have a
>> separate struct device per NPU core then indeed it should be perfectly
>> straightforward to maintain distinct IOMMU domains per job, and
>> attach/detach them as part of scheduling the jobs on and off the cores.
>> Looks like rockchip-iommu supports cross-instance attach, so if
>> necessary you should already be OK to have multiple cores working on the
>> same job at once, without needing extra work at the IOMMU end.
> 
> Ok, so if I understood it correctly, the plan would be for each DRM
> client to have one IOMMU domain per each core (each core has its own
> IOMMU), and map all its buffers in all these domains.
> 
> Then when a job is about to be scheduled on a given core, make sure
> that the IOMMU for that core uses the domain for the client that
> submitted the job.
> 
> Did I get that right?

It should only need a single IOMMU domain per DRM client, so no faffing 
about replicating mappings. iommu_paging_domain_alloc() does need *an* 
appropriate target device so it can identify the right IOMMU driver, but 
that in itself doesn't preclude attaching other devices to the resulting 
domain as well as (or even instead of) the nominal one. In general, not 
all IOMMU drivers support cross-instance attach so it may fail with 
-EINVAL, and *that*'s when you might need to fall back to allocating 
multiple per-instance domains - but as I say since this is a 
Rockchip-specific driver where the IOMMU *is* intended to support this 
already, you don't need to bother.

Thanks,
Robin.
