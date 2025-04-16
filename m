Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866BF1DDC3E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825172; cv=none; b=Fe2VKfv10FxN/mBIig9AlrkKJn35i1kLAkooCtlHSFuRzPZ2NjwIFRZNi9S8KucT+ew000Q9UoFXbusBxysdk44ycKNgRp4VpEmBpQH+9irAHsevxnZh2Jbn0qDcyw7JmTj8qpCtonVeGL9BqleK8ZOjQLPAmS2dzHjXtBk8q/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825172; c=relaxed/simple;
	bh=BcCjvOgeeU0ATsNlaTQ94OdcTJ9s7OSEwfE4jWKYuxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V60q4TLMFLw+hOKpDo/VZ3h+No3KtXx5XQRBN7EGrKL8Je1vZ7iWu98pCI1w+HhzEVKsMO7Ikamkd21NaeATFtsjpVdhaX7i7gkaL7uRAD0HFUBOBoKoSfM+YMGV7qpbRruqWzYtbzrw8JYzjEAUTjfGVE2M+RabUAugkLQhoPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=nd2o0HoK; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="nd2o0HoK"
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTPS
	id 53NOuOphiAfjw56huuJObk; Wed, 16 Apr 2025 17:37:54 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 56htuJtfeM7Yo56htusH4e; Wed, 16 Apr 2025 17:37:53 +0000
X-Authority-Analysis: v=2.4 cv=Nejg1XD4 c=1 sm=1 tr=0 ts=67ffeaf1
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=B3fuDwYyW55wTQKIj88FGw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=BLRy5mX9rXzc9QvDkdkA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ar/aweR9FQh73z0BhLDPfxHbNifaEbR7MIlAP92gXkM=; b=nd2o0HoKjdABzlrSzyrYVlzbki
	bWSFjcR+oUssgRLC7gcx3jcuq6+zXAwEa5YwjihZX+pVTIMl3ItGz+7xmWpb1ZnomucSI165sPX/e
	Jr3xnLlOSNszyI5iBVeYkxbvrZDyuSl+bJsa+ifwfmbrHctj5/zwA/1QPCQETHUfbMEeT2W2Q8Ahs
	Ux2qokNcMfM+gg6HlfZgmTwOzQ+1ZWQwQ40W3nt/GSFPlN70JBOtcdGniV933k/YnqnT+pYi3+rpy
	AR8rk2SlnPcx3Ey7OitoOE8VMd3sZEMLz5u2mNlvfwH3HpHx24jAnIhUzQxTeLEvy1LLNyGWFTeBd
	XYDVHgfQ==;
Received: from [201.172.174.147] (port=53400 helo=[192.168.15.14])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1u56hs-00000000pNK-1je2;
	Wed, 16 Apr 2025 12:37:53 -0500
Message-ID: <658d0535-6842-4515-a888-217cb375968c@embeddedor.com>
Date: Wed, 16 Apr 2025 11:37:40 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] overflow: Clarify expectations for getting DEFINE_FLEX
 variable sizes
To: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250416172911.work.854-kees@kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20250416172911.work.854-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.174.147
X-Source-L: No
X-Exim-ID: 1u56hs-00000000pNK-1je2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.14]) [201.172.174.147]:53400
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfK4lVgmTAoSlgLgMe3pLDJQ4QntHYQ+BRi7QE9seXVKBuNq6yQkmhAYJYNteY2JpZTkgejNgdqaAUa62lZWynHJPwbYIGd738dHWg4MAL1J3Xqroze2Q
 wcpWnBbSfTwMbVxIc7zmxOejf/Hi8egnL4gHcy/icPcgSrSZv6Sxggs0STzmA7pgwglyVLY8khYv0qGl5ZepBM5YhPrl0DbBUWjzavL9QEVo/owNTZg3Iw5I



On 16/04/25 11:29, Kees Cook wrote:
> Mention the use of __member_size() for DEFINE_FLEX variables as a hint
> for getting at the compile-time size of the resulting flexible array
> member.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> ---
>   include/linux/overflow.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> index 0c7e3dcfe867..6ee67c20b575 100644
> --- a/include/linux/overflow.h
> +++ b/include/linux/overflow.h
> @@ -419,6 +419,7 @@ static inline size_t __must_check size_sub(size_t minuend, size_t subtrahend)
>    * Define a zeroed, on-stack, instance of @type structure with a trailing
>    * flexible array member.
>    * Use __struct_size(@name) to get compile-time size of it afterwards.
> + * Use __member_size(@name->member) to get compile-time size of @name members.
>    */
>   #define DEFINE_RAW_FLEX(type, name, member, count)	\
>   	_DEFINE_FLEX(type, name, member, count, = {})
> @@ -436,6 +437,7 @@ static inline size_t __must_check size_sub(size_t minuend, size_t subtrahend)
>    * Define a zeroed, on-stack, instance of @TYPE structure with a trailing
>    * flexible array member.
>    * Use __struct_size(@NAME) to get compile-time size of it afterwards.
> + * Use __member_size(@NAME->member) to get compile-time size of @NAME members.
>    */
>   #define DEFINE_FLEX(TYPE, NAME, MEMBER, COUNTER, COUNT)	\
>   	_DEFINE_FLEX(TYPE, NAME, MEMBER, COUNT, = { .obj.COUNTER = COUNT, })

