Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE811494C3
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265106; cv=none; b=q+WNKx8swdf+xeKSRkeBw9C8BuaXz4brw952OlqE1bHE3+30QBzT3upFeh+mwUTA7nIP1ChmylzaJUUE8genMaXfG/5xk+KccNLukOCKDPBFPBADZxsfWURwKD4P8s8PFFo2EQlsWxoZtqOq7BYV/LTOmr0RH4Kuqzet9HBvIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265106; c=relaxed/simple;
	bh=JYy7ON7O/QJLCgtITPuxfqXIimQ2jdDmxVosMHq1YYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ne/T3Q+d/L8mYF963oiaj7y+PYjVf8ZR9LUvJn6XEbYd7JBEN1KUHOJGkuea/PEbTjet5TI3n4QgxFOiNcmVvG5yWSi5BqsVmxxL4lzNdV71H88NlCwV0HJeuZhPyIFJTxCEMnCdLKKE8vuBJcSLAL6ScgRoIsOh0CQy2X/u/yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=GeMcTvwF; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="GeMcTvwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Kr+2RL/GNrpnH2vhTYcxiG/htKwMI387OrqzmGQpfCU=;
	b=GeMcTvwFDQdDm96kcAh2yMDmQNrDxFe4j765Y0kD8trcXH+SIC2Zogr2qb4lWF
	27aTHusLx7f6NAlCXjXTfLJBoxU3cnSEcTy5pveRF2vJYVscCZa/erSrMtKxd1rO
	VHx5+hsr14ZfhHoKnRrON4vb0egqkMfSv/6tRe3cW8Qcg=
Received: from [172.19.20.199] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3l7djaDRo0v7dAg--.62686S2;
	Mon, 26 May 2025 21:11:00 +0800 (CST)
Message-ID: <0da96120-8448-4ee9-ab45-502c292199fd@126.com>
Date: Mon, 26 May 2025 21:10:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: remove redundant folio_test_hugetlb
To: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
 baolin.wang@linux.alibaba.com, muchun.song@linux.dev, liuzixing@hygon.cn
References: <1747987559-23082-1-git-send-email-yangge1116@126.com>
 <427043ca-ae91-4386-8ffd-aaf164773226@redhat.com>
 <347b3035-26fe-43af-8df4-b1610d305908@redhat.com>
 <aDRnE8B27VgCoJ3N@localhost.localdomain>
 <d5d19df8-c774-4c78-82ca-e0839ed0e539@redhat.com>
From: Ge Yang <yangge1116@126.com>
In-Reply-To: <d5d19df8-c774-4c78-82ca-e0839ed0e539@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3l7djaDRo0v7dAg--.62686S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwNVyUUUUU
X-CM-SenderInfo: 51dqwwjhrrila6rslhhfrp/1tbiigFZG2g0ZJdhqgAAst



在 2025/5/26 21:06, David Hildenbrand 写道:
> On 26.05.25 15:05, Oscar Salvador wrote:
>> On Mon, May 26, 2025 at 02:23:58PM +0200, David Hildenbrand wrote:
>>> Already in 6.15, gah.
>>>
>>> Please convert that code to never ever take any hugeglb locks unless 
>>> we are
>>> clearly dealing with a hugetlb folios.
>>
>> I guess we could just do?
> 
> Yes, anything that involves hugetlb only id there is an indication 
> of ... hugetlb :)
> 

Okay, thanks. I'll adjust the patch again.

