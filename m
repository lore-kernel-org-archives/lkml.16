Received: from ring0.de (ring0.de [152.53.19.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4017526BD87
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.19.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739238701; cv=none; b=NDnVjtQBaliJGQuB9PTrxz/AlfzZZk4P8vtyaJ82mCgbzZUE6I0JXuZLvqXIlOnJf/7e9LfjvHWlUosS+M337fWjqf2aMtdDmW9Wzxgx2/anSsWGVAt74E3HFb3HscURNIMTjiZR7yttJsbDSAL4eBY3Kt2acltEogot2QLq3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739238701; c=relaxed/simple;
	bh=ppw3vJ1gCVcWIn5OaRlVDmg/ng4GS4+jM44pszcGFgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aB9mCkb+t1WZitNtFI0bHcRTbLmFXajbQsXx6aA0P2iYEqvkgGwkzknJjE5+4ecallweqJmYXFJr4c0WXx29PpS77mZaEgn2x0LdCGvW5rfTrOyh146pYJWlELHcQukz4aUBfI70mkqRSEwI/S9BZ4fFoNRhgzSZmk8UpTkpfKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ring0.de; spf=pass smtp.mailfrom=ring0.de; dkim=pass (1024-bit key) header.d=ring0.de header.i=@ring0.de header.b=Oz4xsojw; arc=none smtp.client-ip=152.53.19.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ring0.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ring0.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ring0.de header.i=@ring0.de header.b="Oz4xsojw"
From: Sebastian Reichel <sre@ring0.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ring0.de; s=dkim;
	t=1739238226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8yk01hIdDoOTB8pd782zVymNxuGWbUdglBo6acGQyJ0=;
	b=Oz4xsojwF8SPQ0OlIBurNyBTUWhIy4hoOQbDDGNKvOsmpbiT3m+0cvnSwQ9lH5iXhJtE8H
	d6rOTiSqHv92PTeXPy1fEcdQsLUw/AEV+CdfkRFvrjSGaU6Eub9VkRL2lLBBtZ5wNm9E1a
	SZwoGawvKQvrX2jkW5imlpA57z8sb3U=
Authentication-Results: ring0.de;
	auth=pass smtp.mailfrom=sre@ring0.de
To: Douglas Anderson <dianders@chromium.org>
Cc: Sebastian Reichel <sre@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/edp-panel: Add panel used by T14s Gen6 Snapdragon
Date: Tue, 11 Feb 2025 02:41:01 +0100
Message-ID: <20250211014314.94429-1-sre@ring0.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:39351, ipnet:193.32.248.0/24, country:SE];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	DKIM_SIGNED(0.00)[ring0.de:s=dkim];
	NEURAL_SPAM(0.00)[0.828];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	IS_LOCAL_DOMAIN_E(0.00)[ring0.de];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	IS_LOCAL_DOMAIN_H(0.00)[ring0.de]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: DB156E2E26
X-Rspamd-Server: antispam
X-Spamd-Bar: -

From: Sebastian Reichel <sre@kernel.org>

The Lenovo Thinkpad T14s Gen6 Snapdragon is currently sold with three
different panel versions: OLED, Low Power IPS or IPS with Touchscreen.

My Low Power IPS version had this panel and the kernel complained
about not knowing any details.  I don't have any panel documentation,
but as far as I can see the same timings for the already supported
CSO panel also work for this one.

The raw EDID is:

00 ff ff ff ff ff ff 00 0e 6f 13 14 00 00 00 00
00 1e 01 04 a5 1e 13 78 03 82 53 a4 55 4d 9b 24
0d 51 55 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
36 00 2e bd 10 00 00 18 00 00 00 fd 00 30 3c 4a
4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fe
00 4d 4e 45 30 30 37 4a 41 31 2d 32 0a 20 00 8b

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
Hi,

I'm running my kernels on the laptop as a daily driver with this patch
for ca. 3 weeks now and haven't noticed any problems. In case they have
better documentation I added some people in Cc, that have send patches
for the T14s DT and thus should have at least one of them.

Greetings,

-- Sebastian
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f8511fe5fb0d..7af65fb69075 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1951,6 +1951,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
 
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_p2e200, "MNC207QS1-1"),
+	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1413, &delay_200_500_e50_p2e200, "MNE007JA1-2"),
 
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
-- 
2.47.2

