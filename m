Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F8A1F4281
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669459; cv=none; b=IcbsEmkEVveqeJgkWODgnBf6Nqv/UrWZQPTJcu+7KoCzjCL6Aaszb+9aOajNYlUbApfWjOwDSn2+kf2wt8CROuUeU0OgTEh698Gc1ATFJ9SK/y5Rh+SEVV/GnVfkCHNFHUVGHSWdzZrvcmiViMfssPh+buHk9FYIZ5MMJoRs684=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669459; c=relaxed/simple;
	bh=SPCcFqbrzfIHwolmZbtkAZSKbGxU/6xQjBXOl8gkX1o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YACXCUnTkjFLVXjf/8O3bpaO9gdPzqTMv2BD3Zt5BKkUDPFP9P+OCLZkwZRAmz+4Aj4/fhWr0qw5L5kk7Gr3OVs+7ylE0M3YDD2w7IaG6Ejm2dadbrFbopKT+h3D93gapsy4ndCeOGIUJbOvxNa1ZLOycaVNaeAP6PAKjm3PpNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Lu4havlq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Lu4havlq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso30555905e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750669454; x=1751274254; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGJGLljVH09RHHvcPmR2xlgcJlbWSurnIEnT57zI1pg=;
        b=Lu4havlqx8neoDFi+GQNK9mgC8PgsFG9ODY1HkfyoDzZNnW+/Ko9s11AAt+x/eA3cy
         vdxfKPI3Q7TJr+9O28HKcUxZOhjBZw+lX0mwqdujgTn2l2MdfjSbbDeEALckuvytS8lT
         NBFRnuCy+BwN4pETOzGSzxB/bPm7hIrdwTEI8ckukYpPYOzXxPaUjIbmb/BZnHOCyq8D
         Wd7tciPxbsyuVeakTlVVDBUiSfGezAfj7+Yn5i5ykbjlRRrCAYjtKmU245I3y6qKAStC
         3p6nuIN3fu8WW05lNSUCoh6DvqtfElkwztRb3BGaIrma37Zhoxc2ebhbOaURrjILYq2i
         Do9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669454; x=1751274254;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGJGLljVH09RHHvcPmR2xlgcJlbWSurnIEnT57zI1pg=;
        b=XTiw9ZcJpVStpTBWMBUlWiT2AjjJKtALg5jp9RpYXPtmYa9nxomkma6JXFxm8nZwSy
         4j3pGihan3CTsNxhAMRgkKH1V7aIdoESK/tn02N7jiauHCQHzWFDRuNv+lKxLO7wTiHI
         Kj3Jk0x0r27/t6u29T73VG0lA3pEa7qniqlTzj/7Igt6I25dk3lbx3PrAmsvck8dIWV/
         sQUq5HJqnUGsu3fwvKmFLkcVOwg1c0LVg2hPA43E0O5vEs0VJTHyxusiDq1iopbq7jTq
         Cy34IC7bROkLhzAClLatdpF1hHwdy9r/IGxH1kKtNNCKUwJTTpNqh2Zgu8bZkoj+doey
         9z1A==
X-Forwarded-Encrypted: i=1; AJvYcCWE5hsYkC4OvYjWNRdHSyI3oVIz+AcgWz4y6R5iaTbyQo6wVsuiap1wB4WyKoCeKEhk5z84t2NtT2ksmnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCleSw+LiJCYITiNj8Ep+PpH7MUBwQfQN25Q8MOmjnT9scVH18
	7qLuplyFMVkhautui0SRXMqquLuibAzFyoRoybPFUb0/lZirYb3LZr32LbPHhcedeYE=
X-Gm-Gg: ASbGncvRrQHY52U0JHbahjB1be+LrXYaEloK0SQZGFz08kW36OZLzForTheLE8g6eRH
	1VLiWZ1z8a4nx2AEZy8c3Fye7nQd+yMBQ5wFaS7UaQkqqctOZdzVKiJUmdtaaUntMJwvKK0/OHD
	tpa+UZAnX6Os7w4cIE7UvYdpbfCthBCZ7M+m5ar+iUv5zzxftjBNfxDHbbmBxuZbedRnhxcEirs
	oTAih0F69V8LqXJR6mmqbqF+3Hyj6lXSOuIlDeBUXpBkVpjEq7/pd3fKbfy4CGMKl+sm8OhAMah
	WcNHuDx58ciuOMGhZ441kP/DGYwacqrRhNarqX9mcs/SoW6M5sA+sJhx4u89
X-Google-Smtp-Source: AGHT+IHPFVP2GzxWqyLYPOcDDU16rCAlS0TgolK5wkPSR8zZb2Tfrc8wGwUYkTiUhGSu8NLF6anogw==
X-Received: by 2002:a5d:5f4b:0:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a6d12a41a1mr9212783f8f.16.1750669453679;
        Mon, 23 Jun 2025 02:04:13 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:dd07:164c:d535:3e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6d117c66esm8705949f8f.47.2025.06.23.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:04:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Philipp Zabel <p.zabel@pengutronix.de>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-mips@vger.kernel.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/4] clk: clk-imx8mp-audiomix: use the auxiliary device
 creation helper
In-Reply-To: <aEmzRrhQC+olmywj@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Wed, 11 Jun 2025 12:48:06 -0400")
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
	<20250611-clk-aux-v1-3-fb6575ed86a7@baylibre.com>
	<aEmzRrhQC+olmywj@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 23 Jun 2025 11:04:12 +0200
Message-ID: <1jikkmkewj.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 11 Jun 2025 at 12:48, Frank Li <Frank.li@nxp.com> wrote:

> On Wed, Jun 11, 2025 at 02:53:58PM +0200, Jerome Brunet wrote:
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>
>> Use it and remove some boilerplate code.
>
> Actaully, you also remove unused struct clk_imx8mp_audiomix_priv *priv
> at clk_imx8mp_audiomix_reset_controller_register().
>
> Please add it into comments.

That's merely a side effect of removing the boilerplate code.
Like for the other changes of the same kind, I don't think listing the
symbols removed would be useful to the change description

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/imx/clk-imx8mp-audiomix.c | 49 ++++++-----------------------------
>>  1 file changed, 8 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> index 775f62dddb11d8cfd17a4ebf7a677ef399c5e617..765fb1f5bd4fa2b039d7414abd89471438ee41dd 100644
>> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
>> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> @@ -230,61 +230,28 @@ struct clk_imx8mp_audiomix_priv {
>>
>>  #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
>>
>> -static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
>> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>>  {
>> -	struct auxiliary_device *adev = _adev;
>> -
>> -	auxiliary_device_delete(adev);
>> -	auxiliary_device_uninit(adev);
>> -}
>> -
>> -static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
>> -{
>> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> -
>> -	kfree(adev);
>> -}
>> -
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> -{
>> -	struct auxiliary_device *adev __free(kfree) = NULL;
>> -	int ret;
>> +	struct auxiliary_device *adev;
>>
>>  	if (!of_property_present(dev->of_node, "#reset-cells"))
>>  		return 0;
>>
>> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>> +	adev = devm_auxiliary_device_create(dev, "reset", NULL);
>>  	if (!adev)
>> -		return -ENOMEM;
>> -
>> -	adev->name = "reset";
>> -	adev->dev.parent = dev;
>> -	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
>> -
>> -	ret = auxiliary_device_init(adev);
>> -	if (ret)
>> -		return ret;
>> +		return -ENODEV;
>>
>> -	ret = auxiliary_device_add(adev);
>> -	if (ret) {
>> -		auxiliary_device_uninit(adev);
>> -		return ret;
>> -	}
>> -
>> -	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
>> -					no_free_ptr(adev));
>> +	return 0;
>>  }
>>
>>  #else /* !CONFIG_RESET_CONTROLLER */
>>
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>>  {
>>  	return 0;
>>  }
>>
>> -#endif /* !CONFIG_RESET_CONTROLLER */
>> +#endif
>>
>>  static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
>>  {
>> @@ -408,7 +375,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		goto err_clk_register;
>>
>> -	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
>> +	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
>>  	if (ret)
>>  		goto err_clk_register;
>>
>>
>> --
>> 2.47.2
>>

-- 
Jerome
