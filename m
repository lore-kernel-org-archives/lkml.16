Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CF721B1A3;
	Thu,  8 May 2025 06:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686667; cv=none; b=P+YyId1Dn8e/9Kd0kWfy5+wC82zT/+TOvQwVCGCBYS5ofqrfZ1kGYXltFsuT3B1agq6f7i6Hme0k3SIWoFKGAEKdTJdNnvoAuK8kxoGYb/ySfaqJ8AfYnrCcSSM8YmOXtA2MvRsRRC/M1y3u/uFgn8LuLDmdgDt6CEA+5g6cCyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686667; c=relaxed/simple;
	bh=HTkMbecgEA76J/DSUzXaE8ifmkpnDi8Sa23FEF9VYEU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=HEaPLSEDkcpWhsobBbQcYI2PLW9Bus6secUtSWy8OJN9wgJnhPuVu4ssAR5A1z5UZo4S6qQz4ZipahWxlM8XUioyJ4oNrHIheoajmI00IfRcjUy01BgAuN53ygrlDX/3t8JgMU/wcaDMXK8PG78NmsvQMt8z3sRgA3h5OaQyRqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=WitwGPd4; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="WitwGPd4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746686609;
	bh=0pI2iREWW5cC2LwJLtCoMOYZhwY83h/z7B9+8q2WvaM=;
	h=From:To:Subject:Date:Message-Id;
	b=WitwGPd4ELUfHlcBca74VFrCqdUNdz9uI+Rc7hx3jM/z7Dus5aO4zKCd8/MkbMTCT
	 0RztnDfv3gzZ9TKvLQp2lp2jJ6I9RidPpUTeAGo3Wzs2VQGjBIGmhPiVeG/C7Hm2AE
	 RiwuS/GN2uPiZqp/pZXJWAlPOh3V9UvkjbY68AIM=
X-QQ-mid: esmtpsz18t1746686608t123d24cd
X-QQ-Originating-IP: Lb7KIkQyY8JilwbOns5Cl43BA/5Z8/J56hf/m1H92DY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 May 2025 14:43:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4859509138922957751
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Convert Rockchip CDN DP binding to yaml
Date: Thu,  8 May 2025 14:43:02 +0800
Message-Id: <20250508064304.670-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N3IC8um5pMyYiUTB++F8KmGWAz7BbvjjiJvjkp/Emlsn4bb47X4/ZJQi
	3s93gkfxyyqyBFPaHO95ETcR+vn67It2LfIX0jXKOXkXWHipQnUY61PNk7v42XfLt2bUInW
	b1CJIGt+gHy+SoabkJiwrra6tQkkj42SpsbbS03vIQR40QiBW1GVfYGJAosQekfFzr+CwRg
	YwMqWTEMVM4z3suCQIV+m4DDk3oSPaviOUbZJ1dFHZFydMyGXoh3+7d5aTHitLvAonE8QgF
	jeIEGebHMXzzEwvZ2qy3xzcsPYmyCbRBaWUDR/wovsrryAiK1OwxaGgyEjmpSNJL9dxQPQA
	XIulur70ImXupPMIfD4g/cvF6SxuWkZPkIQkIn9rynumJIkXcJc6mHYGoz/qOuQHDdQ7SbN
	F+CPCIanHXerXlwJOJhajxzhhBnPhbKASftNDzq9ZD4JfIfYape0q0ezZ8Ar9nrYrucZ/4a
	3FwGKtAOVO01z2DpkBTgYShC8gJm4yzBkVDzRRnIlqQwpjht0zILw6So2G0RqS8mSz7aYIK
	0ZXduco+VDbsd63wAHnLfiO659D6971lm00O1i7vpHIvVZ0rFXSEA76N/gJCjGUBk66yU16
	h0hKvIeFpl7ilnJ24FNO8J7buPsBUNIPooKHKJmAWWLOAxB/iUPGGVcchiLR0YPtt1a2tG6
	bUMR4pcsQhe+Pw4KCVpde0oz4eccAOhnEQg2MDPF6m4Q7lW0mcXPAJSpr/gfICE0bHHRA7R
	BnaKLEyJ+IWakDzca2dX0+tz15yetBk95GlTAx58Emd25MrQ9rda/6yHJQrE3wS22Sy6+ZI
	SRWByavJ1v1Z/xKQNObNDN5Oht3I7KmAwqiz0IhA9mpdPExOZZ4rzZe1BAYvukfHNXUxz7F
	e2tfrMTeBn6x31JRJjWXREaL5MK6BBQqdCtwtXoCzkeA7QsaqWvgFrbT/Vh4XCcYyRgX8cW
	VoHl3OzAjNz5v0Q==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series convert cdn-dp-rockchip.txt to yaml.

PATCH 1 try to improve coding style on the existing rk3399 cdn-dp
node.
PATCH 2 try to convert cdn-dp-rockchip.txt to yaml.

Tested with:

1. make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml

2. make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml


Chaoyi Chen (2):
  arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
  dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 ---------
 .../display/rockchip/rockchip,cdn-dp.yaml     | 148 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 3 files changed, 157 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml

--
2.49.0

