Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0441B3923
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343881; cv=none; b=RBsir+0tRS8JrEmuki0tZ8Xz4baSGEE+sLgh1Av8bymHJnp2qzTY/b3By5aB6q+Mv1RZkRqyC0QMm0xaYen//UlMDs0te/m6j7W6qjcohLnrZW7vg0jd+P02AuqvGmWsPR+RPw+/wEqxs3vC66cLkGtrtXSQRCLDCTsxm0mfr98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343881; c=relaxed/simple;
	bh=CpbWcAfGaHy4F+EFWUw79lU+eKjQal3fLI4YNd1mJqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqj2kEBwXufm6ZZqo9U80SjrIN7mrF6jFkkdH3nYzv3VMcEPL8s/IFpdcPmDY0ip/b1REOzRqYvKL/93JzwK4zes6lVqU+9uYiSf/7Ugu5oM6BegnLKZ8HEFYk03snZ4xrLLw/6BfVYBaBIpkgECjph9/CN8l+EGs/gXyFdxphM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GGukmmKI; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGukmmKI"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2e3e58edab5so263917fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750343878; x=1750948678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hItRQ/EsWDhhIfBWpBCEk7E1LEl+Hcojb2DJh97cbHY=;
        b=GGukmmKIqdIqoZEYJ7VAuPkP6w6R9fAVMs9h3seMZR72g9tmNPb1nWucOOXkvvG8AH
         bK3x7aN05gmv+weKP6IQp1OZeonu8zL+XIVD0+i5Vcs8CYR4d8lrkBmCqid6JGvw5EKm
         YdqJt35lDuU3OiGFNe3m5BK6WXoruC3zEqo7HQH/pxLLADP+LfE2jiYm6n0fnypb+i+h
         ix3xGGH69E6HAhkakeKrq9ePbGL69ALZ8MhyY//tZqOjRHZ+mqVpRGoIGYOuYsqVJiiN
         Uf/LKbOH6tKwL0WOOLTyHsEqN9kHKSYnAXQ/nDKQk+k/gPMxJ7cX6ZMs/BtBVln1cTlG
         Vrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343878; x=1750948678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hItRQ/EsWDhhIfBWpBCEk7E1LEl+Hcojb2DJh97cbHY=;
        b=n5e9bS40f+YEKZxKWrOxco48iUvyguqJm9tCjL4abROtF40m1m5xkfhsAtIL1mSzJX
         oTGkkprpKRP6KUW+rABRzMVG9S0cOGsEd319nWzB1TVKAMWvuYrAX6ZnGnJr+5di4Z1D
         VsGAalT2XTDn/uX/ufaVwZfTWo6AKRKEcx3Ts0lLz9M/IU7B+naMILhvAk+rQlCrolNO
         BEFT/Bk3618AGbGVzO9dxfOU8VlDS2LkcZREULQiUQ5c6F2RwGFWH/VGI7MVFLq0EvEF
         orA+fYoVTd6RljSuyoMPSljpezVwoMeNGP3u6vS4e3mzIWjLhmMJ20kf7PjhoFUfKWl/
         LDQg==
X-Gm-Message-State: AOJu0YyukZexyCz+MNGw7yV6fxnzQD2yX6tdyRfVn6xHuUS+IHKztuad
	K3MutR2f9zpBkg6OEtHOjBAY3jRnBAovJqBsmqttYR2cilcfE4RGD6Pn8TKmdZjv0WWuYg0Ztsv
	pKTse
X-Gm-Gg: ASbGnctpgSScg2LGapGdnA0FCn0hPSpS3PZXm2eBkPtHnY9rprDoGBAhIn1DVLOh3Hy
	4zol4guXHg7VCHaobuyexUPzCea45MBUxVguFqU+9NPPmH4QthMjf6c+uKzNXEORf3jWQoKRcyf
	WPT26xXjtdDdr/kWFu0wTgc64qT2+udmhFUyfYlbs9FizEQv1Fa59SmjT1WCxTuGrqFJIrguFzP
	1XoFueSWh420T3yQk8rfpQNApFyQcN82qTnQtjWvnKalMTPknv5dhL/dr2hvJOc0012EcBHItdO
	AdqriyoGYG+CccUODmomiXz7jg9jUaIPf2t8bfR8mYAVueBEKHyK5o2Oeu0XLvhmBzW5BA==
X-Google-Smtp-Source: AGHT+IF5wWj1FQ6BbyupArvuY9tJtohfhdhFBgl6f0a/VE3YSxqXuNxxcAbMe+rm13ajKH0dqzjQsg==
X-Received: by 2002:a05:6870:d0d5:b0:2d5:2955:aa6a with SMTP id 586e51a60fabf-2eaf0830607mr11507270fac.7.1750343877826;
        Thu, 19 Jun 2025 07:37:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eba625607dsm358428fac.45.2025.06.19.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:37:57 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:37:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Add new inflight tracing
 functionality
Message-ID: <514e4b89-d48a-41b9-bd63-0d52249bba7a@suswa.mountain>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-5-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-5-philip.radford@arm.com>

On Thu, Jun 19, 2025 at 12:20:04PM +0000, Philip Radford wrote:
> Adds scmi_inflight_count function to fetch the current xfer
> inflight count to use in trace
> 
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> ---
>  drivers/firmware/arm_scmi/common.h   |  1 +
>  drivers/firmware/arm_scmi/driver.c   | 17 +++++++++++++++--
>  drivers/firmware/arm_scmi/raw_mode.c |  5 +++--
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index ad9232c982ce..07b9e629276d 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -505,4 +505,5 @@ static struct platform_driver __drv = {					       \
>  void scmi_notification_instance_data_set(const struct scmi_handle *handle,
>  					 void *priv);
>  void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
> +int scmi_inflight_count(const struct scmi_handle *handle);
>  #endif /* _SCMI_COMMON_H */
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index c6657582c9ab..d128d497f96e 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1443,7 +1443,8 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
>  
>  	trace_scmi_xfer_begin(xfer->transfer_id, xfer->hdr.id,
>  			      xfer->hdr.protocol_id, xfer->hdr.seq,
> -			      xfer->hdr.poll_completion, 0);
> +			      xfer->hdr.poll_completion,
> +				  scmi_inflight_count(&info->handle));

White space is messed up.  It might be better to fold this into patch 3?

regards,
dan carpenter

