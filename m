Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE021D8E10
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751103864; cv=none; b=NuApqiRGg5Op8wSzk2iq/HWSR5fjWNj8YeWj5RQXk6Ibegp2GqatBRX/NmmS+s+LoTAnhDRonbSV2IEwHNucmnVKCZvRuk2vkE2Oc+dpBHYvOsMEeCRHfsL8mPWb6OPU4rz8hQDiViwKiUm4AY5ndIIGzfkCI1B8lU5TnMyh3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751103864; c=relaxed/simple;
	bh=oFypQtB6XRp2BLBILu3JgyLCrduL49t38sAwB6Q39PY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=FumPpbBbnhEASNlVjHuh+gwiT3MbAMlNoV698AFNnmojDJMqsOVrQgzN20LjZ0Yks5Az/OdCin0+Ixz6ULy5d2RqR8ToAIPYTnZm/aF7wm9/6lvQyrazomevIvY27RKa8v2yJ568dCqB3+ka91ePGQYQ3bteeXv+K/2iqxe7x+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55S9d3o2046908;
	Sat, 28 Jun 2025 18:39:03 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55S9d3Ut046902
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 28 Jun 2025 18:39:03 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <24a7fc31-c54f-4ef3-a76f-7d844a398720@I-love.SAKURA.ne.jp>
Date: Sat, 28 Jun 2025 18:39:03 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] brd: fix sleeping memory allocation in brd_insert_page()
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai3@huawei.com>,
        Christoph Hellwig <hch@lst.de>, LKML <linux-kernel@vger.kernel.org>
References: <685ec4c9.a00a0220.129264.000c.GAE@google.com>
 <11cb9a09-f66c-4c46-bd38-fc6080413c29@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <11cb9a09-f66c-4c46-bd38-fc6080413c29@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav404.rs.sakura.ne.jp

On 2025/06/28 17:36, Tetsuo Handa wrote:
> syzbot is reporting that brd_insert_page() is calling
> __xa_cmpxchg(__GFP_DIRECT_RECLAIM) with spinlock and RCU lock held.

Hmm. Holding spinlock itself is OK because xa_lock() is a requirement.

> Change __xa_cmpxchg() to use GFP_NOWAIT | __GFP_NOWARN, for it is likely
> that __xa_cmpxchg() succeeds because of preceding alloc_page().

Since this gfp flag is for allocating index array, it should use
__GFP_DIRECT_RECLAIM if possible. Then, deferring RCU lock if possible
makes sense. Then, I wonder what this RCU lock is protecting...

