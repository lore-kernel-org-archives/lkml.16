Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D111531E9;
	Tue, 22 Apr 2025 10:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316424; cv=none; b=gLNDXfrbT/dcqHKnh3conrOR66JHuNdhGssmQGqtoz04/4Z339dYvFHt43tRyuWwQezzGzyg1+APsYCRuiHLu954/FiHNuQfTt1+Y4+fkyjXXEHjOxEV8fHja0Iq7BJfTC2CLC7ztuoW9hWtgTPDMpNidHgjsOzC2LPE47tsyBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316424; c=relaxed/simple;
	bh=XWX3ya/A0m+GCH7EVCobSWcufZuNadjRVsGC/wTlWEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sgP245n8hFl2oTxnMftZQiOMiAHrX610q1TQ+QfHdCE2pD8HncXxau7fssnq9d5IRkeHo2My23rInrBES4dCUD4tacC9kOLjFW65ukb7FtXAQ5hDfem+GUJde6BplHiyJ5kgihGHuunIfecTU+bubqnvnxt+vExs/p9EUQYMm4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Oh84lwbF; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Oh84lwbF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XWX3ya/A0m+GCH7EVCobSWcufZuNadjRVsGC/wTlWEQ=; b=Oh84lwbFzKuCEboH1qV2vZ6KMc
	4+ZkuBhwLc7vDDemjPc6i9W26GkFXYmpFuGVUu/M1c9xKGdMTTFgKm8/6yRgO8+fTsZV95twjQT5u
	JRWu29iFEmF2FRnTf97Cn6PTAK8wWeWXWab/VWwk+zFl9EJMZbTgrXZo2KiuW1MYE7xST7kDcGbIN
	iKYHxc58JjuXSU7Da7+5C9mL8BW7zr6yMSyLbCU+2WjYJAWOKCt90Anqhy9YTiL7T7zCrvzVmvNDp
	eT7w0ljKQehnLyKsyaQSrz2TfAXvhU/qaQyVVHD5VQWHyHChcGiQem0GSnZDJcoq2WQxdjjQLmJFB
	unq43JYA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7AWn-0001RD-JL; Tue, 22 Apr 2025 12:06:57 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH v3 1/3] dt-bindings: nvmem: rockchip,otp: Add support for rk3562
 and rk3568
Date: Tue, 22 Apr 2025 12:06:56 +0200
Message-ID: <9448537.CDJkKcVGEf@diego>
In-Reply-To: <20250415103203.82972-2-kever.yang@rock-chips.com>
References:
 <20250415103203.82972-1-kever.yang@rock-chips.com>
 <20250415103203.82972-2-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 15. April 2025, 12:32:01 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Kever Yang:
> Add compatible entry for the otp controller in rk3562 and rk3568, add sch=
ema
> for different clock names for new entry.
>=20
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


