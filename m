Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D734028E5EE;
	Thu, 24 Apr 2025 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745517125; cv=none; b=F7HrNsYrBkaLXqA2pT/AjQ9GOtuP1J0+EZFGx94lkV0k22GrZC1K7M6Tn+JBm0EzFoeW7PXixBsR91FdLuDFtUeglcx6sestbXyZtuQIgUoRH9AxlDw9Ao1eWv6gwOFzqOY+uXqMzePcyNoUiqBnnkQYyQlo4BXQmawpS5gkWG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745517125; c=relaxed/simple;
	bh=zaOz9eut4pMeSAtsxalBvWoDhbN979zNr1r4+hWzwy4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CItTml/gZRici3f5b7WGWYZr23apkm6cAwzIkwQvtNJeSe23nda6eO5z1KoaiVtzUylDUzU3UldPhKFa5xmESTrwl5xfrc7QKAu1JdaRX9YGhHPIBqTRmvRYbYVobyuzjdBUJ1ww4t1nkryfL1PAzGV6v/J+NG188QX4oQRz2Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD70C4CEE3;
	Thu, 24 Apr 2025 17:52:05 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 2FAF35FC3D;
	Fri, 25 Apr 2025 01:52:03 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
References: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: Align wifi node name with
 bindings
Message-Id: <174551712318.4050580.9611713375117981006.b4-ty@csie.org>
Date: Fri, 25 Apr 2025 01:52:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 24 Apr 2025 10:47:36 +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   sun50i-h6-orangepi-3.dtb: sdio-wifi@1: $nodename:0: 'sdio-wifi@1' does not match '^wifi(@.*)?$'
> 
> 

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/2] arm64: dts: allwinner: Align wifi node name with bindings
      commit: b55f9ec87a54b67bd2dfbda1a90103af3f7934e0
[2/2] ARM: dts: allwinner: Align wifi node name with bindings
      commit: 0ecb35f6b065103bedf8fe21451cddeb259e4701

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

