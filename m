Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483B074420;
	Mon, 16 Jun 2025 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078006; cv=none; b=GdzCxhxxPJVo2Ujmzu0IDKL/vE5clKf5j07eqBNpVlPy+RG7s7+DYgUXjFc9Z1yGGz+jjbtnhKuCYMhKUUwO98xMinGLWBII1EoAEia4yMhFJcuBCsN5cQWVGOwPCc2uXfZV/Vq4FM8KxCeirTKm3+IlDN364sCzDnFItZjiHJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078006; c=relaxed/simple;
	bh=V3bdCqRPnnsuaSC/9tsKOoYEPCllsd2mlydlvz+Lhio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFnJWYKoTXCa+QsDnlVyUn8TSfPk6poGH7rQ55OeJNChxneWwxpPSDMPqNa2E1f1UKo+e4kVQA8bkwAl1A1jMhy26GBrQOC7XLeb3qxtwpGVZTgIJowetF1x9JxwPCyTFY/umgKpQ6gIldSgE6GKJl0MWkIy2w8su8CbebdTTLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=EjK7foj5; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="EjK7foj5"
Received: from [192.168.42.116] (pd9e59880.dip0.t-ipconnect.de [217.229.152.128])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 6FC5B2FC0059;
	Mon, 16 Jun 2025 14:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1750077998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IYp63lnKIaa597PgW5Ia82OIQTnjt4Qa68nqLr/SBjY=;
	b=EjK7foj5u2gCuabSBiWQZu5676qyN97375w5SdgnuXZenHbQ419RSOEHlAYPPRdWxcwTcw
	0Y8BLlrvv8zLouJBFrtBDlWDRSmdSTJtHrXEtpV3KsWorfD5E6ZIPqE4TD26qydfl6LJZ6
	3ElhDoeDeV3cYkcZzCGTXmW6pfnmD5U=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <41de4cd4-2a27-4b14-a1c0-e336a3cec317@tuxedocomputers.com>
Date: Mon, 16 Jun 2025 14:46:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250615175957.9781-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, small additon

Am 15.06.25 um 19:59 schrieb Armin Wolf:
> +		functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/rainbow_animation
> +Date:		Juni 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Forces the integrated lightbar to display a rainbow animation when the machine
> +		is not suspended. Writing "enable"/"disable" into this file enables/disables
> +		this functionality.
> +
> +		Reading this file returns the current status of the rainbow animation functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breathing_in_suspend
> +Date:		Juni 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Causes the integrated lightbar to display a breathing animation when the machine
> +		has been suspended and is running on AC power. Writing "enable"/"disable" into
> +		this file enables/disables this functionality.
> +
> +		Reading this file returns the current status of the breathing animation
> +		functionality.

maybe this would be better under the /sys/class/leds/*/ tree if possible

