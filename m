Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE91386C9;
	Fri, 31 Jan 2025 18:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738347941; cv=none; b=ltXkFt0ESUPTKAA8Tqlg14RJ1F3Ex2YsIuwmCRbtmSmaykFSIZrVuPtbHofUvGdX8Ba4o0w+ln8ck+VKov3i3eOSPXVVxjq7UJh3UzrzrmI3jJ4fLACDRlWC+VX+dPW71vwKafY/af7PYzXSgP56LvvAkktlAq1H19y21eI/1v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738347941; c=relaxed/simple;
	bh=14PapOF9arm0Mp99KahmVzvCTHwjpcSVGSyFXtbT/YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OTfgn5z91lwL/U7KRQj0iB8oGH3Dk9XOK3/FKkHUWDCxU6K8ELemhGnIYtmA0si8QzWwSDrcMiPiUW2vTmMU4miFm8fqjs93TnBatwmBbc0w628Q/0d7QS1R8PPqoRIzqO4yLI+W6QMLZFSyTUy7Y5KpiwqFffZy4r0Fg+lv2mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=p8X2cw2n; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="p8X2cw2n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DeK+E3UWXmeeQSfCZOJZEGlV6yQ1IUdoPqkRbHcneDM=; b=p8X2cw2ns3zjZjtrsxUeo9nQoD
	83vokCjh7SElQcKs8UCOP/eQWs6bqwKgDNqvb6yVijFxP70eFHRLeGvaA0SRW8WQaoU6Joaj0pOy8
	o5SirEuImqSVObFtolyc7TPjxMJFiIkn6E0dzdIe8pKrfcQBE2+dur7dLm1JQ+hDgjD6CKuoQCDvK
	PdChZXnjMfKgHMUJAWg26EPJPmIUC+8Y+QNqHtj/ripyneN78T1L4X/rXUFl7s8tkjLISRaY+ouVM
	C5nfn//sOeNx9KXt1htxesH8IzwE6LrKxZB/PKRAkrdvwI9oZLl3FieQ/nyrkOZ4bVuIQALNxt+ko
	h0znrdaQ==;
Received: from [86.39.10.178] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tdvhq-0001qj-9l; Fri, 31 Jan 2025 19:25:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, sebastian.reichel@collabora.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dse@thaumatec.com
Subject: Re: [PATCH v5 0/2] MIPI DSI phy for rk3588
Date: Fri, 31 Jan 2025 19:25:28 +0100
Message-ID: <2498993.ElGaqSPkdT@phil>
In-Reply-To: <20241203164934.1500616-1-heiko@sntech.de>
References: <20241203164934.1500616-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi phy-maintainers,

Am Dienstag, 3. Dezember 2024, 17:49:30 MEZ schrieb Heiko Stuebner:
> This adds the phy driver need for DSI output on rk3588.
> 
> The phy itself is used for both DSI output and CSI input, though the
> CSI part for the whole chain needs a lot more work, so is left out for
> now and only the DSI part implemented.
> 
> This allows the rk3588 with its current VOP support to drive a DSI display
> using the DSI2 controller driver I'll submit in a next step.
> 
> Only generic phy interfaces are used, so the DSI part is pretty straight
> forward.

a tiny little ping :-)

Is this still in a queue, or did it fall through the cracks during xmas?

Thanks a lot
Heiko


