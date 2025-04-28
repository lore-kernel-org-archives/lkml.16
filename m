Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0892F1B0F33
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835132; cv=none; b=qUZwZ4N4SqFNUknzhvisdWaAv1YjDsNRBPNeVsmGnNNaqw973lqZauqZPzxET/VzsQrBcyQZ36KK3rCJlNB4NgQ7wDNxmpzMSgjHB0iW4VLnFCns/V38jINzldURRhoAMZcAAqYFfHIz8kina55IFi71u0EPoK+HzeDzJQHzqIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835132; c=relaxed/simple;
	bh=ojFpplxRjXKXBQnIjhqG2YroPiltS6xMA+3mWVYqXJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tK1RHC4mBEyjXmap8r7Yg7iFOCs6cywUf+PIoWuQU8NfLbx4JMEitxRAkmLF3L/B28mLPl7lSSA7he8ihRcUgGPue9xpwKRP7dQiFy71SyaLJslOk3Pm+NiIdybCMDs+dv80qQryOkJeV5kj2yWXm9cJol18cS9w/u47wIhC+0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 815731515;
	Mon, 28 Apr 2025 03:12:02 -0700 (PDT)
Received: from [10.163.50.165] (unknown [10.163.50.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06BE23F66E;
	Mon, 28 Apr 2025 03:12:06 -0700 (PDT)
Message-ID: <64405466-5983-48ef-803d-0531c4152576@arm.com>
Date: Mon, 28 Apr 2025 15:41:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: remove unused macro INIT_PASID
To: Cheng-Han Wu <hank20010209@gmail.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250427145004.13049-1-hank20010209@gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250427145004.13049-1-hank20010209@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/25 20:20, Cheng-Han Wu wrote:
> The macro INIT_PASID was originally used by mm_init_pasid. 
> However, since commit a6cbd44093ef ("kernel/fork: Initialize mm's PASID"), 
> mm_init_pasid has been removed. 
> Therefore, INIT_PASID is no longer needed and is removed.
> 
> Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
> ---
>  include/linux/mm_types.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 56d07edd01f9..e76bade9ebb1 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -28,7 +28,6 @@
>  #endif
>  #define AT_VECTOR_SIZE (2*(AT_VECTOR_SIZE_ARCH + AT_VECTOR_SIZE_BASE + 1))
>  
> -#define INIT_PASID	0
>  
>  struct address_space;
>  struct mem_cgroup;
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
