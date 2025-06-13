Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6392E11BF;
	Fri, 13 Jun 2025 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829564; cv=none; b=P+E2O7ypIMn81oGKJuuMUDLgPsLNSjN3VXYvbqCIA1jf8IfbttMdd+asbU8bVWQ+UjoQACQLWi+7TzDGnqwvTZIHTtlyY3A2m9mEQ32GtWbGEzdtoohswS6bws4tQyQ+pxxJSZ9C0fVPR9W5SY+n7w22yD2X1kM4aRCbtVEEDks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829564; c=relaxed/simple;
	bh=nOgmaHF835CDydrDSXIMKjIVAD7R+qO1Y1v6X7VmPQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGPphqwhtlMWW6w97lKDjFuIwCMaoi9u9TdlzAVKcSxeLswQ0qCg35DGwa1X9q6iFmbIhWR/1vmSi9LkD+dFWLqfBtz1HrUxVlLF9maQAV61zouGUfwrXOV3eK+4f1hWqia7txfCRpte1BkW+YrVkyMEf6VaOcCtLiNuBGaDPEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIEs58QW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIEs58QW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED9AC4CEE3;
	Fri, 13 Jun 2025 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749829563;
	bh=nOgmaHF835CDydrDSXIMKjIVAD7R+qO1Y1v6X7VmPQA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vIEs58QWwvNcIIydKfkw6Bd+qZ+i+hMIXPj7yGbY/Xdjtc7OQS3/PSG1p8PTuZpAQ
	 ee5oIJmeaLLOSAQfH468TYuvNid4UI9HzxO8KAy3M0/09d2t3H+ubMHpEEaOGVlIQb
	 daEZm9/oR2C8Rms+ZwNWU0rdGPFGgMcTFlpq/rwctLhtKzPHlfsxuWotMeeKd0fdPj
	 n17B2pqpXRoNc7jhvBSv2dpqSAqCLe6jWwD7DdiqEAtLA5477tW2EZiptxnpdGsJOa
	 S4MQ4H5h9kv51T32Di/Vtj3NomyGUWLRd/abvXCxpHOGYvcEnPJKGc9i+81Hde1FZT
	 GLqq/+bC+8nuA==
Message-ID: <6cf12bdc-e84d-4902-bd20-b14c880a2996@kernel.org>
Date: Fri, 13 Jun 2025 17:45:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau/gsp: Fix potential integer overflow on
 integer shifts
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250522131512.2768310-1-colin.i.king@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250522131512.2768310-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/25 3:15 PM, Colin Ian King wrote:
> The left shift int 32 bit integer constants 1 is evaluated using 32 bit
> arithmetic and then assigned to a 64 bit unsigned integer. In the case
> where the shift is 32 or more this can lead to an overflow. Avoid this
> by shifting using the BIT_ULL macro instead.
> 
> Fixes: 6c3ac7bcfcff ("drm/nouveau/gsp: support deeper page tables in COPY_SERVER_RESERVED_PDES")
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to drm-misc-fixes, thanks!
