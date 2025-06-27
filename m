Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590B19D07A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041019; cv=none; b=e+NmckX7pZgbL2LbSZe4CBcm89XV/pXCsGmc/YwZ3eUw9vWrIPVBCbFkuJl5EbM6ZqvQFpvzT6YZ+Sy2sTRBBQkq+tiaGK8aC/Xu6R3398MvGCyBClqUMA1bPAz4XJ1NnhwsR1qQ6NtoglVvlTaGmapzqUnnyQRw0w9viZsaKhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041019; c=relaxed/simple;
	bh=+m6FH5ATjNuE/PIFu8z/fPmdv+EJT49LkPvcFdpFEV0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D5KoMEDHggdR0MIV/lPYTADvzktP0bwa4hmPqaGdXSBKQylmO/dl7CAijaucBqza9U2kmp1dONIFG+gtfv7QU65vIcgiO3E+fL+2B93GUXqojtj/6SQSoDNU5g4fPICCxaOPiRWEsmEioBQcs51b1LEtVcsR62vhGrkrpL4n03Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBl1-0008Np-Hl; Fri, 27 Jun 2025 18:16:55 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBl0-005e4V-0u;
	Fri, 27 Jun 2025 18:16:54 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBl0-000QGr-0g;
	Fri, 27 Jun 2025 18:16:54 +0200
Message-ID: <3c35bd0609e17b151c078b0515bc0495323370ed.camel@pengutronix.de>
Subject: Re: [PATCH] reset: thead: Fix TH1520 typo
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Drew Fustini <drew@pdp7.com>, Michal Wilczynski
 <m.wilczynski@samsung.com>,  linux-kernel@vger.kernel.org
Date: Fri, 27 Jun 2025 18:16:54 +0200
In-Reply-To: <20250601181000.166088-1-drew@pdp7.com>
References: <20250601181000.166088-1-drew@pdp7.com>
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

On So, 2025-06-01 at 11:08 -0700, Drew Fustini wrote:
> Fix trivial typo in the Kconfig entry for RESET_TH1520.
>=20
> Fixes: 4a65326311ab ("reset: thead: Add TH1520 reset controller driver")
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
> Philipp - do you prefer for me to have a thead reset tree and send pull
> requests to you? I currently do this for thead clk and thead dts.

Applied to reset/next, thanks!

[1/1] reset: thead: Fix TH1520 typo
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3De73bfb4ca522

I don't prefer pull requests.
This usually only happens for cross-tree branches.

regards
Philipp

