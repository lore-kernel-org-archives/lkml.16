Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3AD253923
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310703; cv=none; b=cZBAeNlsNZANJFbB9ND2Hj6wNP6bZc6zhMo1MFH0eMMpdSnkLr6JjwyH6+suuGzDwVl6L6LlRMAq2VsjpA99hRfoIUj+O6siVmN+WIA6PpzgwIYV2r0z1KZy7fx7fY8Da0i3YkIEdul/tMtsEC1vtjdyrzaXoNd46qujrCePXzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310703; c=relaxed/simple;
	bh=Nkyee3R9G4pTa9zOBSPFpwFne9Xd6LTkmNOrdy04vBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XpJ27kMLlisbd6pJyAbs0ZeQ5lOq9j8gmZNwu2g1+uFQBNYEL8L0TLYClk0FvI61JC6JMfJPbpZ2RXxyRQTXvRCdeEfAojqdWjXYAxc/oKcrDqX7Y91B1u+HpNAYnqw61op3Gu1IeOqaA6dD9zdABmsIAlhFRH/PNZnCh7ppxAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZypmF4CZ4z4f3kvt
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:04:29 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id DA0D71A018D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:04:55 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP1 (Coremail) with SMTP id cCh0CgBH+Xlm2CVoBMQkMQ--.56407S2;
	Thu, 15 May 2025 20:04:55 +0800 (CST)
Message-ID: <d8e88314-c31f-4132-a4b0-aad7eeb0f082@huaweicloud.com>
Date: Thu, 15 May 2025 20:04:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC next v2 0/5] ucount: add rlimit cache for ucount
To: Christian Brauner <brauner@kernel.org>
Cc: akpm@linux-foundation.org, paulmck@kernel.org, bigeasy@linutronix.de,
 legion@kernel.org, roman.gushchin@linux.dev, tglx@linutronix.de,
 frederic@kernel.org, peterz@infradead.org, oleg@redhat.com,
 joel.granados@kernel.org, viro@zeniv.linux.org.uk,
 lorenzo.stoakes@oracle.com, avagin@google.com, mengensun@tencent.com,
 linux@weissschuh.net, jlayton@kernel.org, ruanjinjie@huawei.com,
 kees@kernel.org, linux-kernel@vger.kernel.org, lujialin4@huawei.com
References: <20250509072054.148257-1-chenridong@huaweicloud.com>
 <20250515-server-reformieren-b2fd91846538@brauner>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20250515-server-reformieren-b2fd91846538@brauner>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:cCh0CgBH+Xlm2CVoBMQkMQ--.56407S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYV7kC6x804xWl14x267AKxVW5JVWrJwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kI
	c2xKxwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVW8ZVWrXwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x07UZ18PUUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/



On 2025/5/15 18:29, Christian Brauner wrote:
> Woah, I don't think we want to go down that route. That sounds so overly
> complex. We should only do that if we absolutely have to. If we can get
> away with the percpu counter and some optimizations we might be better
> off in the long run.

Thank you for your reply, I will send the next version with percpu_counter.

Thanks,
Ridong

