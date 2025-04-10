Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC6A20DD5C;
	Thu, 10 Apr 2025 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274535; cv=none; b=RuIqaEw+Gf3lE/r+yFBnLDIHUPpkr3L/0RvKhk3xQbAYt6MzM7v2xRpZMYKune2tQt/tuwpUIiO+SMsGGsUfdmQCx9Vm1nyrU9sghl+n1hs/cFkfVsfz+zv+MskIMatE5fyd8p1UIQMYIwwxEwQKOfxsHwQQPwmp8V+EVxffsgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274535; c=relaxed/simple;
	bh=wuweQyxfeh3JDiv6/BHMMvGBK/ca2LA+6D6rwnBGek0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eKpb3xH5vfFeAhCZUpDCaLifWfhRVT+PsNxH6gaKJFizrhbbhByIiqShkhDYIB48sjbOGujy/33pdesdBdoyRnskmpBfNMvjaGBCa3zE8xEUBAh5y60kVMzzszndtRmxxVpj4dQWWE6kuwLwYSMZ8ucLTXxDOLRn4j+dp5rk91g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ve0ivaWY; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ve0ivaWY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=EHWyZdcB8AA39zvrCK43NnP1NWZcGM90EVQitgCTQTw=; b=ve0ivaWYSEJlTm2rZRZFbfJSDo
	zTHcwz4xnyJL5ObuBLQAdC9QZ6SxkGhmjzL2hvFbD7Z+7t+JSw23lcqkpH37QfIlHHWsJ+gzKCwEJ
	lDg6fqDR26LXtGCaXX1g1XKfduFssg/6HJDxLXUtAJDoikJWnpqM0t8q4wxOgj8yWgQy8qzVGJWry
	BaUWlxDY9bLvfpPdX0Kbvk1lK1qy6fkm98GAzIVf8iUf1C7IllRHJNKZkrGLHDHDaOkUVuH7uF3YA
	8jt50uXIVw+jMDPOfDvfT/qciVDto++T7cyTVb90miGeLACLR09jWyMV3PFsgi0d2+/Gkx7b29HO+
	icxduvsg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nTw-0002qP-KD; Thu, 10 Apr 2025 10:41:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: rockchip,vop: Drop assigned-clocks
Date: Thu, 10 Apr 2025 10:41:45 +0200
Message-ID: <174427445691.820310.13105802044398378268.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250404214030.401629-1-robh@kernel.org>
References: <20250404214030.401629-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 04 Apr 2025 16:40:29 -0500, Rob Herring (Arm) wrote:
> assigned-clock properties are implicitly allowed in any node with
> 'clocks' and don't have to be specified. The max here also appears to be
> wrong as there's a case with 4 entries.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display: rockchip,vop: Drop assigned-clocks
      commit: 64e6121dc1b18a8208faf5b26efb50206722fd8e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
