Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB90420B814;
	Mon,  3 Feb 2025 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603177; cv=none; b=oAP0DXVi++IZibLdEuiqvEI7cCo3ZoWdcDDAlEZklKacp87RBcIvA+R5ffrg2IC141yQ48J+rKf9q8VXTQh4OJLplhxLtafefyWSj0SdxreyeUCbVPqlSc3o7Tl7q2txH2gPP3cV6qGLPsiJud9Sk4cAaHgr5+0JUXXVywYpmTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603177; c=relaxed/simple;
	bh=5ePCDsb1bAP/jNuRJMfVI3ZCEU/mC/+hPJaIbtgjCxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IklaRflLkt5Yzpv8tgJIKJpXtx+s+DSnzeK4Aosv78MAwtY7mi2nn7ycZgfi4tesqf0O3pXYl+7v4U0b6pMZP99TXkHuAb23A6SiHVuZal04/LlRQ68ToCANH8EVQZEAX22YfDzy2AsXdlMTjAibdVboNqt3MEwz69udaiSmiMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QnMyC7jE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QnMyC7jE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738603173;
	bh=5ePCDsb1bAP/jNuRJMfVI3ZCEU/mC/+hPJaIbtgjCxE=;
	h=From:To:Cc:Subject:Date:From;
	b=QnMyC7jEtXz9PjgfXLoqF7VIO8wrBcTFADIGNXd61AJkiYzCyxjFT4b9dAddVLYOM
	 SO1bStZOV5xiXwXDojtG/AclRbI66ECkQoKw4kZKNT75lLcGielPu1ESxWA48X2X2y
	 Zkmv7MeVuvcuK9xHPVbNHxzrjmdsmD0wjcjZhcB5zMofMg1ZZh7tcBmib3TDWdMTUo
	 zvzakJ0y6tJ5xpAHb9CEWU8Zb8623yJ0KjzYIOjdC830X18li0VOyMusYukbaUdeFe
	 eUM3uz6ITrDi8U2ibnRfOGNSY++kv2yX9cu90VwGnXQnTE6hXtkn8/zLBiGcyJGzQs
	 tt8ZaQRL414zg==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99BA817E0CED;
	Mon,  3 Feb 2025 18:19:29 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Algea Cao <algea.cao@rock-chips.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v5 0/3] Add HDMI audio on the rk3588 SoC
Date: Mon,  3 Feb 2025 12:16:30 -0500
Message-ID: <20250203171925.126309-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support HDMI audio on the rk3588 based devices, the generic HDMI
Codec framework is used in the dw-hdmi-qp DRM bridge driver.

The implementation is mainly based on the downstream driver, ported to the
generic HDMI Codec framework [1] recently merged in the master branch.
The parameters computation has been kept as is and the data stored in the
dw_hdmi_qp struct as been cleaned up.

The table for the N values has been edited to reflect N recommended values
as well as CTS recommended values.

The downstream kernel also implements a machine driver for HDMI audio but
it is doing exactly what the simple-audio-card driver does, so use that
instead in the RK3588 SoC device tree.

Based on Linus' master branch.

[1]: https://lore.kernel.org/all/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/

Changes since v4:
 - Moved hdmi0_audio node the rk3588-base.dtsi
 - Enable hdmi0_audio in rk3588-rock-5b.dts

Changes since v3:
 - Renamed function to start with dw_hdmi_qp

Changes since v2:
 - Also clear the audio infoframe
 - Write AUDI_CONTENTS0 to its default value in case it gets overwritten.
 - Store tmds_char_rate in the dw_hdmi_qp struct in atomic_enable
 - Clear tmds_char_rate in atomic_disable and only write registers when
   tmds_char_rate is not 0.
 - Do not use connector_state duplicates

Changes since v1:
 - Remove useless audio_mutex (was used downstream for multiple drivers access
   to audio functions)
 - Let hdmi_codec build and setup audio infoframes
 - Only access audio registers when connector is connected
 - Rebased on master branch


Detlev Casanova (2):
  arm64: dts: rockchip: Add HDMI0 audio output for rk3588 SoC
  arm64: dts: rockchip: Enable HDMI0 audio output for Rock 5B

Sugar Zhang (1):
  drm/bridge: synopsys: Add audio support for dw-hdmi-qp

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  17 +
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |   8 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 497 ++++++++++++++++++
 3 files changed, 522 insertions(+)

-- 
2.48.1

