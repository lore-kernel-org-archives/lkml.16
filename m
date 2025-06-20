Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785342E8DF7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433318; cv=none; b=hYs3xuHv94+YXtoPf9+EY7DOJtDcm669XP7sU3gBblp1UxgROEdv4M0Y4N06r2lEynN4nfgb6ZfputkeX2qLfXOxtNVb71I9lN4KKf1xunAZ8IMOwEqJZ+ygdGEky5JLn8JqtBuRVhRYUo9PJCj5FEfVgxNa8zEVKeI640EVNxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433318; c=relaxed/simple;
	bh=u+xPzEuEAEP6yiVJSO581cpWVqlYy9aICaz+1YmCR+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFfJqh7B4f73kxBnzPe9wQDOOh/HSVrfxqienUbl4uKQdzM97OPOKuCI3AxaxtCphFy/AMyN4cNwXyqRoZzjwQ6C5fPi9FPKPXP10X1hhdEk62AILHr9AT0tgIs0Sf7acqMSQrvaNokjDjk17mPF0TX1QfFHTwcjaFRpXldSFBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B02E16F2;
	Fri, 20 Jun 2025 08:28:16 -0700 (PDT)
Received: from [10.1.30.22] (e122027.cambridge.arm.com [10.1.30.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DDF83F673;
	Fri, 20 Jun 2025 08:28:33 -0700 (PDT)
Message-ID: <057bf373-7860-4b93-93c2-218adbff61a2@arm.com>
Date: Fri, 20 Jun 2025 16:28:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/panthor: Introduce sampling sessions to handle
 userspace clients
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Lukas,

I was going to try testing this out, but it doesn't look functional. See
below.

On 16/05/2025 16:49, Lukas Zapolskas wrote:
[...]
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index 9365ce9fed04..15fa533731f3 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -2,13 +2,177 @@
>  /* Copyright 2023 Collabora Ltd */
>  /* Copyright 2025 Arm ltd. */
>  
> -#include <linux/bitops.h>
> +#include <drm/drm_gem.h>
>  #include <drm/panthor_drm.h>
> +#include <linux/bitops.h>
> +#include <linux/circ_buf.h>
>  
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
>  #include "panthor_perf.h"
>  
> +/**
> + * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
> + *                        to the maximum number of counters available for selection on the newest
> + *                        Mali GPUs (128 as of the Mali-Gx15).
> + */
> +#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
> +
> +enum panthor_perf_session_state {
> +	/** @PANTHOR_PERF_SESSION_ACTIVE: The session is active and can be used for sampling. */
> +	PANTHOR_PERF_SESSION_ACTIVE = 0,
> +
> +	/**
> +	 * @PANTHOR_PERF_SESSION_OVERFLOW: The session encountered an overflow in one of the
> +	 *                                 counters during the last sampling period. This flag
> +	 *                                 gets propagated as part of samples emitted for this
> +	 *                                 session, to ensure the userspace client can gracefully
> +	 *                                 handle this data corruption.
> +	 */
> +	PANTHOR_PERF_SESSION_OVERFLOW,
> +
> +	/* Must be last */
> +	PANTHOR_PERF_SESSION_MAX,
> +};
> +
> +struct panthor_perf_enable_masks {
> +	/**
> +	 * @mask: Array of bitmasks indicating the counters userspace requested, where
> +	 *        one bit represents a single counter. Used to build the firmware configuration
> +	 *        and ensure that userspace clients obtain only the counters they requested.
> +	 */
> +	unsigned long mask[DRM_PANTHOR_PERF_BLOCK_MAX][BITS_TO_LONGS(PANTHOR_PERF_EM_BITS)];
> +};
> +
> +struct panthor_perf_counter_block {
> +	struct drm_panthor_perf_block_header header;
> +	u64 counters[];
> +};

I think something has gone rather wrong in a rebasing. This struct was
already added in patch 2. So this causes a build error (that the kernel
test robot caught too).

[...]
> @@ -72,6 +236,122 @@ static void panthor_perf_info_init(struct panthor_device *ptdev)
>  	perf_info->sample_size = session_get_user_sample_size(perf_info);
>  }
>  
> +static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
> +		*setup_args)

There's some code style mis-formatting like this - which is then fixed
up in patch 5. So it looks like you've applied fixups to the wrong commit.

Also this series will need rebasing because there's some upstream
changes that it's now conflicting with. The base commit looks pretty
ancient now.

Thanks,
Steve

