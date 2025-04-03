Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5526719007F;
	Thu,  3 Apr 2025 03:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743651527; cv=none; b=jxJFEITxXey0/5fRI89Big2NlS+1ii4QvYCT7UdVE6xlgd1YaCnQD1OgWgSoLaxMz3zf6GoCeXo4wGWA+tklqiGvahMfAvevb/pLvrnZx/JAHjt6jFPFgPsC7ElK+26A69++5CqqLpqjgngwJ6bWYLCG5SCG/CHUEAZrgfsmFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743651527; c=relaxed/simple;
	bh=7PzjWVgYD7s2CX1vK5oZBs0CevyDjTbe2t15DRAmKv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJu53etNQwhaUorRivF6yjNG3+wfd3nbhbyw0WSZxq5VLn7qMCxCBVHvXO/Y810DZuW76qYPI2wnjLtb2hR977M175pRRetUcOldFoeAlZRXvlYcxxW7yjn77C0t8PW6SsfKVItrFcb3FgIP3fAmeptJNiB85gewfahY5bvr3ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=a3i/XnF2; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="a3i/XnF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=DAB/c
	14Fg3o1xJJLLR/NmN5SxSatifa3mDS6AANge1g=; b=a3i/XnF2TQn2LM4jBfj4Q
	j1REz8Tf4rC6XuKVQJr/jQRLD5qJ4QjiDmTQEqgTOnMZdTpESFC5WopI7kddBYmY
	zM/GX5mNEJagda2iduhyWJ6J//s45wce4+NzVJIQaOKmgLF2CKw+pddNdGRc06cx
	GcPwY+NrQeDfpL3jCMh1cA=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHWgmNAu5n7FfDDg--.28713S6;
	Thu, 03 Apr 2025 11:38:00 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 4/9] dt-bindings: display: simple-bridge: Add ra620 compatible
Date: Thu,  3 Apr 2025 11:37:32 +0800
Message-ID: <20250403033748.245007-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403033748.245007-1-andyshrk@163.com>
References: <20250403033748.245007-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHWgmNAu5n7FfDDg--.28713S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1UZrykJrWkWr4kXry7Wrg_yoWfZwb_X3
	Z7Aw1UJr1Fqa4FgFs8Zw4xGry3Xw40krZ5Cr1jyrs7Ar4S93yDKa97X34rCr1rCF1I9Fn3
	uF1rWa9rCwsrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU89iSJUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gEkXmfuAW8v6AAAsJ

From: Andy Yan <andy.yan@rock-chips.com>

RA620 is a DP to HDMI bridge converter from RADXA, which first
found be used on ROCK 5 ITX.

This chip can be used without involving software.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v3:
- First introduced in this version.

 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 43cf4df9811a5..421f99ca42d9b 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - adi,adv7123
           - dumb-vga-dac
+          - radxa,ra620
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
-- 
2.43.0

