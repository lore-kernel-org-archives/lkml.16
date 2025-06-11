Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98635242D99;
	Wed, 11 Jun 2025 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646414; cv=none; b=J50PAlNJgFHTMVAH4QEQ4KV1KH2F0tNvYutU2/W6phnJA9x0JmYbefnSSm7jmKq1StodLx7OvtCjz7Kid7KVj4gEMKF9/5H5o1v+ym0CSrl8le1sEd0rWEKz7D0iZiSXjE3i+VbZCPoalTNhUDwORbgHPPEp1jFpci71uatdppg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646414; c=relaxed/simple;
	bh=DqUnx3Tn8vrHCnhSVQHxQY//CqiAHSj+tXQoJx9Ls34=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKSMHUjpsCjj/quLD+VaBBcFTyxvgM1EgDJkn+zZWCr9YN8EuWy6i5flUSoBpS5zBcPQKVnRui+2D0OjqxQiaFnzPcNyfxIwjfzZCNZURh73/PezpR3W04FLV8HBBgnzPdWwDDQ6sLxm9G5Wva0AFiA9z8WMyg/tE25X4xvuSZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vEU8OJo+; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vEU8OJo+"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BCrQNQ2607077;
	Wed, 11 Jun 2025 07:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749646406;
	bh=QSq1/7jMgg3K9UZotY/kkF6eaX6W6YJjHiG5GK8EF4U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vEU8OJo+FS/6fcfwMFHrP/HftKpV3KF7QPOzWwgXeX92ljXroTz1fdn9Lrhv/70+u
	 +F7QoXWpuh3Szaj5nZlIRh3kq+IkwBps/DKIhFO1Hprks9hxcTyUdZ0TrtaSWzsqzR
	 IH3N0Zhmf6heR6Suxg97u2/Q1k9QJRMrwk0jE0OQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BCrQeR2869382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 07:53:26 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 07:53:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 07:53:25 -0500
Received: from localhost (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BCrOVO352897;
	Wed, 11 Jun 2025 07:53:25 -0500
Date: Wed, 11 Jun 2025 18:23:24 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Hrushikesh Salunke <h-salunke@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>, <srk@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Add idle-states for
 remaining SERDES instances
Message-ID: <ec2c7fab-6f4d-4163-90a9-16dddec80adb@ti.com>
References: <20250609115921.2380611-1-h-salunke@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250609115921.2380611-1-h-salunke@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Mon, Jun 09, 2025 at 05:29:21PM +0530, Hrushikesh Salunke wrote:
> In AM69 SoC there are 4 instances of the 4 lane SERDES. So in
> "serdes_ln_ctrl" node there are total 16 entries in "mux-reg-mask"
> property. But "idle-states" is defined only for the lanes of first two
> SERDES instances. For completeness, set the "idle-states" of lanes of
> remaining SERDES instances to a default value of "unused".
> 
> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.
