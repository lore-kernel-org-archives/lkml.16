Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF1A1DDC15
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919774; cv=none; b=nhs86q6BDQaPXGrp3j99CkRFW3pGmvGp2Yzazh6GkMnxhFMG4EQi6aLlbavXs/LjqfyzSVv4AH7lTc5cdshWprlvVPu8ihLyQXSLqRMPCG3aVESb4+x5VKUmeEkM7hxnz1GI8Bn86vO35mSFL4mA6FtSdp46ILQGUcLQvs8zllk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919774; c=relaxed/simple;
	bh=Pyz6/2fTEswonMd+jTdpRhAsfShyLjN4zXiQIIw3oEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UrvrggzHyAVosgBX/ipSMWAd4K3Pp7nSmjtpq61YgM0JN9tR0ILdkfEuC0LdQQEeHcQB2seGyKPwhmoUeqd2j7RuBic2mDX7e/lhvi0TDHARE4GffuU1cgf6fxR/JSXC8FRNrCAr58jXkxmItdl7KNtO+3WyWfaVruG4YPbBdFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=e8hAOVxC; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="e8hAOVxC"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738919768; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Grg7rJZW3zRg1SggkVh93MgmqC7Kjg7hdIXpPILem1Q=;
	b=e8hAOVxCPOnHDytuhdvgoGoNXUNamo6buD24tWmq347damZgecpgbNYU5S7BUaM5mbPLM4A+W68FXUb03Px3dF5wijvGEAMQVumyU87Zk/zqIHNtkPKH25evXo9eeOXea7kdpOGIl19TnZ0YSlbXBh6/aJFYIreIjlK0mpSIJYs=
Received: from 30.221.129.238(mailfrom:hongzhen@linux.alibaba.com fp:SMTPD_---0WOyzElj_1738919767 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:16:07 +0800
Message-ID: <7e214f7e-1da8-468a-900d-4d9ee726348b@linux.alibaba.com>
Date: Fri, 7 Feb 2025 17:16:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] erofs: use Z_EROFS_LCLUSTER_TYPE_MAX to simplify
 switches
To: Gao Xiang <hsiangkao@linux.alibaba.com>, linux-erofs@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20250207085056.2502010-1-hongzhen@linux.alibaba.com>
 <29c5e464-4a11-42f4-b303-279c4b642471@linux.alibaba.com>
From: Hongzhen Luo <hongzhen@linux.alibaba.com>
In-Reply-To: <29c5e464-4a11-42f4-b303-279c4b642471@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2025/2/7 17:14, Gao Xiang wrote:
>
>
> On 2025/2/7 16:50, Hongzhen Luo wrote:
>> There's no need to enumerate each type. No logic changes.
>>
>> Signed-off-by: Hongzhen Luo <hongzhen@linux.alibaba.com>
>> ---> v3: Code cleanup, remove logically inequivalent changes.
>> v2: 
>> https://lore.kernel.org/all/20250207080829.2405528-1-hongzhen@linux.alibaba.com/
>> v1: 
>> https://lore.kernel.org/all/20250207064135.2249529-1-hongzhen@linux.alibaba.com/
>> ---
>>   fs/erofs/zmap.c | 60 +++++++++++++++++++------------------------------
>>   1 file changed, 23 insertions(+), 37 deletions(-)
>>
>> diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
>> index 689437e99a5a..7dba1573498b 100644
>> --- a/fs/erofs/zmap.c
>> +++ b/fs/erofs/zmap.c
>> @@ -265,23 +265,20 @@ static int z_erofs_extent_lookback(struct 
>> z_erofs_maprecorder *m,
>>           if (err)
>>               return err;
>>   -        switch (m->type) {
>> -        case Z_EROFS_LCLUSTER_TYPE_NONHEAD:
>> +        if (m->type >= Z_EROFS_LCLUSTER_TYPE_MAX) {
>> +            erofs_err(sb, "unknown type %u @ lcn %lu of nid %llu",
>> +                  m->type, lcn, vi->nid);
>> +            DBG_BUGON(1);
>> +            return -EOPNOTSUPP;
>> +        } else if (m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD) {
>>               lookback_distance = m->delta[0];
>>               if (!lookback_distance)
>>                   goto err_bogus;'
>
> Maybe just kill `goto err_bogus;` too, like:
>                         if (!lookback_distance) {
>                                 erofs_err(sb, "bogus lookback distance 
> %u @ lcn %lu of nid %llu",
>                                           lookback_distance, m->lcn, 
> vi->nid);
>                                 DBG_BUGON(1);
>                                 return -EFSCORRUPTED;
>                         }
>
> Otherwise it looks good to me.
>
> Thanks,
> Gao Xiang

Sure, I will send an updated version later.

Thanks,

Hongzhen

