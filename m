Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC766267F6A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842253; cv=none; b=e4HgJEVwPA0y1UBF51yKwNCc/VG0UzlmkjppljFyzXlfqOI50Tai2PeU+1uLyG5zRoyq6JZqoU36tN2c1VfCOhNy3i9Ebx28vFPNBBrheheQnTQl9AjvOX6lxls9RnOXx1LAp6StQuegsQJE2Y9y8yqAZJx5iFiDPolKPYhS/TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842253; c=relaxed/simple;
	bh=ciDUO+ZfgBJWhR8Wy8ySlqBr5GQZDATAmzWc5PieIvU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iSqi2ANmZa48Thqa3RiD3BmGUwGX/y9nIcap01DIXgtN69un0N9RylUYUdT6ZuXo1KqMZQuHDJtRLG3FFMPoLpnVj5yWEjTLPwm40ovY/OsZRg4SaJ7j+QRbb7jNksc2EH7AQunssTldY/3AQawvGoRKlNYQDAiTQ5siloempUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DW2mwWgC; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DW2mwWgC"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SCAVxa3394001
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 07:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745842231;
	bh=iW5UthSAfG9p2EdnrYC7wnlYQMDTwki3KWY3AVQ73rw=;
	h=From:To:CC:Subject:Date;
	b=DW2mwWgCofB8UDX4P/StHrHIWtrlaYuiopuAqMrL4ymHk31pf0DEh5jJc+UMt9BvY
	 faIGw17oENK7ictZxlUojtYJOOVhFeND4M/eirOV6FGuq8B4Wg4MXK60IdCzKk3Cj1
	 ntFrdEdCUxYxLN3BgiV6PcuLKawQ1lPYoRziriMQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SCAVff040847
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 07:10:31 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 07:10:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 07:10:30 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SCAUnv019741;
	Mon, 28 Apr 2025 07:10:30 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 53SCATbu027172;
	Mon, 28 Apr 2025 07:10:29 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <quic_tdas@quicinc.com>,
        <nfraprado@collabora.com>, <arnd@arndb.de>, <lumag@kernel.org>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <bjorn.andersson@oss.qualcomm.com>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>,
        <m-malladi@ti.com>
Subject: [PATCH] arm64: defconfig: Enable XDP socket support for high-performance networking
Date: Mon, 28 Apr 2025 17:40:25 +0530
Message-ID: <20250428121025.246119-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: MD Danish Anwar <danishanwar@ti.com>

Enable CONFIG_XDP_SOCKETS to allow for eXpress Data Path (XDP) socket
support specifically on TI SoC platforms such as the AM64x and AM65x.
This enables the use of XDP sockets for high-performance, low-latency
networking applications, allowing for efficient processing of network
packets and improved overall system performance.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9e16b494ab0e..5c3abd51074d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -130,6 +130,7 @@ CONFIG_MEMORY_FAILURE=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
+CONFIG_XDP_SOCKETS=y
 CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y

base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
-- 
2.43.0

