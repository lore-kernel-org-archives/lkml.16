Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DC7270551
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376631; cv=none; b=nmvW/q6Lif+4eyQ9uGgaUvXYOzL+Y5adkXHliCuk0xZRT2SJMAEP+ueZ1WV7MaBBlxQYq8wxDgchkj6vw9cEzVghQI31Y6NwM/CAS+LA6BL9jo4zGofaZYgKpVB8Z72HKDLRxIkRddpiZy5T/VgyySE1rBRbWI9GzoAvTYSM/Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376631; c=relaxed/simple;
	bh=MimPd4t9Pugh2jkUWpafhm1TpHXQqs1qUbGHE2FI+Y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TwZeDlfN3wYnV0OKW8O81FnoM5TyGrw0LCqOn9StFl4T9TS+ZABWzts/+W0H5NrlqRDkTLdQyKMEtOw9IG99NUYzdVv5VT6Hg7xbacrGzz4JMsm88svt1Nk7cVMGE4/oUJ2Cw0KwLJSJDN4G7c+NT0TIlKv2rDftvMq/qu7+t7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fzFS7H01; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fzFS7H01"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561DUEl43637713;
	Tue, 1 Jul 2025 08:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751376614;
	bh=DJVvZdihbY2Bkzn7JljaxFzTZjHhbJfsa0+sUreYOkE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fzFS7H01BUNrJlrmw98KrR2Ct4RVc2dW7Vs3TtQOTC1pkl2MNiGN/36D9A9qc3V3+
	 3/zrAr2E/YIclFF3J7WOyDgKGxnVDoO9y6+MNlDgq/q/T0dd9mg7Kcu2OEz+45ix92
	 k6uURHTEy/NS2/OPfhjnU7RnhQ8GDONjHbRxhBpo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561DUEtg259931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 08:30:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 08:30:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 08:30:14 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561DUASi1353864;
	Tue, 1 Jul 2025 08:30:11 -0500
Message-ID: <a0489fea-8c06-4c89-a530-8be691f4705d@ti.com>
Date: Tue, 1 Jul 2025 19:00:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Decouple max_pclk check from constant display
 feats
To: Jayesh Choudhary <j-choudhary@ti.com>, <jyri.sarha@iki.fi>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>
References: <20250701095541.190422-1-j-choudhary@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250701095541.190422-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 01/07/25 15:25, Jayesh Choudhary wrote:
> In an effort to make the existing compatibles more usable, we are
> removing the max_pclk_khz form dispc_features structure and doing the
> correspondig checks using "curr_max_pclk[]".
> 
> Changes are fully backwards compatible.
> 
> After integration of OLDI support[0], we need additional patches in
> oldi to identify the VP that has OLDI. We have to do this since
> OLDI driver owns the VP clock (its serial clock) and we cannot perform
> clock operations on those VP clock from tidss driver. This issue was
> also reported upstream when DSI fixes[1] had some clock related calls
> in tidss driver. When "clk_round_rate()" is called, ideally it should
> have gone to "sci_clk_determine_rate()" to query DM but it doesn't since
> clock is owned by OLDI not tidss.
> 

As series is fixing above issue (abnormal behaviour while calling 
clk_round_rate from tidss for VP clock being used by OLDI), can we add 
"Fixes tag" for the patches?

Regards
Devarsh
