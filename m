Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C80333C9;
	Thu,  1 May 2025 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746105867; cv=none; b=tylla3mB2K5kviI6BB6SSCujzCIS9MZ92dADR8rn5nokzsbFYccLZXi0VpI78WrdpYzwNRECBJAickeBF0dU4RUIlAChTqO/zDtBgCn7hzgDCIlBpWg/+HgJRPRBT8Ly7gTPQ9G3aFJ5U+JI1ry0isZ3EWe101ae149W+VH9fU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746105867; c=relaxed/simple;
	bh=bJ6lAB+25GbNuESw/Y6DXKoF8x+Uw5NonCRDTTLVsd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObswNgcQGTr0/kHCXWbeAtRATlPgIHJgMydbAYqe2wwyBMRTGNMPx20XRbROX9uXHDa8uUsRP5E/8y4PDzs71dPphh29aATUrJcln/7X5DJqHsB8Q2SeDMBhKFZ4K3z0bXyn5oUWpizFlsDDGl7Kjqz+9QhOp7Nv7KOlfbZk4JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=O93RWYVl; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="O93RWYVl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bJ6lAB+25GbNuESw/Y6DXKoF8x+Uw5NonCRDTTLVsd0=; b=O93RWYVlcIEJHfYZox89Dpz2We
	i+uD5YrdwVMH9PE9wBEnB18KwRdcss2H4QVZGC84NdxcOcoAq1hr6knfKpwfYGO4xwC9ztGgaNNey
	mOD1k7VTpmeUYV3QcTg10xTGmK2nH44fHDCHy8JUyXqbhm6dRNAxjHXUEUIM4yzb4SHDF0fhStpFm
	9RPB5eU53sJep08mIj/LwElSnRoQoZ11/BazY3inwQyd7b6aJOIvhTfXnkQ53MoknTTgioeGpJFdw
	zmAkNazFMVi0sTvya0JfW8WwkV4wy5LhTf6+Zg1CKEtZVBqrASktFGaGWNYAEccRuFnxm7gkSwYPe
	gfB2JKSA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uATtj-0001q7-No; Thu, 01 May 2025 15:24:19 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2] dt-bindings: phy: rockchip: Convert RK3399 PCIe PHY to schema
Date: Thu, 01 May 2025 15:24:18 +0200
Message-ID: <3825395.MHq7AAxBmi@diego>
In-Reply-To: <20250415011824.2320039-1-robh@kernel.org>
References: <20250415011824.2320039-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 15. April 2025, 03:18:23 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Rob Herring (Arm):
> Convert the Rockchip RK3399 PCIe PHY to DT schema format. Move the
> example to the GRF binding as that has the complete block.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


