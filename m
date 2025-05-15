Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F8B299A9F
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313462; cv=none; b=tXeXjOvgQyUbGLmwBl+R39CKKeb7jXKVBCSPC8ZosdWGihr/+awk9xp1/A8Ymy+cRucgeImmZ8aNiajt9p73HpLT2tj1nGFz0NYQut8Xu+FJh53dV+E8jAuvk7RFphdXlnTnZ/WfOVvILhB59OdDcTdb1cPz96cMuF5pMKyGJIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313462; c=relaxed/simple;
	bh=j+xiNs3av+6qBtDkJKFgywTt2xwP9kFcfJlJCHPVzUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e+W3tYXnirqF2me8mE8txz0n2PcZtp/NldhJbcy9JJhj4qwxs4wcpbuh+vrDyOe+ZUsqdN+48DpD1RneITJCEirW11nvKKH4PHt87CzDiLdZzRHImgMmF02yZWmpnaVMtDLfbCUfU1B02OFKti3oa4vn93VWCja3nEvGfeClQAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qCpCZU3m; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qCpCZU3m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ld9arx90FswKTvckS4BOSrObHJezxkx22Rz8W/MXMQ0=; b=qCpCZU3mchTTrS5K0WmUB2MNeM
	wbJTFYuKhjbTs+cSkk+7pQVcxE4BXuXfcYcYbBJyQX/RUFfOIo3FLdj/gE695TuOj90lRwjD1CsX8
	aMkSaevpSiZNL2HzdtAF+QmWCo0xuHcs63UQyabUB+VKD83+xfIkyzpsghdXXfV5bW7aX0cYOJ3mn
	19AaNXknKWk/OGM9fP3neVAGSl/soWJtOTMrjWpSa9/1qXKxVpYD0x6AUUXyxfBbNj5wNKMK1FAl1
	qSYGJp+vV4Xo05B8MuKSEgr0R+UFCcAwJSP8zwoMMiNP28Bwxxd+RysmtJaXLOvMlq8xvtADz+7sO
	F7XmxPUg==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFY38-0004ph-9j; Thu, 15 May 2025 14:50:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: dts: rockchip: move rk3528 i2c+uart aliases to board files
Date: Thu, 15 May 2025 14:50:43 +0200
Message-ID: <174731343058.2524804.16404184082290188449.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250510220106.2108414-1-heiko@sntech.de>
References: <20250510220106.2108414-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 11 May 2025 00:01:06 +0200, Heiko Stuebner wrote:
> Even though they will be the same for all boards, i2c and uart aliases
> are supposed to live in the individual board files, to not create
> aliases for disabled nodes.
> 
> So move the newly added aliases for rk3528 over to the Radxa E20C board,
> which is the only rk3528 board right now.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: move rk3528 i2c+uart aliases to board files
      commit: 34d2730fbbddfdffd656d36a13f8fdb886a3b5e1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
