Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA992D321D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774735; cv=none; b=VHzzr6T604LR6bei8z4srPBLfIQfURhcTXER3sWP6cJWDnJAkRjVUdvSyhtBoigBJkJ4Ajv2bS5DgBBC9OfA8NPqDQ4XXgZqiq+f/sQAgmVMRzkiadJrhcTwQviLjSrl1a/uhokfB06ooZ/Yd3DxUjxZ7+XAQHABLhXWefwV38c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774735; c=relaxed/simple;
	bh=wlzegHMQtoHuKF3Oe9ZMLorLoGNAfb7HrIptnLROpW4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uHwyMxxNwHRL9ILpq0y7Beh86ruRwmmnywxAGQGIV8m0RyELorIzt4jgfZeVhO2LbsTocqUG9ikwmy9SF3zFE1qX6CTTNif0XZ1HhtT3iH0D4f+yhtnDPY75qCo7n0nxF84OKqcfHcCOLpHPVHrUnK857wdieQfFZmYi7Uv8MRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPBya4mZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPBya4mZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C733C4CEF0;
	Tue, 24 Jun 2025 14:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750774734;
	bh=wlzegHMQtoHuKF3Oe9ZMLorLoGNAfb7HrIptnLROpW4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=OPBya4mZVeDK8tIPUakpMZXp6TeRWI9z0mnsr1usATCwrmA2ia8D890+5eC0pW+eg
	 hOets0zptRdM1Uq+Mdv4mj9Gh7F8PzAUjfkSOVucAUbVC9tpII1kOV/0AedhxWIaLZ
	 uE0otjh3danJMerS0Av4kLgYgbtqB8ljzB1Xn+Yovw/XrGTWVkb04D9bccLbFYsU0+
	 5PG5TWy8fT5IHXP/c8gryH0MJdew0qSmzddwnPiXQYJnuo9hG7iQd5ekDHptk1onmB
	 eO9LKqa3vxe2dSNp0s9lF/HT+EwZzD4jFfnA9Z/IILEMVCvzwd6IMZuc8eP7yBNnFW
	 N05mztJt+O5pg==
Message-ID: <b69b9567-846d-451c-8645-50b6a4b74ac1@kernel.org>
Date: Tue, 24 Jun 2025 22:18:51 +0800
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
Subject: Re: [f2fs-dev] [PATCH v4 1/2] f2fs: convert F2FS_I_SB to sbi in
 f2fs_setattr()
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250624035938.3176350-1-wangzijie1@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250624035938.3176350-1-wangzijie1@honor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/24 11:59, wangzijie wrote:
> Introduce sbi in f2fs_setattr() and convert F2FS_I_SB to it. No logic
> change, just cleanup and prepare to get CAP_BLKS_PER_SEC(sbi).
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
