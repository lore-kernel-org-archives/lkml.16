Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D6C242910;
	Fri, 25 Apr 2025 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579705; cv=none; b=cziz76AT6PhjFf8KrlSiVLbsRKdkiYw7NeJI9FHMiTOSLWSJDBdwnmZXh0K0M1/IXeqFM59//HmzY69roaORLMs8QIymCNh+VW6USQZrZmb1sPLRZywVoNfG5kx39M1R2Bd4/UTZtX4kzFdzZFN+rIVZ1JQjKbcDMCMVoeG0HyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579705; c=relaxed/simple;
	bh=waDywjXtUpYlX4zD/1tQfAt0I25YpPBSHWche6leJNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwOF9F4xpa+KFNrk98wOP/myNvmlhXG5JkKXTPEIy+Q+gBojdsEwJONH5bAxC4RjhyiqL70cMrA0qD0c7GFTeEuf9MkqMRBbHsnVksPIIYF3/oeWzU3mBvE0jbivuHiE7OplJXuy8Ef9TfYW55LcBUk53CyqSlUfxZuPsP9rey4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AnYQkJwR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AnYQkJwR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB49C4CEE4;
	Fri, 25 Apr 2025 11:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745579704;
	bh=waDywjXtUpYlX4zD/1tQfAt0I25YpPBSHWche6leJNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AnYQkJwRNKU4Tf69i1YG7bFC3KdnMW2cR1Z3jD+PV7AjQVZKqOSnKcEHe+uo3HqZY
	 5GzNdj0jtiGMrVQi2AGzUQWJtp0CcdapkteeZ3OBZBgCit7cyeEL40u0qS68juADvm
	 bZmtYA4ZLIQ/9UEuCOSKrK5NZX2/SVSzPe4l/W1o=
Date: Fri, 25 Apr 2025 13:15:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
	sumit.garg@kernel.org, gargaditya08@live.com, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com,
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk,
	broonie@kernel.org, quic_wcheng@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 4/4] usb: host: enable USB offload during system sleep
Message-ID: <2025042543-unfocused-whiff-fa7d@gregkh>
References: <20250416144917.16822-1-guanyulin@google.com>
 <20250416144917.16822-5-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416144917.16822-5-guanyulin@google.com>

On Wed, Apr 16, 2025 at 02:43:04PM +0000, Guan-Yu Lin wrote:
> @@ -724,6 +725,8 @@ struct usb_device {
>  	unsigned do_remote_wakeup:1;
>  	unsigned reset_resume:1;
>  	unsigned port_is_suspended:1;
> +	unsigned offload_at_suspend:1;
> +	int offload_usage;

Why is this moved now?  Why isn't it in the proper place from the
beginning?

thanks,

greg k-h
