Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CAB230BEB
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812996; cv=none; b=H5HfIBMPshkRIEvNbCyoYTSGLZZzbsUWxf6wJZaITz0loU2C+jFGjkq4X+k66d/4DIOMGzgs7fbqcIFM5ahH6vwV4VybGaFIkfuXylgAOYRrH1NU3ZHGZATOc6HZaXLdc/WWrk00xwrtf793mhVw8DntvS7zBdMBguETOwubm+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812996; c=relaxed/simple;
	bh=/JcllkLbrvLKESRy3306wlT1YFBXD98XhZN3kMfY1do=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=NWE3EgjzU3LaCJeM0JniGCc7EHBUaGmsoB49kNqrIQJ+ND8dATVc4YFbJn6aqrReFPOLv+5F036mXnO1AV3sNEEu9N/NBw4qqM9xswJFazZfLtSzzikxp5HGWnziRIEnAhrHY88EJeqMC8pg0xivR+y0GWEoO91DDBOkf3uz8SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fI5627m6; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fI5627m6"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54L7aIND1454795;
	Wed, 21 May 2025 02:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747812978;
	bh=mMuYCSbFg37yvjOCyQwER8gGsGSyFNBjSLw5eTl4nmA=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=fI5627m6om4QOgSGS0XOwjje5HkkhfDpo7if4VBiQhefTzB8qSK7J9Qn6laooOCoO
	 d1pLaYyu/BdNrNDO9OZtWh8DafdGP1+Fd+t2olQLpUYhSVhPExuq3hrhN1pXae2n5J
	 PmDMoigOWgXOplkUj7OGlZR68x+T2ws78Lhj7Jjg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54L7aHWq2559326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 21 May 2025 02:36:17 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 May 2025 02:36:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 May 2025 02:36:17 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54L7aB7B070860;
	Wed, 21 May 2025 02:36:12 -0500
Message-ID: <acb55d37-8231-4f81-92ae-039d84717d71@ti.com>
Date: Wed, 21 May 2025 13:06:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm: bridge: cdns-mhdp8546: Fix possible null pointer
 dereference
From: Jayesh Choudhary <j-choudhary@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alexander Stein
	<alexander.stein@ew.tq-group.com>,
        <dri-devel@lists.freedesktop.org>, <sjakhade@cadence.com>,
        <mripard@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>
CC: <amishin@t-argos.ru>, <jani.nikula@intel.com>, <tzimmermann@suse.de>,
        <maarten.lankhorst@linux.intel.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <linux-kernel@vger.kernel.org>,
        <devarsht@ti.com>
References: <20250116111636.157641-1-j-choudhary@ti.com>
 <e76f94b9-b138-46e7-bb18-b33dd98c9abb@ideasonboard.com>
 <9431081.CDJkKcVGEf@steina-w> <59c66b9a-9ced-434e-8e6d-626a1fa70abf@ti.com>
Content-Language: en-US
In-Reply-To: <59c66b9a-9ced-434e-8e6d-626a1fa70abf@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Tomi,

On 28/01/25 11:27, Jayesh Choudhary wrote:
> Hello Tomi, Alexander,
> 
> On 24/01/25 13:38, Alexander Stein wrote:
>> Hi,
>>
>> Am Donnerstag, 23. Januar 2025, 17:20:34 CET schrieb Tomi Valkeinen:
>>> Hi,
>>>
>>> On 16/01/2025 13:16, Jayesh Choudhary wrote:
>>>> For the cases we have DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set,
>>>
>>> Any idea if any other platform than K3 is using this driver? tidss
>>> supports DRM_BRIDGE_ATTACH_NO_CONNECTOR, so if K3 is the only user, we
>>> could drop the legacy !DRM_BRIDGE_ATTACH_NO_CONNECTOR case. Which would
>>> remove quite a bit of code, I think, and make the driver a bit more easy
>>> to understand (although I think it could use a major cleanup...).
>>

I cannot access the atomic state in this worker thread so I cannot reach
the connector using drm_atomic_get_new_connector_for_encoder.
I can't find any other way to do this. So I am rolling v2 for RFC while
addressing your other comments and fixing it in a different manner.
Please let me know if that is acceptable.

v2: https://lore.kernel.org/all/20250521073237.366463-1-j-choudhary@ti.com/

Warm Regards,
Jayesh



>> FYI: Not directly using it, but patch series [1] is at least touching
>> this file.
> 
> I can't see any other platform using this.
> No one uses compatible "cdns,mhdp8546" and only K3 devices uses the
> wrapper compatible "ti,j721e-mhdp8546"
> Let me post next RFC version with legacy !DRM_BRIDGE_ATTACH_NO_CONNECTOR
> dropped.
> 
> And the mentioned series only touches mailbox access function to move
> then to a common helper file. (So independent change)
> 
> 
>>
>> Best regards,
>> Alexander
>>
>> [1] https://lore.kernel.org/all/cover.1734340233.git.Sandor.yu@nxp.com/
>>
> 
> Warm Regards,
> Jayesh
