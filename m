Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C23D1A08A4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040992; cv=none; b=dEAABvzhUXrqiQU84ICc/qvBpgYGiarwPAIEbRw1a/G1czGNQXPaQYpHEQU5hQujRq0HmCZNaYhFWKmkgjbwd7O2lUbhKP9HnSfO4ss8vIG7wwmlMfocZggSnKJQ++R/0ZKjvCrAA4D9w3IJsdSnCcmTCQPgVuoCAQ4+3KOGNsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040992; c=relaxed/simple;
	bh=PKNgW8caAN/O0yBfmZuznhqL8ntxZ8CW04eJBGBafp4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MO19a///IrP4NeprPDxMZ0WR5aTF7+WqUheEvmXMS1xjTE4vWMHJdmQMXNnnxTK5sEHLSaNKvoBFeiVAee3sfr8qUvRHNUreYuFf1m5D4Q68gn9JM2AHe3GWUMtT68vMVUVdAmvWa6WYpd7ON6x2C4eqw/9bxlazo54qfWIMTeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBkT-0007a9-Rg; Fri, 27 Jun 2025 18:16:21 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBkS-005e4J-1v;
	Fri, 27 Jun 2025 18:16:20 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBkS-000QFX-1g;
	Fri, 27 Jun 2025 18:16:20 +0200
Message-ID: <52a7648a2c86c39189012e5379c53b4362b1f9cc.camel@pengutronix.de>
Subject: Re: [PATCH v4 0/2] reset: canaan: add Kendryte K230 reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
  Chen Wang <unicorn_wang@outlook.com>
Date: Fri, 27 Jun 2025 18:16:20 +0200
In-Reply-To: <20250613-k230-reset-v4-0-e5266d2be440@pigmoral.tech>
References: <20250613-k230-reset-v4-0-e5266d2be440@pigmoral.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Fr, 2025-06-13 at 16:49 +0800, Junhui Liu wrote:
> This patch series add reset controller support for the Canaan Kendryte
> K230 SoC.

Applied to reset/next, thanks!

[1/2] dt-bindings: reset: add support for canaan,k230-rst
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D3c2968fcd72c
[2/2] reset: canaan: add reset driver for Kendryte K230
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D360a7a647759

regards
Philipp
