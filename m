Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D8A55;
	Sun, 27 Apr 2025 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745765205; cv=none; b=kLz4Uk28i+YnK4aOwaMbocIQHXB3MdNvAsDoUwa49FVS7bBRy/7CPjgFafsV2bAuHvmoWFcBFjczaKfXIqm+s36qcsxkEftlUYP2V8j2MfIIMkvKwGhIbm0sqaHbmKumvY1FkjgK1Ar91LP/Zu2BvT6eOS+yM7nmhGpkPJd6Z5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745765205; c=relaxed/simple;
	bh=EMjN1NRJqH0mdrr+kOIC6gH8ti4J53ARzCK2WMPH2sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJjIMwmahMFa0tfGCqxu2aIVKq1tX1F+woKY21yC4W8kTlM1mo/OGQjjJCOH2ubuf61nlxljrAmSgopP1quSSOu3x+LCo80N8d9VsCS09d7in1Y7qQ7SE5elLKw+YR2tjfszIpvyHmvQQ929zwtToQ0EdIsOLleSMr/LPupCrqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlxiK2xx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlxiK2xx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982FFC4CEE3;
	Sun, 27 Apr 2025 14:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745765204;
	bh=EMjN1NRJqH0mdrr+kOIC6gH8ti4J53ARzCK2WMPH2sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlxiK2xxd8rpaDGVIJu20NpNhJW5Pwly63H5m5nDrHTy8PxEDP0avOeBdk6L5skf6
	 BBGenUCsyemIT4F2O7gRJhYXwUSnUl0z61ZlAauKrFczbPJAN7rCTVSNibjEOLS8Uh
	 COD0x68Rdhvzpf7MUZK/eWwAQ6pCbvIh4llans1Zh86X2rbSvG8L20n4ma4sko0fjT
	 ND6qMijIcJy6Y6fy0V0m+eEO6Fq9yvy1ds566lmFr0oUIRmwyKkXq4N8gXzetmY+BA
	 zhcln19HPtcBqC4NaOE6F0piDaqFVs8hL82zFvlgXrd3tjZWVwRjLwLmNHrHM4bp6h
	 3eCGUL2iag+FA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u93HL-0000000065N-0XPr;
	Sun, 27 Apr 2025 16:46:47 +0200
Date: Sun, 27 Apr 2025 16:46:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH v2 4/4] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk:
 Ignore FC bit in attributes
Message-ID: <aA5DVxP7n5GDFxoO@hovoldconsulting.com>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
 <20250425125250.1847711-5-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425125250.1847711-5-cristian.marussi@arm.com>

On Fri, Apr 25, 2025 at 01:52:50PM +0100, Cristian Marussi wrote:
> Some platform misreported the support of FastChannel when queried: ignore
> that bit on selected platforms.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Match features has to be set-up properly before upstreaming this.
> Ideally the out-of-spec firmware should be matched with a quirk matching
> pattern based on Vendor/SubVendor/ImplVersion....but it is NOT clear if the
> platform at hand will ship with future fixed firmwares where the ImplVersion
> field is properly handled.
> If we cannot be sure about that, we should fallback to a compatible match.
> 
> v1 -> v2
> - use multiple compats quirks syntax
> 
> RFC->V1
> - fix QUIRKS conditions

>  /* Global Quirks Definitions */
>  DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
> +DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
> +		  "bad-vend", NULL, "0x20000-", "bad-compat", "bad-compat-2");

Still works when matching on vendor and version (and/or machine or SoC
compatible):

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

I think we can go ahead and merge this based on vendor and version
"0x20000-".

Depending on what Sibi finds out, or if it turns out to be needed, we
can always add an upper version bound later.

Johan
