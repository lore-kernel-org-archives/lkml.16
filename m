Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D3B211C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739156398; cv=none; b=Wj56ub48LDubbRYaGAl34zZ3xCULMMIGKfjyWcO2Z233JbD9ppnoOvyuI6fN9H3xGJ9ckHoQIhL2PUe0P1a4m0XHH1zYtEwnoTrCC7JwvgM4AYu6qHegxLdyVT9NPQMhPc6VfyIggk1gMRRA9TQ5OT2CaHBWVCnqcENT7TGx5io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739156398; c=relaxed/simple;
	bh=TpUzEJWyJ0chtO3AcQ58/6761HOIAjf5a2N5Rt/mVrA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=oH3b1Yhr2i/LvPWjNflWF5/aqN1w8uQnDEzKUNWI7SxSiwuFYNhYS5OjOhpoqwXBk/hPJTwB4GFBAR/1Inxd4+E0VTjp8HxWqxrBiL0o9B39UpoGvIh6StJomWKiUSVhZGnL/Vlj2v3iGOhENRY0gQL6JqqkKZdLnseSnk199kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=icbU7WUS; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="icbU7WUS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739156385; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=oBnfMYylPc9oTiD86UN82wcoKRob6MYiNVBrP5/R5zo=;
	b=icbU7WUSXfEPaWUwcW0LWZu6TL3cgLgeMmN6MlsPTKhlzuj09Fg58PE/0+0tQj0gHsM8vQbeBsG0uV9YmtQ4qRQF0apPBVNQMLDfsvjEeiXLfccR6iedvG2xnCn75fgRGIx/krRy5/iVI623DCmhLZGGbQRnlDVZSfdcXKNp35Y=
Received: from 30.41.15.245(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WP4ia0y_1739156379 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 10 Feb 2025 10:59:44 +0800
Message-ID: <5c55806f-56b2-4e00-8b88-ac97e5733b57@linux.alibaba.com>
Date: Mon, 10 Feb 2025 10:59:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] erofs: use Z_EROFS_LCLUSTER_TYPE_MAX to simplify
 switches
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Hongzhen Luo <hongzhen@linux.alibaba.com>, linux-erofs@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20250207085056.2502010-1-hongzhen@linux.alibaba.com>
 <29c5e464-4a11-42f4-b303-279c4b642471@linux.alibaba.com>
In-Reply-To: <29c5e464-4a11-42f4-b303-279c4b642471@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/2/7 17:14, Gao Xiang wrote:
> 
> 
> On 2025/2/7 16:50, Hongzhen Luo wrote:
>> There's no need to enumerate each type.  No logic changes.
>>
>> Signed-off-by: Hongzhen Luo <hongzhen@linux.alibaba.com>
>> ---> v3: Code cleanup, remove logically inequivalent changes.
>> v2: https://lore.kernel.org/all/20250207080829.2405528-1-hongzhen@linux.alibaba.com/
>> v1: https://lore.kernel.org/all/20250207064135.2249529-1-hongzhen@linux.alibaba.com/
>> ---
>>   fs/erofs/zmap.c | 60 +++++++++++++++++++------------------------------
>>   1 file changed, 23 insertions(+), 37 deletions(-)
>>
>> diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
>> index 689437e99a5a..7dba1573498b 100644
>> --- a/fs/erofs/zmap.c
>> +++ b/fs/erofs/zmap.c
>> @@ -265,23 +265,20 @@ static int z_erofs_extent_lookback(struct z_erofs_maprecorder *m,
>>           if (err)
>>               return err;
>> -        switch (m->type) {
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
>                          if (!lookback_distance) {
>                                  erofs_err(sb, "bogus lookback distance %u @ lcn %lu of nid %llu",
>                                            lookback_distance, m->lcn, vi->nid);
>                                  DBG_BUGON(1);
>                                  return -EFSCORRUPTED;
>                          }
> 
> Otherwise it looks good to me.

Sorry, I was wrong.  I was missing the part of the end of
function, how about the following diff?

diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
index 7dba1573498b..d278ebd60281 100644
--- a/fs/erofs/zmap.c
+++ b/fs/erofs/zmap.c
@@ -273,7 +273,7 @@ static int z_erofs_extent_lookback(struct z_erofs_maprecorder *m,
                 } else if (m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD) {
                         lookback_distance = m->delta[0];
                         if (!lookback_distance)
-                               goto err_bogus;
+                               break;
                         continue;
                 } else {
                         m->headtype = m->type;
@@ -281,7 +281,6 @@ static int z_erofs_extent_lookback(struct z_erofs_maprecorder *m,
                         return 0;
                 }
         }
-err_bogus:
         erofs_err(sb, "bogus lookback distance %u @ lcn %lu of nid %llu",
                   lookback_distance, m->lcn, vi->nid);
         DBG_BUGON(1);

Thanks,
Gao Xiang
