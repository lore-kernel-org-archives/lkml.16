Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1CB6136
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750730296; cv=none; b=SVchHGtDFiO7QAFcVIADVc/cMfMHO8MErGmSE14yRSNGiXYmIT81127Sg+d7/VTDVWyucc/l0S1Qyq2fOxoNd6yVoJwlbEjGnasuXBuKNl3jpN8SeOpjEAKtAma4/2crpdZKUysZMQrALjX69Uak0fSwj2Fg5IgO3p2datDicvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750730296; c=relaxed/simple;
	bh=W1eaSg9I+IApGvpvO5/LXMoWc7fWkAmnBW6MCY8x364=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8yVpr4glv3F4jMAmAng/WRvCXPzB2CUWXfs5kcQJXUwm6KczY0I5zTNssi7nrvganrRMNhRI8yGp6kwG2J6Eh/m+QpMmlceSILoJP8mlOU6fBPZ3h6C4rFcJ7d/bKCqQ5nfb/43MQT9VvSPyP092PmnRsZi4KR1qLspe8eL5II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=O9P69FIy; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="O9P69FIy"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750730290; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=T27/M4wzXCLDiYMhAl2wIjm6tRdKmCJ7H5IblxeRduM=;
	b=O9P69FIydRzJbMV7FqHxxOZ14u5yagRC9mhUIkmB+Fd6aqGuVS7vVm4/BPmxjcYxNzbsf13Qa4+65YdpcdDFFjwuAXm8QIloS3nzpP1BNoPnxbL6GdV6kez2Uuhl9xiUukyu4cw6uZfogMYLfOKwqysHVaIu7SIIEaLy3MZMgRI=
Received: from 30.74.144.102(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeeA-ii_1750729970 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 09:52:51 +0800
Message-ID: <f3c0853d-0b26-49ef-82b2-df1f5163dd4b@linux.alibaba.com>
Date: Tue, 24 Jun 2025 09:52:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mm: shmem: disallow hugepages if the system-wide
 shmem THP sysfs settings are disabled
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <52bc87c7dbd362d4d2b7780e66c1536fe99454a0.1750666536.git.baolin.wang@linux.alibaba.com>
 <924f82b1-0eb7-47e0-b7d4-5dd314df18a0@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <924f82b1-0eb7-47e0-b7d4-5dd314df18a0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/23 21:59, David Hildenbrand wrote:
> On 23.06.25 10:28, Baolin Wang wrote:
>> When invoking thp_vma_allowable_orders(), if the TVA_ENFORCE_SYSFS 
>> flag is not
>> specified, we will ignore the THP sysfs settings. And the 
>> MADV_COLLAPSE is an
>> example of such a case.
>>
>> The MADV_COLLAPSE will ignore the system-wide shmem THP sysfs 
>> settings, which
>> means that even though we have disabled the shmem THP configuration, 
>> MADV_COLLAPSE
>> will still attempt to collapse into a shmem THP. This violates the 
>> rule we have
>> agreed upon: never means never.
>>
>> Another rule for madvise, referring to David's suggestion: “allowing 
>> for collapsing
>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>
>> To fix the MADV_COLLAPSE issue for shmem, then the current strategy 
>> should be:
>>
>> For shmem, if none of always, madvise, within_size, and inherit have 
>> enabled
>> PMD-sized THP, then MADV_COLLAPSE will be prohibited from collapsing 
>> PMD-sized THP.
> 
> I assume we could rephrase that to "For shmem, if "shmem_enabled" is set 
> to either "none" or "deny", then MADV_COLLAPSE will be prohibited from 
> collapsing."

Yes. Setting 'deny' will also prevent MADV_COLLAPSE(), and there is no 
'none' option for 'shmem_enabled'. Will update the commit mesasge to 
make it clear.
