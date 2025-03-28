Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCDC2BB15;
	Fri, 28 Mar 2025 06:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743144198; cv=none; b=kPWcgL9w8SXnko9EmWT3Y090LEwyFGtcl5WqPUimPQd7DyYyZPyjguFF83ic+Y1/YRgbCG/hm7Ob3/YP9BapmZoHCWjJfUP6aDp/VAjnqJetGsDSehrOgw51aiAPcNgT2jqnBFEw9Wy1/4oJURuvLXCLYzcRZpqt11FdYBtPCpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743144198; c=relaxed/simple;
	bh=sW9Z6OZWxlb8Tr4PWiKgWhR6Im7LwKrmpFFiU5O7mrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyrSmcINHBIuWuuaoISYfw/Yk88OPAun8BnB3S+8/5cbHXHtvfs0VnKAVe3vcCpca3dRquUoIFDTtZJrk44IXjqZ+GOWz3MbuqYdeHdEQtVf8a60NFFu2qtPJPkknPGX2Zj2EmzLX5NKC1twdW15nGKEfCziQh7muHGMAdTR4y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=eD1DXvbh; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="eD1DXvbh"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743144185; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=LAfwwJ8ID1JQ9E/p+C141um9qOFdFF7c3OGPGrGp4so=;
	b=eD1DXvbht7SRg2tn1N+OWu8iIliV0qcmqou8hsU8yGEgDFCxCsTujSEFSzaIOawjXafA6ubRW4xCRH+lH3T3HsOs/CqlmS+2n9/xWYkz8Fo2vkKnLjwxpQDYwSMNgZ/yKsG78FIttwlPlmrglm4wCteK/85wQYPPnMR8bBunXv8=
Received: from 30.74.129.60(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WTDVgmD_1743144184 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 28 Mar 2025 14:43:04 +0800
Message-ID: <7e5c7a5e-8853-4a9d-983d-b51cb416e078@linux.alibaba.com>
Date: Fri, 28 Mar 2025 14:43:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2023-53027: erofs: fix kvcalloc() misuse with __GFP_NOFAIL
To: cve@kernel.org, linux-kernel@vger.kernel.org,
 linux-cve-announce@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <2025032719-CVE-2023-53027-dc56@gregkh>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <2025032719-CVE-2023-53027-dc56@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2025/3/28 00:44, Greg Kroah-Hartman wrote:
> Description
> ===========
> 
> In the Linux kernel, the following vulnerability has been resolved:
> 
> erofs: fix kvcalloc() misuse with __GFP_NOFAIL
> 
> As reported by syzbot [1], kvcalloc() cannot work with  __GFP_NOFAIL.
> Let's use kcalloc() instead.
> 
> [1] https://lore.kernel.org/r/0000000000007796bd05f1852ec2@google.com
> 
> The Linux kernel CVE team has assigned CVE-2023-53027 to this issue.

I think this CVE is invalid since it was then reverted by
upstream commit 647dd2c3f0e1 ("erofs: Revert "erofs: fix kvcalloc()
misuse with __GFP_NOFAIL"")

since it's not the correct way to fix this.

The original issue was fixed by
commit e9c3cda4d86e ("mm, vmalloc: fix high order __GFP_NOFAIL
allocations") instead.

Thanks,
Gao Xiang
