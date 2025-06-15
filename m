Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A251DE8B3;
	Sun, 15 Jun 2025 20:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750019981; cv=none; b=fthhVsxiOOvQym55IajcGsJ7MrBK3Ll4Lt20HQtUIB//iPIK4vZZeBL44CmGQDfMk6Uj0WXaM4YEerN7Q2HLPQkRvlXTefHgsddELNtHJ8LBrYw2yAXLBmPFNsUWkY64TVOeITC368VxouEVq6ronGhdotrYPkiDKIX0Ii2LYLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750019981; c=relaxed/simple;
	bh=iRST+W3y9Sbpag6c61P3k/gtkTqGFvr6XevDS76ClN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnrxbLj1PYRMew/xYkVUbgY95Urjb9LJ8vbcpldkFnZDXt/OdqTc1RCXvoheFO67Ezoh3aEhigZpOP8lbJxpNsTF4GwQ7mGD4RanCR0t1hqXMn9p+tzH/mB8W9WL9azr33JxpIj1FnPV3++7yAjEwSHQkG3RVCSii4ihU6Zp3g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AvQ3IRyu; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AvQ3IRyu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=RAJkPe7EIpRAbOJTaqck3rFnfGDcGWUQGEm3UIXN1+s=; b=AvQ3IRyu1hYLqlzE5CUUpeF74z
	5yhEQn1yqePmZiAwATvWC9t/whqoViOMkcVB4K8RXujVRB+nKrqzhjye10xXtbf9c9M9j9w6MKtrP
	tmENRR5YZ/qeI4txIuCmK4c3XGbnBJTg6tzsfgwSudjni30lZxqbXkM6w/AfYKHUFnC5a9xis2nZ0
	P3tf1fYkQG4wfxI/B+cY34kXksZRA9kAWKFnVu9/Do2sXaQjKQTnQzHflo/40K1Fp1a5q82u2Cj7X
	zGAi0OQBGg9AYtkrkTp3PzWUnU5MtN+xIl3NNIstY9GKoazWDl6svgSCnZaNbJh+8OWHFbXx37PUG
	s4CwwzvA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQu8Z-0000000FDom-3Bmo;
	Sun, 15 Jun 2025 20:39:34 +0000
Message-ID: <9b32f31a-334d-408b-b652-55c802096599@infradead.org>
Date: Sun, 15 Jun 2025 13:39:28 -0700
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
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250615175957.9781-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/15/25 10:59 AM, Armin Wolf wrote:
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> new file mode 100644
> index 000000000000..a4781a118906
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> @@ -0,0 +1,53 @@
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/fn_lock
> +Date:		Juni 2025

June ? (throughout this file)

> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Allows userspace applications to enable/disable the FN lock feature
> +		of the integrated keyboard by writing "enable"/"disable" into this file.
> +
> +		Reading this file returns the current enable status of the FN lock functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/super_key_lock
> +Date:		Juni 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +                Allows userspace applications to enable/disable the super key functionality
> +                of the integrated keyboard by writing "enable"/"disable" into this file.
> +
> +		Reading this file returns the current enable status of the super key functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/touchpad_toggle
> +Date:		Juni 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Allows userspace applications to enable/disable the touchpad toggle functionality
> +		of the integrated touchpad by writing "enable"/"disable" into this file.
> +

What is the touchpad toggle functionality, please?

> +		Reading this file returns the current enable status of the touchpad toggle
> +		functionality.
> +

> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/wmi/devices/uniwill-laptop.rst
> new file mode 100644
> index 000000000000..2be598030a5e
> --- /dev/null
> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
> @@ -0,0 +1,109 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +============================================
> +Uniwill WMI Notebook driver (uniwill-laptop)
> +============================================
> +
> +Introduction
> +============
> +
> +Many notebooks manufactured by Uniwill (either directly or as ODM) provide an WMI-based

                                                                              a WMI-based

> +EC interface for controlling various platform settings like sensors and fan control.
> +This interface is used by the ``uniwill-laptop`` driver to map those features onto standard
> +kernel interfaces.


-- 
~Randy

