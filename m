Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9880278E7D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369920; cv=none; b=W2lH3U6AgAQZc4H5bZvZx23M8fY70bbg1tmfX6q2a0mVrIHvjeYSS3xmyvhWk/rNxIGXm3EjSHwdjntWgiTZGn7WmbHA3hinxiNtDMBvt1Rp4rbX7zsQmw6wLPL467TIhoIx8yqv//11to0B/zb7n7ZNvGuTHP30Y77Ai5BcnUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369920; c=relaxed/simple;
	bh=PwLbZDqYR00PWKR+19zXpNBlD2CpbfqU3ClM1ZnR9eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cYAI0FGg4UESnAzBukRd7uHrPUPoxXpIdn0/mzfGhuYRzEQRLH0t8mtZEnVIteCUg0nYPp3cwc+Cs31DujAsXfWCU+GQ/bpsMdiXVJmKTBbnmZn8qpAdCJ2/AMLf1xAfsyO0EKGjr9ITgt0tFsi8S7U30fBppD3Told5l00KXuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QjBiot04; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QjBiot04"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBBElL2056187
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 06:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744369874;
	bh=KUv3PKJ0NE2QBMX7XjP2F9mwfnk+UQuovzzUVGFJY7w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QjBiot04UKMGvFmt4k2sNJ1LKNKiffARtS49pD2YCi2Hqk+o3FKA1KHjo8EcWQ3U6
	 yr962v38fUl+pIamKtJyDbO0xC7vH5JkUvjhT529NSzD5CXTiNWQtGHDvH/bDwsVv9
	 OeupQxDZyfYi+kzUwmfYxZgiv5WNCK4TJ+suhwwM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBBElb087629
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 06:11:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 06:11:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 06:11:13 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BBB7gT071481;
	Fri, 11 Apr 2025 06:11:08 -0500
Message-ID: <ce7d7865-126c-4119-bcc5-1b4feae94f8c@ti.com>
Date: Fri, 11 Apr 2025 16:41:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] drm/bridge: cdns-dsi: Make it work a bit better
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jyri Sarha
	<jyri.sarha@iki.fi>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul
	<vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Andrzej Hajda
	<andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert
 Foss <rfoss@kernel.org>,
        Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej
 Skrabec <jernej.skrabec@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Aradhya Bhatia <aradhya.bhatia@linux.dev>,
        Devarsh Thakkar <devarsht@ti.com>
References: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Tomi,

On 02/04/25 19:00, Tomi Valkeinen wrote:
> While trying to get the cdns-dsi to work on Toradex's AM69 Aquila
> platform, I hit multiple issues in the driver. Basicaly nothing worked
> for with the board.
> 
> This series fixes those issues. While I itch to make much larger changes
> to the cdns-dsi driver, I opted to keep this series relatively simple to
> make the fixes more clear and possibly help with backporting.
> 
> The series also touches tidss, but those changes are not strictly
> needed, and can be merged separately. And the series also touches
> cdns-dphy, and those changes are needed.
> 
> This has been tested on Toradex AM69 Aquila, with:
> - HDMI output using lontium lt8912b
> - LVDS panel (sn65dsi84 + panel-lvds)
> 
>   Tomi
> 

I have tested this series for TI SoCs J784S4 and J721S2 as well where
we use the following pipeline:
DSS -> CDNS_DSI -> SN65DSI86 -> DisplayConnector
(https://lore.kernel.org/all/20250411105155.303657-1-j-choudhary@ti.com/)


Tested-by: Jayesh Choudhary <j-choudhary@ti.com>


> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v2:
> - Change the tidss clock adjustment from mode_fixup() to atomic_check()
> - Link to v1: https://lore.kernel.org/r/20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com
> 
> ---
> Tomi Valkeinen (18):
>        drm/tidss: Fix missing includes and struct decls
>        drm/tidss: Use the crtc_* timings when programming the HW
>        drm/tidss: Adjust the pclk based on the HW capabilities
>        phy: cdns-dphy: Store hs_clk_rate and return it
>        phy: cdns-dphy: Remove leftover code
>        drm/bridge: cdns-dsi: Adjust mode to negative syncs
>        drm/bridge: cdns-dsi: Fail if HS rate changed when validating PHY config
>        drm/bridge: cdns-dsi: Clean up cdns_dsi_mode2cfg()
>        drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
>        drm/bridge: cdns-dsi: Fix event mode
>        drm/bridge: cdns-dsi: Remove broken fifo emptying check
>        drm/bridge: cdns-dsi: Drop checks that shouldn't be in .mode_valid()
>        drm/bridge: cdns-dsi: Do not use crtc_* values
>        drm/bridge: cdns-dsi: Use videomode internally
>        drm/bridge: cdns-dsi: Tune adjusted_mode->clock according to dsi needs
>        drm/bridge: cdns-dsi: Update htotal in cdns_dsi_mode2cfg()
>        drm/bridge: cdns-dsi: Drop cdns_dsi_adjust_phy_config()
>        drm/bridge: cdns-dsi: Don't fail on MIPI_DSI_MODE_VIDEO_BURST
> 
>   drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 224 +++++++++++--------------
>   drivers/gpu/drm/tidss/tidss_crtc.c             |  25 ++-
>   drivers/gpu/drm/tidss/tidss_dispc.c            |  22 ++-
>   drivers/gpu/drm/tidss/tidss_dispc.h            |   5 +
>   drivers/gpu/drm/tidss/tidss_drv.h              |   2 +
>   drivers/gpu/drm/tidss/tidss_plane.h            |   2 +
>   drivers/gpu/drm/tidss/tidss_scale_coefs.h      |   2 +
>   drivers/phy/cadence/cdns-dphy.c                |  24 +--
>   8 files changed, 155 insertions(+), 151 deletions(-)
> ---
> base-commit: 10646ddac2917b31c985ceff0e4982c42a9c924b
> change-id: 20250320-cdns-dsi-impro-3d8fbd7848d1
> prerequisite-message-id: 20250226155228.564289-1-aradhya.bhatia@linux.dev
> prerequisite-patch-id: 46845a8d15042dd343a29a17fc0b9d0eec2605f5
> prerequisite-patch-id: 7ce82c26cb9e18884492d2282a72ff2a760aefda
> prerequisite-patch-id: ec2071425cab81da72e0805ad92fc52731d7a24d
> prerequisite-patch-id: 32cde02288e0c36ed687f67778937a61f78b2d90
> prerequisite-patch-id: 5f302e2bead8994763699a909ad0b5501f09ed9f
> prerequisite-patch-id: 30611df6ef38c7872107d6bf6dde4504d46ab224
> prerequisite-patch-id: 99831bcaa13e25b957d83a6320f34bcec223b939
> prerequisite-patch-id: b0ad38bc6b323ceea7a1d2266b0fab8deaa6b05e
> prerequisite-patch-id: 38dbce2b9302a764be9dbdc551578f02d797dfcc
> prerequisite-patch-id: 133f8b1dab4f47d429b1924df981564ce3736233
> prerequisite-patch-id: 879c546693a53e4b72c1ee25954c894ae57a441f
> prerequisite-patch-id: 3e7edc818ac078a138f0e42e3f47fd685fffb84f
> prerequisite-patch-id: 673b9f0b1936b5a49973b71cab5d13774583de38
> 
> Best regards,
