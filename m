Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC99B26C3A7;
	Fri,  9 May 2025 07:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774232; cv=none; b=W3fpF/ZpagA9aZ7L0s5pvcv0kVPTmOgkf3ZBdxFaj+nEvYt/ayEvt1CsCHeTK1wkLYJMZNVDj1JzlBI6iOem2P/GpXVjN16E3Gzh62tOEc9ipJCdFLZAKJVvikhSMdxoVCNDwooIpWenYNKJ4wx8kX92dnCNoDsVgyC/IL/OBW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774232; c=relaxed/simple;
	bh=0WwhJopkhycwO+EDKmA/3h2Xtcd2/NqM/2fimRhGpy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRK/AOk4RzCx87R95tx+GlQ8vZwua1wREdX4nNLjlrN8RAqGYNp16Egb6DpkJnA5LR1sAXkSsHRayoh6gqxi7vV4vkJ5fkvfINJB4Ps6tir4zV458ga69FBchEhpW6oU5B0kNzBus33wOGpMHH3ZYZbEF0qsywiyEpbLeZKnFvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBm8e5CG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBm8e5CG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A83C4CEE9;
	Fri,  9 May 2025 07:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746774232;
	bh=0WwhJopkhycwO+EDKmA/3h2Xtcd2/NqM/2fimRhGpy4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XBm8e5CGv9avQSxiXTeWn6d5TRwTP96MXxW/1RfS0GP5IT6bGvX9BayRE5+EFTOiy
	 62wgEGqnbXZ+iVw1sxyTZzqKV/rQkndQAbZ3xYR2wQjJUpxY6PEWopL2KnYuzAi5NB
	 OgAPpAnVFU7cLtH82ML1vYaT2byHomFBALHoVB8pIrXS5ZmgLpjpA0LZvCuGmd7z7W
	 U1cUkfR3DXNAtDI+fNNTMjIxMeIHYwqyTnjkQgU3KG4gqJJqbiXQvmmqSb9uMteuUn
	 pcwuYhyEL1oTFxz0NfAU+VUYggf8XdRCdEYbimE3xmdk7o1KATwZFvfvGM28HhTjlx
	 VtwFoJaxsyQAg==
Message-ID: <272301e5-6561-499a-91eb-615fed4727fa@kernel.org>
Date: Fri, 9 May 2025 09:03:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] hwmon: pmbus: mpq8785: Prepare driver for multiple
 device support
To: Pawel Dembicki <paweldembicki@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Noah Wang <noahwang.wang@outlook.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Grant Peltier <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shen Lichuan <shenlichuan@vivo.com>, Peter Zijlstra <peterz@infradead.org>,
 Greg KH <gregkh@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250509065237.2392692-1-paweldembicki@gmail.com>
 <20250509065237.2392692-2-paweldembicki@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250509065237.2392692-2-paweldembicki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/05/2025 08:51, Pawel Dembicki wrote:
> Refactor the driver to support multiple Monolithic Power Systems devices.
> Introduce chip ID handling based on device tree matching.
> 
> No functional changes intended.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> 
> ---
> v2:
>  - no changes done
> ---
>  drivers/hwmon/pmbus/mpq8785.c | 38 +++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> index 331c274ca892..00ec21b081cb 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -8,6 +8,8 @@
>  #include <linux/of_device.h>
>  #include "pmbus.h"
>  
> +enum chips { mpq8785 };

Use Linux coding style, so:
1. missing wrapping after/before each {}
2. missing descriptive name for the type (mpq8785_chips)
3. CAPITALICS see Linux coding style - there is a chapter exactly about
this.


> +
>  static int mpq8785_identify(struct i2c_client *client,
>  			    struct pmbus_driver_info *info)
>  {
> @@ -53,26 +55,46 @@ static struct pmbus_driver_info mpq8785_info = {
>  		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>  		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>  		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> -	.identify = mpq8785_identify,
> -};
> -
> -static int mpq8785_probe(struct i2c_client *client)
> -{
> -	return pmbus_do_probe(client, &mpq8785_info);
>  };
>  
>  static const struct i2c_device_id mpq8785_id[] = {
> -	{ "mpq8785" },
> +	{ "mpq8785", mpq8785 },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(i2c, mpq8785_id);
>  
>  static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
> -	{ .compatible = "mps,mpq8785" },
> +	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, mpq8785_of_match);
>  
> +static int mpq8785_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct pmbus_driver_info *info;
> +	enum chips chip_id;
> +
> +	info = devm_kmemdup(dev, &mpq8785_info, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	if (dev->of_node)
> +		chip_id = (uintptr_t)of_device_get_match_data(dev);

(kernel_ulong_t) instead

> +	else
> +		chip_id = i2c_match_id(mpq8785_id, client)->driver_data;

Do not open-code i2c_get_match_data().


Best regards,
Krzysztof
