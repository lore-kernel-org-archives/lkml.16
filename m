Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467FD78F5D;
	Mon,  3 Feb 2025 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570579; cv=none; b=AB8gHSsxS5yJs3gDzwitC0LZsw1ndveljzsooXHf2LdbjvlRgsVoDpWoWFA2IUuDwwApVFL3hvqOKfpl6BrIx5Nn4Eprkb7/oYgaBwkG6iCGEEmeZxYrgn8lVVMaKLTz5hG4RwRlBnaaaUO2rjaNSq5/h4SLKZt/utMBAfDtq5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570579; c=relaxed/simple;
	bh=y87osAjOK0Ceaat7u0ruPpkesd3QsbfnsmjbmK9MF3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pAsPN4gZ5uACIxibizYv/snZu5zc2h9plWWWdXRbWR9FuFVNYUB0BYt73a00lQOehleGm3XM5kpDBecUoWuKWnMqPu8GZY2eBDDX3HTQ8jLKIBhRKxaKwNainBrKXX+U/0iYEmYBvmI9A8ModvzPeoynpomD9brDGogCOjGgB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JlxRUjKI; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JlxRUjKI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0zN/yPvq2oeObZchTOFj2wFtJfvhQeLm44D+1WAWTAU=; b=JlxRUjKIu4B5udpqRPxiUEr4fv
	H/OH2ox0dCxYz2PsqzXW8yPfZ9JV5N40SYdxDjEGj8uqLNZOJXY9rDPeJsDbHiHCVF4JQeYzCkS87
	/P4j7E8oIY9LuV9y0hHJDyxpH2wiinYzER+2QBFgL+I8pSwNr+mR+9Ud0h/PY8tBYRaa8sBJSs+39
	ZgqiWIogzYcEiLKT33sZnQgDNA7oiOxN7NUFaph8yBuMIZMI7GEfiuipOIetF5FLnfwwe/TI6Mp0i
	LM5UPLPjO8xtFRgFtc0A7XZp6Vk991qMia8rY5Xb8vKCC7W6syHjrnRHj/fO+Bn+brAmn1/vhB6MO
	8zQLxuvw==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1terci-0005Vr-VX; Mon, 03 Feb 2025 09:16:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Fan updates for Radxa Rock 5C
Date: Mon,  3 Feb 2025 09:15:52 +0100
Message-ID: <173857053619.78657.8857232933487355026.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250120-rock-5c-fan-v1-0-5fb8446c981b@gmail.com>
References: <20250120-rock-5c-fan-v1-0-5fb8446c981b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Jan 2025 23:22:45 +0400, Alexey Charkov wrote:
> Couple of small additions to the recently added Radxa Rock 5C device tree
> to improve cooling control using the onboard PWM fan, similar to other
> Radxa boards already in mainline
> 
> 

Applied, thanks!

[1/2] arm64: dts: rockchip: Add finer-grained PWM states for the fan on Rock 5C
      commit: 6ed35e6ff556626734c400fff5a636b38b91fe19
[2/2] arm64: dts: rockchip: Enable automatic fan control on Radxa Rock 5C
      commit: cd5681e63fb9887bd05d4ef59151d6a6b39c9d33

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
