Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF2D81732;
	Wed,  9 Apr 2025 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204172; cv=none; b=dOALse+LSR7eZ0w0WAM8T/qXHqlim5Z3DxAe9EYZQZTn0TZR/rymsA80IB8H5O/XoCG0vA1F2tvjmI1AxeG3+Z5i+e7vVNo0SbbHwzzA2gvClbAFo2EaWmTzVqAe/wsJ1JHuD7wT+q6yaKA/Zj7SGr3dz1NeUooiWZeHGAe9O/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204172; c=relaxed/simple;
	bh=aufx8I/ndghuSYFBp4/9+yegVhQXuBIOziM18P6gPWU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohbAkElM9ID4SJN6w7ZtPM8CQUO9auC7xG8afOUCnR1D21+00aJU46xFRfrHKmM69cO1DBVCkbKj7B3MRyQ6nkpDyq4d/95nevUm7fgupJ90IJWCdll+di21K3BXCNHVJaC+GiCEKr3LbjHpvn66Lr3+7Rok/oJaY0hQ5ogiL9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fml/j+2T; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fml/j+2T"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 539D9JEa1473192
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 08:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744204159;
	bh=eUZgFTHeEy6hrwjjvFHHumFdJNoNVibZ3QUB37fvzWQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fml/j+2TsDO6QXwxGPWbx3MglajG2+DjXCUc8dXHHS18VYQFxRLxpldEMwNI3aOR/
	 Rscsof1bc8HivOvj5O0nSYvSJU4meOW/dp9KRfjC9NHzn2Z+xRE4pfubSMvucMfVA+
	 ZvGCAsGLXT1jqdg6TSu2rPfhGSCEiPuh3AQARJ5U=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 539D9Jfd029117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Apr 2025 08:09:19 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Apr 2025 08:09:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Apr 2025 08:09:19 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 539D9JZk064335;
	Wed, 9 Apr 2025 08:09:19 -0500
Date: Wed, 9 Apr 2025 08:09:18 -0500
From: Nishanth Menon <nm@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>, Judith Mendez
	<jm@ti.com>,
        Andrei Aldea <a-aldea@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Deepak Khatri
	<lorforlinux@beagleboard.org>,
        Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
Message-ID: <20250409130918.d3cyzv3to65oktv2@vision>
References: <20250408231823.826163-1-robertcnelson@gmail.com>
 <20250408231823.826163-2-robertcnelson@gmail.com>
 <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 18:19-20250408, Robert Nelson wrote:
> On Tue, Apr 8, 2025 at 6:18 PM Robert Nelson <robertcnelson@gmail.com> wrote:
> >
> > BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> > PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
> > Its dual or quad A53 cores can provide higher performance than classic
> > PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
> > JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
> > MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery charger.
> >
> > https://www.beagleboard.org/boards/pocketbeagle-2
> > https://openbeagle.org/pocketbeagle/pocketbeagle-2
> 
> dmesg:
> 
> https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1
> 



Any idea why we are crashing?
https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1#file-gistfile1-txt-L311

I don't see the same crash in beagleplay:
https://gist.github.com/nmenon/5709a8714d3ab31cac5c00b515d04752
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
