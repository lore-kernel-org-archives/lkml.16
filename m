Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FE31E98EA;
	Fri,  2 May 2025 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169297; cv=none; b=Gy1yhCvZ9H+mpx0e/Z1BjZF2k9iyj2YdTeq8b+IfVIR52xVdc3aVlAqxVq7TkirxUqQVAEx1G3jCp4tTnEym7Px36Ld1+Zj2r7TYeZfZdKxMBmDd0/4EwLUB1Er1xcGZidZtBHUDbVXHbbuZdRZ2iu9G/dqR13sRB5XkJwXdWZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169297; c=relaxed/simple;
	bh=GvDDf81Wz8kmvhvd60Ue0MYrQ9Kyf2n/GxjwQ2yjYdQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GUHQ2GC5h1ZYjgfxxCF3R1FoYMNn4nXIfUuU/rwTSW+KGcms0LoM8o22sSGT5xnVHCsHs4lhAcHcrwwpKae77NY+TKeVgwvcbc0yvk8lF3PqczUlRS5w8pUmngIPN7TCgpGatV2B2HPQnGWDpbJWi+4LaFdBv6YDMPON6Mk8FEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-669ff7000002311f-81-68146a3d5fcd
Message-ID: <9837bbe0-d494-43bb-8e92-8cbf47a32b68@sk.com>
Date: Fri, 2 May 2025 15:46:21 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: kernel_team@skhynix.com, Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Gregory Price <gourry@gourry.net>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
To: Dan Carpenter <dan.carpenter@linaro.org>, Rakie Kim <rakie.kim@sk.com>
References: <aAij2oUCP1zmcoPv@stanley.mountain>
Content-Language: ko
From: Honggyu Kim <honggyu.kim@sk.com>
In-Reply-To: <aAij2oUCP1zmcoPv@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsXC9ZZnoa5tlkiGwYZ+a4s569ewWXyY18pu
	MX3qBUaLn3ePs1sc3zqP3WLrLWmLy7vmsFncW/Of1YHDY+esu+we3W2X2T0W73nJ5LHp0yR2
	jzvX9rB5nJjxm8Xj8ya5APYoLpuU1JzMstQifbsErox3r30LrvFUbFvVydzA+J+zi5GTQ0LA
	ROL+0b2MMPaPy6vYQGxeAUuJPZvvMYHYLAIqEj2rl7BDxAUlTs58wgJiiwrIS9y/NQMozsXB
	LDCFSWJT429mkISwgK/E4v/fWEFsEQEvidmvl4ItEBLQl3i1bCKYzSwgIjG7sw2snk1ATeLK
	y0lgyzgFDCTetuxlhqgxk+ja2gVVLy+x/e0cZpBlEgK32SQe/5jDCnG1pMTBFTdYJjAKzkJy
	4CwkO2YhmTULyawFjCyrGIUy88pyEzNzTPQyKvMyK/SS83M3MQJjZVntn+gdjJ8uBB9iFOBg
	VOLhDSgQzhBiTSwrrsw9xCjBwawkwhtjABTiTUmsrEotyo8vKs1JLT7EKM3BoiTOa/StPEVI
	ID2xJDU7NbUgtQgmy8TBKdXAGHr/zxuz5utfvvop73I9tVFv2rtbpSWyBmdSlGa7lq2ODs3y
	XCdTJduQOVmqcsqbGQk7df64LKt3srt3mF92zfbd3pfK+rzZDt9eGKq78seuGXJlU62d/HKj
	Wx1O3vep50sX+JsiViH7t4jLRL4u1HxHzOPDHFdNKjfP3L/88dws7ZboK75/lFiKMxINtZiL
	ihMBdBeWM5ECAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsXCNUNLT9c2SyTDYOdcfYs569ewWXyY18pu
	MX3qBUaLn3ePs1sc3zqP3WLrLWmLw3NPslpc3jWHzeLemv+sFoeuPWd14PLYOesuu0d322V2
	j8V7XjJ5bPo0id3jzrU9bB4nZvxm8fh228Nj8YsPTB6fN8kFcEZx2aSk5mSWpRbp2yVwZbx7
	7Vtwjadi26pO5gbG/5xdjJwcEgImEj8ur2IDsXkFLCX2bL7HBGKzCKhI9Kxewg4RF5Q4OfMJ
	C4gtKiAvcf/WDKA4FwezwBQmiU2Nv5lBEsICvhKL/39jBbFFBLwkZr9eyghiCwnoS7xaNhHM
	ZhYQkZjd2QZWzyagJnHl5SSwZZwCBhJvW/YyQ9SYSXRt7YKql5fY/nYO8wRGvllI7piFZNQs
	JC2zkLQsYGRZxSiSmVeWm5iZY6pXnJ1RmZdZoZecn7uJERgLy2r/TNzB+OWy+yFGAQ5GJR7e
	gALhDCHWxLLiytxDjBIczEoivDEGQCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8XuGpCUIC6Ykl
	qdmpqQWpRTBZJg5OqQbGONVJfNE1s/oEMz2mTyr4/P/67xv2R/huHfv8qYFx88ba6Ekyu6fn
	zJnq+zPwDu8FBTs52yLp1P6u5sjV/nfSguq3L1i/48unj6HxEuw2uScn9GfeETi/hGnNQw82
	deM0hRnbWv5dc2PPc7s4OVpu4/vGadUa/5LTipJl/c/2di3wW7i1oadRiaU4I9FQi7moOBEA
	BCkJ+YECAAA=
X-CFilter-Loop: Reflected

Hi Dan,

On 4/23/2025 5:24 PM, Dan Carpenter wrote:
> Return -EEXIST if the node already exists.  Don't return success.
> 
> Fixes: 1bf270ac1b0a ("mm/mempolicy: support memory hotplug in weighted interleave")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Potentially returning success was intentional?  This is from static
> analysis and I can't be totally sure.
> 
>   mm/mempolicy.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index f43951668c41..0538a994440a 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
>   
>   static int sysfs_wi_node_add(int nid)
>   {
> -	int ret = 0;
> +	int ret;
>   	char *name;
>   	struct iw_node_attr *new_attr;
>   
> @@ -3569,6 +3569,7 @@ static int sysfs_wi_node_add(int nid)
>   	if (wi_group->nattrs[nid]) {
>   		mutex_unlock(&wi_group->kobj_lock);
>   		pr_info("node%d already exists\n", nid);
> +		ret = -EEXIST;

Returning -EEXIST here looks good to me, but could you remove the above pr_info
as well?  I mean the following change is needed.

-		pr_info("node%d already exists\n", nid)
+		ret = -EEXIST;

We don't need the above pr_info here because we delegate a warning message to
its caller wi_node_notifier().

This can close another warning report below.
https://lore.kernel.org/all/202505020458.yLHRAaW9-lkp@intel.com

If you apply my suggestion then please add

	Reviewed-by: Honggyu Kim <honggyu.kim@sk.com>

Thanks,
Honggyu

>   		goto out;
>   	}
>   

