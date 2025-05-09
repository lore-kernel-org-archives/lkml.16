Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451B928ECE9;
	Fri,  9 May 2025 12:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793274; cv=none; b=FtPDbfj4Q42aDM+g+URzAdfrdQjdo2O0Zmkkx6Mu7hiI1/IRT1VgBeS1HiZRZ8tM1I94vUXfLTkH9ptxxiLkGRNaBCIsAX+2Fvr5To9+GVBwJsKEJV9G8SXtaxgMtvCipJnrWnqGcV5MDGxwAMyfn4zZCfjYn9Wawa7+TVpngwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793274; c=relaxed/simple;
	bh=NoeuLOpRGRu25SGuPhuZ8S7zFoXJi2CcumQOXl3cSnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tq0fHTIxSVZW1uFHSOpCul5Xj9jysb8eXb5DKDpxEyw6ECymBAT7BxCp/7pC9BeZ7vWfh/N5yBMwPwYLVkBteKjrKfRBtwyTXX3Jh6RTq1G5YXfeuh9x8GYiogFvdgc0429jVldSM0SUTGslyQKIuHEJCIfusYlLl0qQKdH0FjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aHIBkRQb; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aHIBkRQb"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 549CKwMW1380492
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 07:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746793258;
	bh=n+zfqk/2UPvR9IM2h+JQmRugqvCX6/gJ7s0fllqMlcY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aHIBkRQb2TXbmRjspytwNOCIE+piNtA1uOPmNKdYsLt00iSDlq+21C9ZvL3kNEZhM
	 MbHtmyRh2Crhkjv9H7jLY1Oe3zhlYEhoA5J4qnFTkznzJjdyPmG/yWPTircsZDf01x
	 QwD1fSjOHIH2Goz+TD8mu3HrI2VTPBwjefW6J9Gk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 549CKwMf099555
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 07:20:58 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 07:20:58 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 07:20:58 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 549CKw5F015480;
	Fri, 9 May 2025 07:20:58 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Yemike Abhilash Chandra
	<y-abhilashchandra@ti.com>
CC: Nishanth Menon <nm@ti.com>, <vaishnav.a@ti.com>, <u-kumar1@ti.com>,
        <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] Add overlays for IMX219 and OV5640 on J722S
Date: Fri, 9 May 2025 07:20:56 -0500
Message-ID: <174679325113.1568978.6497764622589156474.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250509091911.2442934-1-y-abhilashchandra@ti.com>
References: <20250509091911.2442934-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Yemike Abhilash Chandra,

On Fri, 09 May 2025 14:49:07 +0530, Yemike Abhilash Chandra wrote:
> This series adds IMX219 and OV5640 overlays to enable support
> for 4 sensors on J722S. This provides a reference for a user to
> enable a different sensor on any of the ports.
> 
> Test logs:
> IMX219: https://gist.github.com/Yemike-Abhilash-Chandra/88d4803378d4a3e20f1cbd3b9ada91ac
> Ov5640: https://gist.github.com/Yemike-Abhilash-Chandra/738737fa5b1b635d260d9601ae2e85aa
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: j722s-evm: Add DT nodes for power regulators
      commit: 9bb89ec393e368cf26a65c04cfd4a14851368df0
[2/4] arm64: dts: ti: j722s-evm: Add MUX to control CSI2RX
      commit: 2e8861103a08e4220e99b673ab247aff108ddef5
[3/4] arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
      commit: 646bcbcbdfad22818d32c8771583844aab4e05dd
[4/4] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640
      commit: 6a9d340b1f9910f0f88e0819c464938b91610765

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

