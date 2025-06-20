Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3EB17597
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750381867; cv=none; b=uxHds8eyWiNNYOMmh3z5spkhY8u/Ggi0xYc144GOUF7nOWQUn25F0OiaFPqhxt+cBX0aSfC/oS960jkMjnexnAvz8FqfEUcKzN56Vh0pOQtrVL3iplS5QSLFmN56jnrx0W/Dq5gckKW5zAAKaLdyc0PXpvVi/OjpAKd4sOMrgQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750381867; c=relaxed/simple;
	bh=m3erZLrXR9+7T+GcEAqmDT32hregWLEqYWkFpxUqFmE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=gOBeG+pG+1lPC3WkU3Ka0O9s5o9PuGZcNPEfZzH+sqNtqLWm/+B+jSfngSmrH/uBNYJ2Cj87C+1eD2Din+A6GKDeBsH0VYRMZbtZaTx3IPrGsKLNPMWlcZJP8sMUpVTEiPZOOKP3EnrCaFgLfLDQxdnnnaKVshnyKiWd5U5ZgVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bNfYg2FZMzYQvT1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:11:03 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 41CF51A0B51
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:11:02 +0800 (CST)
Received: from [10.174.179.143] (unknown [10.174.179.143])
	by APP4 (Coremail) with SMTP id gCh0CgC3Gl8ktVRod9E6QA--.64470S3;
	Fri, 20 Jun 2025 09:11:02 +0800 (CST)
Subject: Re: [PATCH v2] lib/group_cpus: fix NULL pointer dereference from
 group_cpus_evenly()
To: John Garry <john.g.garry@oracle.com>, Yu Kuai <yukuai1@huaweicloud.com>,
 tglx@linutronix.de, akpm@linux-foundation.org, ming.lei@redhat.com,
 axboe@kernel.dk
Cc: linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 johnny.chenyi@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20250619132655.3318883-1-yukuai1@huaweicloud.com>
 <9024faaf-d4e3-4699-8b7c-df6650bd6f3b@oracle.com>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <d03be22a-ff9f-cc1e-7739-7c455c6d9345@huaweicloud.com>
Date: Fri, 20 Jun 2025 09:10:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <9024faaf-d4e3-4699-8b7c-df6650bd6f3b@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgC3Gl8ktVRod9E6QA--.64470S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYK7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87
	Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4II
	rI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr4
	1l4c8EcI0Ec7CjxVAaw2AFwI0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
	oOJ5UUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

Hi,

在 2025/06/19 22:08, John Garry 写道:
> There's a non-SMP version of group_cpus_evenly() at the bottom of 
> lib/group_cpus.c
> 
> It also does a kcalloc(numgrps, ...)
> 
> Does that need to be fixed as well?

Yes, you're right. Just run the test with SMP disabled, and the problem
can be reporduced as well.

Thanks,
Kuai

