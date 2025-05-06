Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3611F15E5DC;
	Tue,  6 May 2025 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536930; cv=none; b=ZsTXrNM7P4loJ1zsLO4fnIJqjALPXIWNSYGRiwQG5QPB9bu8Ci0E0wq4FSYZ8g4rapVbUac8pCJVJwXf6frkSyJ1FRpWOe6Yxfvulgk8yA+nTvWJI6Qm9AyBLAs365t5/ZXfKRQZQPeMZlwEzJDvDoql1Xbn7zej/lr8Kk1AlCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536930; c=relaxed/simple;
	bh=Bke2oJVWJgJQ0cXtYQ7p92LP01wN15WaterqQZLbQb4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6XNjybpiJM5OoG1G6IqXEpXvyqI2oT5jjpxWgcsBq8mSAMIjUUDYkwpOmACYjiiRLvCVTXhgM6yFNUg2W975dSrmdV3fTmt6QylLKRkPMJJqvqkVlAGxgBOxYAY36hTOScHm/0lgaCt1b9Qd7cql50dvplyxTRlbOXBgLClS/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KlfoDDqi; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KlfoDDqi"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546D8UTE1067731
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 08:08:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746536910;
	bh=QrTBUEMOym3jK4zrXFsi3KRht5oC7aG3ts/QqJWOXiY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KlfoDDqi32hA0uDSkHEWy9dZCXUJwn/xbrEPfF90Vy9Q5ARfAdkE5O7loVw9JfwE/
	 7QJxNyOajnuZ6ojWkVw+guAfFcIUJSbZ38Q2HeWcTSQk56eE8YtVQQSzOUIubAlmsH
	 XzTyGi/z6r2P8ZAoNjNU6UxeGHMZI1Rk/bRy6xS8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546D8USO102385
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 08:08:30 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 08:08:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 08:08:29 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546D8TEu013595;
	Tue, 6 May 2025 08:08:29 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, Rishikesh Donadkar <r-donadkar@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <devarsht@ti.com>, <y-abhilashchandra@ti.com>, <s-jain1@ti.com>,
        <jai.luthra@linux.dev>, <jai.luthra@ideasonboard.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>
Subject: Re: [PATCH v2 0/4] Fix dtbs_check warnings in sensor overlays
Date: Tue, 6 May 2025 08:08:27 -0500
Message-ID: <174653687807.699760.18005096784426539033.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250502162539.322091-1-r-donadkar@ti.com>
References: <20250502162539.322091-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Rishikesh Donadkar,

On Fri, 02 May 2025 21:55:35 +0530, Rishikesh Donadkar wrote:
> Fix the follwoing dtbs_check warnings
> https://gist.github.com/Rishikesh-D/ba0876a26e35c3b9662c75563b8b77ce
> 
> Test Logs:
> am62a7 + imx219 : https://gist.github.com/Rishikesh-D/f32d6a0ec3cbb0f9f4f29254239d3cd2
> am62a7 + tevi-ov5640 : https://gist.github.com/Rishikesh-D/21aad1db1487b884c22527d6e1432ae7
> am62a7 + ov5640 : https://gist.github.com/Rishikesh-D/da4489f1813e90d840fa5ca91df5923e
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am62p5-sk: Add regulator nodes for AM62P
      commit: 90770c243c384ddde070099e37a3ef2f3b71ff8a
[2/4] arm64: dts: ti: k3-am62x: Add required voltage supplies for IMX219
      commit: d44915df7592b27e3e8c8b3e87c03603e3b0103a
[3/4] arm64: dts: ti: k3-am62x: Add required voltage supplies for OV5640
      commit: 23a5409369b11e9174ba95ba8ddedcffacdf9529
[4/4] arm64: dts: ti: k3-am62x: Add required voltage supplies for TEVI-OV5640
      commit: 30ce5f163e4fb81d1467b15ecc508889be7eabca

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

