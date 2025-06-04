Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8290132C85
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056619; cv=none; b=EFBj/Cd8P0FoCopQ0Hr+AFpfEOjuzSO9CJn13hH6ZRxncd2ZKlubaqqP7KG1Al8Mtyoxr5iLt/runt+h4ubzfVhDbfywtmOASDqTH0I9mUo11oTeyr39Rulq+cTu83Yo3q4dS2E5AHrNVgNrXqamTk1i3cuWd8l/0YKiCZgmxIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056619; c=relaxed/simple;
	bh=grGSitnTH19S2NYEdjGEX2ayjTDvLYWHek1SY6iYyhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=irZ7gfaD2V58ntp6ZMwdNnSdZp4hxluryR/EbZ9PTUc2OCxRolSzVMNNx5Vow2waJGtXKXth3V3oyoMKJDjZ1PCdE0dh7EQCdGS8mwIRkhW4/qKq3OFD5C+3HT6IpoLIQu7rQOOMBSByUZwahbSCtJ+G0BtA4LoZj8imBkzrvr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DF2F1758;
	Wed,  4 Jun 2025 10:03:17 -0700 (PDT)
Received: from [10.57.26.187] (unknown [10.57.26.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 358D43F59E;
	Wed,  4 Jun 2025 10:03:30 -0700 (PDT)
Message-ID: <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
Date: Wed, 4 Jun 2025 18:03:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Daniel Stone <daniel@fooishbar.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
 <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-04 5:18 pm, Daniel Stone wrote:
> Hi Tomeu,
> I have some bad news ...
> 
> On Wed, 4 Jun 2025 at 08:57, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
>> +int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file)
>> +{
>> +       [...]
>> +
>> +       /* This will map the pages to the IOMMU linked to core 0 */
>> +       sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
>> +       if (IS_ERR(sgt)) {
>> +               ret = PTR_ERR(sgt);
>> +               goto err;
>> +       }
>> +
>> +       /* Map the pages to the IOMMUs linked to the other cores, so all cores can access this BO */
> 
> So, uh, this is not great.
> 
> We only have a single IOMMU context (well, one per core, but one
> effective VMA) for the whole device. Every BO that gets created, gets
> mapped into the IOMMU until it's been destroyed. Given that there is
> no client isolation and no CS validation, that means that every client
> has RW access to every BO created by any other client, for the
> lifetime of that BO.
> 
> I really don't think that this is tractable, given that anyone with
> access to the device can exfiltrate anything that anyone else has
> provided to the device.
> 
> I also don't think that CS validation is tractable tbh.
> 
> So I guess that leaves us with the third option: enforcing context
> separation within the kernel driver.
> 
> The least preferable option I can think of is that rkt sets up and
> tears down MMU mappings for each job, according to the BO list
> provided for it. This seems like way too much overhead - especially
> with RK IOMMU ops having been slow enough within DRM that we expended
> a lot of effort in Weston doing caching of DRM BOs to avoid doing this
> unless completely necessary. It also seems risky wrt allocating memory
> in drm_sched paths to ensure forward progress.
> 
> Slightly more preferable than this would be that rkt kept a
> per-context list of BOs and their VA mappings, and when switching
> between different contexts, would tear down all MMU mappings from the
> old context and set up mappings from the new. But this has the same
> issues with drm_sched.
> 
> The most preferable option from where I sit is that we could have an
> explicit notion of driver-managed IOMMU contexts, such that rkt could
> prepare the IOMMU for each context, and then switching contexts at
> job-run time would be a matter of changing the root DTE pointer and
> issuing a flush. But I don't see that anywhere in the user-facing
> IOMMU API, and I'm sure Robin (CCed) will be along shortly to explain
> why it's not possible ...

On the contrary, it's called iommu_attach_group() :)

In fact this is precisely the usage model I would suggest for this sort 
of thing, and IIRC I had a similar conversation with the Ethos driver 
folks a few years back. Running your own IOMMU domain is no biggie, see 
several other DRM drivers (including rockchip). As long as you have a 
separate struct device per NPU core then indeed it should be perfectly 
straightforward to maintain distinct IOMMU domains per job, and 
attach/detach them as part of scheduling the jobs on and off the cores. 
Looks like rockchip-iommu supports cross-instance attach, so if 
necessary you should already be OK to have multiple cores working on the 
same job at once, without needing extra work at the IOMMU end.

> Either way, I wonder if we have fully per-context mappings, userspace
> should not manage IOVAs in the VM_BIND style common to newer drivers,
> rather than relying on the kernel to do VA allocation and inform
> userspace of them?

Indeed if you're using the IOMMU API directly then you need to do your 
own address space management either way, so matching bits of process VA 
space is pretty simple to put on the table.

Thanks,
Robin.

> 
> I'm really sorry this has come so late in the game.
> 
> Cheers,
> Daniel

