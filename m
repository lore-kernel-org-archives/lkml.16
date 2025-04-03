Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D63124290E;
	Thu,  3 Apr 2025 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743668717; cv=none; b=h5viU+pzF6lCKd6pJfRMKzPrbQ9BGLbby5Ll03Y1aDAEhnlDaXuBTWzugael+g29A4itTX5tSxKtAz907aGJ7k1BlOnVYcWQwz0o2P1a4nyrXi71S4yjadxsTErdlw4TRiAl6miqtQKjKR231AgxHKwsOaf4P22acXtMCqy9kbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743668717; c=relaxed/simple;
	bh=W2GXp//p/lyuftqtpov8Pw3eTDvdK9rmsYuGvtyrxpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITyJpaauGutqrTWVYg+IlBn+nnbWq0eQKsRtKWWBmRWr6loYtK0D8x7IC+cLJ9ihBqnZZmFnV+YjIsh//gSZvKf+J2GvvCHZLB2UB2LxPPchiqpYsxI4GYZKaOuqwyOdXi4ijXEt/w5FcXMSTLms4oBrLOhmiWIiI4JLcYtvlCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMjtYpqM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMjtYpqM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F6DC4CEE3;
	Thu,  3 Apr 2025 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743668716;
	bh=W2GXp//p/lyuftqtpov8Pw3eTDvdK9rmsYuGvtyrxpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMjtYpqMUn0oZ4P/Y4Smk3o+lWbC/knZQSwyjheBq5wGC0wmQ6Yx3+wtz0e7EEelX
	 VSrBFnBzZ3julRuM78hF0MhjTQ4AUv6hweaGE6KMkt9Qr31tC593ltRz51wttaEGwu
	 WDmTfEigYH41o8GhZHXqIKa8WCoI/4QyfhQVQkSHQfspAXCoTNeHKhBlrwjFj3P1f9
	 H6oiTUIUQvhG9vWolXusW/Pth7woOu1w55QO5odOShuMo/vghEFCCvIMSaT37PfLu5
	 bBA3wgIzq0i9Hc0cO1LLy/16yISa17qwNtkFW50ebtfkrPJul0TlRDezXfRqx85B+c
	 NDEvRzH/YFpuw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u0Ft3-00000000757-0kce;
	Thu, 03 Apr 2025 10:25:21 +0200
Date: Thu, 3 Apr 2025 10:25:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [RFC PATCH 3/3] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk:
 Ignore FC bit in attributes
Message-ID: <Z-5F8eTaZB2gLTNs@hovoldconsulting.com>
References: <20250401122545.1941755-1-cristian.marussi@arm.com>
 <20250401122545.1941755-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401122545.1941755-4-cristian.marussi@arm.com>

On Tue, Apr 01, 2025 at 01:25:45PM +0100, Cristian Marussi wrote:
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
> ---
>  drivers/firmware/arm_scmi/driver.c | 8 ++++++++
>  drivers/firmware/arm_scmi/quirks.c | 3 +++
>  drivers/firmware/arm_scmi/quirks.h | 3 +++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 4266ef852c48..212456305bc9 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1904,6 +1904,13 @@ struct scmi_msg_resp_desc_fc {
>  	__le32 db_preserve_hmask;
>  };
>  
> +#define QUIRK_PERF_FC_FORCE						\
> +	({								\
> +		if (pi->proto->id == SCMI_PROTOCOL_PERF ||		\
> +		    message_id == 0x5 /* PERF_LEVEL_GET */)		\

This should be logical AND and PERF_LEVEL_GET is 0x8 (currently
fastchannel is enabled for all PERF messages).

> +			attributes |= BIT(0);				\
> +	})
> +
>  static void
>  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
>  			     u8 describe_id, u32 message_id, u32 valid_size,
> @@ -1924,6 +1931,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
>  
>  	/* Check if the MSG_ID supports fastchannel */
>  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> +	SCMI_QUIRK(perf_level_get_fc_force, QUIRK_PERF_FC_FORCE);

This is cool and I assume can be used to minimise overhead in hot paths.
Perhaps you can have concerns about readability and remembering to
update the quirk implementation if the code here changes.

Does it even get compile tested if SCMI_QUIRKS is disabled?

>  	if (ret || !MSG_SUPPORTS_FASTCHANNEL(attributes)) {
>  		dev_dbg(ph->dev,
>  			"Skip FC init for 0x%02X/%d  domain:%d - ret:%d\n",
> diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
> index 83798bc3b043..78d51bd0e5b5 100644
> --- a/drivers/firmware/arm_scmi/quirks.c
> +++ b/drivers/firmware/arm_scmi/quirks.c
> @@ -70,6 +70,8 @@ struct scmi_quirk {
>  	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)
>  
>  /* Global Quirks Definitions */
> +DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
> +		  "your-bad-compatible", NULL, NULL, 0x0);

At first I tried matching on the SoC (fallback) compatible without
success until I noticed you need to put the primary machine compatible
here. For the SoC at hand, that would mean adding 10 or so entries since
all current commercial devices would be affected by this.

Matching on vendor and protocol works.

>  /*
>   * Quirks Pointers Array
> @@ -78,6 +80,7 @@ struct scmi_quirk {
>   * defined quirks descriptors.
>   */
>  static struct scmi_quirk *scmi_quirks_table[] = {
> +	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
>  	NULL
>  };

Johan
