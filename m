Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954132AE97
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263277; cv=none; b=h0szzICiheriWHQMRsvUDiBq0OHtQ8uGq7DV6bXrMbmkPlHfS8e42qlPJtWQPVcTHjAbHDoZB3P5Vipcea0x/F7mwruys8QHRTP0dG3o4xBKoFRAZUT9bcWTPbMSHXwKbknuD8Abpmp84CkdMuCoG+Bq7r1J6rG/2e2jV22EFRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263277; c=relaxed/simple;
	bh=ZljwUMVsMq1qn5Hn6igvMXGnAAWwFuyzwcJGXA+p76o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IW5wrX3IgiGD5Z7B1LhEaBCv5Bp81UnVKV3LE4mExtUc/kbV2qkrYWNPKaFXm5iX+6Er9VnnIPK9ga4Tsf7F60WfFiFQ8WtvQnC1nJ7vqrKsMBEoP/D1MmBRl8tjauhy0DpzN1WXuq68sTEOFVQtilbfML6dtORcg1CCp1YqeR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=e1gFObcS; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="e1gFObcS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744263265; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Bs2n4ggmpJKAVXgPqf/grfYUsXVtkpC5QXujA5eZfrs=;
	b=e1gFObcSvDn59pUWs4lBWURwcxmniynV9ouiNgn4/g1GHHUnlCa3q2W7nHd6zp4diJEVRRi1MvtRuR6oHL/qA1QDsBNXFfgAj91IkHoZ6vA+FC2KhLfs4Jj/hO/dJc1x0xNYf45uVTFcEERaEHghzLiQndD4cKL1tdz0mltJqoY=
Received: from 30.74.129.130(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WWNI0Qe_1744263264 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Apr 2025 13:34:24 +0800
Message-ID: <a3ce2b97-2898-4856-a1bc-07d9ac40a55d@linux.alibaba.com>
Date: Thu, 10 Apr 2025 13:34:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] erofs: remove duplicate code
To: Bo Liu <liubo03@inspur.com>, xiang@kernel.org, chao@kernel.org
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250410042048.3044-1-liubo03@inspur.com>
 <20250410042048.3044-2-liubo03@inspur.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250410042048.3044-2-liubo03@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/10 12:20, Bo Liu wrote:
> Remove duplicate code in function z_erofs_register_pcluster()
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>

Thanks for catching this, will apply it first:
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang
