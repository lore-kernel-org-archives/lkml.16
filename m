Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69898AD58
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750818179; cv=none; b=na0Bke/rwkbDQGoD1+B5gcbiimYLR8SFPkg5MhSesDxwi0TUGm0LJA429Yp3N62PGXWDiEV9BKQzAiKjfzccsD+4bhFIaYqrr6VsdHQtt+EuWxsP63K2ugZ7ZqdF7pk0q+3Qk1rt6Wv7mDzdzrjApSdMVaP9Hc9wjmZXHB3phDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750818179; c=relaxed/simple;
	bh=pguSRycrNbFdkyJPsIgfnM0XWMKUhRIIm7qAZD2y19w=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UjOz+eKqwK9ZiD7+OsjhubsFu11BL70MuRjOQjSUP4RuzdkKBFt7J4u0apaNtEZfE2gtL7xmKld4TUTQSpzF4BgSEISijtRPrsmsfJXMphK+B8hj/UsUpXz5v0vKjQ2ggFp6I+OmwiyLrPpwlUgakdbCupXvUnuBhWkeDidxlIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmMFHkHe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmMFHkHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BD3C4CEE3;
	Wed, 25 Jun 2025 02:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750818179;
	bh=pguSRycrNbFdkyJPsIgfnM0XWMKUhRIIm7qAZD2y19w=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=CmMFHkHe+ifsEcsKBdFsZJIiXI40oyrRGAjlladXEbIyCl03wmwcXqWCDQSn0kESI
	 Fu5i4At5zs2D2MaZfkuzR9wUe2Lgu0e9F9M0Gty/je98o+uXAoehSNqgV5lt+PvMUZ
	 Oid3DzLiDf1PTWXJ3ZRnDrGfprTp/ILh1ouax86ameUM82H/gF8F7CdBBuDxxqktKP
	 SXmRx5WOhN8zoMVGQ1j2HxjtpLHEZ36toNijexB0Tcs6uM3BSc2DPoFwoRf3rN4R0V
	 +pq/KMiMCkNchjNBwYoS7bDANJ9x/oaX9J0ntVeJHDvrd09DXTi9urQYksPWtZ/sfi
	 hNrQJcr6RpMWA==
Message-ID: <c5109563-a233-42f2-946e-e5b7339a03d5@kernel.org>
Date: Wed, 25 Jun 2025 10:22:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH] f2fs: fix to check upper boundary for value of
 gc_boost_zoned_gc_percent
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250625001408.1961-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250625001408.1961-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/25 08:14, yohan.joung wrote:
> to check the upper boundary when setting gc_boost_zoned_gc_percent
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>

Fixes: 9a481a1c16f4 ("f2fs: create gc_no_zoned_gc_percent and gc_boost_zoned_gc_percent")

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
