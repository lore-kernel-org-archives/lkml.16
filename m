Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2BA2343C7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750454829; cv=none; b=mxgjU/HmlNoxedSqOOUpRlgzKKF+UFjnv6Lxt2g0EZf49OeaEp4LOx2uFn8XtnXAK6Fjm9kOUzOdHVg9/AnUejKh5UHYI+9ggQ+BiYWg6XyB/mL611IMOW7KZKbHEjdXQxNh9BG1QyQKxIQ2rybE+vWmgv10TulxPfrPd8LsIJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750454829; c=relaxed/simple;
	bh=adJEqqccC/OWk4epgRiBDb2jy/SGZ/j4cV93OH6WJZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kO4FkrB67GwXItdpsHFAIDkhiPZAtvunLCCLAoXv4N4F0uP2pPVwUJOKhBTW9wZJbh4mG9yG2tlenJMHF274sIbQYPP0/s1muebB02GMwBOeWj01fvIIbtWYWwGfhPfjIcbnS3wXtS838whjp7aG6skRGzNJy2tFFHae3R8M72A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkjJ1cOI; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkjJ1cOI"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40791b696a2so614352b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750454826; x=1751059626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iMIFRsdkyNFzMJ+x7jyoP2b6n5xXmdf/8m2IFfM2q7c=;
        b=NkjJ1cOIk+FxTV8GjF8oJw8PaOnd0bosMflzGIUhfsLKoHQhYjObmJ1fB53b/akD+k
         kF5WpcVUmrLx77zUbSP8VEHSCDegTFWryxmn5yCTyXfsEqT+OSyrRU1BiumVh55qA8Vk
         LXuaKJJ7JO6U5mV010xy7DQpsHGYkBEB9LfCmTH3ErjVI2vv5A4qnUuuduVdJU0kDkDQ
         FnxHWlix8ZpN8bFdivDbcz8u+sqxMkzvLkkcwS5JNFE7di+pW95duQbYIjoWUAoBoIV8
         DMNCv1eHG9E8qoGzU0SGuWn1XvnS3/qZrOkzDbgUpP8pysFTCa2jR/mfrUirNOIyDy66
         So0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750454826; x=1751059626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMIFRsdkyNFzMJ+x7jyoP2b6n5xXmdf/8m2IFfM2q7c=;
        b=iyGaFFNuURIjZ8uQBmfBB24Qk+j/QfkkRWrbq/Nd9cu6lEJgV4HF7guiuVricMvCcR
         yEO2SDD52QQGuQWhT44LddR0ttCWKTlOGjkz6/u6ibbibOmai4F3a6fP9pE9bfi4j9WH
         cNSDy0wyJeqCpWjhoBdqUmhAoP/c53luof2Jc7cai+117dMwsq5wmOfAoThUsbeIx4TF
         7YTUIA6PLEdUQxCef61qpkTDh7TsCPAsI0IdoyyW7fnSOqKr70kEZFhe2JdkHtr3vLoW
         pXyGYEQCb49eYuiSQBkk67f8McttnDJIdY3/9DczVgy/l/On/M87wVeavWxXFoG4kkix
         ss1A==
X-Gm-Message-State: AOJu0YwrQvqp1PsrdpyMkvM2l398dA/vhc2TTYfj1I4GEcicyPvxw+oJ
	Zz5eBNhFklGiRFVmMg1Xtu2XYOU1KHF/xTd+xxDKy4AiZFjEMl36l+cBs4cpbkfLji7LkdPCoN+
	Oe0he
X-Gm-Gg: ASbGncu9pkxuBgBQm3LDxRBfabjLT9OB2p/A/RZWnAMw55i3mOVzmyTehb/uYm0daL3
	ralZMs/diZBHsr3MKLQxcuL7jwDLBOhGHd400jpH13YowtXJSkWXjDE4LGlK49XY/JpE6rA2aZU
	Tf/zlk3dOLx6HvPLZDH0/SPjyKsfrpFmJpeB56oDJrQc0kcFqhH8sS3kECgR4TqJIQtPp41jECU
	97F+4kCJikkAcfiYyBkazueZBw21MCcc0sZ09S8zO2CsbQ4Z9pCe9GBuf0j+Lc/YyZXRaaCRmQM
	1o4aZZu9T7sPunMF6wM7AsgXpZ55yBZQgMeaGmPSyVnjwAsUNiwu4/rYbxN7CahTL3M9ag==
X-Google-Smtp-Source: AGHT+IESnwOrs/dDV5b5ifwpLpIA2to3QsVlAToKotqflwsgrSLGEX6wnpXNqOonKrdb5B/s7K5ZVA==
X-Received: by 2002:a05:6808:3a05:b0:408:fe75:41b1 with SMTP id 5614622812f47-40ac6f00417mr3259549b6e.29.1750454826289;
        Fri, 20 Jun 2025 14:27:06 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:35a7:a70f:9610:a99b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90aeee82sm478413a34.11.2025.06.20.14.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:27:05 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:27:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 4/7] firmware: arm_scmi: Add System Telemetry driver
Message-ID: <f2c0a0d9-6a1b-42c7-a180-e04e357dbbb5@suswa.mountain>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-5-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-5-cristian.marussi@arm.com>

On Fri, Jun 20, 2025 at 08:28:10PM +0100, Cristian Marussi wrote:
> +//TODO Review available interval show
> +#define BUF_SZ	1024
> +static inline ssize_t
> +__available_update_show(char *buf,
> +			const struct scmi_telemetry_update_interval *intervals)
> +{
> +	int len = 0, num_intervals = intervals->num;
> +	char available[BUF_SZ];
> +
> +	for (int i = 0; i < num_intervals; i++) {
> +		len += scnprintf(available + len, BUF_SZ - len, "%u ",
> +				 intervals->update_intervals[i]);
> +	}
> +
> +	available[len - 1] = '\0';

No need.  scnprintf() will already have put a NUL terminator there.
Unless num_intervals <= 0 in which case this will corrupt memory.

> +
> +	return sysfs_emit(buf, "%s\n", available);
> +}

[ snip ]

> +static int scmi_telemetry_groups_initialize(struct device *dev,
> +					    struct scmi_tlm_instance *ti)
> +{
> +	int ret;
> +
> +	if (ti->info->num_groups == 0)
> +		return 0;
> +
> +	ret = scmi_telemetry_dev_register(&ti->groups_dev, &ti->dev, "groups");
> +	if (ret)
> +		return ret;
> +
> +	for (int i = 0; i < ti->info->num_groups; i++) {
> +		const struct scmi_telemetry_group *grp = &ti->info->des_groups[i];
> +		struct scmi_tlm_grp_dev *gdev;
> +		char name[16];
> +
> +		gdev = devm_kzalloc(dev, sizeof(*gdev), GFP_KERNEL);
> +		if (!gdev) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
> +		gdev->tsp = ti->tsp;
> +		gdev->grp = grp;
> +		gdev->dev.groups = scmi_grp_groups;
> +
> +		snprintf(name, 8, "%d", grp->id);

s/8/sizeof(name)/?

> +		ret = scmi_telemetry_dev_register(&gdev->dev,
> +						  &ti->groups_dev, name);
> +		if (ret)
> +			goto err;
> +
> +		if (ti->info->per_group_config_support) {
> +			sysfs_add_file_to_group(&gdev->dev.kobj,
> +						&dev_attr_grp_current_update.attr,
> +						NULL);
> +			sysfs_add_file_to_group(&gdev->dev.kobj,
> +						&dev_attr_grp_intervals_discrete.attr,
> +						NULL);
> +			sysfs_add_file_to_group(&gdev->dev.kobj,
> +						&dev_attr_grp_available_intervals.attr,
> +						NULL);
> +		}
> +	}
> +
> +	dev_info(dev, "Found %d Telemetry GROUPS resources.\n",
> +		 ti->info->num_groups);
> +
> +	return 0;
> +
> +err:
> +	scmi_telemetry_dev_unregister(&ti->groups_dev);
> +
> +	return ret;
> +}
> +
> +static int scmi_telemetry_des_initialize(struct device *dev,
> +					 struct scmi_tlm_instance *ti)
> +{
> +	int ret;
> +
> +	ret = scmi_telemetry_dev_register(&ti->des_dev, &ti->dev, "des");
> +	if (ret)
> +		return ret;
> +
> +	for (int i = 0; i < ti->info->num_de; i++) {
> +		const struct scmi_telemetry_de *de = ti->info->des[i];
> +		struct scmi_tlm_de_dev *tdev;
> +		char name[16];
> +
> +		tdev = devm_kzalloc(dev, sizeof(*tdev), GFP_KERNEL);
> +		if (!tdev) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
> +		tdev->tsp = ti->tsp;
> +		tdev->de = de;
> +		tdev->dev.groups = scmi_des_groups;
> +
> +		/*XXX What about of ID/name digits-length used ? */
> +		snprintf(name, 8, "0x%04X", de->id);

s/8/sizeof(name)/?

regards,
dan carpenter

> +		ret = scmi_telemetry_dev_register(&tdev->dev,
> +						  &ti->des_dev, name);
> +		if (ret)
> +			goto err;
> +
> +		if (de->name)
> +			sysfs_add_file_to_group(&tdev->dev.kobj,
> +						&dev_attr_name.attr, NULL);
> +		if (de->tstamp_support) {
> +			sysfs_add_file_to_group(&tdev->dev.kobj,
> +						&dev_attr_tstamp_exp.attr,
> +						NULL);
> +			sysfs_add_file_to_group(&tdev->dev.kobj,
> +						&dev_attr_tstamp_enable.attr,
> +						NULL);
> +		}
> +	}
> +
> +	dev_info(dev, "Found %d Telemetry DE resources.\n",
> +		 ti->info->num_de);
> +
> +	return 0;
> +
> +err:
> +	scmi_telemetry_dev_unregister(&ti->des_dev);
> +
> +	return ret;
> +}

