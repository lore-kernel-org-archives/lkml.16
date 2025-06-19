Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339C823BCF1;
	Thu, 19 Jun 2025 04:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750306404; cv=none; b=fQ9BethgjQw6lboOGIMILu6dGnXclnBLZG+1mwWXD3k66NRN/QVD1u529YDiHBWVAknYYJ26CQIJeFfLvfuw/uHsyjMzV3ZbqYuPYrD6QzReXIgLu39UxnAXSwYbuF/WQHkHR9U5wdDP2yw8Y3Ic1ytveEmm995pq5uerZcccko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750306404; c=relaxed/simple;
	bh=VnLJTt5TZn/1JqPrr3RK4iKqWM+0/IVu7HJoZcruKak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9NKe7j71hYRha1HzUK6rdv+57iVWz6dbwp/zpMC6vMcC1WuDWhk7+veJftGUowqpRyIaH48nO+TEf81UCNRpsF2T7O1gnvluhyK9cb8fepjd1GCnAdwL0RVsjM8FAp9YcUmjTM4Pe5+thjOJzx2TA34HHl6P2W9BE1U/reyDXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=EfB0CD/5; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="EfB0CD/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7mH7c45eSfL+b4MqS/CU4uB/SYh3Jq2So6ySOqYFG+4=;
	b=EfB0CD/5usDHBil636l93NHjNoxGqOGsvbJ1iKPna7nEh8WxcJO9xotH3n5i54
	C0FWUjv3btrdYM2t1a0pyrKp1VjzHVIVnQv5JNsnPLyjo78ToApYoBSbrf047v2t
	dX2q2JTYGXp+IjX4X1Amrdr8Wf27N59b2GblJ3rsipBPI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnl4A1jlNoj0T8AA--.46928S3;
	Thu, 19 Jun 2025 12:12:39 +0800 (CST)
Date: Thu, 19 Jun 2025 12:12:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: tqma8mnql: Add EASRC support
Message-ID: <aFOONKOejLcYOyLQ@dragon>
References: <20250520120820.890252-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520120820.890252-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgDnl4A1jlNoj0T8AA--.46928S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwhF4DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRefBWhTjjdxrwAA3k

On Tue, May 20, 2025 at 02:08:18PM +0200, Alexander Stein wrote:
> Enable EASRC support in tlv320aic32x4 sound card.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

