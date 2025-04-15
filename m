Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDF210F2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699217; cv=none; b=bIWVhHDnuo9ZR7KYdm0RF4lZIlFVBqW7NlXC7FBnyQvGd3tpnSrw7epVG1tfYZkhAbFYGJWrjsaSz9EVaubyW+IK5f5xYmDZWbgPTku/XQ8lj4dVZd5cshv2y3u94eFarbdzTHbukmbUSydUiz11sweoHXOOVPM9UIEt0vMHrtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699217; c=relaxed/simple;
	bh=qKWykaqE0R6La0N3SWYt37iLGqUOh8lAcLv/F9XLRSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuM1GaKOg9F5oyqdme9eUz5VIf+p0DDGY6VHoKtp45o+DzsyashIBzGLfrQsQ/y9WVC3EhP7TvVK92EdwPZDTtueXrbb7CY/PnPjWxYk5Y1FucBuJ2sYvZgxo+ZdSEisZaZdHfcfHRNq5lIN4X+wUVHshBdoObXslZ1ZleoGOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA85F15A1;
	Mon, 14 Apr 2025 23:40:12 -0700 (PDT)
Received: from [10.163.49.104] (unknown [10.163.49.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63B913F694;
	Mon, 14 Apr 2025 23:40:11 -0700 (PDT)
Message-ID: <a7c8f6fe-19c9-4546-900a-3d164ec37a94@arm.com>
Date: Tue, 15 Apr 2025 12:10:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: add nr_free_highatomic in show_free_areas
To: gaoxu <gaoxu2@honor.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>,
 Yu Zhao <yuzhao@google.com>, Barry Song <21cnbao@gmail.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 yipengxiang <yipengxiang@honor.com>
References: <d92eeff74f7a4578a14ac777cfe3603a@honor.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <d92eeff74f7a4578a14ac777cfe3603a@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/12/25 14:57, gaoxu wrote:
> The commit c928807f6f6b6("mm/page_alloc: keep track of free highatomic")
> adds a new variable nr_free_highatomic, which is useful for analyzing low
> mem issues. add nr_free_highatomic in show_free_areas.
> 
> Signed-off-by: gao xu <gaoxu2@honor.com>
> ---
>  mm/show_mem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/show_mem.c b/mm/show_mem.c
> index ad373b4b6..03e8d968f 100644
> --- a/mm/show_mem.c
> +++ b/mm/show_mem.c
> @@ -305,6 +305,7 @@ static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_z
>  			" low:%lukB"
>  			" high:%lukB"
>  			" reserved_highatomic:%luKB"
> +			" free_highatomic:%luKB"
>  			" active_anon:%lukB"
>  			" inactive_anon:%lukB"
>  			" active_file:%lukB"
> @@ -326,6 +327,7 @@ static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_z
>  			K(low_wmark_pages(zone)),
>  			K(high_wmark_pages(zone)),
>  			K(zone->nr_reserved_highatomic),
> +			K(zone->nr_free_highatomic),
>  			K(zone_page_state(zone, NR_ZONE_ACTIVE_ANON)),
>  			K(zone_page_state(zone, NR_ZONE_INACTIVE_ANON)),
>  			K(zone_page_state(zone, NR_ZONE_ACTIVE_FILE)),

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
