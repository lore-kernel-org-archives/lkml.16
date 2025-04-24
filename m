Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089E71DDA14
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745459419; cv=none; b=XFi7Paq/R47GclRJcLr6P1KcYNn0vXmFoYtmJkzcFpAmE5GfWy8JXycTGZUFnPAOHr1Rd+iL3yLHW3afF4KhjeXGSkv6FmPUzAA1s3QFKns7gREoLsGHZBNvOLAYpdHKG0fTyjTFuW7kYI6FM31humGKg9T5avJHsa2HAFX1G9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745459419; c=relaxed/simple;
	bh=JmXm4Zk6MSSEwTYRosPuxA4NnDKVNSA1ONFH3qB3bV4=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=t7rbCSoeOQ0GknhcOYLAt0cdDTdUNgzr9c/eVFKpFUBDKMB1M2v2/ZYAOoMX1oipHntfFv/vwQgbS2qwXcd3KLr+XZEWBYqiG/oPu7d+myaY6sSU5KuCVlfEulOFkV2zUWFYthyLqRQ6lBn1hnxksZrixrgkx85TLEAyhYKwAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Zjf5W14hSznfVp;
	Thu, 24 Apr 2025 09:48:47 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 0CF831402C3;
	Thu, 24 Apr 2025 09:50:08 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Apr 2025 09:50:07 +0800
Message-ID: <50dc6bdc-ee62-41f1-b8e5-be64defb07c6@huawei.com>
Date: Thu, 24 Apr 2025 09:50:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sandeep Dhavale <dhavale@google.com>
CC: Gao Xiang <hsiangkao@linux.alibaba.com>, LKML
	<linux-kernel@vger.kernel.org>, linux-erofs mailing list
	<linux-erofs@lists.ozlabs.org>
From: Hongbo Li <lihongbo22@huawei.com>
Subject: Re: Maybe update the minextblks in wrong way?
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemo500009.china.huawei.com (7.202.194.199)

Hi Sandeep,
   The consecutive chunks will be merged if possible, but after commit 
545988a65131 ("erofs-utils: lib: Fix calculation of minextblks when 
working with sparse files"), the @minextblks will be updated into a 
smaller value even the chunks are consecutive by blobchunks.c:379. I 
think maybe the last operation that updates @minextblks is unnecessary, 
since this value would have already been adjusted earlier when handling 
discontinuous chunks. Likes:

```
--- a/lib/blobchunk.c
+++ b/lib/blobchunk.c
@@ -376,7 +376,6 @@ int erofs_blob_write_chunked_file(struct erofs_inode 
*inode, int fd,
                 *(void **)idx++ = chunk;
                 lastch = chunk;
         }
-       erofs_update_minextblks(sbi, interval_start, pos, &minextblks);
         inode->datalayout = EROFS_INODE_CHUNK_BASED;
         free(chunkdata);
         return erofs_blob_mergechunks(inode, chunkbits,

```
This way can reduces the chunk index array's size. And what about your 
opinion?

Thanks,
Hongbo
