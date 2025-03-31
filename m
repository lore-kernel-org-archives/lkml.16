Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431CD1465B4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413159; cv=none; b=ot4zlbJQMIdWYn52ZQsGPoo8EozhJihogchgyCTZKYVpkSpmRqlf9t0H+Q3/YhKFJD4/A0bJ6Jn+zPNt2JWKrSSKL0qQzmTxN5E0hAv+ZZqqX1e3y/gG9NnLI1+303V7Q+UGxH4Wh3C5FJFW03eMpOxnn8ceBnHhskXLyWc7DFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413159; c=relaxed/simple;
	bh=fohpss/wNGT/gEs99DlJDYOaeDjgMuopm0PMrT3kozw=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=MqAwf4mhGYHTYAoSm9uGVfskDfXHa3RxSaqo880gISNostOg80RXl3S8Y3/h9eXzeEEecFB/C56I0K8+gmQx5CtAUL9PcGuPapj1y4udhgTQ0dCIf8LQgSfJs/GTOqwypLr+j+PPDqyN47a3JW8r9n2kYvjsrsQNIgJ0/So6Zqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZR5Ms4BDzz51SXw;
	Mon, 31 Mar 2025 17:25:45 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 52V9PVjp073794;
	Mon, 31 Mar 2025 17:25:31 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 17:25:34 +0800 (CST)
Date: Mon, 31 Mar 2025 17:25:34 +0800 (CST)
X-Zmail-TransId: 2af967ea5f8effffffffc4e-3c31b
X-Mailer: Zmail v1.0
Message-ID: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <j@jannau.net>, <liviu.dudau@arm.com>, <chunkuang.hu@kernel.org>
Cc: <fnkl.kernel@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
        <asahi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDAvNF0gUmVwbGFjZSBjdXN0b20gY29tcGFyZV9kZXYgd2l0aCBjb21wb25lbnRfY29tcGFyZV9vZiBpbiBkcm0=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52V9PVjp073794
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA5F99.002/4ZR5Ms4BDzz51SXw

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Remove the custom device comparison function compare_dev and replace it
with the existing kernel helper component_compare_of, as suggested in
the review feedback. This simplifies the code by eliminating redundant
logic and aligns with the pattern used in other DRM drivers like
hdlcd_drv.c and malidp_drv.c.

Tang Dongxing (4):
  drm: adp: Replace custom compare_dev with component_compare_of
  drm: arm: hdlcd: Replace custom compare_dev with component_compare_of
  drm: malidp: Replace custom compare_dev with component_compare_of
  drm: mediatek: Replace custom compare_dev with component_compare_of

 drivers/gpu/drm/adp/adp_drv.c          | 7 +------
 drivers/gpu/drm/arm/hdlcd_drv.c        | 7 +------
 drivers/gpu/drm/arm/malidp_drv.c       | 9 +--------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +------
 4 files changed, 4 insertions(+), 26 deletions(-)

-- 
2.25.1
