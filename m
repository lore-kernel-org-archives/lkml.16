Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3928B221577
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715647; cv=none; b=qRbEiKHRcGSaBgXZUvNQmk32CX7e23AgEcDYPvxs+6i8txKYEarFJf+v8vbOi9P9Lx6O9s+zOjpH0R1iQoDTONNJI/5QpV8svz6f730pbFE4wRrC/pNYBXZ150Tt7nCv9lsVG0jhFWEGUt+Jayw+FdV6SPtOEOLD5qDEdoI4ypI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715647; c=relaxed/simple;
	bh=3AKwHvukcx/JX+AVXfNn8t45IMh9ZAc/fb4/FKVLIvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lzx8LnsHoLVYrzUQfyUO9uLLvjJGnaZVtDPS9JsDDmBuXh6MYuQejgB2w2ghaKZAjunBGD06WK7K4qyB4hu9XBQSacoSKPdj0JLneI+Qwkd3Ljo+saRaG9x0APysYTqR8RJ/BHksgzgDdeCiFiRCAcbIAlUazo5pCLiNP70AVFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zlxOw0od; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zlxOw0od"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d7b50815so4770535e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749715642; x=1750320442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tga5kXKog5STsi2U/YLSW8/VY0xp1yr5sCcYg0G1v8=;
        b=zlxOw0odVoNpd/c/mVfTwPolpiMR2dyB8kWOI9A47dSKHcrM/XJU9TQyzOZ8GLzdeb
         Ej38leydFFj7VPaiFBX9XfKs8ygqCqJfewKT55PoFM3hoQ3r+64Spu+I6U/erLvT+RSD
         pVSy/36uA5tcbrKqfHi+fiXe3LxXR1RQMUHWBHIsk0EaekhW8+0X9xr65Q7djPt7e3A4
         bx3a6dvBhjeNzPVPqp4Li4QWjwgbKPjFdO3w2UNSNKYlXFRylrUDzvsVe5g6dRw5un4Y
         8r1jnA+xlcsBh1cBYQ3PNXE0/Mybn+GHt9DAgXfNWSCx+FFGx5ZkPq1ZjWXplfHTSxjD
         P+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715642; x=1750320442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tga5kXKog5STsi2U/YLSW8/VY0xp1yr5sCcYg0G1v8=;
        b=Wq4zSaQGICSn9s8+VgR2mDDrh7yabz0JiqrWHMZCfVeXde/r8jC4+Cs1BpOtImP6bY
         SSyeV3NKwHtv58+cRZj71Hhi3fJ5NCxzJOm77ZZqooZ2IOBupJdwRU7DGS5iuHu/C/an
         OVqr9UuN5L3yTo+GxhgIOqUlcGZt2Z0Hrhmvz9L1wNujrcMDpePZ08kCOSpu1WBexU3E
         v5rlilnUiSS5Mye5aHohr5NLwega3BqkfbFuwfcqJq6Ei1LlM6Jf2mqogcVOT5nt5lVd
         Ae2cLbii73+D6E/Dm7tURt2Q48FYABzCClBXsqdvY1DuIQHjqeOrW4T7TAjZ9BOi2LKq
         s9vw==
X-Forwarded-Encrypted: i=1; AJvYcCXSLpPKIOKMmO50dWvOBi96trgVTLX/bDqJohN51BLGRsIiY0fWW3VY2pilBHONqCaPN0e0QVMI7INIxtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQtgfff1I0wQMDpoWHwihjRl1UtxaxCo2diQGbT3rP3pgWwhm
	gh87resMxTYkIVIs6fn5tAep/VJRp6dP0YECuaLp7/svijycTAQC7uyB7KnYPjKVl54=
X-Gm-Gg: ASbGncuIWeh1gT/erB6B51kr41pR8Be6js2sJ5NkwOCi7vFu0sytYx3GberEpQdJJAg
	IxHdPaUOsLA1Kxn+ROL195d/c5Oy0Yk2p9+9DWH8zxP11PGRqUqj+zBOr+f/NEWI0fKy/nrQKgs
	RnLDx14z66KfoC/YpwEbpymDdHUQt3OKXXDAhPFbJRTlSBcFZtgMlOmpEJB45KH7ZdOhqS0ICNr
	lHrtV+pLubUqEZ4F6NR+0gZOecHCJvkDqeN+C9mEa3DXFV9/pNdBcok31oisJ4+s2b7FGRwhI/I
	Sw9tnbWZCZECdBCUFWR4YBjIktFvBjrio6Kf/Qcf4dC6lJukWst6t6fk98epeA0V5mMuirzrGgY
	joJZyLlI6r2Kd4nrnKnNBbrW/2l+1rXgmbQ==
X-Google-Smtp-Source: AGHT+IGi8depLrW96CcJU0uRrvbrEU4gok7h37OKmMA8t4OWkN4ZZoaRU8i1KOq64JiXsTwP2m2gxw==
X-Received: by 2002:a05:600c:34d4:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-4532b8aaa17mr27481535e9.8.1749715642554;
        Thu, 12 Jun 2025 01:07:22 -0700 (PDT)
Received: from [127.0.0.1] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm12942335e9.7.2025.06.12.01.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:07:21 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 12 Jun 2025 09:07:16 +0100
Subject: [PATCH 2/2] media: qcom: camss: vfe: Fix registration sequencing
 bug
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-linux-next-25-05-30-daily-reviews-v1-2-88ba033a9a03@linaro.org>
References: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
In-Reply-To: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=3AKwHvukcx/JX+AVXfNn8t45IMh9ZAc/fb4/FKVLIvI=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoSoq1LAqAgp2RAhkUMDiJcKN5qouq8aHwbWkiH
 qWwJfiwD9GJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaEqKtQAKCRAicTuzoY3I
 OvV3D/4yYMwD3YFyav7NzLxt1OaaKzk4NRe9tUCyz0297KH2g0BjtvuLYrizQcOli4cDCNp5iR0
 j+vM7J32BwbxVYlTm6nLnEIBxHBPEkd5yg5HvqBMxnX4NNobVZkmbM8d1JgajvmPu5xcGPlOWVJ
 FzA62MCeZrWsW89CL7nCWKbaT+THz1dUVUfFSC4Im7rpzYek9SUstOl36ClokghocC1xM/ZpM10
 E9fZ122eQuEc4xlrvYWnrr95zZCd7sx9cqgklloGgWB5NImlZc1Xd2H7SYqV7w9hNXYpZYK5oWo
 xnzLVAlL+A31pI8U3PSerwOIcoYdGLCxUjiFKWPWpb74PZZWYFwDrWXDgHq+ECisHT9FPOrHwoF
 Td0nzyb+e038A8L0lAZgZZ3xWW4V2BBgOR3jkDcEglxgipp3xc162fskvPf6DW39BvHiFQquxLc
 /y0TAuK6U1iL619Gb/zH/JCp5HmtUHXJ93M4dl3Q/TC62rviD/q2/t8FFH//U+eOFZlmJudHLQB
 aWdE6z/93VkvEjHryvlYxywQifTpaA4N2vVYGxUbwkuf1CCbzY1pqlZYp5NrYoNVc9DBUZmzqqP
 nJxd6v+AAn6MWPEbsdMNe8QqgWjRdFm4S0i8vnDqZwmx3LXaEh0gNzwctKDDmiXR68Ktp82rNC5
 mMr0ExJ4IgLKahA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

msm_vfe_register_entities loops through each Raw Data Interface input line.
For each loop we add video device with its associated pads.

Once a single /dev/video0 node has been populated it is possible for
camss_find_sensor_pad to run. This routine scans through a list of media
entities taking a pointer pad = media_entity->pad[0] and assuming that
pointer is always valid.

It is possible for both the enumeration loop in msm_vfe_register_entities()
and a call from user-space to run concurrently.

Adding some deliberate sleep code into the loop in
msm_vfe_register_entities() and constructing a user-space program to open
every /dev/videoX node in a tight continuous loop, quickly shows the
following error.

[  691.074558] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000030
[  691.074933] Call trace:
[  691.074935]  camss_find_sensor_pad+0x74/0x114 [qcom_camss] (P)
[  691.074946]  camss_get_pixel_clock+0x18/0x64 [qcom_camss]
[  691.074956]  vfe_get+0xc0/0x54c [qcom_camss]
[  691.074968]  vfe_set_power+0x58/0xf4c [qcom_camss]
[  691.074978]  pipeline_pm_power_one+0x124/0x140 [videodev]
[  691.074986]  pipeline_pm_power+0x70/0x100 [videodev]
[  691.074992]  v4l2_pipeline_pm_use+0x54/0x90 [videodev]
[  691.074998]  v4l2_pipeline_pm_get+0x14/0x20 [videodev]
[  691.075005]  video_open+0x74/0xe0 [qcom_camss]
[  691.075014]  v4l2_open+0xa8/0x124 [videodev]
[  691.075021]  chrdev_open+0xb0/0x21c
[  691.075031]  do_dentry_open+0x138/0x4c4
[  691.075040]  vfs_open+0x2c/0xe8
[  691.075044]  path_openat+0x6f0/0x10a0
[  691.075050]  do_filp_open+0xa8/0x164
[  691.075054]  do_sys_openat2+0x94/0x104
[  691.075058]  __arm64_sys_openat+0x64/0xc0
[  691.075061]  invoke_syscall+0x48/0x104
[  691.075069]  el0_svc_common.constprop.0+0x40/0xe0
[  691.075075]  do_el0_svc+0x1c/0x28
[  691.075080]  el0_svc+0x30/0xcc
[  691.075085]  el0t_64_sync_handler+0x10c/0x138
[  691.075088]  el0t_64_sync+0x198/0x19c

Taking the vfe->power_lock is not possible since
v4l2_device_register_subdev takes the mdev->graph_lock. Later on fops->open
takes the mdev->graph_lock followed by vfe_get() -> taking vfe->power_lock.

Introduce a simple enumeration_complete bool which is false initially and
only set true once in our init routine after we complete enumeration.

If user-space tries to interact with the VFE before complete enumeration it
will receive -EAGAIN.

Cc: stable@vger.kernel.org
Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/all/Zwjw6XfVWcufMlqM@hovoldconsulting.com
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index ac3a9579e3e6910eee8c1ec11c4fff6e1bc94443..3fccc83ebbcc84c20e17da72c359de3dfd18fb40 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1062,6 +1062,9 @@ int vfe_get(struct vfe_device *vfe)
 {
 	int ret;
 
+	if (!vfe->enumeration_complete)
+		return -EAGAIN;
+
 	mutex_lock(&vfe->power_lock);
 
 	if (vfe->power_count == 0) {
@@ -1122,6 +1125,9 @@ int vfe_get(struct vfe_device *vfe)
  */
 void vfe_put(struct vfe_device *vfe)
 {
+	if (!vfe->enumeration_complete)
+		return;
+
 	mutex_lock(&vfe->power_lock);
 
 	if (vfe->power_count == 0) {
@@ -2091,6 +2097,8 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		}
 	}
 
+	vfe->enumeration_complete = true;
+
 	return 0;
 
 error_link:
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 614e932c33da78e02e0800ce6534af7b14822f83..33b59dcfc8b2b81e896336b079a41eba603ec400 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -169,6 +169,7 @@ struct vfe_device {
 	struct camss_video_ops video_ops;
 	struct device *genpd;
 	struct device_link *genpd_link;
+	bool enumeration_complete;
 };
 
 struct camss_subdev_resources;

-- 
2.49.0

