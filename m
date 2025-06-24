Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4ED2D1F42
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774760; cv=none; b=dltR94Ka3QnwQ2UX8n2X94335MdLqNLtq10yaHqqMbKjnnFMGlA6rOd98cnYkn+n3ETTevCYmSa2NhciSd2yhk7rgGh0kZB806ePRRIhKK7eBgcA8lU34uUxqc+mvSlT+2wtg31DHchudNUxCfbMKA6eH2NQh4a3+PHs4ZInMFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774760; c=relaxed/simple;
	bh=+O2XMJoIFYapG4jpDaxlSd2Kzerwe59/bvMlnOv9D9o=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qVndCSqjdZ4e8mDY8YytLyViMxPUCAJ+KZgo5fVXef5ZKtNKLoJB5hvdc23O6gZRb9NyqEvA2/vXvnUVdihAd3xu+Tpxe8P+jMJOvAMASJLvkpDCWYQHSZt9/Cniorcym5mhQuqzP8bjftBHKIthkv2uRSZEYlgjg7K97OMoBEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWprPhtI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWprPhtI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC39C4CEE3;
	Tue, 24 Jun 2025 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750774759;
	bh=+O2XMJoIFYapG4jpDaxlSd2Kzerwe59/bvMlnOv9D9o=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=tWprPhtIjJVwH89Vitnol25HwtwQCcdvJv5BuEtOP/ugno79OURNQxg5hpHmN526z
	 ZaIhB2CH+kBiq6EOKGVlHFa+vsnNqOw2tcPtHgi6bMZWP2mBRAa2xRIJ72iTEQy/tn
	 jrR7RY/W1O3EjbnCC9gyRP65kYGHORjWLNpKWc83Kv67Or1+cV4gfDXhCKeNcHy+zx
	 /hjiCFz0qjhfxQTXX1gkJvokcEwLnRZGc91FFUY2rXCiYAYgZOzUgxA01xpFUI+HIE
	 M6yLIau/CZNtv5GykPUtDlJWKUaib58vHk2DJKrclkSwHEQ6pAqfxFxTtOpe1QNISD
	 Rr6otHifx9uuw==
Message-ID: <1c6a9b6c-8bce-4a02-9dbb-a883e74c0045@kernel.org>
Date: Tue, 24 Jun 2025 22:19:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, bintian.wang@honor.com, feng.han@honor.com,
 niuzhiguo84@gmail.com
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: don't allow unaligned truncation
 to smaller/equal size on pinned file
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250624035938.3176350-1-wangzijie1@honor.com>
 <20250624035938.3176350-2-wangzijie1@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250624035938.3176350-2-wangzijie1@honor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/24 11:59, wangzijie wrote:
> To prevent scattered pin block generation, don't allow non-section aligned truncation
> to smaller or equal size on pinned file. But for truncation to larger size, after
> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
> we only support overwrite IO to pinned file, so we don't need to consider
> attr->ia_size > i_size case.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
