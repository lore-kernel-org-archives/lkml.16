Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE501F4E59;
	Tue, 22 Apr 2025 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303686; cv=none; b=Uh0ktuAMv/VEt5b+ezWtFwiDIHpzZmuJw7HoVJrgreeKKu8OxkKwFHZmiRh8ecM0yxZrCgrV7Pr05AdGrQaod3qlPC95B+3dASJ7pdhAFTMC1LqfOTZ0HKeXgEuIaf0OwcOPlAchs3ajNv2FCyRc2co4AI04sgE/K1DWBui0QiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303686; c=relaxed/simple;
	bh=JmWei4l7lz4o6cL+p+ipmgk1XVBbw67QcTJhUS+A0Mc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c5Wg7h+C2rGJZkE9ubHfBhD9Iy6tPh4Iy/n5+aWvu/WnW+ooulo5FT3Zlx256EedJZECq9zU6y++8kh9p0H3lzQXRGClwbbeJxKAMfCBNKmdkoo0bCxQMn1Oh9AsGu9jD4L1t7bBMCKBGYAJyzRhZKk08jSWbo1PZ+bAiTkXeLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CmeyMm2d; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CmeyMm2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=IYN9Q
	s58I4Vqu/JlMsD4Ruol4GYfkyWwUO6goo/h3SA=; b=CmeyMm2dwunsc1EAStZP0
	qC7em9NgXBcnQKJh5165MLlW22JUOwoqg8+vZ0Kk34vQhd/ibXt/2+2OF9Uw3+j1
	ezoIOMPpv+D0BN9hjJPY06feAmVGEBNsjB9XAy5JltEYsvwDxZnlzf0cfFIe14fR
	dVxhTEkoMr2d6P33E0xudk=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCXQ3dlOAdoOBRXBg--.17896S2;
	Tue, 22 Apr 2025 14:34:15 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: skhan@linuxfoundation.org
Cc: gregkh@linuxfoundation.org,
	i@zenithal.me,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	shuah@kernel.org,
	valentina.manea.m@gmail.com,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
Date: Tue, 22 Apr 2025 14:34:09 +0800
Message-Id: <20250422063409.607859-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
References: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXQ3dlOAdoOBRXBg--.17896S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFy8trWrWryxWr43tF1DZFb_yoW3urc_Cw
	43uF4kWFs0k3Z0kw1v9ry5trZ8K3yDuF9YqF1DKF4FqasFyw1fA3yUX393KFWDZr1xtFn8
	GwnFqrn5ZF18WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8yUDJUUUUU==
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbi7h43q2gHNktCUgAAsu

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

fix usb device limited  max_sectors when use usbip protocol

Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 drivers/usb/usbip/vhci_hcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index e70fba9f55d6..fca3a4a6e94d 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1345,6 +1345,9 @@ static int vhci_hcd_probe(struct platform_device *pdev)
 
 	usbip_dbg_vhci_hc("name %s id %d\n", pdev->name, pdev->id);
 
+	/* Set the dma mask to support 64bit for vhci-hcd driver. */
+	dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
+
 	/*
 	 * Allocate and initialize hcd.
 	 * Our private data is also allocated automatically.
-- 
2.34.1

