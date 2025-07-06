Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260792E3711;
	Sun,  6 Jul 2025 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790501; cv=none; b=mErTtMtwszwPnOx5Ku7za9zjNizZdQGsqPZCgGVD9BrymY4CannQMQCS7ya4o5T2kWaAqd+Hx2qFWDrAe2zv/mu2YXWXLABbTRuslINjQmMVJKKDYjR+rXGROxm/NVEuiAfPSL4+anuJRotbwt3MQV+SybCDaA2S2XQuHTOHdUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790501; c=relaxed/simple;
	bh=J1k5lZEu3LgIv6pN+ZoKssHUNWojfkyaGTyqt2ecRxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tte1XANzGiIYXG51L4tJCX9j2RSH4cPIas/TSmG3aTaNNWALdfZcVyNi/BrfcNK+658F3caYnjYP+R4Y2Dktx82lb7hyfbz13GxhpO4OwsFTJIM8h8roX/FIZtf2cDb1WNCtZrNyt6hWzvUGKWf6lUI63UvYxW+Ng2v3TFMxFqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Xiai2+3Z; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Xiai2+3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751790496;
	bh=J1k5lZEu3LgIv6pN+ZoKssHUNWojfkyaGTyqt2ecRxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xiai2+3Z52amY6IYj95jg7PBs+DMg3EzaD/Puq1zk41nTtP7bxKerJTkzZeWRYs27
	 LB/fJP/8bRCd+d7YNxecDTqTVgQaZ1zOqqlYZSf2px1T27blw3mZ3Z6nh7P9p1cn6z
	 yg5yCwWOGBaCoqYWU8jzhJqRQQDUP5+ydvkVOR08=
Date: Sun, 6 Jul 2025 10:28:16 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Mario Limonciello <mario.limonciello@amd.com>, Antheas Kapenekakis <lkml@antheas.dev>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Subject: Re: [PATCH v5 4/6] platform/x86: samsung-galaxybook: Transition new
 firmware_attributes API
Message-ID: <0e0521b9-a3eb-45f7-aa97-250fb48d1c18@t-8ch.de>
References: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
 <20250705-fw-attrs-api-v5-4-60b6d51d93eb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705-fw-attrs-api-v5-4-60b6d51d93eb@gmail.com>

On 2025-07-05 00:33:59-0300, Kurt Borja wrote:
> Transition to new firmware_attributes API.
> 
> Defining firmware_attributes groups statically through
> DEFINE_FWAT_ENUM_GROUP() incurs in a minor ABI change. In particular the
> display_name_language_code attribute is no longer created. Fortunately,
> this doesn't break user-space compatibility, because this attribute is
> not required, neither by the ABI specification nor by user-space tools.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/samsung-galaxybook.c | 244 ++++++++----------------------
>  1 file changed, 61 insertions(+), 183 deletions(-)

<snip>

>  
>  static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
>  {
> +	struct fwat_device *fdev;
>  	bool value;
>  	int err;
>  
> -	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->fw_attr_lock);

The mutex is still used, so this can't be removed.

> -	if (err)
> -		return err;
> -

<snip>
