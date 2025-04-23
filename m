Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997D1E485;
	Wed, 23 Apr 2025 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411622; cv=none; b=IzGU9OVwHWJY3HRUJlyWBt/qLcgO+Dc4oVtyAdVQ7XafbsIiqIeRdkUN3IOjTXttrnzmSyAtF+9YlJh6l8eGeqPMC1Gxxa6eVSuDsvhNfyyrB34OolbBV3/+gLKY/0pLYEy08dc5uTyEqVT6yRRNB6C2xcMLHXRG5iHpfGog1W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411622; c=relaxed/simple;
	bh=1OZA2BJ+ka4V8KUJAigHCTHxTTWKg7dPGzgtDNIHTbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYp/nfL7x/vgWTqE7k5kxhzPYYxPmgKMF1FJhrLgGUTb3mlNwhk1zQxvLQKRdWhGPM3xKJ7smB2lTI3CYK4W0QicWgdMBuFTF22AM/fbxw7WJmnAWVZAVDSnYRy1a7S8QUB5JCTaYw6SKFu1R73TbQqIUafr4xn3K103tm6SZ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxypDDlD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxypDDlD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374AEC4CEE2;
	Wed, 23 Apr 2025 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745411621;
	bh=1OZA2BJ+ka4V8KUJAigHCTHxTTWKg7dPGzgtDNIHTbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxypDDlDgf8d/WAnT+0dNXjXiQcZe4Trx2Jt6dlXQzkSYMhzDXzY51HP5vpTOOFkO
	 T0b3u+xyiS7D4HuB2QjG2e9gwoItjgaPkHFffgS0scXFCuk0NUqDtf8f+ymMv6UZTS
	 nd8FtNDyw2kzcHGVwH5D2Dyu1bWq7khN9lcIALDmth1cjWRePNHE2+pgM9GldoTJEb
	 6Sl0Fjzy85zidXpU51tMbbQCDEdszE427KuejLgHU6+zi0z4GntP69I8fH1yTb3wsk
	 JKECKIBaTgdm82Fk6qGs9jat7F+0LsEDIGPrbm9WIErcaoDiT+36Bto3/Fg4sUpI9l
	 EsUwchrXV3pPw==
Date: Wed, 23 Apr 2025 07:33:39 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy
 variant
Message-ID: <20250423123339.GA191369-robh@kernel.org>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-2-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422132438.15735-2-linux@fw-web.de>

On Tue, Apr 22, 2025 at 03:24:24PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add new compatible for Bananapi R4 with 2.5G phy.
> Base board is compatible with existing BPI-R4 only 1 SFP is replaced
> by RJ45 port and use mt7988 internal phy.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

You didn't add Krzysztof's acks on these patches.
