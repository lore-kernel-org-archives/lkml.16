Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405DF2E11BF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829582; cv=none; b=NwgJwWLDhJvyI9RIO2Uagf1aOgEhnmUrPCvOL88YvRswnaPCcpZ2MEH4nGNPEtdmmdy4vM6BRoGHTukDppAbWAnrQDL7WIePgCp8NI8F+Gbk7hUeNYPvUE7C2ZzbfCWugWyAKz3zhuAILZHt0AWcdkIl0DSOLzd8CrYIVx2AP50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829582; c=relaxed/simple;
	bh=uaH1xVBzEX1wQl3zNVsgm5Cm5l4gfuLRI34UpYO4V2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQV45bp22GRo0ZTCy6OMx65WgUJiOP/g0JvFxsQ+uUtd8PKquywxG3jwoPfECjJqXUkKZwnFKnAaiaUnDfp7pJ/NJ0kyPkZC0x+MYbBfQmDVWMBpFs42TtnCsrAdMeCUfvtSk2oKSZf23dEDmbz21iVWR6x0++aMzOlWF2LMDZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLe2kEHt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLe2kEHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12BEC4CEE3;
	Fri, 13 Jun 2025 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749829581;
	bh=uaH1xVBzEX1wQl3zNVsgm5Cm5l4gfuLRI34UpYO4V2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mLe2kEHta0ii7bN0EtXu/yxvL3lssnj0wCLqINfz+M5a+U/ScCeFt7OtssuK0w/yx
	 9180bypmfxz4z87JUjaS/p98g4O1/1h+qqHM66N279c1uLjGebqhG2trjBTGRgUwps
	 RKaPU5f+veawU4HDFbzPOISkmtS4SpcK9/jSWBerfVbxrQoqStB9sekiUHqp0K8y3A
	 isSrVKIz0IBmlPqyRriCVSDvYvC2GVtLv+Dp76rZInMkRRX0B8bIqGG4M6zE5kxffA
	 cJQl+Z3tv+ZLJ9AqjOtz9gL/CPLsO+dOlMZmVQYKNjAh8JyDK1dugv067D+Ft11Dl6
	 /eayx/p8dDDtA==
Message-ID: <dfd2f320-4f33-4638-ad5c-891e00eaf45a@kernel.org>
Date: Fri, 13 Jun 2025 17:46:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: fix a use-after-free in
 r535_gsp_rpc_push()
To: Zhi Wang <zhiw@nvidia.com>
Cc: lyude@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, aniketa@nvidia.com, arpitj@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
References: <20250527163712.3444-1-zhiw@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250527163712.3444-1-zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/27/25 6:37 PM, Zhi Wang wrote:
> The RPC container is released after being passed to r535_gsp_rpc_send().
> 
> When sending the initial fragment of a large RPC and passing the
> caller's RPC container, the container will be freed prematurely. Subsequent
> attempts to send remaining fragments will therefore result in a
> use-after-free.
> 
> Allocate a temporary RPC container for holding the initial fragment of a
> large RPC when sending. Free the caller's container when all fragments
> are successfully sent.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Applied to drm-misc-fixes, thanks!
