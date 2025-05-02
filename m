Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F86256C70;
	Fri,  2 May 2025 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197088; cv=none; b=IGqfsSetpflVtbSIleG0OGywHxWwAaXGev/9aplSNLc/5de+b2QUHXmps6SaYSV7fXtdIQJvBTsZlKXN2DSCVYwF8dwjsCTj0SNFP/MWwZC+G1sruvO+C2E+rGD/892dh/L2Ywivf44VEjTGM8DzlZnanWsB3uNa3Ov8egDSKy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197088; c=relaxed/simple;
	bh=U4EvRvncQ+ZnYY+y+wDX0rbrxAa0m7a9jku71njH2j8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9ErX0K26FA1nMRG1UrVhqS/j17ioaJPW1HzWGqHfTyAmgFWXufsWF+6IFHUbV6kIyAa0wiSgIg+vE4zpCH/0fU+dkgkx0m4Y9Ir54rrnGSfTd3fFYWEhkUXM3gGXkb/g+BsgyYpketJ/k7D6R4DeQMnf3QORzdzglwGgj4hIn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rIlHUvbn; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rIlHUvbn"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiXkf430797
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197073;
	bh=VGRzkNwck2VgyYwpwN+WuSVIvbmopA7IPAFz7KH7CAY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rIlHUvbngpq1VMlyP5aAstvb5E4Fps23bLTrGwdldy8lub13C/dt+rkfVtfzxYHbj
	 f1MpYDhABo1yfFHsNhydoLg3qUAxlcDV/8SANax4LZhIeqWn5MvL8c6Hrw6CPgisSU
	 ZLBm/mrT+dtfFDH5TPpOZAz9JFPLaucnFaY6CERU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiX5a037873
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:44:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:44:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:44:32 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542EiWU1128660;
	Fri, 2 May 2025 09:44:32 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <parth105105@gmail.com>, <parth.pancholi@toradex.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v3 0/2] J784S4/J742S2: Enable ACSPCIE0 output for PCIe1
Date: Fri, 2 May 2025 09:44:30 -0500
Message-ID: <174619706058.3123134.8004461889197725220.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250422123218.3788223-1-s-vadapalli@ti.com>
References: <20250422123218.3788223-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Siddharth Vadapalli,

On Tue, 22 Apr 2025 18:02:16 +0530, Siddharth Vadapalli wrote:
> This series enables the reference clock output from the ACSPCIE0 module
> to the PCIe Connector corresponding to the PCIe1 instance of PCIe on
> J784S4-EVM and J742S2-EVM.
> 
> Series is based on linux-next tagged next-20250417.
> 
> The previous versions of this series were a single patch. Based on the
> feedback received on previous versions, the SoC and Board support has
> been split in order to allow reuse for other Boards based on the same
> SoC.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-j784s4-j742s2-main-common: add ACSPCIE0 node
      commit: 9bfebd8750a06f5f8bf16ac58eb7deb638686d07
[2/2] arm64: dts: ti: k3-j784s4-j742s2-evm-common: enable ACSPCIE0 output for PCIe1
      commit: e3dfcf482d0787a5882f10a33daa4c1ec62b87d2

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

