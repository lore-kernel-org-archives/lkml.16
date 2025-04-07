Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3865A22B8CE;
	Mon,  7 Apr 2025 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010285; cv=none; b=f320DJ1iXXK5lcAvFIqSo6AclbKWnmfacujaRzt2g+shDO0tYMpOkPHnnow8QbJ8Z2neyxZqPrV9AK7w2Xlp+py6Ja+gUTNEj/3uzSNmI2yvf5ug531QbZRPW5yo0HudTbp3VIpZ+4lBPOqS0TyRyRyFCkjtbgKByDkurx7D994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010285; c=relaxed/simple;
	bh=C403OQ+m823DK01/9mwZnbhQwWB3bMp6kAoRCCmwXiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I1vt97W7ow2Tu22rEk/Gqoo1ft8TLsLEPtG8O0HiDmaxFGMdvJ+/2jw1iXMJxfEZ5E9FZdmc1yEaaQfL35mnwBWj4jb1SHWR+tTmgpbOUtPYlFIJ7xd9jtMFlKJ2gXO101Hs6f6ktyL6t4TM8G+EpuV7zyQoxaBvz7MLoAVfoNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0titYTkD; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0titYTkD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1JjkQbWY/HnPp5mgL4PyI7UmyjOUB6NOpVVT766uZ7M=; b=0titYTkDoxaYelZsph46XGJIsw
	MPqXxVEmr2+oK/6jc1wOBx0xJ3EWYSUY6MDQUFF8OkLjm/aBxnqx20eco1CAiUAqjzMMKUd2yFVPZ
	1v6jaVhAoqis+uX7ZelcAeA3jm+DPWFj/2u1nv+wE6hNiKpoFdtspe5djqLV2si4avIjEDvtSl9Wg
	KTgQB14K3WPERh50xu5k0u92785ScWt49Daql1c3DTG3/ZiSyGouBUdLbLKq10+Yok1RYnUA5xYmS
	60gWwsiB80IKmCZWZ4e93bZahbNyZanyjoAtTJ4siokgxNPB3xB22HM5dcPNZKXdB5nBxxXXi3hhB
	s59kFcNQ==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gjv-0000tP-2Q; Mon, 07 Apr 2025 09:17:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] ARM: dts: rockchip: Add aliases for MMC devices
Date: Mon,  7 Apr 2025 09:17:39 +0200
Message-ID: <174401024396.372530.9920450693183884709.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324125215.160616-1-andyshrk@163.com>
References: <20250324125215.160616-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Mar 2025 20:52:11 +0800, Andy Yan wrote:
> Add aliases for the MMC devices so that after the system starts up,
> they will all have fixed device numbers.
> 
> 

Applied, thanks!

[1/1] ARM: dts: rockchip: Add aliases for MMC devices
      commit: d15d8d234248d6575b2d4efc14731d0a623f89d0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
