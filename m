Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6FE1C2324;
	Fri,  9 May 2025 07:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774234; cv=none; b=Mh9yN6/D/QTPx7H8rUW8his6U+cLop0QGGe5Iad7LmWDqHs902eLcu617Afnx2cD5Pej3m7FCuMLVI2tKmErmwVUib5LgTVVEyH5RBgJDu8RaugiP77EnKsxF3otobbQ6lAG8LYhd4+iETQOU2iO5L6QLdISCkV4h6huvYXEbzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774234; c=relaxed/simple;
	bh=pMxZmxI1VTEWn/QzQURkbkpS90LK5PUgJzj9Ke8P31E=;
	h=From:To:Cc:Subject:Date:Message-Id; b=oUPxUPXjuYniE9hqrtEc8/mDq9KKRn+sBgeQIsn2JFfqi64D6hnoR4PY6paN7W9+nV5yR99ae8gDpNMATGcWKvMdADl2yq1iZXDBRS51jFSHe3mh+oHmIWzVjymrGor0DsjF7HlSk687COH+Udi+BdqDCcnXDhhHloxneYGdKsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=T28Z0aQ2; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="T28Z0aQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746774182;
	bh=GLWJyeyEqgTaTvXxCBcD4bDAQeLZi6rUdn4/8rKb0dk=;
	h=From:To:Subject:Date:Message-Id;
	b=T28Z0aQ2sSsr3gnAVoCVEpfZ3+R1Sro+3+2sfUNyO+ptBhobxm2u9YyH6jniHq5tF
	 5fSkmyZRrcZJscNYf5dQo8PK3ltSJwO+lD/UIM/A6L0nLyGdhj9CY5MXiN++hNSxW8
	 krhiE7s/fE447yGUB8VJWryjqGYDrXsjpeuRzqgs=
X-QQ-mid: zesmtpsz9t1746774180tb32ae7f8
X-QQ-Originating-IP: miQ+YtuyQtnpp7cNWsmyvTgnwANw2OzXQMMVb1vnhro=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 May 2025 15:02:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9267701617921800790
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
Subject: [PATCH v2 0/2] Convert Rockchip CDN DP binding to yaml
Date: Fri,  9 May 2025 15:02:45 +0800
Message-Id: <20250509070247.868-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NSTiGhYb0MY6jyqCntWsLZPGnXrVt0/v73wxoM0i0JKF1kVAdka+5RRM
	wREFCJwUJ2Z5hCcJDfGcM6pHsRoBD7zPye1rG7u4Hz8Fs+s+dHqP1C0WsrfDVcJyyxoRoQi
	2d/RKowUb6ieyqlyUjUPRTLTBhNgSWTmgmu0m66DMre33CWGqK+NYx/FESqx72DXam+gDs7
	/5KGmCPCZnb4YkfV0J5GJYh7TCB53j8bQqwkkZyG7v0eaWMlsiV4Qz5bxWpFTnnT9rAbQDc
	qC9FfzHu+vGTDXRgUvd/w2tpZEcHQ0dTPfGUscNOhyinm2S6VMw4mXJPQtod6HezXxoUZ9F
	DKbu0YN+QQjHJw/86ZwFNH3RVxYYno8X+cfBdEiLh1vN8EWv3HC81cn9kSMIcG3HRGRnPeM
	tug3aTyWXDVWVOFrE7+z8/nR8k4Ng7hJQk1GqUReRV6osvcRff3F8dPGaQqc4JPqW+6vDcE
	lx7bSLrDQQet5GHj+hQIPUaG0lLj+lSkOtl1PrkSgGkiQFOSN0h9z/wY+AVphbv+ajcgyXm
	0g3TnH1gAD0U0IHFZV4AY2s4G1lrPS+hlzXxKjy9TKHaXkcb1Rh/oS8PwHmlc+53C+UYVit
	QMwJr+yP+RFKKCRlw9t4y200Hratzk8qJrWUqfGggpH0nxAUZA27WQe3A70pl5ddf3+FjEz
	AoFQkiWC7Arc0dX5UgUEW49iwWQhGOhyET+KxU8aeYDNGkxT2yNMM7avpAtIfLsz322xxBQ
	gTKqTcpRLc6jQhVi0Zuk2a+/qB3GJOvwwpDdOKZL0H2dX5lzH/KGHNIxnZaO1lc02WZoCOm
	1KV4QeaIXH1cj/RNGeKO35p9KsTLT8DdazNjtb+eBYB3dlIhosEciZsy7DlhWL3P0zyUh1q
	UTsYYKspKp5U/HXvd4raJqyH6Bg9b5xUmPvw3vh/oKBaT9IcTF+7E+RnXAhjfRaVjUIekw0
	XZYsMqHEAj7jOG3Y/A8PZzvJTROoqq9c9g1iNXAqdqMZ1qmPo4mPisdZ5/p67Sdw9Bzw=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250508064304.670-1-kernel@airkyi.com/
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style

Chaoyi Chen (2):
  arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
  dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 158 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 3 files changed, 167 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

--
2.49.0

