Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31132566FD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208082; cv=none; b=uYxGJyT9EcpTbVudEFqd0e0VtAQkGZP7hsN7yGPTI0u/SXpzDwae5IvPAVnkI8HpbvuWccirb5y0bL00X0vjUJx+VZlJnz+NQKvE82vx7xkqARwi82jRF3yWxWbw//PxmsWHHFndVOv1xsGzVo1bybqNqA4jgwiLX+xyvpB0lxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208082; c=relaxed/simple;
	bh=IKvRI5uf+aD+nZqPr2KfiHGfOxumlIrmYZ9wIyQhmLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hLU+Mz3l95/tvaqGtxVXXi/sYE/5d4LwpSFyebvC3WCGBPIelsxkPSsTTZ/OnkVw4/rkV3qje/zTLeOzF8CuIrYLD4Q/mmJS6+hpTfNA3VG3SPVie/oqnkJ4fQtGxreTZFcAf2yXl8tGzcgsLhzNe+0UEfbuMbYp1Yizsug9sV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxI04hkZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxI04hkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E094FC4CEE7;
	Mon, 10 Feb 2025 17:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208082;
	bh=IKvRI5uf+aD+nZqPr2KfiHGfOxumlIrmYZ9wIyQhmLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VxI04hkZoo5zoOfSQd+FXAaLIoEznbe3LKQjRcsfKe4KCOzoYJEf3lUrtp97K/XZN
	 4ZGraAAU+k7IXpFTBG0JO4TZVbj5vqoiIor/GUoUVyLQKt22hp3B3r7OS4gYDkESXf
	 YT1hYfCDqR1thN4NzfjaQu+ZtaEH1jmgfcwtIbOe9tGIfVTlZvRVrdXHtTtoTt86Pq
	 LOaauNhaoRLbHmUk/TBDzoz98Uo5LigAllJJrZfJRksLkXjfKD3lPIAQZDJWQqMwmS
	 XbUv+SVnJYcVtL/zUXVFtjsM8en4iPWKuMmRF57Os0wA+JtD4FKqu7vUffvBztJOU2
	 +xrQh43GHdVWA==
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
In-Reply-To: <20241231163121.241543-1-robh@kernel.org>
References: <20241231163121.241543-1-robh@kernel.org>
Subject: Re: [PATCH] phy: Use (of|device)_property_present() for
 non-boolean properties
Message-Id: <173920807849.103786.14338216546875530681.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 22:51:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 31 Dec 2024 10:31:20 -0600, Rob Herring (Arm) wrote:
> The use of (of|device)_property_read_bool() for non-boolean properties
> is deprecated in favor of (of|device)_property_present() when testing
> for property presence.
> 
> 

Applied, thanks!

[1/1] phy: Use (of|device)_property_present() for non-boolean properties
      commit: 88c0053baed659acd85b87dd52cbd75f3d8806be

Best regards,
-- 
~Vinod


