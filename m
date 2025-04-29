Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCEB25EF96;
	Tue, 29 Apr 2025 20:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959561; cv=none; b=k7l6DD/aLt6BjDWcsIGW+ba1O+3VkgIUfWH7nsDW6pB/LQUqmgXUchpSa2gFNjdy4nxiSeG4oiv4Qb5ti4sR69STGFYBpVQcDX6gWuj2GR9XETpbggqmmNtack5+qXUobZ3ljNrb54WUWb1doTorl7+dxeIwt76eSbOqIYMQyLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959561; c=relaxed/simple;
	bh=0d3Da3N8ZlAqzjT7Tmz22/qVhMH8FcXsMN1un2i+TfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxrWizGfzxmmUt07kSwdwcQb/DIb3daCbat9YilB9bgEvlnPH1wyCpH0kYEj6E6fj4S8o7iA5kMSAG0q2uEVRf6JoL+xciS7siL5aiZHCJqPOC04CYOgvc+iqVu31wjFlYltbPpMGLwRbN54GNUYphS6KR3EwDfj/LmhHOYZFRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=SJ4clfS2; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="SJ4clfS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745959557;
	bh=0d3Da3N8ZlAqzjT7Tmz22/qVhMH8FcXsMN1un2i+TfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJ4clfS2AgzLkxhudmIaxZf7PrNwF499USl1sm0+CrzfYyuC4jqyj7POcR9DSuOva
	 AtskzTlKcuBxVEHGkxCVzFkDl+yaT3TfdK3oswoIwrDJu202llsD/n3HWzC2mdYXWO
	 tBQP7jzEQlf4pf5r52xpPRBrXktNihJGX14p8oVs=
Date: Tue, 29 Apr 2025 22:45:56 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: lschyi@chromium.org
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <ec2f7e54-0582-475d-af91-42d9be65cd3e@t-8ch.de>
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
 <20250429-cros_ec_fan-v1-3-a8d9e3efbb1a@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-cros_ec_fan-v1-3-a8d9e3efbb1a@chromium.org>

On 2025-04-29 16:14:23+0800, Sung-Chi Li via B4 Relay wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Register fans connected under EC as thermal cooling devices as well, so
> these fans can then work with the thermal framework.
> 
> During the driver probing phase, we will also try to register each fan
> as a thermal cooling device based on previous probe result (whether the
> there are fans connected on that channel, and whether EC supports fan
> control). The basic get max state, get current state, and set current
> state methods are then implemented as well.

There is also HWMON_C_REGISTER_TZ, however it depends on OF.
But this patch looks very generic, so maybe it makes sense to implement
it in the hwmon core.

> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> ---
>  Documentation/hwmon/cros_ec_hwmon.rst |  2 +
>  drivers/hwmon/cros_ec_hwmon.c         | 72 +++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)

<snip>
