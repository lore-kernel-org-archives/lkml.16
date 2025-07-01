Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFB63C47B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751338887; cv=none; b=mT19fFdv5adRqdFUwAYacZA2mbwbtYPi+GPw3oaxG3tdmdMtoK84L0KUF/EENraZbTAaH/6K7bfCljWn1qfFVIXKpnAm1cM8GNX32JuOlC1Zqj2qrFPIbc3OBo7O+BigajsKoNVtimT++u7hHvEDh3CB45hJ5ZIYzMxVgWVuKhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751338887; c=relaxed/simple;
	bh=hdnApl4/Gk5OHftwPeg37vTcl2zebPR9fDoMLMAMFxY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ni8wf4TsL5tCZsHbzPazHIXw7c5l2rEiMWz26Jjqzrfy5tFjJ4BCpS/TgxasbH8HosfJsdG+tRU+AWvNn0PcdN8UilpEsUbeEvjjyn1q4npHX061HoiUkcT2S3kzA1vmaJpWUb63GV6H2t3UpqPGTJlWNh0RvZT5dvHz4Gkl0GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvxGnFJT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvxGnFJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED6CC4CEE3;
	Tue,  1 Jul 2025 03:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751338887;
	bh=hdnApl4/Gk5OHftwPeg37vTcl2zebPR9fDoMLMAMFxY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=jvxGnFJT5tW0hbt0rkiFLAohxHl7f5GP4w7pyytqpGcRbYJk6bAg3Kr/PytlY2bUO
	 w7rJGMcTmMCkCYlIhyoGFvlnZIfNOUagOzsM8fv4HrVPAmhh2j7Z1eGgqn66JR1a3t
	 +OOFBBQcEYt0VjiC4Bk9mLb58e1hK4u+rxNNctZ56OVmZ5wPnRgxyXi/a2E6c+dEOP
	 J6Fhs/ldO12ZyzOeE1M9V0N6QoqIv+7okmUZybTIJyIU68qjOif81F0zLoP54dWmMK
	 r8z96eqrnSUdC6Ep1NmP0fdk6EhOu3t6llyLmgdhVVhZxjl1DnBMXVGPjY2dpr/QSn
	 gpsAHj26ZUqKQ==
Message-ID: <c5a47888-9a6d-4a2c-9861-c9503cc55701@kernel.org>
Date: Tue, 1 Jul 2025 11:01:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, wanghui33@xiaomi.com, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>
Subject: Re: [PATCH v4] f2fs: avoid splitting bio when reading multiple pages
To: Jianan Huang <huangjianan@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20250630125753.650630-1-huangjianan@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250630125753.650630-1-huangjianan@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/25 20:57, Jianan Huang wrote:
> When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
> to the nr_vecs limit, the compressed pages will be split into multiple
> bios and then merged at the block level. In this case, nr_cpages should
> be used to pre-allocate bvecs.
> To handle this case, align max_nr_pages to cluster_size, which should be
> enough for all compressed pages.
> 
> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
