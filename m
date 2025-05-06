Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01568221D8F;
	Tue,  6 May 2025 03:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746502292; cv=none; b=S5vkwbOAwTSzahr4A/0J1BgS7sVSKvHqOCFZevvdazMK3IziBN8rXDyaOVUYloqTc7H1aHw4cI9PcVJHccOVVoY8yknO2khE2vAO5eqcrZphAI4/VDChJRTfDu9azU5IY9xWb3GoJUoels2Te99mwRSF02PizQT3qntnTE2gmXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746502292; c=relaxed/simple;
	bh=Bc323uGw9bg1vSKP1bB4KaCxLYWf8Yumf+T0uu+k9iY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uw9HH4QUfkynM9S2tnUGueS2GbRDGO2GpkoROii4+uGOmDMfn5928TY5ziBz/znVOQRmiJy9duR6npqR8PhrDFlrBiuwn3ghwENGqbWAw12Ir2Taj8xJ3yKAdSItCRmgcY1bBbtenFl/rRs5amMWPwsMWk9LGyKJi7bEMicvB5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XnGfu3cB; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XnGfu3cB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=miqoq
	4cqdh1LtpHKSamdO+B4bXNZgm7fPVKTf8kCeHA=; b=XnGfu3cBMwyQ1+N3WqN2Z
	R5lJyrRUH4xhRoOxOBSdARl1o6AgUzNBnzYRZ2y2Pc2t53aw4WtnY4vy4nQC0pDa
	Xho78/M3X/9/jEZzRhA22ZAwOq1GW12FUADN+nwe19kWO8aeK+JEWrfL6QUE/8qb
	0YcXu/cESyFM8oIqW1fV+Y=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAHt3N8ghlooYTGCw--.39086S2;
	Tue, 06 May 2025 11:31:10 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2] xhci: Add missing parameter description to xhci_get_endpoint_index()
Date: Tue,  6 May 2025 11:31:01 +0800
Message-Id: <20250506033101.206180-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgAHt3N8ghlooYTGCw--.39086S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryxAr1ktw15WFW3XF4DCFg_yoW8Gr1xpF
	s8G3y0krs5JFWav3W8Aan7Aa4rCa17Ary5KFWxG3sYvrW3tF10yF12kF15tr13Zw43Aryj
	vF4UG3y5W3W7uFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_FAJUUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWxFFo2gZfjmk0AAAsu

Fix kernel-doc warning by documenting the @desc parameter:

drivers/usb/host/xhci.c:1369: warning: Function parameter or struct member 'desc' not described in 'xhci_get_endpoint_index'

Add detailed description of the @desc parameter and clarify the indexing
logic for control endpoints vs other types. This brings the documentation
in line with kernel-doc requirements while maintaining technical accuracy.

Fixes: d0e96f5a71a0 ("USB: xhci: Control transfer support.")
Signed-off-by: Hans Zhang <18255117159@163.com>
---
Changes for v2:
- Add Fixes.
---
 drivers/usb/host/xhci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 90eb491267b5..dbe6f41202ca 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1359,6 +1359,7 @@ static void xhci_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
  * xhci_get_endpoint_index - Used for passing endpoint bitmasks between the core and
  * HCDs.  Find the index for an endpoint given its descriptor.  Use the return
  * value to right shift 1 for the bitmask.
+ * @desc: USB endpoint descriptor to determine index for
  *
  * Index  = (epnum * 2) + direction - 1,
  * where direction = 0 for OUT, 1 for IN.

base-commit: ca91b9500108d4cf083a635c2e11c884d5dd20ea
-- 
2.25.1

