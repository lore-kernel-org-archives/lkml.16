Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A236288CB9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095131; cv=none; b=XHEvyk8g2IAXYbMS6b0/sv6z3trDoi1bkS3niGHD8Xs3oha8cS42EqoeWwlxuWD/qbp4N/qBYIuen74BTwByJNnnBty47fGgGKBAgBHtBUPkIk7/ovDFPWMX+tkzm4u8M7Lr6r036WwcIBamxCXuU3kGYTWag/FHLsOO+Ucm0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095131; c=relaxed/simple;
	bh=HvJYCQ26zFqcISTyhNEbYWLh3eDft7d6STVfq6ldmS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W2IaAOe87ULr0hQ0s7uxCuTnTlzqKWUpKLqfnt9XPICYq8tQSetdldDdbMnd7xnricoXzeYVp1thwuiZeisXMEMMdsujgG93VodFyxd+nbmm5dAC/kOhacbRT/2Nm7flek0CC9c7LQyptOdltYroCdSvyMhjvU3aL1TuwFmC3Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDAPY2UY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDAPY2UY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C44C4CEEA;
	Mon, 16 Jun 2025 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750095131;
	bh=HvJYCQ26zFqcISTyhNEbYWLh3eDft7d6STVfq6ldmS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WDAPY2UY8cljpCnXUH0IrXdvKDI2Dd8HaCI3JsP3zKnWyXoZz9Fi9RFaj6njrd5W/
	 TniMdBf0fu1dzY9Jh2Cmcpe6CAz2/TvKpOFYwO+SDYUIvKddhTfJ+uofQl2SxG85pG
	 AoBMWbLCDLGXyAiA5H2/ImkxoRi8hwlwYk5i5XjMlCow27DqvBGhjvb4iUYema5o5h
	 wXPKTaBUr2a4ItzNw5he/B1JzkFXR1HDV9+JyW3v0qxruZHDcf6v3aXw7LoCSK91UV
	 vDLxLlsm4CFCP+nfu0plNao93qF/wsKdyGoIwZndj8Ud8JOQ07axK4FLGpoIHOA+zO
	 xmjkfWmxt0nRg==
From: Vinod Koul <vkoul@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Lubomir Rintel <lkundrak@v3.sk>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250523085112.11287-1-johan+linaro@kernel.org>
References: <20250523085112.11287-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] phy: drop probe registration printks
Message-Id: <175009512856.77433.17489306165089300644.b4-ty@kernel.org>
Date: Mon, 16 Jun 2025 23:02:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 23 May 2025 10:51:12 +0200, Johan Hovold wrote:
> Drivers should generally be quiet on successful probe, but this is not
> followed by some PHY drivers, for example:
> 
> 	snps-eusb2-hsphy 88e1000.phy: Registered Snps-eUSB2 phy
> 	qcom-eusb2-repeater c432000.spmi:pmic@7:phy@fd00: Registered Qcom-eUSB2 repeater
> 	qcom-eusb2-repeater c432000.spmi:pmic@a:phy@fd00: Registered Qcom-eUSB2 repeater
> 	qcom-eusb2-repeater c432000.spmi:pmic@b:phy@fd00: Registered Qcom-eUSB2 repeater
> 	snps-eusb2-hsphy fd3000.phy: Registered Snps-eUSB2 phy
> 	snps-eusb2-hsphy fd9000.phy: Registered Snps-eUSB2 phy
> 	snps-eusb2-hsphy fde000.phy: Registered Snps-eUSB2 phy
> 	snps-eusb2-hsphy 88e0000.phy: Registered Snps-eUSB2 phy
> 	snps-eusb2-hsphy 88e2000.phy: Registered Snps-eUSB2 phy
> 
> [...]

Applied, thanks!

[1/1] phy: drop probe registration printks
      commit: 95463cbb4fe6489921fb8c72890113dca54ce83f

Best regards,
-- 
~Vinod


