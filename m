Received: from out199-17.us.a.mail.aliyun.com (out199-17.us.a.mail.aliyun.com [47.90.199.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC3E146A60
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 03:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.199.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749438530; cv=none; b=Ue8uvqlWeOp4BEcnM4GHeS/Fif7Ph7jwAM4kMCsAX6RBQb5gMfTsWqWjmacwFCzgH9uOdyT8W98WK+vjvGg0vap8FTgzL6LKq1fLX1yC4Y+tTvmpIvuHRN4pt6pW6L9iG4vQJV1NFN43LPtBi+TEz2axay+uMM6ymkD79e2fZVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749438530; c=relaxed/simple;
	bh=hmRzEbXG2kzWtHkhRA1TrR7/X0WUqUuAh3KDnu5ZpmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GzouX7UCwSxFXr4t2hjEHhyXHSuMvljDVC29mNGUc0qSSTwq07AU08GZBkbd+Mp2aFzbHvzgLKh3SzjGOvea/9JddVVpMLmciFunMfN0t2k/w3Ujk4sHtXRo2tAzfJqJRvBe8zRgXYW4mjWmi7TyAA1VYIHoY45ztqIbUG84LKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=j9J9K057; arc=none smtp.client-ip=47.90.199.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="j9J9K057"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749438515; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=SvSgVLN1gXlZ/uDePszzNnA/Qx6F3kvF2qgKUMgBs4A=;
	b=j9J9K057MLLt7ejPRc1IKoKKJHxf9+WKp2ghIdqmQLtTD9OCjWRujfagVbalvJ5PIXvF8XtRPm+a4cgs7OSDEDmRampgo2PZ1//tqzL1OUTiNHPCoOxadcg/qOi+4GNWFhUmgp9FdwWCE+JyuRi1fCWK31kVcFSMEojTk1vU1xs=
Received: from 30.74.144.144(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdK.gHk_1749438514 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Jun 2025 11:08:35 +0800
Message-ID: <48d9e462-5ec5-4b37-a485-d86118d1bc53@linux.alibaba.com>
Date: Mon, 9 Jun 2025 11:08:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Barry Song <baohua@kernel.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>
References: <20250609002442.1856-1-21cnbao@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250609002442.1856-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/9 08:24, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> I have been actively contributing to mTHP and reviewing related patches
> for an extended period, and I would like to continue supporting patch
> reviews.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Barry Song <baohua@kernel.org>

Thanks.
Acked-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 99dcf9036b9d..c6770ebe2927 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15845,6 +15845,7 @@ R:	Liam R. Howlett <Liam.Howlett@oracle.com>
>   R:	Nico Pache <npache@redhat.com>
>   R:	Ryan Roberts <ryan.roberts@arm.com>
>   R:	Dev Jain <dev.jain@arm.com>
> +R:	Barry Song <baohua@kernel.org>
>   L:	linux-mm@kvack.org
>   S:	Maintained
>   W:	http://www.linux-mm.org
