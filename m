Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22F933086
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875654; cv=none; b=AdeC/cXn3nlWX+AYfdSpZxE1/Dynl8JEWuvU0JGKWQtAYXAYHptc1BTDHYT4IE+cVSNgVe6ib3hptXXcRlGY4Y4Jghg4wszXvWl5iFkNsbJPgxr8zNGD6XyCFJb/29wag1R8DQogfmt9+GK8HttD9wZWIrFzOJ2RHU797no7jLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875654; c=relaxed/simple;
	bh=gaGzM2w31GMpScgpRrG0d0Qo6Bc7JT43U7e3UXyWTKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5aw5wXk9+KDK7GEAZgDN9mFSvfA0Ri2gLRzk2+gXKdzFbmSdrLSrc7940CR6MxVR85R6eBM/wJZsh4FN2GbvXXXqVPNH3aaCy2PxAJxbinbAg8WtZ48QXhhe0YSwWwsi8EmHo0sd77HY4oiOvkRRjo3CTk52K67+jCsoFN3dIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPU68Xsr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPU68Xsr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFE7C4CEEA;
	Wed, 25 Jun 2025 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750875653;
	bh=gaGzM2w31GMpScgpRrG0d0Qo6Bc7JT43U7e3UXyWTKM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LPU68XsrchUxw1g90Sarr0/D8SscqUfjU+zuO2UD6AB4xks+uZDrHkg3I88U1k6pE
	 fq7x6zr23fEel7icKbPOcniuzE4H/bAUykpOFW1r7G+5wa2wLW1aazG9AjfHEivGvc
	 xmS1kxGZb4Oi3/T2E6LBIX7g23Q4bPRX51cIO1rUZYlRMn2P1Hdf5TfY1XcVf9k10U
	 /E/BrIPtdXzPB578hB0Qhi0t7uq1Bbbr4+sV58eG9nByFr5IsEwOig7sWPDIxtJK5+
	 zNEbRHpZOhr/JB857o6FfpX1dN26dfwTavdMLleETWi8ny4NhX15UGPuTyOciFA5mu
	 Nx3WQCEbVa+8w==
Message-ID: <cdaa3640-64ac-4fb0-ba6b-52dc65988d70@kernel.org>
Date: Wed, 25 Jun 2025 20:20:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: replace `Duration` with `Delta`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250624-nova-delta-v1-1-b37d75a593ac@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250624-nova-delta-v1-1-b37d75a593ac@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 2:59 PM, Alexandre Courbot wrote:
> The kernel's `Delta` type was not available when the `wait_on` function
> was introduced. Now that it is, switch to it as it is more compact than
> `Duration` and cannot panic.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to nova-next, thanks!
