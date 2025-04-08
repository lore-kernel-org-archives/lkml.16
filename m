Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0380228E37;
	Tue,  8 Apr 2025 01:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744074912; cv=none; b=PpIe8QhsV0rU8eRboSybK1oySo0Pb7PejMW+L+SdDXijnmZFZaH5KLiVF4v10MlPkcRyr/vPKQMR/XW64ff4JADekW+w+bqjVM48zqA6R5peIzPGkjJN7DKbvp2lu31GKkU65QZdO7mfbSPiNysO0G6o093Bhe0uaeq5OkmDhYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744074912; c=relaxed/simple;
	bh=pgTNeOJqHTPwVJwa1UwAzqOlSlG7Gym5QmME+/tye50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QebnBUQHq1nASdlkVRuM+TCSaIwf0KlTEMrmBjDMIF3REqywJWidCqz+mza3MTqkpLxZeUkVqS6PTflJB6yZw7CqPGmWnAFoMabViYEXfmg1+Q9NI0RPaVwEyfrXcj+L/k/yet5xwyiW4y6tuUNUW/IhHQtRxRQ8NYta8rfyEzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=boT46qQx; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="boT46qQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1744074900;
	bh=0kVMxKOm5pByEsr4rY99Yr1e+Z6Yn/HV7y/2Si2yC/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=boT46qQx4QzfUF6N1cTmPSfjlE1gH6k1Ldsp6tN6mKuPMfkmQi+8PRjMtNdiFTvU4
	 2ji5dPAdpCzK8pCYa9hcWOrqnDL+imuF1G1rs/S6wxFGT6YSg01De4QFo4bJaE9tFK
	 cou1Kujnt5WTXg3/2l0zFyP5jxqEQC8A4gRNz8x7Ui1sADHz5wV+zWhcZ2m7oYcwu8
	 caFC3AzGF7+0hs/y57mcC4QT0MLxE7sUF2cHdhIbbs6OKXQ3mPZrdDctkAqW331lnu
	 bPA9AJR9nxTOUH+wXESvHuiuLE/+QZ913WMhxVECfprc+DiVq0xvKuoV9QjlPpdt5E
	 ntmPn7FDs2Vjw==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 94C587CB20;
	Tue,  8 Apr 2025 09:14:59 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>, 
 "William A. Kennington III" <william@wkennington.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
In-Reply-To: <20250404191144.4111788-1-william@wkennington.com>
References: <20250404191144.4111788-1-william@wkennington.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Add MMC Nodes
Message-Id: <174407489947.454798.15613957607681427179.b4-ty@codeconstruct.com.au>
Date: Tue, 08 Apr 2025 10:44:59 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 04 Apr 2025 12:11:44 -0700, William A. Kennington III wrote:
> We have the driver support code, now we just need to expose the device
> node which can export the SDHCI and SDMMC properties for the 2 MMC
> controllers in the npcm7xx. Tested on real hardware to verify that the
> MMC controller is functional with filesystem access.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

