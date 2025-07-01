Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFA926B778
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359378; cv=none; b=Im4ks+4dXsoZYccmlh1eH5AXUy/tBH8KejY63nmsk598LE3DEHsKL4T5DmK4EPLEJ/bURMPAGPxo0K9V6bMglk8GOyVoxK1bFeghg1bnMhVSKHVXYp9dSFfyNyJtbUVIuYsrBbo375mozkimFA0OacCJK9oOcNOyviCAG3tkTmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359378; c=relaxed/simple;
	bh=wOV+bD/lURSVeWhLh1HKT/ph+9zefJzcIBU6K3qSrnM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eBxhANrScO9rUUaV5oB+9vW04opbVPNph9IrmB0Xk1rGCIVPG6L053S2DpUZI63WSI8nYe0NHOU0XOrTaq4GvDvmG4rWRqJmgZswKqcBD+bCL3FFqtYWEe9GcWqr0ck8o8rSbqRu94ptticzYV8K+usvEGNZYdVMsCyujAncH5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWWZq-0007Su-4v; Tue, 01 Jul 2025 10:42:54 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWWZp-006F1h-2b;
	Tue, 01 Jul 2025 10:42:53 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWWZp-00047I-2N;
	Tue, 01 Jul 2025 10:42:53 +0200
Message-ID: <886fe23d09c3db0e884b6e2d975344a71e12731e.camel@pengutronix.de>
Subject: Re: [PATCH v2] reset: brcmstb: Enable reset drivers for ARCH_BCM2835
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Peter Robinson <pbrobinson@gmail.com>, Florian Fainelli
	 <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
Date: Tue, 01 Jul 2025 10:42:53 +0200
In-Reply-To: <20250630175301.846082-1-pbrobinson@gmail.com>
References: <20250630175301.846082-1-pbrobinson@gmail.com>
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

On Mo, 2025-06-30 at 18:52 +0100, Peter Robinson wrote:
> The BRCMSTB and BRCMSTB_RESCAL reset drivers are also
> used in the BCM2712, AKA the RPi5. The RPi platforms
> have typically used the ARCH_BCM2835, and the PCIe
> support for this SoC can use this config which depends
> on these drivers so enable building them when just that
> arch option is enabled to ensure the platform works as
> expected.
>=20
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>=20
> v2: Update the defaults to add ARCH_BCM2835
>=20
> This allows 6.16 to boot on the rpi5 when just using ARCH_BCM2835,
> which is what Fedora uses, otherwise the boot stops due to deps.

Applied to reset/next, thanks!

[1/1] reset: brcmstb: Enable reset drivers for ARCH_BCM2835
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D1d99f92f71b6

regards
Philipp
