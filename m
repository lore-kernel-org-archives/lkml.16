Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524A038B
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 04:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750480064; cv=none; b=rKypcY/mHuYOx0GzDjC7Z0o13isQkDriK5bOwlHUuDHqwct+g3aAQzexkLq0HxFPU1ZeL2PuMgOMHuvqoEuSKQEw99hKV/QyVjsXWjV+io9ofvNkBBKdW1Ca5NKM//E/LCFmQExsLiXncWDXrGclMqawd16F2NmwxK50luuxUu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750480064; c=relaxed/simple;
	bh=R/wf7cVKEPVwzsUdWQxfUoM2xu02XWF/WQ7C2naXGd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBOLU+ynHeG5dZRBlJN+Z571m98JntJaHRhi0qVc9jH6clMZuQY43lh1r3AIhlPf1CX27whn1uKx2SUUA8NdzA8uJHgO6hjeqUXvLAG1JjmqilF+2lhJ9u8YDz3J+qTLE5yNU3AR/zoF00L/0RbgLPFysSGSFIseNCOKMXOkzXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=aI8eit9P; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="aI8eit9P"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750480054; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=B0gYkZDG3902TE6IDALp4GeQ2/n8W9XRX9u/h5JaMIo=;
	b=aI8eit9P4F9ONCTaQEW6TElOESnroSXte0tvU5kh+fZBvrex965ImlPrFBcfzGyiyNHWhWA4Fp8jOXDwSiYLF6bVShO+t6j2F9ZN1t3YmsWkitZBWURTfZKOQdS5cOsLfe//JA6hScW+EwDoie71UzuYU0ZwTTP4965FdkCG9b8=
Received: from 30.32.92.233(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeMrdqU_1750480051 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 21 Jun 2025 12:27:32 +0800
Message-ID: <e47a7541-7b95-453a-9512-96343486b0ec@linux.alibaba.com>
Date: Sat, 21 Jun 2025 12:27:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] mm/shmem, swap: avoid redundant Xarray lookup
 during swapin
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250619175538.15799-1-ryncsn@gmail.com>
 <20250619175538.15799-3-ryncsn@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250619175538.15799-3-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/20 01:55, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Currently shmem calls xa_get_order to get the swap radix entry order,
> requiring a full tree walk. This can be easily combined with the swap
> entry value checking (shmem_confirm_swap) to avoid the duplicated
> lookup, which should improve the performance.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Reviewed-by: Kemeng Shi <shikemeng@huaweicloud.com>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
