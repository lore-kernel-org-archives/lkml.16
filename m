Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD04233D8F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919459; cv=none; b=GoUnaEraq72QO6uAfLsfhxvZDu63efF7W+Jec2ig2bwW2zZrJVWdvKzPj/c64Tk1ZafNY/IGetbhTsNf/YYa2C+Qro5Izm76hhrRt3gsxo6JCnUIbL3baitYfSaimdre9TeAHluayOFhk+xOEct/mr2GMrkdXfG5fAk56fqvwnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919459; c=relaxed/simple;
	bh=niKEt6aGkeC/jZety5nFoVelutzsUCnL2nFPw+sdJDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JF857axXNK/YuSHbR8Tzx1Q6rBQyTaiEOUxcLT4V9jtJd+f5IWfZe20MBI0NoTZzlmRoZfNa/EjDQbwC91fKr3lssg92QPYe6plk/bdY2fZ9uT6u38ic9nmL6yB0bNCoi2rfHpkwAmbKvxUBIWyIeFYaCVR/upg3EEFXE/dJwoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=OzRoIq2O; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="OzRoIq2O"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738919453; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=srTohFrkLUWkNmQn0i+d/kVtXnoicbZijIYddqpXBbA=;
	b=OzRoIq2OMJVFwsrDsxQiTVk+aAYbiF1tpq+6TfoKUvY5ZGsQC0plfNx2QP6hy8KFuDWz742oTYRybGnajkAZvuWbfUufR7fmz6LvgP3BBmbuEgGBph2vW+KLjYph1qTx65IUO7gpmphAeMcBSjNbpl/e/lq3bvOKn12MFkERn08=
Received: from 30.74.129.145(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WOyyqss_1738919452 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:10:52 +0800
Message-ID: <c1a59a9b-2fc1-426e-99e0-26380fcbb4de@linux.alibaba.com>
Date: Fri, 7 Feb 2025 17:10:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] erofs: use Z_EROFS_LCLUSTER_TYPE_MAX to simplify
 switches
To: Hongbo Li <lihongbo22@huawei.com>,
 Hongzhen Luo <hongzhen@linux.alibaba.com>, linux-erofs@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20250207080829.2405528-1-hongzhen@linux.alibaba.com>
 <f4319592-df8f-4468-b8fb-7fcbc51804c6@linux.alibaba.com>
 <10e648ae-7e0b-4560-a73d-b728efbc9e15@huawei.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <10e648ae-7e0b-4560-a73d-b728efbc9e15@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hongbo,

On 2025/2/7 16:57, Hongbo Li via Linux-erofs wrote:
> 

...

>>> @@ -329,35 +328,31 @@ static int z_erofs_get_extent_compressedlen(struct z_erofs_maprecorder *m,
>>>       DBG_BUGON(lcn == initial_lcn &&
>>>             m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD);
>>> -    switch (m->type) {
>>> -    case Z_EROFS_LCLUSTER_TYPE_PLAIN:
>>> -    case Z_EROFS_LCLUSTER_TYPE_HEAD1:
>>> -    case Z_EROFS_LCLUSTER_TYPE_HEAD2:
>>> +    if (m->type >= Z_EROFS_LCLUSTER_TYPE_MAX) {
>>> +        erofs_err(sb, "cannot found CBLKCNT @ lcn %lu of nid %llu", lcn, vi->nid);
>>> +        DBG_BUGON(1);
>>> +        return -EFSCORRUPTED;
>>> +    }
>>
>> No, I don't think it's equivalent, please use
>> the previous version for this part instead.
> 
> I think this version doesn't consider the fallthrough case. May be just use the goto statement can keep equivalent.

For this particular part, I tend to use the first
version since it's already simple enough anyway.

Thanks,
Gao Xiang

> 
> Thanks,
> Hongbo
> 
>>
>> Thanks,
>> Gao Xiang

