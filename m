Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A6219ED
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750727892; cv=none; b=qhvYOa55hv1YFIaR3QkvUou+dYht03NHMVmOK8BHgvW3ybI9Fvgcb5vlJwF3dEEkLXF+pqueu/yuEiMj4YFApqYcmliMv8tiHl4pbzDNXg0Se2jbTpD6gtsWo9QvCtx0wKDplY4XO+GcVUyZ9SMc/8B7MaIiz/eEFZ0pJw5wZdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750727892; c=relaxed/simple;
	bh=RFfgKbLxGNvHC/F6vk19XkSLA8cVar3l3pgRu2bP4gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=mpJ6q4D1/lBoVmsmw/0KSxSCdEM1W7hF6yJRiC+Mya8GgnPcAZWxaDVkIZmzKy9TypeOCAeVtgqs51OpZNRFrs7fnuDJEMiUzS4p7BQwm94syTuUNViZU9fUCn4pAYodVlHvDDBw3m0EZapEM+PuV3nW/e4SurkaYgZ3Z+55OWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55O1Hj5G053897;
	Tue, 24 Jun 2025 10:17:45 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55O1Hj5h053893
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 24 Jun 2025 10:17:45 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <8b29764b-3a5d-4a5b-8910-5d33f17bdae6@I-love.SAKURA.ne.jp>
Date: Tue, 24 Jun 2025 10:17:45 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: embed actual values into ocfs2_sysfile_lock_key
 names
To: Heming Zhao <heming.zhao@suse.com>
References: <29348724-639c-443d-bbce-65c3a0a13a38@I-love.SAKURA.ne.jp>
 <8f689011-4f35-41a1-a4cb-b81c833533f7@suse.com>
Content-Language: en-US
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
        Joseph Qi <joseph.qi@linux.alibaba.com>, ocfs2-devel@lists.linux.dev,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <8f689011-4f35-41a1-a4cb-b81c833533f7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav405.rs.sakura.ne.jp

On 2025/06/24 9:38, Heming Zhao wrote:
> Hello,
> 
> Just from your code logic, the switch is unnecessary, and converting
> the input parameter into an "unsigned int" type is sufficient.
> 
> e.g.: (not test)
> 
> unsigned int type = args->fi_sysfile_type;
> 
> if (args->fi_sysfile_type != 0)
>         lockdep_set_class(&inode->i_rwsem,
>                 &ocfs2_sysfile_lock_key[type]);

Excuse me, but you missed the point.
Your approach results in showing "type" instead of "args->fi_sysfile_type".

    &ocfs2_sysfile_lock_key[type] --> jbd2_handle --> &oi->ip_xattr_sem

The point of this change is to show the actual value instead of variable name.

>> Before:
>>
>>      &ocfs2_sysfile_lock_key[args->fi_sysfile_type] --> jbd2_handle --> &oi->ip_xattr_sem
>>
>> After:
>>
>>      &ocfs2_sysfile_lock_key[EXTENT_ALLOC_SYSTEM_INODE] --> jbd2_handle --> &oi->ip_xattr_sem
>>



