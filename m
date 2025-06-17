Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D3D27380D;
	Tue, 17 Jun 2025 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750138149; cv=none; b=J/msM68smlM4J+qbxYhvM7R9AweduyBFMSutClogvZEr1uhITXE4+savsXzd9NBiHvu8T5DBwQFDuurvTXvYh59DLSFqdEBAg9LFJiWss+C0XXRq/n7qBidcWToWf9/OGa9mEUcvQrYQVOF03tGK8y+10VuA0SVfjGfeFFpHH+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750138149; c=relaxed/simple;
	bh=wrhH2b7tnvyCZ1ZGxtLKRIhbXD+nPH9Auh/Dhzgwcfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9lE6k+eh0r6YC6vG17MMreuEZ03kHs74g5kFa8qR5pZD9YOiiA7mnk7mGXd8XS8J1n6SBbOJ+BOP9vLghxgQ2jJdHKcGHHmp/Vth+pzQX+iJMg4zBl6GGEsvY6Kx4BeDbfmFM/bstix1R5ru1+zG/0nKYbbyUDZ2xkc2syeep0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEKjucv9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEKjucv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABED0C4CEE3;
	Tue, 17 Jun 2025 05:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750138149;
	bh=wrhH2b7tnvyCZ1ZGxtLKRIhbXD+nPH9Auh/Dhzgwcfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEKjucv9PP/nKEokjwzBmvQAmKfyl+mCxY2Oey071VsL0wtxfE7sDBrh7jxS3QX8M
	 h8mPMc7aVTV/Hcv9pH0HYkftEgtoODKAc41bnT3zan76S1OuulHjLC0CKt+dOlDgbW
	 JwurdMrbaV5rMW3FLZOjxiIhGrvsK26D8EM9yCuz8oV+dPO0In4ilvRsmvZkow79Nu
	 3rQKaR4jv4RaLU435/X1E1VsT8vnSJWRV4V2M/H42ipB0pgCIYET3wgPu/7IGlEqgF
	 K0vaW5JHDUznIqyp+MK7Z/vUVNufaWx/fxVKgfkyjgwnm0k/K8BOkrjvhvQMJOqQsz
	 iu5ngR+GxKy/A==
Date: Tue, 17 Jun 2025 10:59:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	sanyog.r.kale@intel.com, ~lkcamp/patches@lists.sr.ht,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: debugfs: initialize ktime_t variables before
 div_u64
Message-ID: <aFD9IVIUt1n7xJG4@vaman>
References: <20250617015230.54981-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617015230.54981-1-rodrigo.gobbi.7@gmail.com>

On 16-06-25, 22:48, Rodrigo Gobbi wrote:
> The start_t and finish_t variables are not properly initialized
> if errors happens over request_firmware actions. This was also detected by smatch:
> 
> drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'finish_t'.
> drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'start_t'.

Should we care about debug statement printing wrong time on error...
Rather than do this, better to move debug statement up so that it is not
executed on error scenario

> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-sound/0db6d0bf-7bac-43a7-b624-a00d3d2bf829@stanley.mountain/
> Fixes: bb5cb09eedce ("soundwire: debugfs: add interface for BPT/BRA transfers")
> ---
>  drivers/soundwire/debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
> index 3099ea074f10..951fc255e4eb 100644
> --- a/drivers/soundwire/debugfs.c
> +++ b/drivers/soundwire/debugfs.c
> @@ -237,8 +237,8 @@ static int cmd_go(void *data, u64 value)
>  {
>  	const struct firmware *fw = NULL;
>  	struct sdw_slave *slave = data;
> -	ktime_t start_t;
> -	ktime_t finish_t;
> +	ktime_t start_t = 0;
> +	ktime_t finish_t = 0;
>  	int ret;
>  
>  	if (value != 1)
> -- 
> 2.49.0

-- 
~Vinod
