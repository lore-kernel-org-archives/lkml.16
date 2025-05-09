Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66AF28FA88;
	Fri,  9 May 2025 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793166; cv=none; b=YjRabua1mU/bicvCBCHFly5lnXjIIjwfIvqoSuwUdiQ49LlO2Qj1cDZdw4fgkqCXZDKa/RoyW37CW2ExLjZx35gjhDaYJBGDozobCV34Vpt2keBiPAQKuxMUj7Iw1Ggq8arVgkXu3CiSmNrh58yXUpdiQl6CLHLOTCZmLkk2iV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793166; c=relaxed/simple;
	bh=NjwdzeI3LIHCeBC02VI8Dq1qSyVjAC9mWwY5oWvAzxU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ko7x9u00gP4U4Cr+OG8gCIPeXIoVP7YCw1HrtVy2zIKjdCX8NwWHDUDYyBwIIp1RzI28fCB317OnqBntxdXR/73lRJyh9Jb+/AFXVJbTUYSXaAxlnP1s3vsp4hlUsEXwfBzV72+deOdPWRMa5mjJ4UYY3ZTkn6GUUM2yHyynlwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f2TzyCl+; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f2TzyCl+"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 549CJFIX1397284;
	Fri, 9 May 2025 07:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746793155;
	bh=2jyB6aUOgYfUPr24M21QgvhDyfQjoJzYfN68uPqNe9g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f2TzyCl+jENyjpZElnYmwnXctueESgB3m4PLOJmrwjhjD6ldM4rsGqY1idJv2Jhj6
	 jGM3aJ9t9yI3exQ0echzxkEQptsBHq73cDozKZz2edkbovjZIBWLyCesZ8qflJelsK
	 xAJVG0jpcNkeYk53tEMdkjHRDrw7WeLGl/358vCE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 549CJFBL2855990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 9 May 2025 07:19:15 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 07:19:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 07:19:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 549CJEF4051801;
	Fri, 9 May 2025 07:19:14 -0500
From: Nishanth Menon <nm@ti.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <vigneshr@ti.com>, Prasanth Babu Mantena <p-mantena@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1 on J721E
Date: Fri, 9 May 2025 07:19:12 -0500
Message-ID: <174679309079.1567113.16838918804275353622.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250507050701.3007209-1-p-mantena@ti.com>
References: <20250507050701.3007209-1-p-mantena@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Prasanth Babu Mantena,

On Wed, 07 May 2025 10:37:01 +0530, Prasanth Babu Mantena wrote:
> J721E SoM has MT25QU512AB Serial NOR flash connected to
> OSPI1 controller. Enable ospi1 node in device tree.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
I have done a minor local fixup for Fixes tag as I had responded
in the thread.
Thank you!

[1/1] arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1 on J721E
      commit: 6b8deb2ff0d31848c43a73f6044e69ba9276b3ec

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

