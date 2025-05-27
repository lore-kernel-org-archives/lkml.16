Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE2D20299B;
	Tue, 27 May 2025 22:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748385622; cv=none; b=CpVCzyJh0SBG3/ZhHSQOZl4ZOUAENBFw6QN87ClACAXP9o4yZCTZLceBXBe0V3Y3LjifCmDhM4JLhj1Aoytnl5CV994C1KC6FsesEQTMjKaZf9lt6pL15ITio85fsLlHXG5Y4GfORiPAPRHucCZoGKL0b40fuOrdAiCZXm5Ee0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748385622; c=relaxed/simple;
	bh=NSo57GFDK3pRjZbqeVf45lXVa0GyJ02lg0snu8/nMzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YzhRSX1uznhPsy6N5s+10TXCeYz64g2Ka1TqCHAhDchpF7BqXdTf1aXY2MQsgsU/PhkL8fqOFrAm1ZLoPfh85LAhhQC7NMiLzILf/qik1AJFe1f7btqZhivxygsJMwGExnLq/Y5r66iLaoLNACGNS9O4ahnec/Z+o+2uQKwDFjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Jorezx+v; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Jorezx+v"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A2E46C00282F;
	Tue, 27 May 2025 15:40:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A2E46C00282F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1748385613;
	bh=NSo57GFDK3pRjZbqeVf45lXVa0GyJ02lg0snu8/nMzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jorezx+vksGQPRa+DdurWwy2CZjWiPqn2YFUQ/NEJ2B3F+YmO/8/Wg0i/1vnz2LZz
	 ZsPwx2mK04Ck6Q/uuUA3n48UsDX9Qxw78Xp3PB9Ad5rvG/KOdCj8w8zXYvMTt9SkmE
	 2JwGYNLjJEXDQnAsKP0UBxLUPP4xY+OjLnLqbUhE=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 36CCA18000530;
	Tue, 27 May 2025 15:40:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: bcm958625-meraki-mx6x: Use #pwm-cells = <3>
Date: Tue, 27 May 2025 15:40:12 -0700
Message-ID: <20250527224012.232638-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527181320.373572-2-u.kleine-koenig@baylibre.com>
References: <20250527181320.373572-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 27 May 2025 20:13:18 +0200, Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
> bcm-nsp.dtsi has #pwm-cells = <3> as is specified in the binding. So to
> also use that correct value for bcm958625-meraki-mx6x the property
> overriding that value just has to be dropped. This fixes a few warnings
> like:
> 
> 	arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65.dtb: pwm@31000: #pwm-cells: 3 was expected
> 		from schema $id: http://devicetree.org/schemas/pwm/brcm,iproc-pwm.yaml#
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
