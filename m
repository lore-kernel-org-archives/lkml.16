Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1E122D9EF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779531; cv=none; b=Vu4N7ZUlZTSOvJ+YmozikfShhylvlhdgGs/bIu6c6EOR2h6ZL6RMS87awaWBY/+9BsbDYjyIHR6PKSTQO2zjZzTkxUH4Qx7I/N5Rr50/hmtYF9Sw06akt9HW9aM6YbaQNZCmzVeqB+wY9L5bnyrDYObEejtkDYNpjy9PaDzbZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779531; c=relaxed/simple;
	bh=mi786CI0+Ajj0O8fo9KC0phpG5QVo4LT3C2GYKvg2rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrFbqyVSN+HhyEviDGLGCifCn7vrhZTg3z8j72tCIkyea+SfSf8pz8OBk17q1QpFVH2N2JogbhA2tIuSckuXkemqDbps9vPS2bkdnLKbr2MqkxX5U2fToWPWxN0yowt/bqrqSgTrmMKOTlrowbxfCK4G8WjKwKHQcrqr0TOPYco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z7OEvrvt; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z7OEvrvt"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0be50048eso1088773f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746779528; x=1747384328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jiF1pbiit8RXJodj15L4E9c2gnVhsdzQP7MvMTnz+gk=;
        b=Z7OEvrvtIbXeqP1l7ANG90AQpx/yU+GOR/tvIO11ys//hI0fR9nUu2TQ11ZjU4F/zp
         dqincUQXBYpoWwWBRY5kDoylcnUNNP741m7ENpzan55CDpHFH8L2bQHoBjvYrAE6iqdU
         Wu7QZdMZ61sSODErF16v7NNmLwvphyXkDw3gwpCnSyAebQrWOWT5k+5BGiny9wiQFQGr
         3rRjDKbHuAorYXVMYWlROLfqkwqWPLQPOZ1TBQcnorWal0Kp1QZTN88nX/pRKHLqvibO
         8ij+RBFSQUw7PN/JqSrcha0pLawJ07MxH9B1eLT9ekkw9RBRQa6V7L2du3nWrqcwI7YO
         ZNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746779528; x=1747384328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiF1pbiit8RXJodj15L4E9c2gnVhsdzQP7MvMTnz+gk=;
        b=pi04nBbCuk9RjeX2Vq20YUcDVbc704mSDVDhFIi8lU4LFtWvs2x11psZ7uT7zWDpkO
         elJQnhKcYoAMjl3ORCrHkjIByXsbo4+YquW4QZ2K3ghj/u9wrdhdQkSAjm9S11AvhKJk
         RZS2ccpaj2e/mRawWZB/2JtpeeyuWQdYtMqZPp3RgKgqhkgO/Thq1NbZd+dZIP+cIvnv
         lfy77VR509OuiOw551suYWyMdP8hiRCAG6dEDcT3MPYmzn7pE30d9c8E0LBAq5BHviF7
         HcoeWKi6yPpi8EKRwGAOVliZPocCIPEyOmu1p/qk/xv8kwuQ+TAjonsNIMcRw+m6OVvL
         cXgA==
X-Forwarded-Encrypted: i=1; AJvYcCVZSPVV0uQ3YYQB+yHkISrd4GSWfNzqHTK7Hbg5NVD1xvAwqBIr9LS412pxQFXcxsmvUVpf0egk62qOSwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi7u7qpmTwNYhmnPvala0sJs5vnrqqkmE7PZ5HZUQ+MM6wD2Op
	vt2eDpfDLYfXxzzs6L4MiTnoENrpm+NcqYjC86AHMECAsRjAr3AJt87fH3u0/FU=
X-Gm-Gg: ASbGnct+DCbiZm1Iv7F64ro7yzLEh/rPbBi8boIhAwfwVLHQbQ+mMuTH0+9M6Mm72f6
	Q9SI4FyC6REcz+G4gQ49/FyoDyvRwzlZy184czX8MrVj3BVg0a0F5BQP3SKtBLIT85YpUVle473
	VN9HOHQ1F9XAqYbSvj24xKXOTB7jNKWEDTVQ4SD5ojEbOq3H1F+7Tnu7aOvu2GcvBvwW9hZIdB3
	vT4xG7n5a6vgynyTzYfybuZmy7AMYmSHh9FNFcVxcRzsg8+7Yw0fo+r5m1vvAy4R2f03cgor9Jl
	9VVryNboDSvHUn6fru6aIHO7Vq64DYYCNNoGC5jltxtaWS6MVKiIh+7K
X-Google-Smtp-Source: AGHT+IGo7ag956w5i3W9+O4Hysr5DbRbNHyxYYXKoci+clSYLagmnbvGr8QjyCHV5wNtMeLk2ElqtQ==
X-Received: by 2002:a05:6000:2485:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-3a1f64328bbmr2116798f8f.13.1746779527863;
        Fri, 09 May 2025 01:32:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4bbf0sm2480709f8f.82.2025.05.09.01.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:32:07 -0700 (PDT)
Date: Fri, 9 May 2025 11:32:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 2/3] memory: Add STM32 Octo Memory Manager driver
Message-ID: <aB29hOrv0nU73RCn@stanley.mountain>
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
 <20250428-upstream_ospi_v6-v11-2-1548736fd9d2@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-upstream_ospi_v6-v11-2-1548736fd9d2@foss.st.com>

On Mon, Apr 28, 2025 at 10:58:31AM +0200, Patrice Chotard wrote:
> +static int stm32_omm_toggle_child_clock(struct device *dev, bool enable)
> +{
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	for (i = 0; i < omm->nb_child; i++) {
> +		if (enable) {
> +			ret = clk_prepare_enable(omm->clk_bulk[i + 1].clk);
> +			if (ret) {
> +				dev_err(dev, "Can not enable clock\n");
> +				goto clk_error;
> +			}
> +		} else {
> +			clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
> +		}
> +	}
> +
> +	return 0;
> +
> +clk_error:
> +	while (i--)
> +		clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
> +
> +	return ret;
> +}
> +
> +static int stm32_omm_disable_child(struct device *dev)
> +{
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	struct reset_control *reset;
> +	int ret;
> +	u8 i;
> +
> +	ret = stm32_omm_toggle_child_clock(dev, true);
> +	if (!ret)
            ^^^^
I'm pretty sure this was intended to be if (ret) and the ! is a typo.

> +		return ret;

If it's not a typo please write this as:

	if (!ret)
		return 0;

regards,
dan carpenter

> +
> +	for (i = 0; i < omm->nb_child; i++) {
> +		/* reset OSPI to ensure CR_EN bit is set to 0 */
> +		reset = omm->child_reset[i];
> +		ret = reset_control_acquire(reset);
> +		if (ret) {
> +			stm32_omm_toggle_child_clock(dev, false);
> +			dev_err(dev, "Can not acquire resset %d\n", ret);
> +			return ret;
> +		}
> +
> +		reset_control_assert(reset);
> +		udelay(2);
> +		reset_control_deassert(reset);
> +
> +		reset_control_release(reset);
> +	}
> +
> +	return stm32_omm_toggle_child_clock(dev, false);
> +}

