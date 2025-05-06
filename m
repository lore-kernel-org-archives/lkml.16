Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035F266B46;
	Tue,  6 May 2025 13:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536975; cv=none; b=uAFHKDOrAi5uTvV0/fEuzxVjtdu5w+s5qrd1hnyOia1zr93z9AfvjIy3yg4jxZZKK0/tdS+9nAB0kLpnvpPfhe80ZGZot+WSTPU7afd8nygeEm4nfkNzjYAIjkuwI2L1YIsoLMsHp5XqZDhr8co1jrOeIhLkq3kmj+w4JOxMxKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536975; c=relaxed/simple;
	bh=XuNLYwv4I44qXXWDUCcJGd1BTZ9XbotdJQFOKxuUXHI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kAMNouYc+F7KD5//6rx2M4XtxVdMcVXFUuGVSb/Ln785RRyHuHjRS7KcwmWA6+XvLG4oaLioKs1hyC8lvFmlgMgTJEIMpHwpjy1H/kExsB6esvW0m7hwCy3Qh6l0+ekQFPm/xjGTYQYj1izkMvurbcvBM/BMTHYjp288d/8uIzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uGSdB/HE; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uGSdB/HE"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546D9NTJ508993
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 08:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746536963;
	bh=a+oEfF96Z/IiSXPjQsuXB8B1jzzW8U5OwiYJRhUIYhk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uGSdB/HEXLCHA3Ql0Kker3N+x/wSFZvA6xsPquc3iqjnps8qWr0R9IQuohuVvhthQ
	 neNG2TU2mw3sNZxC/bkHaeGLclduM9t7M1QFlMOrBtpDKyN6PJkLVKphQ7q3zpziMb
	 kTLFdz7tRJprwLg9nwhrWKYjr7d+H1xfAn5U0YBc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546D9N7Z007559
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 08:09:23 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 08:09:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 08:09:22 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546D9M1Y014931;
	Tue, 6 May 2025 08:09:22 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, Rishikesh Donadkar <r-donadkar@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <devarsht@ti.com>, <y-abhilashchandra@ti.com>, <s-jain1@ti.com>,
        <jai.luthra@linux.dev>, <jai.luthra@ideasonboard.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] Fix dtbs_check warnings in ov5640 sensor overlays
Date: Tue, 6 May 2025 08:09:21 -0500
Message-ID: <174653691513.707452.7671570412184180977.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250506045225.1246873-1-r-donadkar@ti.com>
References: <20250506045225.1246873-1-r-donadkar@ti.com>
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

On Tue, 06 May 2025 10:22:23 +0530, Rishikesh Donadkar wrote:
> Fix the follwoing dtbs_check warnings:
> https://gist.github.com/Rishikesh-D/2f6e0a11f2f72ce70f75058d0caedc9f
> 
> Test Logs:
> beagleplay + tevi-ov5640: https://gist.github.com/Rishikesh-D/38ac71408f108147f4de596f260ad7c3
> beagleplay + ov5640: https://gist.github.com/Rishikesh-D/7911f4efdc935c22a2c97ff502c73189
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies for OV5640
      commit: a5da12f37b8532b7ea9196ae7c7927a535883194
[2/2] arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies for TEVI-OV5640
      commit: cabe662bd54b37deb7ebf0a4dbaabc7812fa411c

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

