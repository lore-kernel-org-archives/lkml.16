Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E1B21ADC3;
	Wed, 30 Apr 2025 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023824; cv=none; b=BKctJPW9mAnP9JLTAqT8zBABUrOeV2gckW+6tdlGlqUMgoeHPW98fB8G3jW4wBTng6lchBt4UZkEeaHL72p7zJGnbIzD+1PYZM9hT7lZiCyLbjSIJlmLD384qS2euHJdhdWniwEJ6l53wa1PMduioqllS8JQA4KfOOAt1eoCN78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023824; c=relaxed/simple;
	bh=bqhe/3wNNetMAnct5PI5HuOKdKT6FhLcSekOS/ZFhsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+c6yafwZ2HYbhpTbL6FIGMZ7ZMxNxiv82oxhltYAWA712BHri+Vl5oA7dZr+A3MpCwhqVX9UzJq6Y5MUzInRZ2HbxCB7KgsnJFFM8LEFd+Q6QxH/ha8e30P4v7sevx/IhYywV0sRo9PQWfV+VWA/hXino/OTolmtGWFq4ABDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=qt0JpBNR; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="qt0JpBNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746023812;
	bh=bqhe/3wNNetMAnct5PI5HuOKdKT6FhLcSekOS/ZFhsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qt0JpBNR2hK2mKSMpQBhV7DlvYlkIh8CixnfUKZGYR4vzp7g13bKclX1wami2lQRG
	 Q0rs6uQmC8kbxpeCPq1E3oDsARy6iY5rfR2nNmYXhJUcK+/lOkdXRWoi5km0KFfbSu
	 VAVyAcilSGw4vxeIRuSnTdzkdcIKYEETGVWVRYF0=
Date: Wed, 30 Apr 2025 16:36:51 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Sung-Chi Li <lschyi@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <2518c6a3-6524-48b3-8e64-8990a61cc608@t-8ch.de>
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
 <20250429-cros_ec_fan-v1-3-a8d9e3efbb1a@chromium.org>
 <ec2f7e54-0582-475d-af91-42d9be65cd3e@t-8ch.de>
 <aBGCB6_4XR4Z-vFI@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBGCB6_4XR4Z-vFI@google.com>

On 2025-04-30 09:51:03+0800, Sung-Chi Li wrote:
> On Tue, Apr 29, 2025 at 10:45:56PM +0200, Thomas Weißschuh wrote:
> > On 2025-04-29 16:14:23+0800, Sung-Chi Li via B4 Relay wrote:
> > > From: Sung-Chi Li <lschyi@chromium.org>
> > > 
> > > Register fans connected under EC as thermal cooling devices as well, so
> > > these fans can then work with the thermal framework.
> > > 
> > > During the driver probing phase, we will also try to register each fan
> > > as a thermal cooling device based on previous probe result (whether the
> > > there are fans connected on that channel, and whether EC supports fan
> > > control). The basic get max state, get current state, and set current
> > > state methods are then implemented as well.
> > 
> > There is also HWMON_C_REGISTER_TZ, however it depends on OF.
> > But this patch looks very generic, so maybe it makes sense to implement
> > it in the hwmon core.
> > 
> 
> Hi, the HWMON_C_REGISTER_TZ is for registering a thermal sensor, and here I
> registered it as thermal cooling devices, so they are different. I followed
> other hwmon drivers:
> 
>   - gpio-fan.c
>   - aspeed-pwm-tacho.c
>   - max6650.c
>   - qnap-mcu-hwmon.c
>   - ...

Indeed, sorry.

> . These hwmon drivers also manually registered other cooling devices, and that
> makes sense to me, so I think it is good to just register cooling devices rather
> than make big changes to hwmon core.

The implementation does look like a lot of boilerplate.
If Guenter doesn't chime in, let's stick with the current approach.

> > > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > > ---
> > >  Documentation/hwmon/cros_ec_hwmon.rst |  2 +
> > >  drivers/hwmon/cros_ec_hwmon.c         | 72 +++++++++++++++++++++++++++++++++++
> > >  2 files changed, 74 insertions(+)
> > 
> > <snip>
