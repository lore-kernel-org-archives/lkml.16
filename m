Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE39A2AF19
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751573178; cv=none; b=RYAi7T7DLSrTn6q8QOWN3GMseKADMT822IXePnGB4JBtu6k7QKZLYVJudBQDbP1VT7BL1Io4xqG/u6oghr7CZavvUpel4WSiUy2KPzdsUCSuWRCxYK7iWvm2l+d815nza2r/DzvHFuHT4PPdNcvfOVSQhhs1tVlAUJzJfKIYVzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751573178; c=relaxed/simple;
	bh=SKd6ngcbSzuyPoBy9402pghcS63YIxZy5/NF3GWQKz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lumjTchsM5GMqX8dgC7NOAc4gvw5SVqU0nqw9dlG79er7T0ZoNOCo9TE0BHzHeCtGOHk15dGlu8xKqyu/diI+U+CHX2ZcDWFVknBS/mjVC9D1kCJcBU54nDCOY24D5BJPdXm9Fly7p/cK5tYJH0GdZriA8GAU63C9mmR+Um0nGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZuOdoL4l; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZuOdoL4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751573174;
	bh=SKd6ngcbSzuyPoBy9402pghcS63YIxZy5/NF3GWQKz8=;
	h=From:Date:Subject:To:Cc:From;
	b=ZuOdoL4lXk+W3koN8vS97To6DfYTUs+hGm7GjpCYkiCbQlehuDNI13OpQDzBqo83V
	 OL+fuGg3u9HswOLFZ4tCuPO9id6BdNKXhNyC6FRhAjjfCV8mp9+LlplwH+kWs6pwC6
	 6Q5moxXI9f2x/dJpSknUOresr7OnrrqsI0qpf+epj1x8bMl4v/4zUBFmR/4AZjXnU+
	 m7HGb0fSJoEApK0UYKUSpfh0e80+iOH+lXlAbH2OK7o0k4N9fIMmN94RD7T11oMrv4
	 g34x75xOV8x1ntkK1wCdGdC/v6XW14dVoa28h8wTOfoHO+4kEeR/PZP4CuVvvv8HhA
	 zS6jrE/DAxz+w==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 6803F17E0497;
	Thu,  3 Jul 2025 22:06:14 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 03 Jul 2025 23:05:45 +0300
Subject: [PATCH] drm/display: hdmi-cec-helper: Fix adapter unregistration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJjiZmgC/x2MQQqEMBAEvyJzdiAxirhfEQ+StGZAszLBZUH8u
 8FjFVRdlKGCTJ/qIsVPsnxTAVtX5OOcVrCEwtSYpjO9cRzDLuzhOWI7oHwmxcqL/DkM6K1rB2+
 Xlkp/KIp+3+N03w/uoi0YawAAAA==
X-Change-ID: 20250703-hdmi-cec-helper-unreg-fix-d9e71349c1f4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Attempting to reload a kernel module of an HDMI driver making use of the
new CEC helpers revealed a resource deallocation issue, i.e. the entries
in /dev/cec* keep growing.

Moreover, after a couple of tries the kernel crashes and the whole
system freezes:

[   47.515950] Unable to handle kernel paging request at virtual address 0020072007200778
[...]
[   47.521707] Internal error: Oops: 0000000096000004 [#1]  SMP
[...]
[   47.537597] Call trace:
[   47.537815]  klist_next+0x20/0x1b8 (P)
[   47.538152]  device_reorder_to_tail+0x74/0x120
[   47.538548]  device_reorder_to_tail+0x6c/0x120
[   47.538944]  device_pm_move_to_tail+0x78/0xd0
[   47.539334]  deferred_probe_work_func+0x9c/0x110
[   47.539747]  process_one_work+0x328/0x638
[   47.540108]  worker_thread+0x264/0x390
[   47.540445]  kthread+0x20c/0x230
[   47.540735]  ret_from_fork+0x10/0x20

Do a proper cleanup by calling cec_unregister_adapter() instead of
cec_delete_adapter() in the managed release action handler.

Fixes: 8b1a8f8b2002 ("drm/display: add CEC helpers code")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index b4273c3522fa8b4996fd02107a87acefa3a45737..3651ad0f76e0c49cc7b3a8e2148dccb1f290e95a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -69,7 +69,7 @@ static void drm_connector_hdmi_cec_adapter_unregister(struct drm_device *dev, vo
 	struct drm_connector *connector = res;
 	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
 
-	cec_delete_adapter(data->adapter);
+	cec_unregister_adapter(data->adapter);
 
 	if (data->funcs->uninit)
 		data->funcs->uninit(connector);

---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250703-hdmi-cec-helper-unreg-fix-d9e71349c1f4

