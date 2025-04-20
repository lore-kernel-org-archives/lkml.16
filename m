Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE7723B0;
	Sun, 20 Apr 2025 22:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745189059; cv=none; b=chYAVNotLP6AkCOjASj++tm/33EqDyJCCwxySMtI32FAwTXIL3SeZDtvEOLgjoQQR7rth6bPCm53sT6otDOVdLJIP/7u/yhp1AiyJVyyGZyH986b2gTrcG/oCM5uzneDZ+7Tj781Fi0o77YnSkodDFSL7PKpl1QLztgqiWiHUjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745189059; c=relaxed/simple;
	bh=tId+8cK+v3f/NVc3TE4jdQFEIIVJrtzTxqYhm/Jahlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QF2Az9tVGPX+L3zKD7d/b5Nk5NB4LzFb9c4OL/mfbAsmOVTGKAaWkHVxj3Ac7JmilL4n9KrToOBks5iZx3R9tIgA/LKyWkVuqJlD/rsmcN/KymSBxpMn8vu9BoPp05ilwH4f+eiTBLoVwgCV6aqgMUIC3Q4qMyxSkWc2SKlFihg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbEdh7Ho; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbEdh7Ho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC8BC4CEE2;
	Sun, 20 Apr 2025 22:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745189059;
	bh=tId+8cK+v3f/NVc3TE4jdQFEIIVJrtzTxqYhm/Jahlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PbEdh7HotpNJ7yyhVDQZT4kc2XJgpqYbneZVF/rAhsa2OpuhpFErAHm+olFw5Cnv/
	 hM47D55vkFWUDlln7pI5KA1/JdEJ7w17+kNt1FaUsqZUR69ZoBFJ+tXiaEULuE30+w
	 CYsCFfFHlpXoQMZKgZgvQnnydW6pzhoN7zYazP7/NrqjdWPufr7S3ZKV8qPQiadIIl
	 Cm4VYAapLbi+NyqlUIu1uf29cX+hF04BmBXxV2mXTjO0YMdwKo5FH1l1e6eBN2oceU
	 Gqw/2BTSdRCCD0hRmg+NQM6lW5A/PH+7viWJ8ag6wrUj3KO4fuD4RjIn2c3pwodtDu
	 EGC24gnK342vQ==
Received: by pali.im (Postfix)
	id E1ECC75E; Mon, 21 Apr 2025 00:44:15 +0200 (CEST)
Date: Mon, 21 Apr 2025 00:44:15 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add the Dell OptiPlex 7050 to the DMI
 whitelist
Message-ID: <20250420224415.d4ri4aje3u3gn23y@pali>
References: <20250420223334.12920-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250420223334.12920-1-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716

On Monday 21 April 2025 00:33:34 Armin Wolf wrote:
> A user reported that the driver works on the OptiPlex 7050. Add this
> machine to the DMI whitelist.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/12
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 79e5606e6d2f..1e2c8e284001 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1273,6 +1273,13 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
>  			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7060"),
>  		},
>  	},
> +	{
> +		.ident = "Dell OptiPlex 7050",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7050"),
> +		},
> +	},
>  	{
>  		.ident = "Dell Precision",
>  		.matches = {
> -- 
> 2.39.5
> 
