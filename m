Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826614C8F;
	Mon, 19 May 2025 02:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622978; cv=none; b=FIHFQXf943Y8MAxSdQ3z9w83GY9wCKmHSvA9rhwnqvWnJxYiYpl8nKPaCdmQjQXN/uandTY56lzGj4cYYU/TksXlIEO/kg6N7IZ45fVqjQuotsuAFHcyQ3sR2jtdAFfIIlMBZGYmXxw1XEzW72VgU2nfV/9dctt1a0GYpGjsZyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622978; c=relaxed/simple;
	bh=pBaUi5ieK0ANEQLNMp3wfR7WbzIPsvzhnxLZxVu5pZ0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=sInzIN0Q2J1LVIz5nxje5lqisiE7XclSrrVj9OYLxvst1tg+CDX3kLIK8Fcv5saa2fD5h1ttwK18VYOmJDOcOSwxmNF9t+UTBtbF/W56eb97o2zQOXfDRtL+Yw67+5a6hSFp6k3vGNTAed3ssu5DTfK7DV+Rsv0Bk1FceQb8sek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=Q5aFVVYg; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="Q5aFVVYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747622930;
	bh=q/sSSvsejltScJuXpP48TQCHlwrbZHa7HU/nV26CHgY=;
	h=From:To:Subject:Date:Message-Id;
	b=Q5aFVVYgfDaFCGvcTIc30xJX5VGjeBX0TRbqp16Vdw/dsf58Fml1UyCl8YUpydGZb
	 DKXV5s2HLVqmvhDAg8fb7NdFV/sCUYLbGsNLb3vjLwxsyL2pD7oGC/79UbXmZTBbE9
	 k7RGD8fyBOqyV7D8ffy5QvleGJQVdZ8b86edq1HU=
X-QQ-mid: zesmtpgz6t1747622928t1cc315c3
X-QQ-Originating-IP: T3MnAOsWUPLbC2flLp01PBfX5yrywZTMate7vWnKhJw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 10:48:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3107093563551695927
From: Chaoyi Chen <kernel@airkyi.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Zhang Yubing <yubing.zhang@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Diederik de Haas <didi.debian@cknow.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 0/2] Convert RK3399 dp-typec phy binding to yaml
Date: Mon, 19 May 2025 10:48:18 +0800
Message-Id: <20250519024820.194-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MKzYG8XJzx27v8Wno56Jlu2s9jcvIOcQB40By9sEkJlhYg7b7t1jD4gb
	xp0HJ//8Ci+pq/rVBNpvMCjrsKbzVuFrM4F1Yd1wnjXMgUUkIIg0RJdomGT8o7sa05+U3Rh
	+6qETCkU/1Hr9vO/x1IU0naFV3UwFr/qW3yUOjaxbWorbFnpy1jj9AgU3UtssvqXmwPPEtd
	7T4VTyiwDS1se+q5uhtJplzvcjU8ypNw4e1O+OBfX+3E3qbZEjuD7KuZuiqW/gpPUz/zLAC
	VqVhRvOhTfqlKftjKFUl/2RuQsL6r7O1I0d1C8lf5rXDXtgdbXT7Vm/a0ptrnelUbDQcbw0
	T37t+edoW7GgbX9PrVesQ7o6qoXUCY+592HOA65r9Y75uld0XWvFLvV95knvf4jjPTsE8Uj
	7QPDVgkKj4SsmAmHWL66DTPkI9KdwqgHPdQMC0oJd0+C5IQ6ecZxk3btsMzOlyKBYu8txi3
	6sDhL/qhx7+BxZgL4KOVUUT/tMwi6ZmbV06wQJvADDGgmK/C6Ou8Mdkl5o83/6sLh27egen
	Cnut4INMU0uTLcvNg6Gzks0KqvMqlKJOOh1B/Rt5gnc14oJhMGb6K5jtsKh0+cJevrtLQNF
	hP4An26UVVKF98oFaIOAtu8QyzLMmD/MjN8AjLf7NjIA53lhf2rC50zjD8rW4dkGTLc0FRZ
	JD5JkCRjNg8D6s52JOpnmwS/2fKWi/v+i2wAxZVqsV3wSXNpb8zSUFV6KBRAOcTzxwotpIp
	B6aRJrSCt/lwjMqpvR521Rp9gU/q73cqu8QscfxfbjFo+GF0ffNJgtdCv2g4uBHSlXK7jsN
	OuC6XegzbrHnX26Rlex7ZuT1d3pzu5hhwHBzEgkBFotwCm9yUc7kbONyZ0cY9en8mNOuMsj
	HMmdbwydeHEBJLXsiYXEWhADvWxZG+jcBADCMsa8D+SnS+wKsdKMeSsQBL0iE2sgpxnR4nQ
	pMQKZumy+hpeYkPVCNE/v1PAHIAKH/NJb6W48HcYjXkUvJdT0a+WxPoFR
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series convert phy-rockchip-typec.txt to yaml.

PATCH1 try to remove unused "orientation-switch" property for
rk3399-eaidk-610 board.
PATCH2 try to convert phy-rockchip-typec.txt to yaml.

Chaoyi Chen (2):
  arm64: dts: rockchip: Remove unused usb phy prop for rk3399-eaidk-610
  dt-bindings: phy: Convert phy-rockchip-typec.txt to yaml

 .../bindings/phy/phy-rockchip-typec.txt       |  84 -------------
 .../phy/rockchip,rk3399-typec-phy.yaml        | 111 ++++++++++++++++++
 .../boot/dts/rockchip/rk3399-eaidk-610.dts    |   1 -
 3 files changed, 111 insertions(+), 85 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml

--
2.49.0

