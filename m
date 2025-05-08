Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DF0216E05
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696008; cv=none; b=t7x5LvG2fid3J6BhIfog09KVIztqz9VddJ7Cp6KbM9kKKpZ9QxWXqwHNz28tYA+CzXsODrxuVaWn/6TUiC0/OhmXHdeUnFIcWxrRuda4/n2KC77HVpzCosW5FGL2fJ8hwSVLoV/r8zwbYnp4I6VUhmaoIQxUEgZMgBPfwoG25hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696008; c=relaxed/simple;
	bh=hnINcULJKHYJ9cO06p8JPKpFweoVVjduW6YYgmpYZaU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jK+0AJXr1wc2uSe1ppkSV8efjFO1cGm8NOrABcYM7GAfCsZXJW9v0z0BSwGNYQYNZATREpLPbh2uxC4ZaUdo+sPfdIK8li3mAeOqYs8u4x9YGBwlhOFQBYKP00CZ3J7sp1Co2Zy2zsgDtTuvwoiGjHWeKnDIS0zuXzczKRylp04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxQ4-0003WE-Tb; Thu, 08 May 2025 11:19:56 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxQ3-001hZx-2i;
	Thu, 08 May 2025 11:19:55 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxQ3-00049l-2O;
	Thu, 08 May 2025 11:19:55 +0200
Message-ID: <5a72aff989d9e3e00fdae7a66c39e746db2bf501.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] reset: canaan: add reset driver for Kendryte K230
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Thu, 08 May 2025 11:19:55 +0200
In-Reply-To: <20250507-k230-reset-v3-2-c85240782ea5@pigmoral.tech>
References: <20250507-k230-reset-v3-0-c85240782ea5@pigmoral.tech>
	 <20250507-k230-reset-v3-2-c85240782ea5@pigmoral.tech>
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

On Mi, 2025-05-07 at 21:25 +0800, Junhui Liu wrote:
> Add support for the resets on Canaan Kendryte K230 SoC. The driver
> support CPU0, CPU1, L2 cache flush, hardware auto clear and software
> clear resets.
>=20
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
