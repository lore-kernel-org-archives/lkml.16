Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07162A923
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 20:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748809031; cv=none; b=l6Y28BhK3ZoKGz/ei+sRnRVsbKoOkBlLtQ5nuntZpIfk14rFP48C5tjv637jQYCERtOmH/bYQwScdsiRzdYkoHte1VtfEpMRSA/MpRuCqPr2wMEbyJKMEqYI/x9N6SSUKv2c30KEWqLOsBI8r6er6gwCoe8CUL7EPzDZnR0sfrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748809031; c=relaxed/simple;
	bh=8PKyOPYnfNSjR7FPJGszGOBmLeOkqRohGMI593pMfuo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBXdh0MGjBgzoKasKhjbgDruWqcVrsBBtHt9n2F6YlBq0wJHo7LIiQITy+w62MPR7I+WMzmJWQfVv9PgRQs1WM81BBuga1PtPXBztsBRlcbs+2QtEMk388Qp8+nWN26+X/mpASIfasB82WZIrIl2I/p4v2tAIOTxVnV4Pf5o6FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 35cea866-3f25-11f0-9706-005056bdd08f;
	Sun, 01 Jun 2025 23:15:50 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 1 Jun 2025 23:15:49 +0300
To: Diogo Ivo <diogo.ivo@siemens.com>, mika.westerberg@linux.intel.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-watchdog@vger.kernel.org,
	jan.kiszka@siemens.com, benedikt.niedermayr@siemens.com
Subject: Re: [PATCH v3 0/2] Add driver for Intel Over-Clocking Watchdog
Message-ID: <aDy09SFPkzr2AJnr@surfacebook.localdomain>
References: <20250317-ivo-intel_oc_wdt-v3-0-32c396f4eefd@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-ivo-intel_oc_wdt-v3-0-32c396f4eefd@siemens.com>

Mon, Mar 17, 2025 at 10:55:05AM +0000, Diogo Ivo kirjoitti:

+ Mika

> This series adds a driver for the Intel Over-Clocking Watchdog found in
> the Intel Platform Controller Hub (PCH).
> 
> This watchdog is controlled via a simple single-register interface and
> would otherwise be standard except for the presence of a LOCK bit that
> can only be set once per power cycle, needing extra handling around it.
> 
> Due to the way these devices are described in ACPI tables with both the
> generic PNP0C02 CID and a more detailed ACPI HID we also need to add
> their HIDs to the list of known non-PNP devices. As there are several HIDs
> for what seems to be essentially the same hardware but I don't know all
> the possible HIDs this series does not include an exhaustive list of all
> such HIDs, only those that I could personally test.

This doesn't describe why we need the driver. We have established ACPI WDAT
table. Can't you utilise it by providing in the firmware?

-- 
With Best Regards,
Andy Shevchenko


