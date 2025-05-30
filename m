Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E14189513;
	Fri, 30 May 2025 04:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748580867; cv=none; b=U3uAb0tKkS3dFdo3vqX9eJ0d9dQmhctv07j0sjbbtcAf15ktiGrGvcyBxz7hE3PipX7aPMYpPMCCQkncv0tE2dqkyamqPnf9d7QrUTnRXF59eUJa2AtEcghaAat2M1cRQsIymz4iUyS25Ij76+xHWckuu52hyARCPNTHU8/TCiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748580867; c=relaxed/simple;
	bh=PlJYv7a1kevMgQMMDKAs4mCChzhyuzZz1iGoFFENiD4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHFuzFyqx/8EuOm0cq2JgHUPRjbjYw3IxJ/Rmp8xnG4eHem8TCXz8DwwdPXdE9+5pXi6sy17QubJT8v2p8nzZOPlB3wj4N6111bo2kV24UjJIhV5w1caE9N5gVhD5OdDFTIoWNBZbyi8GkRf8fNBhBVtwxY7o23W2fCb92NkelI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vNVwq3eO; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vNVwq3eO"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54U4sIKc3690307;
	Thu, 29 May 2025 23:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748580858;
	bh=j88dOx9CKL2iTWNeMcWQlAwWWk3oGkkwgXbvo2MDQ7k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vNVwq3eOt4t6WEFS5juWeGnwJjZ+4uAZsDrhL6U5ZIXMDwL4HfXlpqfilZ3m1hLRY
	 VEgvkEqrgd0vNBvFeOHGdjU2B+LgM+Z33WPh6qKp788/5VJb0BNn0P0XU7ZHYySVWw
	 RCtaY3kdkxDB5NqA8aqSE0KNwUqPvtZlXwFsGaSU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54U4sI7o578818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 23:54:18 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 23:54:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 23:54:18 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54U4sHDH2555964;
	Thu, 29 May 2025 23:54:17 -0500
Date: Fri, 30 May 2025 10:24:16 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 07/13] arm64: dts: ti: iot2050-common: Remove redundant
 "mcu_cpsw" node status
Message-ID: <29efc4c0-e206-4f1c-a52f-27e5bbcda64b@ti.com>
References: <20250529133443.1252293-1-s-vadapalli@ti.com>
 <20250529133443.1252293-8-s-vadapalli@ti.com>
 <c0fdeecf-4a76-473d-9b66-e547d8fe9d1f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c0fdeecf-4a76-473d-9b66-e547d8fe9d1f@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu, May 29, 2025 at 03:38:51PM +0200, Krzysztof Kozlowski wrote:
> On 29/05/2025 15:34, Siddharth Vadapalli wrote:
> > Now that the SoC file "k3-am65-mcu.dtsi" disables the "mcu_cpsw" node by
> > default, following the existing convention of disabling nodes in the SoC
> > file, remove the redundant section for disabling the "mcu_cpsw" node.
> 
> It became redundant when you disabled it, so this must be part of that
> commit. Do not create redundant code with some artificial split of one
> logical work.

Sure, I will squash the commits. I tend to split the commits since it is
easier for maintainers to squash commits (if required) than to split them.
Thank you for reviewing the patch.

Regards,
Siddharth.
