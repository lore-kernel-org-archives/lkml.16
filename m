Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA53266F08
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843077; cv=none; b=NHfasmLidM8S3alPTyUY4WxIMqk89bLFOlxdPXlW1pxy5ql/gKVsrG2GP9/m+ruiHWtLttT/Qz5zdrzNNsPTFrO0i/8c3aGEdgeyUXPfyw0Nw5Qnh6x5RznBCBuxzBZNY4Nd/R1mYmXQQsEKAEiKlgmKHRv1Y+d3kei36ZRJxvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843077; c=relaxed/simple;
	bh=KmIXJS/6YcffXQD7u5MajtiR00J5pbjGugvwWwumVbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuJFCZ4Pe/ddvPE+BmRNTFmSRXX5mEqCX/coYgqxwdE44s2JGAwn979Ll1ZKTCIDnTal3uOrNd64DNByX+RKieQ7iUH9FQB/O5/yzew85vM2eQQXuBg758GCYjcLIW746q9/p6HxhskBm4UsCdXkBzgov3BOBwFtVIJ3X4hfexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62F821516;
	Mon, 28 Apr 2025 05:24:29 -0700 (PDT)
Received: from [10.163.50.165] (unknown [10.163.50.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BE063F66E;
	Mon, 28 Apr 2025 05:24:30 -0700 (PDT)
Message-ID: <6914fe24-e36d-4d8c-b664-73ee4195c15f@arm.com>
Date: Mon, 28 Apr 2025 17:54:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm/debug_page_alloc: improve error message for
 invalid guardpage minorder
To: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rppt@kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, david@redhat.com,
 harry.yoo@oracle.com, riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
References: <20250427100442.958352-1-ye.liu@linux.dev>
 <20250427100442.958352-3-ye.liu@linux.dev>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250427100442.958352-3-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/27/25 15:34, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> When an invalid debug_guardpage_minorder value is provided, include the
> user input in the error message. This helps users and developers diagnose
> configuration issues more easily.
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/debug_page_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/debug_page_alloc.c b/mm/debug_page_alloc.c
> index d46acf989dde..6a26eca546c3 100644
> --- a/mm/debug_page_alloc.c
> +++ b/mm/debug_page_alloc.c
> @@ -23,7 +23,7 @@ static int __init debug_guardpage_minorder_setup(char *buf)
>  	unsigned long res;
>  
>  	if (kstrtoul(buf, 10, &res) < 0 ||  res > MAX_PAGE_ORDER / 2) {
> -		pr_err("Bad debug_guardpage_minorder value\n");
> +		pr_err("Bad debug_guardpage_minorder value: %s\n", buf);
>  		return 0;
>  	}
>  	_debug_guardpage_minorder = res;


Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
