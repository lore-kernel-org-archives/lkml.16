Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C17EEAB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425939; cv=none; b=KhlneAun+jyzMXPRovc51AvKpbEdj4iXygYrLstu6HpbU9Hv7u69phOkXgsFZWt5S9IFrLhz9BcxqwxCsJGKXf6R9p0JVzRuq+x/YrfbtyJMIQmdJu+Gzx5twtbdpioCOJ7J13hTWy48gqF7V3NtXFdFCR8DLUJIyFpBZodp/iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425939; c=relaxed/simple;
	bh=TOWmoiV7dROcpvE8FI0qo5GdrkaDw81r/N34kGCjJtY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OjH6i7jmz2kuqN6qy+7A0VAiRHohStkpbq4l8cAzgwVGfVpj/0sT+5VN6S0/8aSdi6yrefUIJVMcodwLiu35jhnDOi/5hOGh3G0S+FHgdTKQinkxXeQTClj1YDTjo97E3kY1jfG1zbbbZx8GLPFy3rQk32zD4kcbI5zWE8lovu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrWWoK2F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrWWoK2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CBAC4CEE2;
	Wed, 23 Apr 2025 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745425939;
	bh=TOWmoiV7dROcpvE8FI0qo5GdrkaDw81r/N34kGCjJtY=;
	h=From:To:Cc:Subject:Date:From;
	b=ZrWWoK2FIyu47dEDN67BKoV+SEHzd7+JgGowrCnt5CO4JbrhU8uqabYPDlfvKPZF0
	 SQs2xCD0CzM1tM8890V0fAc2K4n94XpC/GSEzVeOsSSLMOJD//XV28HhSjx2HrsrqR
	 YRrMvqIvE0BwU4YM5UVF6LS9yGTYIMRWYkd9WmvVyYq3t1GFSLlzgU1mg1U6aI4lwn
	 S5U7Btx+YvuUPlgOQwWgRJ23kb4EdCO+pzLckbCdRi7a6bWbAuUsoMexbRc3/vyevB
	 kTKz+DcMGSD4ToIYk8BeZZE+3SI/o805BEGEbNWIR1YXQs0WziLJQ8dn60+bdrydF3
	 PafBwb7rydKAg==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: panel: himax-hx8279: avoid using an uninitialized variable
Date: Wed, 23 Apr 2025 18:32:07 +0200
Message-Id: <20250423163214.2276114-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

goa_even_valid is only initialized in one branch but not the other:

drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
  838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
  842 |         if (goa_odd_valid != goa_even_valid)
      |                              ^~~~~~~~~~~~~~

Change the initialization to set it to the value of the condition instead.

Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
index b48b350b62da..4f548430654a 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
@@ -835,8 +835,7 @@ static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
 			num_zero++;
 	}
 
-	if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
-		goa_even_valid = false;
+	goa_even_valid = (num_zero != ARRAY_SIZE(desc->goa_even_timing));
 
 	/* Programming one without the other would make no sense! */
 	if (goa_odd_valid != goa_even_valid)
-- 
2.39.5

