Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C5B19B3EC;
	Thu, 26 Jun 2025 17:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959261; cv=none; b=uLudhh4xwk7TtvFCBJSWRuK9r81gmYnbjxcIK0PP/x1RCu7KtCK+SAdc8tiZkkRP9ODJsn5COd2y1RocdXviXOiDhesGU4SXUBHf5yMjCiCDz0yS3C6zcehdyBPNDwfN8h+aUHyt/rarT4gnzTaxKBVLcOPmni/W5NLawYnpHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959261; c=relaxed/simple;
	bh=zEQS1ug5v1lforkO+zqWpi+COmj73DWRUbk05YFmnSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCan8vc1ztQ5YCcQuePoDHtd54E9JK1TNheRp5pXptkh0fZ6bV+/ogK7mEqLV1IwC4Drk68Pf14hMA52oS8nGZrRqeyOx9seDsoDRfGYW7xNcJE19AtIr5nzM3xxD6P4AL8er1hhgCnpFYOz6MbJwq8TsxJgod14BMZ4IVt9pfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVbMnrMA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVbMnrMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4E7C4CEEB;
	Thu, 26 Jun 2025 17:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750959260;
	bh=zEQS1ug5v1lforkO+zqWpi+COmj73DWRUbk05YFmnSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nVbMnrMACT4Kqkly4XlcOPUhXlk1+vFfwFSNJSf4aHKapL2d0Za6G04NXIkINHlGg
	 JmRT73lRGrYidZyPwg2a5BiUwpqMJQOSq47chG7tYzrBF7WDOlsyMwJZWHT8YYyhwY
	 NGodrhrOS4pxv2QPFE4JxUucSNrEwj4RN3qlHNkThHAvtrURJGkuEwhUXJsBYGyogG
	 1+pHohn2v/Wz6QvFt+KZOwsHNrVNw24M7rZH6dAUdmU46HgLmlw1Id8z+R8N/YSrTt
	 xXHB171fRZMN1kZg+1umA0k9Gih6AXN6+fMPvfuaM1nLDDSibezkW3ZGM3W8n4PALM
	 4qfDWd+FsidVg==
Date: Thu, 26 Jun 2025 10:34:19 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	sanyog.r.kale@intel.com, ~lkcamp/patches@lists.sr.ht,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soundwire: debugfs: move debug statement outside of
 error handling
Message-ID: <aF2Em76RGWVpJfg-@vaman>
References: <20250621191522.14415-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621191522.14415-1-rodrigo.gobbi.7@gmail.com>

On 21-06-25, 16:09, Rodrigo Gobbi wrote:
> The start_t and finish_t variables are not properly initialized
> if errors happens over request_firmware actions.
> This was also detected by smatch:
> 
> drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'finish_t'.
> drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'start_t'.
> 
> Initialize those variables and move the debug statement outside of
> firmware error handling.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-sound/0db6d0bf-7bac-43a7-b624-a00d3d2bf829@stanley.mountain/
> Fixes: bb5cb09eedce ("soundwire: debugfs: add interface for BPT/BRA transfers")
> ---
> @Vinod Koul, tks for the suggestion. I`ve kept the ktime_t initialization, after moving
> the debug statement, they are not actually needed, but I think there is no harm to keep that.
> Tks and regards.

Thanks, but I guess lets avoid superfluous initialization. we should
drop this as well

> 
> Changelog:
> v2: moving debug statement
> v1: https://lore.kernel.org/linux-sound/20250617015230.54981-1-rodrigo.gobbi.7@gmail.com/#t
> ---
>  drivers/soundwire/debugfs.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
> index 3099ea074f10..42d2aba285f5 100644
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
> @@ -291,6 +291,9 @@ static int cmd_go(void *data, u64 value)
>  
>  	finish_t = ktime_get();
>  
> +	dev_dbg(&slave->dev, "command completed, num_byte %zu status %d, time %lld ms\n",
> +		num_bytes, ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
> +
>  out:
>  	if (fw)
>  		release_firmware(fw);
> @@ -298,9 +301,6 @@ static int cmd_go(void *data, u64 value)
>  	pm_runtime_mark_last_busy(&slave->dev);
>  	pm_runtime_put(&slave->dev);
>  
> -	dev_dbg(&slave->dev, "command completed, num_byte %zu status %d, time %lld ms\n",
> -		num_bytes, ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
> -
>  	return ret;
>  }
>  DEFINE_DEBUGFS_ATTRIBUTE(cmd_go_fops, NULL,
> -- 
> 2.49.0

-- 
~Vinod
