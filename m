Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FD619CCEA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482204; cv=none; b=h8EvFFix5aF/8JS6MZfPSKs06HmJjdu8TSkVNt6+6FWInG1VIT85V0Mihbao+4G6Pm+lDVcCr2TxLbKG9eZJo4oz8hISJr3cjW0vYnSlf9OwyK9g/1oerdhXSO+ca9tLHPO3Y+6Fseve4agMnPsYE93mcj9l7eT3fPdcRTHuGcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482204; c=relaxed/simple;
	bh=FUSF6dmhuuTU8raDy8wQzUQyI+F+nNdK7RweTlozMxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lPlwoJNZXgIs7wfPoopyucwOvE3DMBEZ6t6Pa5rWEfwkXayT8SO7a6QVOlZP2+pqBEGgZf9RgOeQNgTlSU3/w6UOSLJMAWjn186dQPc1twIrTU3pxIISbrqbwWwmKZcZwK7+vqlQ8prRc/IGqgw8nnNrjGUe0HR165YZuEV6U78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IObR2D6p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IObR2D6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C291C4CEEB;
	Thu, 24 Apr 2025 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745482204;
	bh=FUSF6dmhuuTU8raDy8wQzUQyI+F+nNdK7RweTlozMxc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IObR2D6pKLpVpEB7jtcJyvFaesOQGUAEp90przdD74Cetq6B8w47sI2W7iuthQAF0
	 C9FKXzJlS8QZ956UI8l3Qvy4PVSD8X42gjJ25fsL5zs1NXFBuDFn/wwlpjZhrgPsNw
	 HYeWLwno/Y+5Xs6xLFNTxHUyuxz7Rn0/bL86ZBpo56EqBjzNoGZBfiLGaOKqjV3OK+
	 0Jpiym+fG6PAg86ERCjh+J3o17Zu0YLoYrMm4kjPhu/xbreiFlir66xGrBGoD8NmcW
	 Rjdc3moTDk512AvxKuMV7CyboKmDQCZKYjetpoUrQTlxDV0dB+AMh75U4/sJu9JmpB
	 zJIfGUPKtc1EQ==
Message-ID: <bd36327b-53e0-43d8-95c9-b26c2905720e@kernel.org>
Date: Thu, 24 Apr 2025 10:10:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Additional documentation for nova-core
To: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
 <D9EH7958IAJZ.1R6EJXUR5H3NB@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <D9EH7958IAJZ.1R6EJXUR5H3NB@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/25 3:25 AM, Alexandre Courbot wrote:
> Thanks a lot for doing this, this was severely missing from the
> WPR2 patchset.
> 
> Due to the strong focus on documentation, and in order to ease merging,
> I think it makes sense to keep this separate from the WPR2 patchset and
> merge it on top of it. Danilo, would that work for you?

Perfectly fine for me!

@Joel: Thanks a lot for this work, appreciate it!
