Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5F81FBCAF
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747966208; cv=none; b=VRIAREtzuRV9n48EotNOMuBXUPxowJKrufVRC8L8dZwq2I54p36EZRkIYaXcFvNYfF35frigYXqiIq0i+wDQDdJgRmx9q6IooOS6phBO9vJ3ZP9FILY7skoHZFp4IrSzRVxaqdQN28BHxSgw/fQ5A0hRzTuEtVXwB5ZDe1JMsxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747966208; c=relaxed/simple;
	bh=3o3gXIXqgb2ZSDnot6DFESn7N0TnBdXPrFPagY2C53k=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kfJMahJ8bqerm26DxZ3hTzy0vniNTzzCiAfnVm1fKwLJfL3VV+Ue3fTB+qHQMAUlzh/NjcZ5SGao9lfukPlfIXnQeGXujtGmMBo5IQH5Y4mTfhe6qjTrUurqBmIX/lkMES4g2g6Kiw92dSInl8JabloA307NF9/2TIxu4Wm+Lv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMqwDiIj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMqwDiIj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6113CC4CEEF;
	Fri, 23 May 2025 02:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747966207;
	bh=3o3gXIXqgb2ZSDnot6DFESn7N0TnBdXPrFPagY2C53k=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=FMqwDiIjzsRU+iqv99pjfEW5Haz+lAtwPGAMIVEU3wceTrHPXOEywivfH0eCYzIg3
	 5noOe8AwJBDwCouGiQbKgVpD8KxR+XYA/+5rdht2kPLQpCxeEiiOLi79zj3HTCO1K5
	 EqGYQV8rauEhimfOif5HOi9CkXrZnFpsedCF2ctejuOnURZ0uy+xv+/QZI6MN0XO+d
	 RSTOVJ1JejNXZjEhvy3yanoCkK7v49+nHH/bCMYUirkLzXd8DN0iw7nNHLRecNKZK7
	 DSa4P5ySRLkm1xM4VqQzx374xAkhTKj229orELKeld5qvqMej5W/OfqmkCPpvGshos
	 otEcQQTWYuLTA==
Message-ID: <83b07b9f-031e-402e-9736-986651d870c2@kernel.org>
Date: Fri, 23 May 2025 10:10:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, niuzhiguo84@gmail.com, ke.wang@unisoc.com,
 Hao_hao.Wang@unisoc.com
Subject: Re: [PATCH 1/2] f2fs: use d_inode(dentry) cleanup dentry->d_inode
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/14/25 16:45, Zhiguo Niu wrote:
> no logic changes.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
