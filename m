Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C380C27B50C;
	Sun, 15 Jun 2025 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006368; cv=none; b=YUgJpw6Az8giFqhENlY0EbTCf1gwskwTVs0qs8KFa7OkoFh30Ah0DQwtBXDYN9YtjMCwFRTDl/k7aCmDuOc5mBBPxRUvkSo8Ns2WrlUVGbPDnRfmGSc+rRHyo6cZVIyW8rIt4IMNKHPUADUVBU1E48dQnOSe4fpEXUlxULLWAo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006368; c=relaxed/simple;
	bh=waeTw7yWy3QuYQKUy1k68cPCqMP3I5rcjAEUx2QJeG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mpz7aEAnHzgsmolEo2h+jL30pAGNiV3EAq86p0gZekv31NXpSA/Oe6Z2M+rlcOHVTrKXXQfoVqjvyV4+HphVNHrXri8ilyWZbKdamxyKev4Yep0KftWKMFm410UQUeVQxEJJ9zt+f1T0b1r7bTz19jsh17ILwHxioJ8mx6uSz0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+iBhysC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+iBhysC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE042C4CEEF;
	Sun, 15 Jun 2025 16:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006368;
	bh=waeTw7yWy3QuYQKUy1k68cPCqMP3I5rcjAEUx2QJeG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T+iBhysCWjCL/En2CtxuNZazQkAcLvlnMf/PQK1HES5XFuVFPEp7kWgG8o218Qfco
	 AWmzJCWZOSAfM2A+4+xN9lJP/8clwbQ+JxLeLsSpNQklVOlBqkPJ1PRCQdQlzoPwuM
	 9drcFqUuI864wmXoZnSaGPQn3QZ5QnGlLPSp73Id5nwpy5YKJcqrVj1KSPwnYqkirO
	 T8ae4aYVVQlm92aYABY/DutM+TBxCQcbiXWZsT8T+s7ayla2RV9dIJjpohskmNXPaN
	 nOkQF0/lcayj9DXqRq4pckwedCyIFozMGoUTlFT+yUT/OKZh5SM2rfqX5n/Qj70iBe
	 +4SQsq6CCN0+w==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250607212609.743346-1-robh@kernel.org>
References: <20250607212609.743346-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: Convert Marvell MVEBU PHYs to DT
 schema
Message-Id: <175000636547.1180927.9393502709140378980.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 07 Jun 2025 16:26:07 -0500, Rob Herring (Arm) wrote:
> Convert the Marvell Armada-375 USB and MVEBU SATA PHY binding to DT
> schema format. It's a straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: Convert Marvell MVEBU PHYs to DT schema
      commit: 4dcf1632d617262f16608f3bd0f6dc00eede8d4e

Best regards,
-- 
~Vinod


