Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E6327F4C7;
	Sun, 15 Jun 2025 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006365; cv=none; b=QS4v18Gpg59xO3ffaeNUv/mcNfOlnZMSOSyGanpQRjm40sThw0JHu9TI0xVZ10leZDkgzY/aliVGCfQhIUF6BnZ5jGqcLcBgWfxeX0/4OR9yRH8CJbB95zaFpEWD5ZUl+wsDk3DJUmUXm4vWGzIrF5LBsm6IcPP9lFw2zcsR/Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006365; c=relaxed/simple;
	bh=Qz1/0+f6f6wOIGk0uobnSw0mO6TF5EAN/B9lJlE04yM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RPcHXUeBT6jBW3loFe1VuISsc1HTQjEDVBUMIu7ciLPp5/1Ptc/7G9VNre3uwoKDhR2CpNVO5fruk+WmbD1R1zwxk2YQj/b4DrUJ+NijMMmax9uDZPGKcb4lRCvf/sHLzAnezGhJX8isTAQRyLnE7sB8790uj3nNq3fMIJeOHEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAMXLvTA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAMXLvTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADCFC4CEE3;
	Sun, 15 Jun 2025 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006365;
	bh=Qz1/0+f6f6wOIGk0uobnSw0mO6TF5EAN/B9lJlE04yM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KAMXLvTAT0oW0+YChf+aTmd1PDOS7XQeX4c2T61yJT6B8E4shzBj3slVMwlD23Nva
	 RRMQUh96RNpCCs4PcECNPoJmOvtU0LagWs88ImAsLks1wbDiiGsKHz2evcHZRpS9TQ
	 hH6PYYL9UP+LoYZQ26F9PeWoteNsCvFizoOYaQC4+paPFtMkiGiQpIuUJx1kQgOYIu
	 MQwbPz6r1lX/6vpsd9TIv0OJLnfZrxMeevhDRE5YjwBuWTg0K9ZslTBKFygPikuMcW
	 kQ54gvwtbAFIDQM8fifTMXaURYArD70v6eZJkkaOhCMUKv1AyeUWFFhvHo+92oitnC
	 9uGOOyWh5FvzA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250607212541.742427-1-robh@kernel.org>
References: <20250607212541.742427-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: Convert marvell,armada-380-comphy to
 DT schema
Message-Id: <175000636232.1180927.5495769053614901406.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 07 Jun 2025 16:25:40 -0500, Rob Herring (Arm) wrote:
> Convert the Marvell Armada 38x combo PHY binding to DT schema format.
> It's a straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: Convert marvell,armada-380-comphy to DT schema
      commit: a5aa04619e715adda36ca5a97cae4c48bad8d65b

Best regards,
-- 
~Vinod


