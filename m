Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C252550B3;
	Mon,  5 May 2025 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450191; cv=none; b=g8gPtUS4PII/0svIq6G9VS7opxZ8jlldWhdTdCaIa7VvTrF7D4QlGL0DP0IvH3h58KjWopkIxtomt32e6OLMf6q7hkKwnXA6ib3DqpYYjnPwA6oj5+VjgKgp4nrgwZrNAnKiRjFGyY7ZsI/ZZDM2l6MA0tiOvcLQeuj8z75Fg0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450191; c=relaxed/simple;
	bh=I3du49/zti6vYZR6AKYEZr1VnzwPOVR/3gGU23azqjY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blfJmuuBpWhwczTEYNihlU3F2M744xAkohqX09mmLaWZ8mMNJ5fox0Pfb6CrT+crsBQUGDO6N+mWyd2q9yvQFDYj0Ede7zMedpgEefvG1SppZly4/Wa56f4IPman+yV845RdRqa0pkCr35rlw7jd74dBdpdawwMyfDkf0DC376w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YgBPQDsO; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YgBPQDsO"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545D33sQ943634
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 08:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746450184;
	bh=bCVraN1KmmvdFxDljtPzJDoctV1ha4kdbThoFPLx6v4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YgBPQDsOZPJ3bQkSLIVWcdnTs0GfpsEZ2/ZTe04ZSsGkK4fWItgbJ5W0sNgCfDimA
	 VU2shLyK/bKDKGPSizY9m4qMIdJnYpsKkmAA0UNhHNf+Mx5Zh6Jm0XFyV/sJz3tHof
	 qv0u3nfMw92xQ2H2tVeX2qfyTtJvzK4hSfBlJeQs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545D330n013862
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 08:03:03 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 08:03:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 08:03:03 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545D3319097888;
	Mon, 5 May 2025 08:03:03 -0500
Date: Mon, 5 May 2025 08:03:03 -0500
From: Nishanth Menon <nm@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
Message-ID: <20250505130303.x56xnmww5mzohahn@reentry>
References: <20250502153915.734932-1-p-bhagat@ti.com>
 <20250502153915.734932-2-p-bhagat@ti.com>
 <20250502160541.azhzbnmghrkory7h@cleaver>
 <e7ddd359-bf19-4f6a-af32-43bcb5504ab1@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e7ddd359-bf19-4f6a-af32-43bcb5504ab1@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 15:01-20250505, Paresh Bhagat wrote:
> On 02/05/25 21:35, Nishanth Menon wrote:
[...]

> > Looking at the board patch in the series, this is am62p5 ? what is the
> > difference? If there is a difference, why is there no dtsi
> > file for am62d?

> AM62d2 SoC is similar to AM62a7 in terms of CPU cores, cache hierarchy and

Looking at the block diagram side to side, I am unable to see any
difference - it looks like "similar" is "same" ?

> other peripherals. https://lore.kernel.org/linux-arm-kernel/20220901141328.899100-5-vigneshr@ti.com/
> Thus same dtsi file is being reused here.

So, if there is no difference at all, why this series? Commit message
does need to specify why exactly what is different and why we are
re-using. If there is no difference what so ever, then we follow what we
have done in K3 architecture so far, which is just to introduce a board
file (assuming there is difference there Vs what is supported already).

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
