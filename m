Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A537133E1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750817997; cv=none; b=gpEMwbpIRkmA0grI0eY0Zl1WqINJnt3XhzSphimcAunOBoFjNbANmgBE3knVFLZ1GIeLLSX9d/J5lV29CKhve9E9nccVI1mmtGsTtgxyf0B5XqUlL3aah5Gw5WWhRidEP92K1QpuDn2BRF3MzjTR/6jP/xr4P+1DbiIGruHlpKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750817997; c=relaxed/simple;
	bh=sUlXBOh/RWWAZudBpnTBpz6oydGeyM6tmekluLDS8kM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Cm2g3eu9+WRZ2qxpuw47nOd1VbF3/e8HwnkqiySuAv+6hdvVL4g8JaykuShKD+6sevDj5LluohobOk8PUejRxjYrhXK7Cm3kJ9kVtwSX4DUlZumADfnCDbWqM2NpSWqeEyHhJFBuWB/xVCBtUE40C6QdFLRjRkVEJccsAhXyBY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D75KGG22; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D75KGG22"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E97C4CEE3;
	Wed, 25 Jun 2025 02:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750817997;
	bh=sUlXBOh/RWWAZudBpnTBpz6oydGeyM6tmekluLDS8kM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=D75KGG22sNrrXwO4nKe9OBj2PSKSK3MvKPCOmzJ/dcPHeauaFTMriV90/bVOYmg2w
	 DBmL1WWCGFuDy3t3V90MVkgl+czeKoIne+GiThedV78spFTco9nfrbQ3uY0BHYQU0A
	 k76oPP/nWZpgDXVgFfiW23GY74CGN7ONr42SD3hUy6n74m/LNIiEOH88Yr2ikaSpth
	 LHQ0oSbCj+WDuF6YV7XCOjLU36pscxxriH5b/sRL74CLdAv3ajdmk0XM80uFOWO3cR
	 O2odFpjKyolHHAfs+mFuO/v87Cwp9uhaf+BytvuUGRFlm8khCeK0iBAU0S8NCemcPF
	 ddw6ZU2aFvQUw==
Message-ID: <d598f60a-a276-4033-bb26-08ac74c28042@kernel.org>
Date: Wed, 25 Jun 2025 10:19:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH v4] f2fs: enable tuning of boost_zoned_gc_percent via
 sysfs
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250625001336.1937-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250625001336.1937-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/25 08:13, yohan.joung wrote:
> to allow users to dynamically tune
> the boost_zoned_gc_percent parameter
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
