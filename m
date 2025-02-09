Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59838143888;
	Sun,  9 Feb 2025 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739091405; cv=none; b=pa4CohgBSU9siCS+jRiUPlYDi06VWnkvMeKttu/G4ccQVxEXUWIsLQlAQhg+4cWPMZXeUqXyjVaROIK1FX1CyGI6iFkHW0B3Wv+pW2nf8EuJLyFjxFpkqsk2UD7F3zuBb/pOQqMnM2Maa7evoCPNeFt8IfC6AiUo466+sPIMsdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739091405; c=relaxed/simple;
	bh=Mcbw4GACrCNeZyEQI00FG9OCTIjRjWk8cFGCChsxv4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RGorZAitQroMLfPvOcXrpbAUqwx90gGvRBIkFEPPvm1nGUUDeVvIvVWl+BXwp8iQC6hnUzHBPjDeyg4p7r7WEmkYXT2E1vGFwmeg99Xewt8yaKPo9qdSDXhCn7B2NYXbileRGDvTlRUxARqR6buf2Cfo4QraPJlFTr1sovzzAo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4F0C4CEDD;
	Sun,  9 Feb 2025 08:56:44 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 792525FAC0;
	Sun,  9 Feb 2025 16:56:41 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Lukas Schmid <lukas.schmid@netcube.li>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250205164716.2509650-1-lukas.schmid@netcube.li>
References: <20250205164716.2509650-1-lukas.schmid@netcube.li>
Subject: Re: [PATCH v9 0/4] Add support for NetCube Systems Kumquat
Message-Id: <173909140135.1184685.5784910677727356231.b4-ty@csie.org>
Date: Sun, 09 Feb 2025 16:56:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 05 Feb 2025 17:47:09 +0100, Lukas Schmid wrote:
> This series adds dt-bindings and dt's for the NetCube Systems Kumquat board
> 
> Changes in v2:
>   - Fix the devicetrees according to the "dt-schema" and
>     "make dtbs_check W=1"
>   - Fix the License of the devicetree as requested
>   - Create a cover letter for the patch series
> 
> [...]

Applied to dt-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/4] dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
      commit: 9a8463c68e0d1144e6af492a920796fcc373fef8
[2/4] dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
      commit: 2a120293fb8fc84017cfab3994ad4fe338148288
[3/4] ARM: dts: sunxi: add uart1_pe pinctrl for sun8i-v3s
      commit: 3199ed9b375870079c1bb857a10c55a95f90fdbd
[4/4] ARM: dts: sunxi: add support for NetCube Systems Kumquat
      commit: 6e085e64a2907bb9467360b7607d1257874c2626

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

