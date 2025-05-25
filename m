Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4981D47B4
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748166956; cv=none; b=iiMlbyHQE634PByD18duRIgkLaY3gakV3scdgx99sJUY5I7Irmm2/KZvvLzLrSYgNU62TaEy7xXBt6v8e0IdPs3ZIh/h2VAlbJNPnvGfqx8vIJeXMwPt1YU8KcB3v5Ocp60GgFhAG0qT02Y9Y5Ifp9oUT4D5Y1YNPLXI7OD/8ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748166956; c=relaxed/simple;
	bh=NQP7jqFUEh4B5N7CPMMbSmLmin4zYEpjxuKWftdQM3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nuT+uXxciNQFX3E0/Jl4nv+TnfIyNYatfGaAFc2yYbKAuTZekraMYIfq2lWMFFfN7PJ0tP1NeHzDypWy0IpFvr8alaCE9fkU06I/eKHRim3PGTcyAOlIvj3iSnMPpGWoosUeLZn3W999+p+/y41BVdsfvUKVWTJ/yAgczh4O/6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=pwoYNqk3; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="pwoYNqk3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1748166951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrfySnnJmJf8OR0WcIjvlJn/uez+04v8Z2OdLalAhPE=;
	b=pwoYNqk3SKEZYb8xaXXifHMpsKCZv9lOGhdaapKJt0RKxp9JiE9iBaQt2Gj5leL7jWhniw
	WfT4kOeNCTjxTZlWtaA4dj/M5g9Ab/ALWdRIdaPnt5uyLYaG4jClSmZfHIivFTzQAX558l
	xWbAis92MJNKTQcTVtzeOVguQvb15HYRnZ5gOSOtpUJMq+zSZHLlLaQi1ji2wMgCQAAs2k
	IefmJ4ch/khK8iwkGczex3FLekWbWouOdVggWHwwzqZQnwq/bI+EBoca85sv6H0pJvFv1/
	CTGFOhsv2WI6I9dD7y7CyVnsbj/aU0nF4xv6OkGjwLyzHazqLRFtIcecmGWksw==
From: Val Packett <val@packett.cool>
To: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Val Packett <val@packett.cool>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/panel-edp: Add BOE NE14QDM panel for Dell Latitude 7455
Date: Sun, 25 May 2025 06:53:36 -0300
Message-ID: <20250525095341.12462-6-val@packett.cool>
In-Reply-To: <20250525095341.12462-2-val@packett.cool>
References: <20250525095341.12462-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Cannot confirm which variant exactly it is, as the EDID alphanumeric data
contains '0RGNR' <0x80> 'NE14QDM' and ends there; but it's 60 Hz and with
touch.

I do not have access to datasheets for these panels, so the timing is
a guess that was tested to work fine on this laptop.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 90e8c154a978..ec7c1e21f2d2 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1937,6 +1937,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b1e, &delay_200_500_e80, "NE140QDM-N6A"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
-- 
2.49.0

