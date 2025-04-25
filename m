Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44502417C5;
	Fri, 25 Apr 2025 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581911; cv=none; b=EeLZR95f9AnjKa9XsKcSd7/SS/dtmtYk6r8gRlDc2nGHmv9ISn9l33KwkLjf0WEtQv4hSGq6EiH9pvvMVhn4ofzq7w4ylapJGlvCELKKSvfJimC+Vao7rY4Rb6rYEbTJZuIaGFcNtCFedKRoWrMyFD58Y0P5PtzNNnT1NKVndhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581911; c=relaxed/simple;
	bh=LUXrYjZVHEgsBdp2HP2c1CeQ9o3InPu5P70jXNk78eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZ9LROP6TMOwCOxmthSlCtYXrE1wySOqF+CXXFmWHAvcBEbnv7Lb905jdr76p3sPg8E/3cQKCixPU9NOsyjXiZxNdc4eLdbEIu4wXD8h0HDL4cpOZTe2LugUe1xIYIrVJAFtkI6LprExB0hKjyrnBbmqZ7sfv19m5DNj7YWqoGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0gAQqvwv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0gAQqvwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E19C4CEE4;
	Fri, 25 Apr 2025 11:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745581910;
	bh=LUXrYjZVHEgsBdp2HP2c1CeQ9o3InPu5P70jXNk78eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0gAQqvwvYYDi4pF93Vtf949BGBBOSxDsljdQHdWSnKImwpb7Oxks4YCiLLBxqhK5h
	 OrqWoeRVpKQtG8o/ZL4Zi2iE9/woJveAYyBTkSn9ZiqLE2WIhwZ22VwNFh4pcagJnA
	 gE6nBWAX7KfzQupfm1ZWmNcmdCYwzwtKwbs5+h6c=
Date: Fri, 25 Apr 2025 13:51:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [Patch]: staging: greybus: camera: fix alignment should
 match open parentheses
Message-ID: <2025042527-ligament-backlog-f512@gregkh>
References: <aApq_JPIBhnGqfiR@andreas-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aApq_JPIBhnGqfiR@andreas-VirtualBox>

On Thu, Apr 24, 2025 at 06:46:52PM +0200, Andreas Kleinbichler wrote:
> Correct the alignment of the parameters to match the open parenthesis.
> 
> Reported by checkpatch:
> 
>         CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
> ---
>  drivers/staging/greybus/camera.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index ec9fddfc0b14..a1b76df39a8f 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -263,9 +263,10 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
>   * Validate the stream configuration response verifying padding is correctly
>   * set and the returned number of streams is supported
>   */
> -static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp,
> -		unsigned int nstreams)
> +static const int gb_camera_configure_streams_validate_response
> +	(struct gb_camera *gcam,

But that's not right either :(

There is no real "fix" possible for this warning, sorry.

greg k-h
