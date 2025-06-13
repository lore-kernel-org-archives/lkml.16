Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC7D7082A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793130; cv=none; b=F1oIHjhkUByJH1SZWHNn3/CgOzInuT/hvbGpEoHb6Fv/m2kl6n6m8nQJJwuOLmadDonZqmNJ3oo271ITQuHKUAkyJOkyr4SYTjDj4xBw5CXj8cYhr2jovgPSi+MZs59pf0Ort1gNKInARrn1WpfO46Uj+L6jGy+fw8ZIFEL9Zzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793130; c=relaxed/simple;
	bh=rOd4/KK6J7m10xGotXb7C6crXWdrl9XLcSb1EYIPMkc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PUqNwLDPW4nOIHjtBdxBM1Wj183SQGbROrFr55SblWCVjY2pmQu22I9SaiHow7byNBh1J8W7ecNbfZOnpT6d92rg6F4QWpyNOem5i2E9swOx6vYLdwpTipTuOgn+7FYrmqU3SaFR1q4QVCmEWWLWZS+i2VIEd2/aDMRrMZzI+xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRIS2iua; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRIS2iua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AB4C4CEE3;
	Fri, 13 Jun 2025 05:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749793130;
	bh=rOd4/KK6J7m10xGotXb7C6crXWdrl9XLcSb1EYIPMkc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=FRIS2iuapAF0JpPVJLBnt5y41GRTlixpKIpsY6wJ1oC7yyrdW+C7OVuYamnkd03bZ
	 vawny/sqIj6TdjqsWiro9SExg3bxA3MMvqmP+jEpCIDNrmT0XIB5gK1qHjQf7aUDBx
	 K3hAoMeIjRZCaQIDi0MimNZFbTWpm1BdRqaOCFJ7TnIo8+j19s1ESHP3pamY9uWqRy
	 hPI23twkRqPnD/lzly+16hyRZaH3svgBlCyADAOTH23aRQ5JePMnjbC2UZ7nPFU6DN
	 NuYrR/KN1YE3OaqeKNbOp3h03JQY8F4qMTWLzwbbCeZtpTRTFhl1OUuXS++MkArdwZ
	 MDZ1TX+ZZdKHA==
Message-ID: <a5ec2625-5ad4-4ffd-b8bb-00bb0e4e29b6@kernel.org>
Date: Fri, 13 Jun 2025 13:38:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, niuzhiguo84@gmail.com, ke.wang@unisoc.com,
 Hao_hao.Wang@unisoc.com, baocong.liu@unisoc.com
Subject: Re: [PATCH 1/2] f2fs: compress: change the first parameter of
 page_array_{alloc,free} to sbi
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/13 9:50, Zhiguo Niu wrote:
> No logic changes, just cleanup and prepare for fixing the UAF issue
> in f2fs_free_dic.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
