Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53FA26982F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115576; cv=none; b=j2HsjB0esU+TAAK/TJY/h2eef3sJZDERxTH5W08cCaq4nNs+9a66XJl0us8zt0eSOAsXU3xIYtVDoA36VeofdVcmJxqZA82ygFXd1SQuWsniMbEIqBuoEuctmYDgjQCfQ3Ylx/FuIJV5aWVZSLxuEPuFtHE7np7ZbAIPEbF4RQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115576; c=relaxed/simple;
	bh=NxjV2ImRRaMdAhCvQPYLGALNhw1hrut15dfM6ycp8jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwXJ6KOHCKGaIV7nRfrgvefi0mx9eyP0scKvNAKDCtUcpa+LNZ53dah1IobUyJUOh3hjF+FY7eOE9e4XBW6GlumoABzRdbZSiWkicRZejmFvJv0QwrRQh+zNX0zqTgldhJwJif73XUXMSPev8b4mXQcEoJ4L00F/jA91FBofCWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vf3QjZB6; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vf3QjZB6"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744115571; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=M9dVXERWK7r6fVWnBHBSPiIvrOmFU75ldecNYqrlthU=;
	b=vf3QjZB6UL612e972/9SdGnHAOLtHxsZSBccbwCptGEm7UH8+qDrwaPP77KOoC/wXY+lnMj5Lh347BoAAdGqT/gC6y14hueTcrCg4RWSsEcw5caDZr3EA+djkaQim815icJjhjXDpB689mZxkzlrrLspeR5+DDiQS63TKXiQck4=
Received: from 30.74.129.179(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WWFLMed_1744115569 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Apr 2025 20:32:50 +0800
Message-ID: <13998eca-c78e-416e-bf8a-5918618514bc@linux.alibaba.com>
Date: Tue, 8 Apr 2025 20:32:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] erofs: set error to bio if file-backed IO fails
To: Sheng Yong <shengyong2021@gmail.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
 kzak@redhat.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 wangshuai12@xiaomi.com, Sheng Yong <shengyong1@xiaomi.com>
References: <20250408122351.2104507-1-shengyong1@xiaomi.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250408122351.2104507-1-shengyong1@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yong,

On 2025/4/8 20:23, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> If a file-backed IO fails before submitting the bio to the lower
> filesystem, an error is returned, but the bio->bi_status is not
> marked as an error. However, the error information should be passed
> to the end_io handler. Otherwise, the IO request will be treated as
> successful.
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

I will take this patch for this cycle soon, thanks!

Thanks,
Gao Xiang
