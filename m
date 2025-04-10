Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B659D28EA78;
	Thu, 10 Apr 2025 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296775; cv=none; b=SGscOz5g9AriK4onwf7595v59Ou+SN0SMDSU6fqHMwykX7zCjjH1ymGfdgfFtc1HiRiVZ0T0Yz8c5S6dApIIL1Sna4BQn04br5OkJqBQY9eudxi0OohS21+1Pf+kCBn1RpUQdLUmbob5v1tdNm7yw66UN7ZkHxRJ74TcmwoP6MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296775; c=relaxed/simple;
	bh=/1ROIKmwx8nS/3o+gcsJ2hhGc/4xQMxN4rw0Hq6QGtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qW9hs3Cf8YdyOSOTfCxyLOvDG5K2xDq+drFhIwJ3fM5y7rI2OX8DsnsT6exiKc0+QFm0dk+0keAapvQEQ0fA1e9IHWWpT0y7Az4l4oqOMiR+SxW7jIPievnf3d3OLPZq5vS2Bx4G86DjzwXurJ6++Vx13bg+3Avx9i47ce3t8gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=l5re606N; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="l5re606N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=yZn/B883RgMsLPIID5LgMtmDe9bGTls7z1CICv6lcL8=; b=l5re606NcoT9rQ16OVwhTiRvWH
	8XTByoVQxqz8+A6twXqlLlyFjLHQftHc8VdXa+Qmcvwjn/iHyAXxN+9hN1HwhiLXr6pMJ806Hv1Bw
	0LJI5OtMlA7HRe4WSnzpVPg5TrgEOy4S3DjuPmHTED/sY17AmTJ7ote25xJuyNmiPZNxdELKT9aS2
	GsBbWWCh/VQHpwqn8Hp4JIKghzaTJxGDKN6bEXKwPJxotlROEQI91PWrGVScIPV6AqxEPc+AV8OX4
	e3yFDu9xVFaSOLbUDzHpYixc7snv1PbihmoIbO4GJnaoe+hL3rt1I8RtUgsLJbZdDkt4N2Q25eUS4
	D+dA30lA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2tGg-00012N-PM; Thu, 10 Apr 2025 16:52:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: rk3588: Move SHMEM memory to reserved memory
Date: Thu, 10 Apr 2025 16:52:23 +0200
Message-ID: <174429674412.910874.12215629980197538006.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250401090009.733771-2-amadeus@jmu.edu.cn>
References: <20250401090009.733771-1-amadeus@jmu.edu.cn> <20250401090009.733771-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Apr 2025 17:00:09 +0800, Chukun Pan wrote:
> 0x0 to 0xf0000000 are SDRAM memory areas where 0x10f000 is located.
> So move the SHMEM memory of arm_scmi to the reserved memory node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3588: Move SHMEM memory to reserved memory
      commit: 8ecd096d018be8a6bd3bd930f3a41a85db66a67d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
