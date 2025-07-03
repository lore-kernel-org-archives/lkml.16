Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A2B220F36
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534215; cv=none; b=T1EFvxZh5KVq8RXkyxcOPgwH3cfbnCBfLEw4aEaejkbzYCcreEgfj2TdSohbBRbY6IP7nsuiOYoNM+lL0+s7iBwfRoIVJ/lQuQu963X1XSo6vLRZWFUWxQ9KnQ2AaArXrY+ewEm45k77o+Pz64zHcPrU+NAXhqTdPMEetcZ46go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534215; c=relaxed/simple;
	bh=QMDx7f88cknzGh+MwyPL+ZIHDAomtr32IJprmUxtYR8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vBOEn6dy73xmiA8UVfnFqH46ypdcsacezrq2J9zUrCLTuwMfDqzFDfRAIyT9FXEawwacP2e5NzmoAKqvPC4tuc0M+fOhdNZfiGRj7SzU4k5ijtqJJTP2yR+A3s1MJOsVfUqgBulJFfDipQkhymeWXZyVNYk/IkHp8gmU1GdqDoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXG3h-0007OT-U2; Thu, 03 Jul 2025 11:16:45 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXG3h-006ZxO-2A;
	Thu, 03 Jul 2025 11:16:45 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXG3h-0006CY-1x;
	Thu, 03 Jul 2025 11:16:45 +0200
Message-ID: <eaa7d6a40e76cee8ae02293ce272f22fbce9d7b9.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: Convert snps,dw-reset to DT schema
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Jul 2025 11:16:45 +0200
In-Reply-To: <20250702222609.2760718-1-robh@kernel.org>
References: <20250702222609.2760718-1-robh@kernel.org>
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

On Mi, 2025-07-02 at 17:26 -0500, Rob Herring (Arm) wrote:
> Convert the Synopsys Designware Reset Controller binding to schema. It
> is a straight forward conversion.

Applied to reset/next, thanks!

[1/1] dt-bindings: reset: Convert snps,dw-reset to DT schema
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D196dbace0824

regards
Philipp
