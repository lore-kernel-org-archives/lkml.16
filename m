Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC3204C24
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.61.151.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738629681; cv=none; b=KZqs6HK0sjWgfXsAupo345dAaklwgXmpaIEJV/8KqKTNMgzpJrMidH/iKE3aAKic4j1tR8GC640+FCBDbqKFaYhwBBj/tEzDJ0Bdh8mmNUdzDK+e8T5XTwpRZxEfJyprGw0CN+EJNQXUKD3+gnNWOYge8EgnzlpHRb/CT1QJH18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738629681; c=relaxed/simple;
	bh=6Ljhb/l5cuzFKG1hXUzN2XVip9+IRIDVeEsVro7oKzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjLgPBqf2G7LQH2LCHDQkuMxoegQd6kBs0FbhMb6gHyuyLweeCjamBaQdmg2ahsOcD3IZ8uH75GendY0tWoiVFx103SFU/3yNwWmfwY5RrjHbg/gh9VWMpESjp0AptcweMoEqYpeqHzSeypz3r/8lwG+sZQA7U4PCTvTjYFw+zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech; spf=pass smtp.mailfrom=equiv.tech; dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b=hRUcsxdy; arc=none smtp.client-ip=209.61.151.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=equiv.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b="hRUcsxdy"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt; s=mx; t=1738629678; x=1738636878;
 h=In-Reply-To: Content-Type: MIME-Version: References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date: Sender: Sender;
 bh=ggcwfyqRfyHYBb0dqYboatBmMxLglcl8RWmU//+wvXM=;
 b=hRUcsxdyU9UHIbEJkjIeToFgmMskMLJTjVOPSXsyWYCmHN+uQv4/m9kkwCs6wmvu0ZrTWoLXJpdJ1iBZF+NzIwAQAi77AwQf8Pg00SrSkSNLTR4e7xeN53WVf/i4wC3UqPvKLQtMX9PyxOJLuLSG2KZ63Gi+ZGNFwNE0i421OfGkuIhwFtxoQfm7kKDRt7zemsbVOWGoujEPjxAJI3u6gCWx6cvGPgSRqzVnNr5z6TwPD9SjiCKYWW1XbqlyEQ86S6m7Ssolc03vNp9DK7c7T6UKwHmOgppgTdvh+UQi3FOZxPWbzA48/7QDb+mtDgLyKMRhvrOgHmyWfFtQvHGsJQ==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyI4ZWI3MiIsImxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmciLCI5M2Q1YWIiXQ==
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 09e3f01714c1 with SMTP id
 67a1622e14383b735a52af42 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Feb 2025 00:41:18 GMT
Sender: james@equiv.tech
Date: Mon, 3 Feb 2025 16:41:17 -0800
From: James Seo <james@equiv.tech>
To: Armin Wolf <W_Armin@gmx.de>
Cc: markpearson@lenovo.com, jorge.lopez2@hp.com, jdelvare@suse.com,
	linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/7] hwmon: (hp-wmi-sensors) Use the WMI bus API when
 accessing sensors
Message-ID: <Z6FiLeldpQXvnO6B@equiv.tech>
References: <20250203182322.384883-1-W_Armin@gmx.de>
 <20250203182322.384883-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203182322.384883-2-W_Armin@gmx.de>

On Mon, Feb 03, 2025 at 07:23:16PM +0100, Armin Wolf wrote:
> Since the driver already binds to HP_WMI_NUMERIC_SENSOR_GUID, using
> wmidev_block_query() allows for faster sensor access.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/hwmon/hp-wmi-sensors.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
> index d6bdad26feb1..03c684ba83bd 100644
> --- a/drivers/hwmon/hp-wmi-sensors.c
> +++ b/drivers/hwmon/hp-wmi-sensors.c
> @@ -1197,7 +1197,7 @@ static int hp_wmi_update_info(struct hp_wmi_sensors *state,
>  	if (time_after(jiffies, info->last_updated + HZ)) {
>  		mutex_lock(&state->lock);
> 
> -		wobj = hp_wmi_get_wobj(HP_WMI_NUMERIC_SENSOR_GUID, instance);
> +		wobj = wmidev_block_query(state->wdev, instance);
>  		if (!wobj) {
>  			ret = -EIO;
>  			goto out_unlock;
> @@ -1745,7 +1745,7 @@ static int init_numeric_sensors(struct hp_wmi_sensors *state,
>  		return -ENOMEM;
> 
>  	for (i = 0, info = info_arr; i < icount; i++, info++) {
> -		wobj = hp_wmi_get_wobj(HP_WMI_NUMERIC_SENSOR_GUID, i);
> +		wobj = wmidev_block_query(state->wdev, i);
>  		if (!wobj)
>  			return -EIO;
> 
> --
> 2.39.5
>
Works on a HP Z420.

Reviewed-by: James Seo <james@equiv.tech>
