Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2814828366;
	Tue, 13 May 2025 01:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747099281; cv=none; b=hGlQfer+qzxRaRncQDA6mFv7PvSEcrBnP47cisxDxQDLX1qQo46iQ0SkscVUC8VzUDMtZhRSd7OvjqV/v0p7xYveB0lz0VVGk3tn0JE5rw2WFvpa2SDkZoXkumDPow6ET92U4bf2U3bewAwZiaFaJQiNtHiQ7UrFKHCGzU4j7DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747099281; c=relaxed/simple;
	bh=+zXFHp+zs7okALBFZfHmltCz3nqOH4MQBGvpJBntwaY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=iRpB3+NuiTeY4eD/vSgNYJ/kx/y68VWZMeF1mHrGw+a2JBiA7dA3e+HnBhjbUb1jdE1C9qSZHlE37bcfzL0FNypzuXXCfixir5jMnjZ9nV7k6n58QliVdeTzw1MpH7NQ9wMq1N5Wgs6/nzbcU3i7MiMU+6XlT8g5Caw3cFIjDYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=Co1n7HhM; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="Co1n7HhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747099212;
	bh=sx0QPXnSaLIf4F34i9zHng6KtwZzILwK0rjOsdgpCTc=;
	h=From:To:Subject:Date:Message-Id;
	b=Co1n7HhMer8FJlSY9wEQbv7GPvFZf/ZJmY5ZKsmh9Qcjgh3ilo2+j9VAsQ3o/IZvS
	 Jw+RjyP1i8c4Fpj01luMmECgDyxgwWx3Y85cA7ffZKL8s1cKKhHn+Eu+/BkONJsNbo
	 EG8GAt3qjwWro6K8biikU2bKEf7paevU9MmpTOWg=
X-QQ-mid: zesmtpgz8t1747099209t919a02de
X-QQ-Originating-IP: 5vhkHeA2dWXXDt212fbrUzKzkNBcuE37BFyAXXTQglI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 May 2025 09:20:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14605522553798699493
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
Subject: [PATCH v3 0/2] Convert Rockchip CDN DP binding to yaml
Date: Tue, 13 May 2025 09:19:02 +0800
Message-Id: <20250513011904.102-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MxdW4jxL6NvXQoGjJXfegqbg1k50qSDlLw4rve6vJXOuUogvtaDcDkc/
	KWnLXy/+T+NkJ+Izy6Z46f1fWP/dPjVv8e7irs6piqewz3yy8enrSTNAQ+0zCKsNZ4dbxHL
	ujLnAZ3jIAFUI7t3BosbH3LbUB3tBapDrkVumWTLVBiqg+XpauhYALlJ7Qsl27bTrUUhs6T
	rlVrFl682kRAJQPWC1fjChxxmE+w3ZdE8x5tfSBTsAF4/34XpdrlV3F2A8kvkdH2qnYtadx
	Wm6/OWXIYhwrY1uNqdYqDBhQ+xX6HS0psQCc2LpRZp4M5UIJQQ3s6p8K/xArjCHDR+Nw1tj
	8ioF5lM20/wFuAPGxadFHhDQTbmllcUEwt30KIrCXSsgkwZ83VipnXst96YxsR49aCpyEZF
	OskKu2luiOX3lbIhcMZsgHPm9BURDVVrC4UARmIlm98DnxjavBaffA9Ro75WFfhwYUh4/kB
	iTpxOGvvvLOkyz7dE/4HySdCOHs6iG9jZEoD6MoQiqRrlhPnvM8Gb2HEkistD9JOL2RAfTq
	TEwQmeZ1I0FTqgYKNZswZMVZj3OdBHwc1jlDquIkLUo2lhXgOyW+Vqo+8/Gd5TIxa8XyQZO
	9QGHyj1SeD7U14Sm+3Jyl34s3/EXfOKvxcolPNVF2Jhcq5XIBIsw5+GurGFMY5hjKB6y17I
	nG2l2wjJMaGqDa5xQAY0S96j6c94nlnAVyYZ3C8QhDbm0rEu0AZjXvF3HJie+g3vBiWn592
	p0XZSnt14AoyzHZm8JWeBjhplcI68tIc4LPOoCmWccwP6dOKYg2b9SWbuy9T6HFchtuEdIa
	TY/jcFzpcIxWZ8oOMi5QAYf8d93m4/bG3oebLDT751XYGk2vb2Vo9wi1ifWX6Gypmma+azs
	yIVtsllBzQL0lbSRw5MtKn1s0PiV/XFRT+io00QCUkU3RI51faJnG9sex0ZumtoodOL8je0
	nT88DxQEJA3cjFzfhszIP2ASIC6yyC2y8ftqqAi0zSYjRZA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250509070247.868-1-kernel@airkyi.com/
- Add more description about phy/extcon
- Fix some coding style

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250508064304.670-1-kernel@airkyi.com/
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style

Chaoyi Chen (2):
  arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
  dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 165 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 3 files changed, 174 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

--
2.49.0

