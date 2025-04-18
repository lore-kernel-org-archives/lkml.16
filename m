Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB82945009
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002453; cv=none; b=RO7FkWtZuZ57F2+T0kvDQOMysAl05iXGw+9FPtapRIPS7zvFDUAQ4kdVAczL0WuCQT04ZAoeRnZyJu+COAtoxbo/7GYtQxO2QvJugKXA1oHdDfM5PYl+WqBN2et1jqsnRUi0HWSG71fQKnTkGbSfkr6og5iZ3Jv/kLzAWR1u/IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002453; c=relaxed/simple;
	bh=eAHglsHFYKJWS7jdcO4pwyhNZ/voAud6ySzRianlqE4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vGKJJeL5sq4nEJYAjxTnaeCr50RJxfCa34fMPV44DiqbOf4OQMoPnfDnH2XymVZe8fNxkQ+rDivFWHQZJq772UJx/gB0DUO3J9IEY52FUAh0q03PsL8NH5C/4ZALx353xbwRUdkX652Hggqb6KrPQ0Nox3BQfDqgEFT2Nl4FD8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=J3Eiw7ZG; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J3Eiw7ZG"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIrxXn1000830
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002439;
	bh=XF5UFEiPpcoG4EPoQ5tbuqNRT1AiCobPXUiSYtdTDLo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J3Eiw7ZGqetox3+539+LJ9Ptm8Fa+kitgTEhEX7da25TwqN35flJI2M/QNcCzSvT1
	 vx6/n51iaEMRlkEifLeVadjT7o4QVFYtsE5fD0ZSuSY20sBXX8y0Xgp3+DEm7u07Fa
	 jiepfgJKOcXHJm7PMtpU8Pf5zcpBbYwfBSAI6b5s=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIrxJf077947
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:53:59 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:53:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:53:59 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIrxDq114058;
	Fri, 18 Apr 2025 13:53:59 -0500
From: Nishanth Menon <nm@ti.com>
To: <shao.mingyin@zte.com.cn>
CC: Nishanth Menon <nm@ti.com>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>, <ssantosh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <tang.dongxing@zte.com.cn>
Subject: Re: [PATCH] soc: ti: k3-ringacc: Use device_match_of_node()
Date: Fri, 18 Apr 2025 13:53:57 -0500
Message-ID: <174500239091.94267.5561449667206494033.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250331201425296l4h98bZjxHzs08fdvHrGO@zte.com.cn>
References: <20250331201425296l4h98bZjxHzs08fdvHrGO@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi shao.mingyin@zte.com.cn,

On Mon, 31 Mar 2025 20:14:25 +0800, shao.mingyin@zte.com.cn wrote:
> Replace the open-code with device_match_of_node().
> 
> 

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: k3-ringacc: Use device_match_of_node()
      commit: ae9c0b68089d5412bb252c4adbeff122017557c3

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

