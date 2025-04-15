Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08C817A313
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732186; cv=none; b=TiTSkMLJWtExRdbVNsg23WZdrJCK7y0EzxuITM4GUdKbZjdVCpgVbeFoFCaCXEeu755AgcPDogYzNzT4O1iduqCtVesH6bHtpJe2waIGHnRywJ9dM4Fv6BnzlMd2Y9qM/CWvrwLDWbRBM4Yl+nW35Z2hL4nbUFEPay4naqNDH6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732186; c=relaxed/simple;
	bh=HMIWjDv35CPnijzC+abmr8sC/3JUysoaO+Lo/UHarvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ia7Pf0sqZrRicq3USCmiyRZigIZPTNdexb2v9MyOC6qYt4wb4vi1kU4+ZObQUN7jy0lXVDe7h2gaeaQC+kcNQpe46N2sC1qgsVP0uSD34sfuai4YGvXftolczAQd/+POMkcldundSOonvVR3Jt6SeQZpfSoYuFE9mVE2GCOeQvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udRWZ/Of; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udRWZ/Of"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31D6C4CEEB;
	Tue, 15 Apr 2025 15:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744732185;
	bh=HMIWjDv35CPnijzC+abmr8sC/3JUysoaO+Lo/UHarvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udRWZ/Of+0oWLHW7iSzTEqMJX/zos1ZYVS9x287jZCO/xGV4x2km95wYw+K0wgn9h
	 U9N88jGmiqAPW2Yv4vqq8ZI2sLzLwczIYPa6NjK5CZQAOOFe8V8ZGJ3reNHc5g4hAa
	 K9c9V2SUr7l4sfdcyPZY21rMr+OGSMIgkOF0yhv7ppKJckUkuv9Q3Ou7a9kzrgqPfX
	 cFYKZ5sib5AzA1yJreg5Yxa79Ymcs3zzb/MyogE+y52ukHLHaLsB4dEZ5LRGd2+Aju
	 hMj/2bMSfjt+2Xc2ISUQ3I78drJDTO+pAUfnEnVzbX9/VlOpki4RtQCUK+6vHAXUbn
	 kci0HgMwqp8Ow==
Date: Tue, 15 Apr 2025 16:49:41 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Karel Balej <balejk@matfyz.cz>, Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] mfd: max14577: Fix wakeup source leaks on device
 unbind
Message-ID: <20250415154941.GY372032@google.com>
References: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
 <20250406-mfd-device-wakekup-leak-v1-3-318e14bdba0a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250406-mfd-device-wakekup-leak-v1-3-318e14bdba0a@linaro.org>

On Sun, 06 Apr 2025, Krzysztof Kozlowski wrote:

> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/mfd/max14577.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
> index 6fce79ec2dc64682ef4d85f22d762ec8e2ce1adb..7e7e8af9af224660557e76c2b80d92b05c86d202 100644
> --- a/drivers/mfd/max14577.c
> +++ b/drivers/mfd/max14577.c
> @@ -456,6 +456,7 @@ static void max14577_i2c_remove(struct i2c_client *i2c)
>  {
>  	struct max14577 *max14577 = i2c_get_clientdata(i2c);
>  
> +	device_init_wakeup(max14577->dev, false);

devm_* again?

>  	mfd_remove_devices(max14577->dev);
>  	regmap_del_irq_chip(max14577->irq, max14577->irq_data);
>  	if (max14577->dev_type == MAXIM_DEVICE_TYPE_MAX77836)
> 
> -- 
> 2.45.2
> 

-- 
Lee Jones [李琼斯]
