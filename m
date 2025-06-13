Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA0C1DB346
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749794922; cv=none; b=ED64ZI3jcD6PqZfpSJjhylUoBiH5FT0nHcH7eNitA7L2eq+BVbvoviClEbNUT1ebOJf7XzSAiHX9XjgP5RgK+9H1yNpQbumY0z2q/jZbUXpHC6q5hgAOSP77lTba4f/t0jmexqOFBykvydRpVHMuQGDF5u0ULkg+zP0jhA9U0pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749794922; c=relaxed/simple;
	bh=iykDZfXZ8iabXE3eY+UFFOO/NgLs6BThg7X2/plrLX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzDnQjXy0l2Kvvl+EKqpQC7ufjXrGmZ9zI1osTm7o/PDbD/iki/SHrR/Myp/CNKkkC2RZN1DkEdpG0pJGSfYe2uk11cfr/B9ELmCl6w+1gLwlIERI/roMgXnICZOsyq4ni+e0l5PAKvUMcihQ6/EZ5InD7cd09ctOZqYpm4CLaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JRDPdO9b; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="JRDPdO9b"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749794914; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=U6N77Rg/y/+7iThJTzrXEJ/3VtfKAqzvXRg1gw+dPLk=;
	b=JRDPdO9bC/kPDQdc9NcdPS0YcO4IheKnJiTrYSsrXn1GUX3ChhiJXuudUoY/vGUzKFHPsDS3Leq3oV//4HNB5dDdi9iB6LQJVLtEUDsE8Z5vP2gwU20ABifpBw3/52XobUrsYg/Poy4q4WzrTs2OSbCoVWIEzvZuq7tPjaqW78M=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WdjN4EO_1749794913 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Jun 2025 14:08:33 +0800
Message-ID: <0baf3fa2-ed77-4748-b5ee-286ce798c959@linux.alibaba.com>
Date: Fri, 13 Jun 2025 14:08:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unused trace event in erofs
To: Steven Rostedt <rostedt@goodmis.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-erofs@lists.ozlabs.org
Cc: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
References: <20250612224906.15000244@batman.local.home>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250612224906.15000244@batman.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Steven,

On 2025/6/13 10:49, Steven Rostedt wrote:
> I have code that will trigger a warning if a trace event is defined but
> not used[1]. It gives a list of unused events. Here's what I have for
> erofs:
> 
> warning: tracepoint 'erofs_destroy_inode' is unused.

I'm fine to remove it, also I wonder if it's possible to disable
erofs tracepoints (rather than disable all tracepoints) in some
embedded use cases because erofs tracepoints might not be useful for
them and it can save memory (and .ko size) as you said below.

> 
> Each trace event can take up to around 5K in memory regardless if they
> are used or not. Soon there will be warnings when they are defined but
> not used. Please remove any unused trace event or at least hide it
> under an #ifdef if they are used within configs. I'm planning on adding
> these warning in the next merge window.

If you don't have some interest to submit a removal patch, I will post
a patch later.

Thanks,
Gao Xiang

> 
> Thanks,
> 
> -- Steve
> 
> [1] https://lore.kernel.org/linux-trace-kernel/20250612235827.011358765@goodmis.org/

