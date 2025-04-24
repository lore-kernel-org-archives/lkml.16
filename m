Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4738128F524;
	Thu, 24 Apr 2025 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745517126; cv=none; b=gQqeN3uPYrcxjMJe1++VMQPCzDIgGNUAlveuYXPf/XvNkbWcY/HZBWTnUwhuIjcqvg2GTVAuzwPoovqoHZyHJu7gixSGr4yE67XAq6GlgdmZg/Mcnyejjdj0Z+SwWuUNi24W5XVdehWwDAf9EXVVdQOfoAKWPMwl5zJrUhSFq3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745517126; c=relaxed/simple;
	bh=90ZjYFCAQ3mKy/3agdzbiceBReZhqzc5PhnvCZaK3LM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mlTS5mNVqxTUlxizzbRfQologAfx8dalbXECyMVr/7RquijmOjd/6TsUlI8e6Ujc8VoNWsIX8ULgTIaxTr9tRBtQothB51/MH+okovep+pPlkhTBYkyl8K3hR7z/aoGUw40hUyU/GKcP3yt1JgZ365iQ8znXuBVjbPEIlMiPclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7E8C4CEEC;
	Thu, 24 Apr 2025 17:52:05 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 39AB95FE68;
	Fri, 25 Apr 2025 01:52:03 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20250416100006.82920-1-amadeus@jmu.edu.cn>
References: <20250416100006.82920-1-amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
Message-Id: <174551712323.4050580.15085872783453662439.b4-ty@csie.org>
Date: Fri, 25 Apr 2025 01:52:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 16 Apr 2025 18:00:06 +0800, Chukun Pan wrote:
> According to https://radxa.com/products/cubie/a5e,
> the name of this board should be "Radxa Cubie A5E".
> This is also consistent with the dt-bindings.
> 
> 

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] arm64: dts: allwinner: correct the model name for Radxa Cubie A5E
      commit: 1e5a69d67d1b3c55c9b0cd3933af1436b5d52aa1

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

