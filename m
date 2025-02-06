Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F054D529
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 02:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738807890; cv=none; b=RR2OHn574JONSmvfENpJHlLY62G8eCx5ciw88NjpleC1S6j5hQkx1tPmIGZafdbRiulUP4A/EhZeYcifwURdY/M4AI4z2KGsXeUAgGh6attT2X7PEu/wts5VkTFRCDzzIZI7UvnnCRHQmtanjX7obk/qqrDWiEIR6FrLXZr90iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738807890; c=relaxed/simple;
	bh=qR4aqXrsloPMkB41nqvr7YJ5vWbSvPdLHVAfUjj5CBQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OL8WNZbWItgNruE8uJjLGsiCw2xjymwkBRwf1c41wmdzSplXrEiqVlHIkRKOpesudoQXhZPwkBqdCRnGoWxgkkkgFY3jcE27xVRJl9T5tcXtA9r38PL3gJW701SXh/BUh/ZURHcpRaMEZPvU7HWCjpEXdk+R+msBviWhHMqygZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQE/vEYV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQE/vEYV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892CEC4CED1;
	Thu,  6 Feb 2025 02:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738807889;
	bh=qR4aqXrsloPMkB41nqvr7YJ5vWbSvPdLHVAfUjj5CBQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=CQE/vEYVUdXDSPhB7MYwZHCdBgPgVMb1lrztPyo06HkeYOK/w73j4arDexT8COYH2
	 A8w5ZNZRjo9UT7ytejX90t2VmQe7B1JpiHDnNcnzZFFV2qLTLmUl9lWpZ+vBBERik+
	 UN9ob3TuoKkoBDyl8KZ/AURXLvOfVDomrmiZLHSAQLrkDmc4Es/zXayH5vf6wn9AWd
	 sxD4IzmCzzf+QKtwlgL1JddZyaAq9T/7zvafe86eufRMCpqMG2FgbBF5QPG978NBk9
	 /e1RV/v2r4UKxk9vrzzMWqQ5W3H94FnbyG5BJAUfpBdtu/tGHrePdEQifuZJ2S6EoA
	 Eeu+csFjfJgtg==
Message-ID: <74e94276-aaa1-4b82-8a5b-74d767cf63a2@kernel.org>
Date: Thu, 6 Feb 2025 10:11:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: introduce f2fs_base_attr for global
 sysfs entries
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250131222457.1634039-1-jaegeuk@kernel.org>
 <20250131222457.1634039-2-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250131222457.1634039-2-jaegeuk@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/1/25 06:24, Jaegeuk Kim via Linux-f2fs-devel wrote:
> In /sys/fs/f2fs/features, there's no f2fs_sb_info, so let's avoid to get
> the pointer.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
