Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DB330E82B;
	Fri, 20 Jun 2025 04:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750394954; cv=none; b=V669cBpzIVE3Iu9LV/95Mf/fISKpKHLz1BvB4EQVqM+0mjlN1z2OoWAtiaV+L1cl1+CWh9GhAi60Kt4JObiUtgOxK6KUXh5HMMqJuqaVZJlIfMC4kO0G5Q64tn0EVyE1IGKkRgJo8XVm2nGLEZ3xjqPh5bVVHN6yJxndwS7LsfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750394954; c=relaxed/simple;
	bh=+qrsRH9dpVOHqQiKwg0LLbbsFyD3rE/aWfEqcpw1tRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ET2qKFc1r9o1ecbmDQoTpH7M4rH0WW5sSIU22oWwQR8hnzM+5uiai1f/rb6Q70Jya6sfo4IqMmFAw9JqGcADqTdkD4+nI4VQ7uQxTC8UwwD2u2kseFEdNX3FZLehzQ+il8PQLS9DPruEdPzhSm22VS2P2pc32TJGkkJjur4gXAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jwMiFpmp; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jwMiFpmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750394951;
	bh=+qrsRH9dpVOHqQiKwg0LLbbsFyD3rE/aWfEqcpw1tRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwMiFpmpuYh5xtd/P5C8AALfCAEFEvua2QOxvGvbcqzdKD2KSDfGuD7TkiJLaj3oz
	 FzrWLUfMfjtoDYHsznAdRFxUmiwT6LT8ZzCH7WkteRWuNh/CU1yni9FJTd9qtcnCLz
	 n3IhVvZoBoNxHuz2FbSOnyh5MDuuIXiK9kMftf7c=
Date: Fri, 20 Jun 2025 06:49:09 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: lschyi@chromium.org
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH v4 1/3] platform/chrome: update pwm fan control host
 commands
Message-ID: <945a7849-05e8-430f-9181-f8a68864247a@t-8ch.de>
References: <20250619-cros_ec_fan-v4-0-ca11548ce449@chromium.org>
 <20250619-cros_ec_fan-v4-1-ca11548ce449@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619-cros_ec_fan-v4-1-ca11548ce449@chromium.org>

On 2025-06-19 15:42:54+0800, Sung-Chi Li via B4 Relay wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Update cros_ec_commands.h to include definitions for getting PWM fan
> duty, getting and setting the fan control mode.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

Also this was Acked in v1 by Tzung-Bi. Please preserve already given
tags to easy the load on reviewers and maintainers.

> ---
>  include/linux/platform_data/cros_ec_commands.h | 29 +++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)

<snip>
