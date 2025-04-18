Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765CF14EC5B;
	Fri, 18 Apr 2025 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002826; cv=none; b=QMXCrQwx0iWIQp7AtkWWLUhFtk+3OIPjv/PEChWZXkvCiUjk6CN0HK19G+gko1yVyFee2zRzIXmkfoiI9rE74Gy16IkJ6h3FImgEI9sLkXfsfQj3hzy6I8gkT+p2uhs+gEUqpXmd6JiDQ+0T9mKJEyjFppnM/Mzi0+3EQ+3gpq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002826; c=relaxed/simple;
	bh=F3VmWRHx+UIETMeqIT7KP7lQ0w/tMPCOqgmLpGNNeQY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sYAMpwN9anx8uM/S+yz/dyz4JmN5CIegKeC6gVp3RbQG2iO1eUTIbkSQhT1822K3TpgpWINlXcgcF556SVxgfxwwYRlFu+FrgEQ60ZaIjnb2NVVuwnR6RSxOt3s+xHZJzTIynhBsff4g4HwwNpuxUmL1SLpSyAWUzNqOXvrxLm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GDueWkKA; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GDueWkKA"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IJ0C2j1061682
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 14:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002812;
	bh=AOMCPCVH5mFNR9+7E9QB2UW9eCxznsJSzMrjdheXjNA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GDueWkKAplp3xSed2AeDL9KGQk9PjCwJ8ZOM0dZp3oL5z4XNaFxzRt7ViscW6dxTq
	 /lw/eGMnwGyZVO54YmxeJmzvzcKRzP8qfecuynkhgG8+CD/fnQndU8qeMyz08qy8Od
	 yOT63BXsjMLce9Refs76emj9Tj1SKwI8u0yU113o=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IJ0BpT111217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 14:00:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 14:00:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 14:00:11 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IJ0Buc121849;
	Fri, 18 Apr 2025 14:00:11 -0500
From: Nishanth Menon <nm@ti.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Robert Nelson <robertcnelson@gmail.com>
CC: Nishanth Menon <nm@ti.com>, Conor Dooley <conor.dooley@microchip.com>,
        Dhruva Gole <d-gole@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrei Aldea
	<a-aldea@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Deepak Khatri
	<lorforlinux@beagleboard.org>,
        Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: ti: Add PocketBeagle2
Date: Fri, 18 Apr 2025 14:00:09 -0500
Message-ID: <174500275378.96085.17582484120065140121.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250415225940.3899486-1-robertcnelson@gmail.com>
References: <20250415225940.3899486-1-robertcnelson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Robert Nelson,

On Tue, 15 Apr 2025 17:59:39 -0500, Robert Nelson wrote:
> This board is based on ti,am625 family using the am6232 and am6254 variations.
> 
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-2
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].

I have dropped the Cc list as Krystoff pointed out this time around when I
applies the patch, but, please take care of this from the next series on.

Thank you!

[1/2] dt-bindings: arm: ti: Add PocketBeagle2
      commit: 3a5ff313ac521ff034f07ea6687ffb3f2229d62a
[2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
      commit: 92d8c028aa924286f10ac75b7f9e8edfc9ed432b

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

