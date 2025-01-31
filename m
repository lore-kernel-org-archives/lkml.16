Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2CA1E885;
	Fri, 31 Jan 2025 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738315214; cv=none; b=VcHwgsEIP4WineT5QHwiUma9NzYTWaY1LECCHvVypNQjaeI1+eKlp8hDxfGVV7TeEOYQg9ZKre6a5PBSYXd/20o52s2OPNLjOX7Y/w4mIwEXYJVjuObDovLPN0AqHL61gsDGQmbf13jVcjZa5bjhfAalCCy84mhLBEKu19SwpAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738315214; c=relaxed/simple;
	bh=uBO58v9Hrbhb+JQu8iwnHsYbOYM25bye45XXGOQWJfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T8gHCRXirSqiF+6GI2zAp+wG6rrqK8HNBzdj0Pk+j5Jni33uqILT2Lj8D2VMaoXNvmf1K1aOArinvkchrRx1s6Y+pyfU7+/DYBnc76/oZtWltsjzrnFWDa0l2zkNRYB6EwCWL7eyISgHB7VGuCs6fI9eFPe4kp+DbnT0a560jy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=fO5N0AY6; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="fO5N0AY6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0B7vxdS52txOQYr8MAUjOPGxnkb0yKArb/TqnTim/JE=; b=fO5N0AY6e9Fe7eGia4ydGVl/AS
	U5f/5AQpGP2olKzC34QoHN1a2he0xkIe1t39UyugTbsuF0DaAMy4hwn9jxFduUIRVRtEYQXipSgjL
	lcrYQ0CM0Lzx2V8ORCRr7JriJ4M5AMdoUpMjOpPQoM5w4cmWy/TxbvOArken6/B4lGgYrduzcJM7Q
	SaXdPbZZjhVhyUnYfmmHnCvW/azD18jKc3IiupUbz/JuKTLqXZ+3T55naGCHmLvoIj2QxpluMUx5c
	U0TBimeFUZaZSLUxwj6rHskipMgsQRG5sfccRnUvxhennAWMQi6skyE3UQ+eCLWDA8xpmqUwS2nT7
	UPT5HCaQ==;
Received: from [212.111.254.164] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tdnC4-0006Gx-0H; Fri, 31 Jan 2025 10:20:08 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH 0/2] Describe the cameras in the PinePhone Pro dts
Date: Fri, 31 Jan 2025 10:20:06 +0100
Message-ID: <5127541.31r3eYUQgx@phil>
In-Reply-To: <20250119-camera-v1-0-320be4f0dc2b@bootlin.com>
References: <20250119-camera-v1-0-320be4f0dc2b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi,

Am Sonntag, 19. Januar 2025, 23:56:58 MEZ schrieb Olivier Benjamin:
> This series adds support for the Pine64 PinePhone Pro's rear and front
> cameras in Device Tree.
> This is based on some of Ondrej Jirman's patches hosted in his tree at
> https://codeberg.org/megi/linux, but I have also fully reviewed and
> re-written the code from the RK3399 datasheet, the PinePhone Pro
> schematic, and the IMX258-0AQH5 software reference manual.
> 
> I have tested these changes on my PinePhone Pro and am able to take
> photos from both cameras using libcamera's cam.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
> Olivier Benjamin (2):
>       arm64: dts: PinePhone Pro: describe I2c Bus 1 and IMX258 world camera
>       arm64: dts: PinePhone Pro: describe the OV8858 user camera

Patch subject should be
"arm64: dts: rockchip: describe the OV8858 user camera on PinePhone Pro"

patches need an update to accomodate
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c96e63301978f4657c9082c55a066763c8db7b1

And please name the new regulator nodes similarly
(regulator-foo)

Thanks a lot
Heiko


