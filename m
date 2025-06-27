Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B482EA755
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041335; cv=none; b=RsVX219GdfnGV1Z76a+rEPIKH1y5Z3RIWj0Y9uFU0qiYMAs1Rmsg2VFsCMc3STaOtpal7CJ18Ox/ZgUhIlaQN7nfydC4LQpn0oEkH2A5zIxEH1gIlaHl6vkZqKzjL7PxPUbtN3Usb+Ktvy/qL4yrC7HE5a+Dus8SyXZ6/GE7bd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041335; c=relaxed/simple;
	bh=4DXISltS8p4I+htA6tcQ+fIt3VjfR7ml/pbNKCURfQs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QngI1Vn+C6eU4ywx7VeU+vZgbhKEPpzJYwWnRRWJTzi75//2yv94S1QC/el1Hrtle+Euw58ti3JrOEFHqIVy+4K0Z1mO9TibcLPV6RA/tduyp0176THlEU55l9oDvCmIBnI8HAU69NM5LBu4RCQUeM0fGjL/8TFzDeUE/yntpgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBpq-0007BZ-Jn; Fri, 27 Jun 2025 18:21:54 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBpm-005e59-0I;
	Fri, 27 Jun 2025 18:21:50 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBpl-000QYv-3A;
	Fri, 27 Jun 2025 18:21:49 +0200
Message-ID: <e569866ba4a2290b89b5bbd427d5cee71364612d.camel@pengutronix.de>
Subject: Re: [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Alexander
 Sverdlin <alexander.sverdlin@gmail.com>, Yixun Lan <dlan@gentoo.org>, Ze
 Huang <huangze@whut.edu.cn>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Longbin Li
	 <looong.bin@gmail.com>
Date: Fri, 27 Jun 2025 18:21:49 +0200
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
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

On Di, 2025-06-17 at 15:01 +0800, Inochi Amaoto wrote:
> Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> Add necessary code and bindings for it.

Applied patches 1-2 to reset/next, thanks!

[1/4] dt-bindings: reset: sophgo: Add CV1800B support
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D5a5c61f7ef96
[2/4] reset: simple: add support for Sophgo CV1800B
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D811fe8ad1db9

regards
Philipp
