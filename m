Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F8719E97C;
	Thu, 19 Jun 2025 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297220; cv=none; b=ocB+UGEjJnApH1KC0iWxh/iPWIpGf0P0+YFmy68Gm6fhMH7dE2OMwRR2aSL12Q0Zx0ZZrs8aopLsQ169wb9cZDhFpiFkXbbVqQaqtr5yGzU/GOcKb9yfP+wyYvLViuynrwOQLrcSPv35RsKulAccM7KtOxOiCF/+Zq0KtHaScUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297220; c=relaxed/simple;
	bh=z4W/5q3MfpuebwypaylYFOBs/0zUazBsHDSkzMhrQY0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=l145RJ90EujYlqNvY0avMw7rdJpYrfRIGRO5ntOf/zGmwuoqIQk7H1+0LpgzXqV+XaTpVePCpEMKtj/il5dv0eQQclsCCPwFTbRMp5fzRMaA9Vdoi/z8IYg5sM2gEbRER/ToCPk3KfVGBE7Q/JkK1jy9WPvJeccCN1Eg9q5cmZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmauIfGn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmauIfGn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6909FC4CEE7;
	Thu, 19 Jun 2025 01:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297219;
	bh=z4W/5q3MfpuebwypaylYFOBs/0zUazBsHDSkzMhrQY0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cmauIfGn+V0fXJZoBk3VLdYUHm594MQU2k2ZH4CEDN+8YhgT1tlWpF0vp0HAhdrgn
	 3oXfRwxAjJP+L4X5x/yLgGWzs9qwV6E0GA+sCW6ZBPpCZuK7t82N+9fD2ssv1qFcE0
	 XFp4L2XCdlOJgkKnYSotfWgAk/g1to2EGEKtDHkgP/7uLyv5VN2skwEWIaHTSuANQl
	 H/YuFXBVdkQdaUMu1BbOR5UCRg2nJmv74C/xKjXKSjP3Maz7fCRy4phoyyignNUzgQ
	 g6Q8IO26J2L3bL0Lh46jqRr5dCk+8XL5BHhh6xsZXQBESDIeOXX0wGOZUi9VIKgl9h
	 +/XhnrNxneoOg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521210806.61286-1-robh@kernel.org>
References: <20250521210806.61286-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert marvell,armada-xp-cpu-clock to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:40:18 -0700
Message-ID: <175029721859.4372.14703260841968150696@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-21 14:08:05)
> Convert the Marvell Armada XP CPU clock binding to DT schema format.
> It's a straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
