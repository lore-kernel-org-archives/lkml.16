Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7437374F1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918892; cv=none; b=b8ACK8JDdG6D6vzS7yVgRjDmoexgwTY0GI7NwximIxu+Mxauz4hwmwf0oHYHBVqQnAWM/+BtAH3v6TDAIdwzrlPTjV8pAw5gcy0k8jYf/KhaunmbED4JF5H7k4cn1MnwLXzICN43+r1gYHp8XZKiT94xSAz7BknKfH50krN0wuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918892; c=relaxed/simple;
	bh=HU1yudL4dZAZwdHcWLmEZOnPPyJlzzcjlV3Rhx6XSi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y56Yfae7nOwTTH/fLL/q2mKlAA8Umbyp0JrzRLAceSphQpMuFFprr0ZmyAsuK1yQoin/ABzKMGhS3dg2XSUc4Tcsv2281enJbk60a9kMkyj0BNviHYoG5Fs+ghpZlaIdnNO+fVOU+MqxjtqtAZr5fkgICt8IMnckcRiYbEBdoTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1E3D1063;
	Fri,  7 Feb 2025 01:01:52 -0800 (PST)
Received: from [10.162.43.18] (K4MQJ0H1H2.blr.arm.com [10.162.43.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67A583F5A1;
	Fri,  7 Feb 2025 01:01:28 -0800 (PST)
Message-ID: <65b52d7a-c913-4f62-9389-d097c70f4281@arm.com>
Date: Fri, 7 Feb 2025 14:31:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/secretmem: Bool type variables should be initialized
 with true
To: Liu Ye <liuye@kylinos.cn>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250207074237.193775-1-liuye@kylinos.cn>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250207074237.193775-1-liuye@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/02/25 1:12 pm, Liu Ye wrote:
> The variable secretmem_enable is initialized with 1, which is an integer.
> It would be more appropriate to use true for better readability and

At the cost of messing up the git log. Please don't send trivial 
cosmetic changes.

> consistency with the bool type.
> 
> Signed-off-by: Liu Ye <liuye@kylinos.cn>
> ---
>   mm/secretmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 1b0a214ee558..2f9442d6633d 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -35,7 +35,7 @@
>   #define SECRETMEM_MODE_MASK	(0x0)
>   #define SECRETMEM_FLAGS_MASK	SECRETMEM_MODE_MASK
>   
> -static bool secretmem_enable __ro_after_init = 1;
> +static bool secretmem_enable __ro_after_init = true;
>   module_param_named(enable, secretmem_enable, bool, 0400);
>   MODULE_PARM_DESC(secretmem_enable,
>   		 "Enable secretmem and memfd_secret(2) system call");

