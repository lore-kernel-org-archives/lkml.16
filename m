Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510354A33;
	Sun, 15 Jun 2025 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750019539; cv=none; b=MysIKgXOjg6Puqx79dUCkDH0suCmlDPWcJAXN4mteeerJLUwl8HCvj3i+wej9O4VHV3z/SHRoUtmZwycVgEsXsvULj/wAgw2V4J1QVFXKdYi+2ggt+AEjVTIwdpzwOAfu0DIESMc3hFKrai2Zou+exhuC7RMMv9vzXw8dRq+P/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750019539; c=relaxed/simple;
	bh=ipOLP6LLsrl4oKuhTrsXI2JwHthOndb/e7QX0jG2D7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3Un6Fpi3RUY5h3zoORsTR7Q/hxFv4ShYzcJsI8G5aHiYK53cjhRJNx+i8as08HICiZ4BM3Q8H20RPsxTGLi6iRqH9YZ8VPhaQ/sxbHCIGkMW+N6OdFjTssQ7yOmqMU22JYGs8yCsD/L0zYDiPpu/bZz2TQ0d2Vas6LVGavdQoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cWX7SIHv; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cWX7SIHv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=36hN1hq1+Wf5IthuRmh5VmMSvRMked2DbK5JEoEMcys=; b=cWX7SIHvgsHsqd3nj4FhTC8epZ
	JhPDYH5KDwPe/fxzFsgmwc+IjFvZWjgKEWFz3HV7txe4Ierz1+8vU8zGXBPh9dpf5e1BYRrpQPwaJ
	YGZgmfyi3qVIx4JViW3qzjEySEE1gDmojKoNT0HHpsXio9q5gRJZc879MJSJvkjgqwkbrxai1WFr3
	6CzmyFPAff3CLSGplqy1ADmF+q3g5jfgmdLsO3wrX7mf+yoKC2xdvtO6c5kVSWNBYmVFX5ZBQxolv
	tqQhq8uuqURaE6cqqP0wD6KVgNdeNqgbEdGg6vUpyEuwzUNlKBtflTSla6jUSnhG7Ti0VaFcTSe24
	PqkjvFPg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQu1Q-0000000FDVS-299m;
	Sun, 15 Jun 2025 20:32:09 +0000
Message-ID: <d86a489c-8895-43c2-9968-1c0c6972c828@infradead.org>
Date: Sun, 15 Jun 2025 13:32:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] platform/x86: Add Uniwill WMI driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-2-W_Armin@gmx.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250615175957.9781-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/15/25 10:59 AM, Armin Wolf wrote:
> diff --git a/Documentation/wmi/devices/uniwill-wmi.rst b/Documentation/wmi/devices/uniwill-wmi.rst
> new file mode 100644
> index 000000000000..232fa8349611
> --- /dev/null
> +++ b/Documentation/wmi/devices/uniwill-wmi.rst
> @@ -0,0 +1,52 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +======================================
> +Uniwill WMI event driver (uniwill-wmi)
> +======================================
> +
> +Introduction
> +============
> +
> +Many notebooks manufactured by Uniwill (either directly or as ODM) provide an WMI-based

                                                                              a WMI-based

> +event interface for various platform events like hotkeys. This interface is used by the
> +``uniwill-wmi`` driver to react to hotkey presses.


-- 
~Randy

