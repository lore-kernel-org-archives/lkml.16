Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDD926AA93;
	Tue,  8 Apr 2025 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114669; cv=none; b=vDpJQow4S/YB+Fl8pZdiHUlq110LhTBQnWNUyKz8aT/067EzLLpuN7aQ5/MUkxnyrqhQTZYDsVLQpvi/gZqgs7zIekWKe5ViXVfka88mbLItq3Ngi7+7FjX5xM3QY3GF1AAFx+AH3NfivMRDCIbeM4aGCtLv8EiP9re6ewxr9Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114669; c=relaxed/simple;
	bh=V1YRfWmWFWbhpHBtVJZMWNP1AZyQpK52DXn595wf9HY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSX7ZfNp2LWOHb2K7U1oO307MY54QM1jFW/SNrddqRvkNXQjB3ZlOG0eAgMa0j6cVhUZkq3/ZAqOVmHwHxewpc/zKliqzgk6bvy5954dloWq1hEx8djegJAFF1hMTq57+UICAuzsMLfviAKaWc5LZS27yGfiw0DiGVyGVaFa/Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Z+pTG+24; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z+pTG+24"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 538CHNdb673137
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 07:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744114643;
	bh=40zPUQrlcr8Vw5CjXjou4ckrp+WYfHtg2mzzQ/p+6/0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Z+pTG+24QgYuVGeEyiu+Krg6vZD7z7igJ9ynRkHU8gV8Jm+rk/alFJXJ6xgz/x1Ze
	 a4AtgTKrrLmHMtSXF4MfZwIp5riKITAoI2dWKwHf1d/oOE7WISSopWkXw9bHWnU1/X
	 FSaUIkDrIXCw+FmbzQOfgnR4PAZo73uoIGk5pqJg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 538CHN4S008016
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 07:17:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 07:17:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 07:17:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 538CHNA4001367;
	Tue, 8 Apr 2025 07:17:23 -0500
Date: Tue, 8 Apr 2025 07:17:23 -0500
From: Nishanth Menon <nm@ti.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <jai.luthra@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH 3/5] arm64: dts: ti: k3-j721e-sk: Fix dtbs_check warnings
 in IMX219 overlay
Message-ID: <20250408121723.ksjtilh4hxl2wh34@derail>
References: <20250401114053.229534-1-y-abhilashchandra@ti.com>
 <20250401114053.229534-4-y-abhilashchandra@ti.com>
 <20250407134523.d56rjpydflmkw2ze@privatize>
 <c1762c69-6a76-4f89-ab64-e6d9215e1be2@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c1762c69-6a76-4f89-ab64-e6d9215e1be2@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 14:31-20250408, Yemike Abhilash Chandra wrote:
> Hi Nishanth,
> 
> On 07/04/25 19:15, Nishanth Menon wrote:
> > $subject - the patch adds description for the supplies for the sensor.
> > Please fix the description.
> > 
> 
> In this patch, I am addressing all dtbs_check warnings generated from this
> overlay:
> 
> 1. Adding the missing regulator node
> 2. Removing the incorrectly added clock-names property
> 
> Due to the inclusion of both changes, I opted for a more generic commit
> title.
> Please let me know if you want me to split this patch into two separate
> patches
> with specific commit titles and commit messages.

subject line should indicate what we are fixing here. If the commit
message indicates two different problems that were to be fixed, it is
better to do that in two different commits. Generic subject line is hard
to gork to understand if it is critical or not.

Do not forget ./Documentation/process/stable-kernel-rules.rst and use
fixes: tag as appropriate to indicate the original problem patch
which is being fixed.


[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
