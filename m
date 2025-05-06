Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CC03C0C;
	Tue,  6 May 2025 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537011; cv=none; b=cU+ttOnZs4ycxQH0nMdorg0jLQmOtDfGMd0RYGtF/p+b6+DQTDF2r758c9XYYdxE0qit4u3XvEpAQ1Ka8vW8RdvMdfjT0ogk+4yZlATEiGgQlP7TTmyRfTJNKWIs1YgXITtQpQ+1+Nl3lCapNOzq8T/Rg1RUKXcdnXnNPoY7TdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537011; c=relaxed/simple;
	bh=/bpooHBEJModu2gwj25LTjMGDdwHouYNPtu3yCbIpBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YAS47rTlCKtVtJhVkZRY+vzZ/+aUXBlaCAd4XCqAC5AOoD3K14EhKJNDQvOypVrVhk7vZnc28zjYFxYjka0QpVfggirSrUBT1iha4eADUyRBj0foWbeI/vb5oc4URGIvZ7CXnmcglFMUm3f4REVaR89FYDZdblo6JGaZgOsCyCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Y0hlhFUP; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y0hlhFUP"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546DA3cw1233575
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 08:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746537003;
	bh=m1WV0MLIxAXaiL0qMLLb987hannOL0sYsm3J66Wc0gE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Y0hlhFUP5qOd3sYVqkxo8lsyYBg3/T2Kt/6x+yRcZ6SH376RvoXDr3/gJ81g5/7X+
	 E/vLDgqaRsdBQRZU76/7ldR4xwSD3mbaiS5i9TnvTmr1v3O84PEzWwqXai+2kwRAfe
	 Alg47wn31a4xdM6VU2D6HZYoTJioONISBiiGhSIk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546DA3g1103618
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 08:10:03 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 08:10:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 08:10:02 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546DA26a015719;
	Tue, 6 May 2025 08:10:02 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar Padhi
	<b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Andrew Davis
	<afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 00/11] Add R5F and C7xv device nodes
Date: Tue, 6 May 2025 08:09:58 -0500
Message-ID: <174653697389.718892.12387672790395559537.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250502220325.3230653-1-jm@ti.com>
References: <20250502220325.3230653-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Judith Mendez,

On Fri, 02 May 2025 17:03:14 -0500, Judith Mendez wrote:
> For am62x and am62ax devices, this patch series adds device nodes
> for the R5F subsystem and C7xv DSP subsystem found in their
> respective voltage domain, based on the device TRMs [0][1].
> 
> This patch series also includes patches for enabling IPC for am62x SK,
> am62ax SK, and am62px SK by reserving memory and binding the mailbox
> assignments for each remote core.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[01/11] arm64: dts: ti: k3-am62: Add ATCM and BTCM cbass ranges
        commit: 5bb1949ffa021056b389393c5edb22abba5372c3
[02/11] arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F node
        commit: 5722117235aca01893dbda9dbc7e4790b0b9d43c
[03/11] arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
        commit: 7f321892dc53015e29cd1055231727b8cdc24923
[04/11] arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
        commit: f0623719c2a612cbb9d5927fc5ffef9b54a12fb7
[05/11] arm64: dts: ti: k3-am62a-main: Add C7xv device node
        commit: 56f13d79430f8faa27943e376ac25aca0836ee93
[06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors
        commit: 77c29ebe76d80174d5735b61edd3c95e32a75d2e
[07/11] arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors
        commit: b05a6c145001e99348a2fe33958be912f4eb8d4d
[08/11] arm64: dts: ti: k3-am62x-sk-common: Enable IPC with remote processors
        commit: 8fb034b8402ead1028ed63394a177947b1450fcd
[09/11] arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
        commit: 2a473854bea16de7d3502ae2cd1ba4481eb632e9
[10/11] arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP
        commit: b4ec77305c2645ce96c4a13aca0c375815e06672
[11/11] arm64: dts: ti: k3-am64: Reserve timers used by MCU FW
        commit: e4b55d85024f806c9b364d498e0ebbc74d76d77d

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

