Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E548E8472
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743389064; cv=none; b=tX6ftM9Luc5puBDT8IXb2HNQ7iFEzNSiXaixtN9sRZ+uxVTICd/qZSdOF5gREb1AicNMIdxhW95emFfCoXy4ZYQHyEYeAEQWKEfMWr/EzR9gjLWEVwd1TVFoBjW85ORO4vGo0D29784jaf4AYQUAfIZPys7lj9rwfhPgn2EYdBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743389064; c=relaxed/simple;
	bh=Wo2l9bPFL5cvlg+hbb4bp7o3WTMmJUfDXSaxf1bc2CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YzSaWTWNrxLZ080dSqKPwSwFlDJ+mj5D2+Zo9n5rJYI5awQc7rsciKYrcV5cjveVK9RFHbkti2+wnOckxV4Lq3lA6jKqbm2CJ0+LyS1HCQbGOzJyCLvKn4HQuLv/gPFzqzDWJ8LktgeDmy8v6qfecz3TZ6wILX7bbAinPx2FsvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ijmFDa+Q; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ijmFDa+Q"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743389057; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=RnoDTRNko+9S1JNn2nnbKX17T9hcYVNFQ8u9P9wIuhc=;
	b=ijmFDa+QlOZ4Zzq8m8eyyMi0jc74E9sAI2Ru4iu0IMkvfxP9pA5ySmj8j9JCWL60/7p8DYGEOS+PmXTkFSF0v5OFHUsDZGeZ4cTa4qB87k1U05W/kvHsHpfz1uzpx3jCTCunj/rJNVtI/vywkfSE50WrU7kyTpQQfTw1pIaXi+I=
Received: from 30.221.130.198(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WTOphfz_1743389056 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Mar 2025 10:44:16 +0800
Message-ID: <27fcadc5-38c5-4850-8b02-73ecde092d43@linux.alibaba.com>
Date: Mon, 31 Mar 2025 10:44:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] erofs: set error to bio if file-backed IO fails
To: Sheng Yong <shengyong2021@gmail.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
 linux-erofs@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, wangshuai12@xiaomi.com,
 Sheng Yong <shengyong1@xiaomi.com>
References: <20250331022938.4090283-1-shengyong1@xiaomi.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250331022938.4090283-1-shengyong1@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/3/31 10:29, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> If a file-backed IO fails before submitting the bio to the lower
> filesystem, an error is returned, but the bio->bi_status is not
> marked as an error. However, the error information should be passed
> to the end_io handler. Otherwise, the IO request will be treated as
> successful.
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang
