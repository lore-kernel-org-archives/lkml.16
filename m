Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54BB80B;
	Mon, 14 Apr 2025 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632581; cv=none; b=kllX6aAO69pJY1S741BKToLzZ+lHIOK4kA+Nt68gVK8NpQ2qvwX3UqUaw+Gstei8haz7iFKdsGaQvCG7IS/G5kNrskyZjVVzF89NzIRi9n4opFlP1ssBqZq7Xf566TvTITpdPSvnXq/u8TZzx0ICTQIOGO2KUOrIZ/PZpIn5VQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632581; c=relaxed/simple;
	bh=Z24WC0yRu0hGKO8M+SaIoFZZwIfYmEPH65p1iHpqsHw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYkiuyNUY124M3w7uLZ59yOl9VkYDOaFl2Vx0eNvFyXE4jlkzP9BPyyr+ienEsOl0bJHRXpL2aFH8juQuIN4LPw12spfQ4FP+glPOvVsLANnB98QhusDTwCZY0jFI1h6hZE/uzKJq1Ly9d6ajZ1/e1dT5NPysYuSLKGWNmJC0RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eSCYkf2f; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eSCYkf2f"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EC9U0R2150317
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 07:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744632570;
	bh=FY2G7ywdamUCOs1pJmxsy0MWSW+4XqqFqXoRrEMbON4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eSCYkf2f4IKIQQ2xCOtpJuiKiCMNGvpZqmaN9WPL3OGOG7TWJ+U0vbaEdmxbM0NPw
	 DijoYY52vLkdtu3+nTedcsO5WnrSf1JtqTUq/u09eiP4l7fU0YeLQUuG8yKNT2TYFH
	 9xicptTbWs5aYibt1NMSDadlqjGnBKVbKVFu9XEU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EC9U0x054608
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 07:09:30 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 07:09:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 07:09:30 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EC9Uic090737;
	Mon, 14 Apr 2025 07:09:30 -0500
Date: Mon, 14 Apr 2025 07:09:30 -0500
From: Nishanth Menon <nm@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
Message-ID: <20250414120930.m7x7zfmyby22urpo@ultimate>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250412052712.927626-1-s-vadapalli@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10:57-20250412, Siddharth Vadapalli wrote:
> Hello,
> 
> This series is based on the following series:
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> Based on the discussion in the above series which disabled 'serdes_wiz0'
> and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
> file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
> 'serdes1' in the SoC file anymore, since that is not a working
> configuration - serdes_wizX enabled and serdesX disabled doesn't work.
> 
> Hence, this series aims to cleanup the serdesX nodes after the changes
> made by the above series.
> 
> Regards,
> Siddharth.
> 
> Siddharth Vadapalli (2):
>   arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
>   arm64: dts: ti: k3-j722s-evm: drop redundant status within
>     serdes0/serdes1
> 
>  arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
>  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
>  2 files changed, 6 deletions(-)
> 
> -- 
> 2.34.1
> 


I do not understand the logic here. serdes cannot operate without wiz
nodes, correct? why would we leave serdes on by default?


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
