Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B6717C219;
	Thu, 26 Jun 2025 04:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750910681; cv=none; b=JjOB76bsWg2kfkgF6u/P992jy0b48kfud1fQgEBegam25e3UO1dLb65yq3S5vqmptFrfrtfMYxQsSDsLJbi2+Ayuwl03689ccoc4F/GdrUSBkRMOU3FqfONWO1XO/vN098DjjcXtdAAOf2S/tE4mYKW7OCJftrS6ZxDO/R36VgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750910681; c=relaxed/simple;
	bh=A/JxtFDR9cml3X4JdecW/b6exF4TA3kIDLcq/31CSys=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6KoG9iUY42M/m9patIKfKhMAdnwy/xz82wRj6bvMifXpCxgcFOT6GTWwV7+wSeYCbyfkf1XxBAZ0YcAr6PAQFY6I6PIsMWtAwDjN9DfMOEmPdyJcux7ijM30IN14sMB+bfIWtXbuMxs62RGGQxldqfkaRnn04Zo2zpnY5LAUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NfU6O7Ww; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NfU6O7Ww"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q44ZaY2303517;
	Wed, 25 Jun 2025 23:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750910675;
	bh=6iawhAcBMlqWUHyPcEw0STZIXQJ74Yg3UZePUno615M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NfU6O7Ww5UvBI2qJ5cqCA7ktN6s/X1hV8Fg2fsKbKZnkPkp5I7kAL3yagSXIBqmdH
	 r4Gp6fJ7eVItUJTAcuMiSZVtt5xxOhQGulvSmSFeEu3lJEbBoJlnrxnnmXsloApG9X
	 f6EgCYnfqA2JS7gT4OJ4RADtwskfB6v3/mOlYgzg=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q44Ydo1621181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 23:04:34 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 23:04:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 23:04:34 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q44U92600170;
	Wed, 25 Jun 2025 23:04:31 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <devicetree@vger.kernel.org>,
        Jayesh Choudhary
	<j-choudhary@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <r-donadkar@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: (subset) [PATCH 0/3] Enable audio support for J721S2-EVM
Date: Thu, 26 Jun 2025 09:34:10 +0530
Message-ID: <175079060333.1874839.12615376553290693686.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604104656.38752-1-j-choudhary@ti.com>
References: <20250604104656.38752-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jayesh Choudhary,

On Wed, 04 Jun 2025 16:16:53 +0530, Jayesh Choudhary wrote:
> These 3 patches add the support to enable audio on J721S2-EVM.
> 
> This required the i2c-mux support[0] which is now in linux tree.
> 
> Now, this series ***depends upon only one dts change[1]*** to ensure there
> are no dtbs_check warnings (no functional issues):
> "ti,j721e-system-controller.yaml" refers to "ti,am654-ehrpwm-tbclk.yaml"
> for clock-controller nodes, but for audio we need "ti,am62-audio-refclk".
> When scm_conf is "simple-bus", there are no such warnings.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-j721s2-main: Add McASP nodes
      commit: 56bf596ff9026b616137968102884233c86055d4

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
Vignesh

