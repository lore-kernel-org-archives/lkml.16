Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4A92DCBE6
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747966304; cv=none; b=UF01pOWej7ncAt+J24ZSQ7SwYJhvFf3WOaxt71tOJ2iNAZmc1NgQ6J3hOrZlhUdZkdqHElBoFtTfJzo0AHKoFtLAgbH025bZ3E5Zz8pXjQ0spWZC00Cj1tETjwDaoUNdzPeRlHbnxxdmixzDXWGjBwaAeZAK4IBGwRcxyHz2xFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747966304; c=relaxed/simple;
	bh=MQVQ714Mes4figyzBT1sfYw//srKeIIbh4GJGOjRbQw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bJG9JFJOiB8wm9AOh9ajeUUuZn/8VliH7PwbL2x68trhkmE7ZkdKKw5YGVDo5VHP9qrxiWdoPpR7bahLOfZHFe5fq+e8S5t8cJwPZ3yxTH3BxQklzgPIAy83TuaRbTHKHG9KAK5Dl1mQCwEV2l8k3+9av8KHri6pMoeP9GAdQdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1i4e4mc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1i4e4mc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42F9C4CEE4;
	Fri, 23 May 2025 02:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747966303;
	bh=MQVQ714Mes4figyzBT1sfYw//srKeIIbh4GJGOjRbQw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=N1i4e4mctMYZi1snPn+Ejwqi4+AnJKAJDddOX2oEpjoI4t1fJj4dm6sKtyJ6PVdkj
	 SZJ31Y7CeSGDlR+OwpcTt3XkcaQB3MXjmGGERYKt8fkbjp9P1vaXjLKl9SgUhTpeMk
	 xNfi73pf7dOYjaJhfK3YJFxTFOdQ4Xfc/e7xRuTTLfzosLS2OLUbxmsScrJ4TceLJY
	 0HRbnRUbHlMdVQHPRGU64n6EjRPnYO8afgIgnTu6XpU+QFRx/ys3WlZv4sk5tr/W5I
	 NwDQsqNB/f2SJPmAGO0gWaPMdBf3KaYbcHs7pLFxIPKdruXq9yVHPzqCk3vwo2mEmH
	 JYEkxA48jqlFw==
Message-ID: <4aeeec81-63ec-4991-b6b5-9091c67178eb@kernel.org>
Date: Fri, 23 May 2025 10:11:40 +0800
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
Subject: Re: [PATCH 2/2] f2fs: fix to correct check conditions in
 f2fs_cross_rename
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com>
 <1747212349-18425-2-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1747212349-18425-2-git-send-email-zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/14/25 16:45, Zhiguo Niu wrote:
> Should be "old_dir" here.
> 
> Fixes: 5c57132eaf52 ("f2fs: support project quota")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
