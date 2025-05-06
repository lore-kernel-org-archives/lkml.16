Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8DB1EB5C9
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517503; cv=none; b=R+qC15lyjLSjHDkI4BpdqlBei6olUpjexNZLA3QLnitHE8WNIbKsuHAyrGSUG5ujMM/Boc2ig34wcX4IYy4CIpxcSBt3w7kuJ55R3LSGJkes5SD9W0MZj9siozYYeDw/6RAXLC20gA+lGc4+Ql7T1EbKPXlLoW2XB2Pt1o7P3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517503; c=relaxed/simple;
	bh=B6sC1f2QNO64o97AJnkfgwsT5Z+gGdMAqFOk0d0vM70=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BSHR3mMm0huxF7LETiHSywkogzJt3k07/M/WQy7JSdpr2+Dd6ffnT/0yqF5e+BTFOQi3So+XC9HpN29MGy2tBIppFgMU3keITc4X/3MD2HX8g9n/OUIm5OpKr9DmRz9/hZ8cDrx2io63smLXxZq4/VUmboWMIs0CiksSY7AToKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=la/onv/B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="la/onv/B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB46C4CEE4;
	Tue,  6 May 2025 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746517502;
	bh=B6sC1f2QNO64o97AJnkfgwsT5Z+gGdMAqFOk0d0vM70=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=la/onv/BI/oYLBcOQz9X10kjDlF/XA9P8ET2UdKui3O673PK9OFCP+UdrO/Xq97qL
	 z4eBaAnx8WMCu5/WPq4xxhVq/wjlfONpGHxfCaoN8SP1hG4BN10RjfT9ZixNPOJBq9
	 6lUncF56JfEUO0OGDfsYNorBKzjL6LepoEVq96kOODTMnq7FzK4HsxCpJmKxZRqKRi
	 Uci8itVQL6fP17siOrdCdUFo6pTkZhyDnXdWfNGO9YEkl+wvXklkgsgpIJJHVm0cg9
	 XQCZnaWe8YqBPEnvuDh3zc4bc4PWPsTJuQCyHWsjJ/J8GFe+kQqjEaTY0vJu3zZ+FU
	 8+CPEA23jnPOw==
Message-ID: <b19dbd5a-bb6e-4e7f-b914-bc5d921276c8@kernel.org>
Date: Tue, 6 May 2025 15:44:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v5] f2fs-tools: introduce fault injection to
 fsck
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250430183530.3254943-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250430183530.3254943-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/5/1 2:35, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Due to the difficulty of intentionally corrupting specific metadata on
> some storage devices like zoned storage devices, it is challenging to
> effectively verify fsck functionality. To facilitate this verification,
> it is necessary to add a fault injection mode.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
