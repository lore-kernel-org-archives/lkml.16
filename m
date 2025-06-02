Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8492721A444;
	Mon,  2 Jun 2025 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748879004; cv=none; b=Idh0OXkMO0+wzakdFtmNrcU3wwFws4/tJrdOGr2frusJOn2gN2ZHUo6CmDcafrcnHiws45+lvNraPVLkfCmiGYqFESzq9npbcTmCdFK0R22mSCYcgTHWYM1BCSS70wvQuRr8bpdoqTM4cuvg3O8VoTnFNvpjM7kVnXgKMZxjArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748879004; c=relaxed/simple;
	bh=DBJwOAmkyX2Nribm1dGA50el7+wrnSk5uZuhbhqZS4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4OKdxdYKqCTWJoXbKruwkb4BU7M81GZ6fK9uXvRZcXcyOvWAL0+gYNtrF2p8Kql/+3ekfhpdQzm/K7vWIwMombYcQyI0fMIDc3ldj2U1RG9hzmsLkh6OyAuaidXGTiFEBr5SCDWC3l0VZ+kQzYMjWJXebp4220Srgxl3ved/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=n9azWB/n; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=n9azWB/n; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="n9azWB/n";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="n9azWB/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1748878455; bh=DBJwOAmkyX2Nribm1dGA50el7+wrnSk5uZuhbhqZS4s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n9azWB/nVNOjiLwTH70drkA1yuTzOU6cp4vgJ0VU37Q88UZpL/01xyQICw3cQF6Ri
	 40+E509WAVyz4eVM7uPTYnHFC7UkXQk2N+qVzXyGiypX4hbgOEfhjcexL/3d1KfPYT
	 XVSWdpJx3e2vMfVz0tV38bWPNPZy5l3EJKN+Fqbd6BjgAGq/JaZSrkRQM35qjC5VBL
	 BCntMKkeDnF9LpAh79Hp/5tCq5yAtrJt4nobyJB6ix9I9sLBQvTxM9u7WHqrszkLSb
	 S4G0epOaPOjqoNvuZWyacuqyH0pwAQdyNjCiIarHxb7J9uSsgjTGJgY8QVQqKPiOzO
	 pdReT7E14GATg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id C0FD03BE084;
	Mon,  2 Jun 2025 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1748878455; bh=DBJwOAmkyX2Nribm1dGA50el7+wrnSk5uZuhbhqZS4s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n9azWB/nVNOjiLwTH70drkA1yuTzOU6cp4vgJ0VU37Q88UZpL/01xyQICw3cQF6Ri
	 40+E509WAVyz4eVM7uPTYnHFC7UkXQk2N+qVzXyGiypX4hbgOEfhjcexL/3d1KfPYT
	 XVSWdpJx3e2vMfVz0tV38bWPNPZy5l3EJKN+Fqbd6BjgAGq/JaZSrkRQM35qjC5VBL
	 BCntMKkeDnF9LpAh79Hp/5tCq5yAtrJt4nobyJB6ix9I9sLBQvTxM9u7WHqrszkLSb
	 S4G0epOaPOjqoNvuZWyacuqyH0pwAQdyNjCiIarHxb7J9uSsgjTGJgY8QVQqKPiOzO
	 pdReT7E14GATg==
Message-ID: <618490ca-cde1-4e13-8638-f5cb65606c6d@mleia.com>
Date: Mon, 2 Jun 2025 18:34:14 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Content-Language: ru-RU
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Michael Walle <mwalle@kernel.org>, Fabio Estevam <festevam@denx.de>,
 Markus Niebel <Markus.Niebel@tq-group.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Max Merchel <Max.Merchel@ew.tq-group.com>, Tim Harvey
 <tharvey@gateworks.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250602140613.940785-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250602140613.940785-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250602_153415_809469_D7AF26E5 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message. 

On 6/2/25 17:06, Frank Li wrote:
> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> warnings:
> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   .../devicetree/bindings/arm/fsl.yaml          | 23 +++++++++++++++++++
>   1 file changed, 23 insertions(+)

I prefer to see NXP SoC powered boards under Documentation/devicetree/bindings/arm/nxp/

LPC18XX/LPC43XX SoCs are not Freescale.

--
Best wishes,
Vladimir
