Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE913209;
	Fri, 16 May 2025 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404615; cv=none; b=AOQQqaUCpKN3QagjAU406OdWhZSDLpnG/OUpU5J/K3VmFiBoDWwwssGEclqo90SovYoppEYWoNwWOwq5xcAhckJAixI7f/MQHnKkyGYljl55YV1Z31fW09TLUgzF+iqXeg1TTYSuiXHAund2dof87HFarLP7SzD4mymhDBbPlLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404615; c=relaxed/simple;
	bh=LYYrNFafkCxBXNIP0MdzmtAPl7HX5/WtNzfIhSCjBB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0hEE2N21oK9NT094G0S9bbSlYpsJr5vq+TprgXS3i3ysRcaSCpC4PvoOsQXP1bWDZepfSV8dPgMKZRBtGBEaW1cyYQeye6kRi0h9SFkdtd8WOEhgiApQPSyB+zpvzTRQOYvIXWKZtD4jBZgUrI+0+qOo7UtfUNN/ekms4HlCZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9/ozvWa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9/ozvWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6B3C4CEE4;
	Fri, 16 May 2025 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747404614;
	bh=LYYrNFafkCxBXNIP0MdzmtAPl7HX5/WtNzfIhSCjBB4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a9/ozvWampK7x8Pa8fAWqI6Ga5XbILUpFy4CffEmV4wJ/5hFXOF6bR+ZmdohVzsfw
	 hDmowLs6VsoO51wyyeLeA0+YnoxkkdnfawaxkXrb2TZhMOU3FnD5Y9+Y/ykUQQklbE
	 1H1LVfskozYBUp3bN6wY6DTydINISYiEncJZgA1ClTs3xSu8SqxvsIsBJrSFXzVGuQ
	 r6qV/BWObuarevcIBboydG1WrG6PbtI8mNY2yospB8Qb1gacts/YXy10kIFsBIqS6Z
	 N+5HbU/G60+9GaqlMtmpehzpmAZN8oIAS+9gt61jMAzX0dJ9QuPGIs7Od0RRWSMj0L
	 Qf3K+pEAcj73A==
Message-ID: <04c07c31-6481-48da-a7a6-002acce7a3eb@kernel.org>
Date: Fri, 16 May 2025 16:10:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/fifo: small cleanup in nvkm_chan_cctx_get()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aBHaCM66pXaP84ei@stanley.mountain>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aBHaCM66pXaP84ei@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/25 10:06 AM, Dan Carpenter wrote:
> "&chan->cgrp->mutex" and "&cgrp->mutex" are the same thing.  Use
> "&cgrp->mutex" consistently.  It looks nicer and it silences a
> Smatch static checker warning.

Applied to drm-misc-next, thanks!
