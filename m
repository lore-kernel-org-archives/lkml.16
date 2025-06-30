Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38C9191F92;
	Mon, 30 Jun 2025 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279845; cv=none; b=B1WxUQUgrbFOI67KNqDbCS6eyF4ZFkX1P9GF6YbB4KmxFoRIXXSSMklAZP4VKpyoaKphReLjniX3K5VRF2JQuikaG+96PjlPnjcI/AxQzzj81el2yXmIxS8kDMZGngz9YrXzUoCDysRiAzktj56YK47cTr35/sf37cB8M96o3Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279845; c=relaxed/simple;
	bh=I6v7+2Lj0U1E1xur/fLOtCrs41aLHuKzyBm8BqVEENQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXn6Q9ypFHJW8cXSVvZUgC/CchNlQs6ij7wLRUbeHj6XsjX8onmfKKGnpDuNJb4Sk3ALfP8U+K0hTh3THh0e93U3kvb6tDtONXNBMCne7cLJCqoy7wTx0zqxn+c974S9sec4UVXQnL8z9GF0YytNWLqaWhcNUpov43mVc24HLKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNiJxc4e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNiJxc4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2567C4CEE3;
	Mon, 30 Jun 2025 10:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751279845;
	bh=I6v7+2Lj0U1E1xur/fLOtCrs41aLHuKzyBm8BqVEENQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mNiJxc4ehbWTc79WumhE2WdTKIwy28mnieiWoKlI9et2AwCDyoknaQXQ/11BqsENH
	 AGjzTIxt92wtTsOc1MRKmS9pKG5ZRJLrXRo4oY1/8m2tkzFLDrSTm6PvaHgvvR6czl
	 5He6BKrdehdSlC7zheDBNgY9T+FRudrHenXwvHSAA48D2c/xrEWR4fkkhCteQciyYa
	 9Bqr5Adgec2yc6t9tWJG03jT3xUsOZ3C+qvz/TAwwrJ8K643ut5qHzW7cGteTkYI6V
	 fWpPVyvpqZuFN1T4wFxXKVkPp+ix9iXxK5BFa+bj3/d9EYwczw8caJsSsQDrpscMYy
	 +vzPsv4Nc5DTw==
Message-ID: <36b59175-87ef-459b-9b9d-f7de716f0be5@kernel.org>
Date: Mon, 30 Jun 2025 12:37:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Documentation for nova-core
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250503040802.1411285-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/3/25 6:07 AM, Joel Fernandes wrote:
> Hello,
> 
> Please find attached initial documentation for nova-core mainly about the vbios
> and boot process. It helps build an understanding of the boot code. All the
> information is derived from publicly available code and sources.

Has there been a follow-up on the series? I think it'd be great to apply, now
that we landed the FWSEC-FRTS series.

- Danilo
