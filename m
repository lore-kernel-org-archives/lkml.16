Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0462F136E;
	Sun,  6 Jul 2025 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751814065; cv=none; b=PvdFMRqwBQ2KIgqf8xo0IQS3A5hW4Mwc7isSJDVLbSXTXTuvaBgU/nTIACqVFngZCGEhEpRC540+x5/SLZ6bXduR+r9UgVpVHMIIZtkK3VJPVUSqB5t1IKHfoJhHsS2kg0D9i5wtywTBuLw+57ghDV0mKw9o7BDQwprxTsKuRbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751814065; c=relaxed/simple;
	bh=wxD5NaCEQvIO77/Aqk12w1R3fsXVl2HTOBj/rxBOxg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blSmAf+XzeiMCV7ERfRQIkvpextdrUJE6ZGg5LFbBocDXSlOk67ihsKgFTZG2grcOgRpMifau3h8oOHMilJtJuV7S2juLkfuNdcQ5D1YoJ3xQSBBiFvy+ezuvFmbSoE1DJq0xG1ru5zZl7NREnJLI8EpyrpdoQABamCWQ07+oAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvpDNYva; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvpDNYva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944DAC4CEF3;
	Sun,  6 Jul 2025 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751814064;
	bh=wxD5NaCEQvIO77/Aqk12w1R3fsXVl2HTOBj/rxBOxg8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EvpDNYva7ni7wbZ6wlpnOoKk/bmzhOUIQ8R9fpc6kA135TIMwF6Ou26s+xF7JAELS
	 UpbBVxITaWXUdUGPLon+qQHFhiiS/ZxV6Kc+QSstJbB9JXVdZYXlxpud/pvlJoe0dm
	 7oSYLv+Cp/idmpLHUE5YhPsPNyD3DBm2eD6IJ3x39suAfbVhCBzHnfG9i9ghip50Ye
	 snqeYby4Udx8tEEFOZczd96Ycizqa9+ynQKEbZs7U98lhH+6OWmQ95vEK4iAlXaoLZ
	 888wdlwHw2j94HGQEjYPDfwHFwkk89jGer11iJjjU3uROWl35qHWrPxpZ6vFSYPwRC
	 4kALDMP0xVhJA==
Message-ID: <6213cdfb-4638-4ff5-adc2-71fdd78b2604@kernel.org>
Date: Sun, 6 Jul 2025 17:01:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4 V2] Staging: media: atomisp: i2c: removed redundand
 debug message
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Andreatta <thomas.andreatta2000@gmail.com>
References: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
 <20250619084420.146151-2-thomas.andreatta2000@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250619084420.146151-2-thomas.andreatta2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Jun-25 10:44 AM, Thomas Andreatta wrote:
> Checkpatch fix: deleted `dev_dbg()` printing the name of the function.
>                 ftrace can be used instead.
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 857d7175942c..6fc39ab95e46 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -779,8 +779,6 @@ static void gc2235_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct gc2235_device *dev = to_gc2235_sensor(sd);
>  
> -	dev_dbg(&client->dev, "gc2235_remove...\n");
> -
>  	dev->platform_data->csi_cfg(sd, 0);
>  
>  	v4l2_device_unregister_subdev(sd);

