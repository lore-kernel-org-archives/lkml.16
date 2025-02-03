Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B7A1FBE89;
	Mon,  3 Feb 2025 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738577009; cv=none; b=RL6e9LSEImJPmzbIahGBXU4Gl7WfRAoad3RpktQsda12aJJ1g4Kk4CTSacJPLbqfwbPD1O6A/UjtEPHwTekDBwPdpSZXu5VUfIf9vYL6gVJYBMoWs5VLc4pMX4h5aN+6VGgC/xiZC3kfEMehWLkqLE9qEVtztmcx64GKOaafMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738577009; c=relaxed/simple;
	bh=CjPh2b574jLnmXszurDp0YgE4EJWVAhoILKnIPH1zkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=is9Zvfb61U34jMgWQFRDhVgSVnMhVdHsTv8J4/LFrr5+Y25im3SetbOMkfAIscNKly5ZMFzff9QZ/bAVqHHi0ks9gBr5vSSwDm09VdKUVMen04b3Z8Alqp7B9ycMex43cPje4rD3i3L4SEuwjRcQZlDdylV2jeJAqJehxTpmhxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iuAD+Ulf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iuAD+Ulf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61102C4CED2;
	Mon,  3 Feb 2025 10:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738577009;
	bh=CjPh2b574jLnmXszurDp0YgE4EJWVAhoILKnIPH1zkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iuAD+Ulfl6eBo2dTljn37N5oMIvNHPqLOExo+P+XWkNy+Zy7ttUPmKgTIp1pQMw0Y
	 0VGVHJOFv8c0lzzJeJ21KTyCXImt76+OXUlUk3YBGo1QthCfAqtgstI0DoOggUWBHD
	 tBR0VsGfIkFtBX8vcl6eL+FQ0xjuWTqbU5+7kj7s=
Date: Mon, 3 Feb 2025 11:02:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [RFC] driver core: add a virtual bus for use when a simple
 device/bus is needed
Message-ID: <2025020311-elderly-struck-1d26@gregkh>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
 <2025020106-avert-senorita-4181@gregkh>
 <2025020306-overhang-glider-7d42@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020306-overhang-glider-7d42@gregkh>

On Mon, Feb 03, 2025 at 10:39:58AM +0100, Greg Kroah-Hartman wrote:
> --- a/drivers/regulator/dummy.c
> +++ b/drivers/regulator/dummy.c
> @@ -13,7 +13,7 @@
>  
>  #include <linux/err.h>
>  #include <linux/export.h>
> -#include <linux/platform_device.h>
> +#include <linux/device/virtual.h>
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/machine.h>
>  
> @@ -37,15 +37,15 @@ static const struct regulator_desc dummy_desc = {
>  	.ops = &dummy_ops,
>  };
>  
> -static int dummy_regulator_probe(struct platform_device *pdev)
> +static int dummy_regulator_probe(struct virtual_device *vdev)
>  {
>  	struct regulator_config config = { };
>  	int ret;
>  
> -	config.dev = &pdev->dev;
> +	config.dev = &vdev->dev;
>  	config.init_data = &dummy_initdata;
>  
> -	dummy_regulator_rdev = devm_regulator_register(&pdev->dev, &dummy_desc,
> +	dummy_regulator_rdev = devm_regulator_register(&vdev->dev, &dummy_desc,
>  						       &config);
>  	if (IS_ERR(dummy_regulator_rdev)) {
>  		ret = PTR_ERR(dummy_regulator_rdev);
> @@ -56,36 +56,17 @@ static int dummy_regulator_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static struct platform_driver dummy_regulator_driver = {
> +struct virtual_driver_ops dummy_regulator_driver = {
>  	.probe		= dummy_regulator_probe,
> -	.driver		= {
> -		.name		= "reg-dummy",
> -		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
> -	},
>  };
>  
> -static struct platform_device *dummy_pdev;
> +static struct virtual_device *dummy_vdev;
>  
>  void __init regulator_dummy_init(void)
>  {
> -	int ret;
> -
> -	dummy_pdev = platform_device_alloc("reg-dummy", -1);
> -	if (!dummy_pdev) {
> +	dummy_vdev = virtual_device_create(&dummy_regulator_driver, "reg-dummy");
> +	if (!dummy_vdev) {

I originally was thinking that many platform_device_alloc() calls could
be replaced with this, but in looking further, I think we can get rid of
almost all calls to platform_device_register_simple() with this api
instead, including most of the use of that in the drm tree where all
that is being used is the device structure and not the platform one at
all.

I'll dig into that later today...

thanks,

greg k-h
