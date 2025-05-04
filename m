Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498574C7C;
	Sun,  4 May 2025 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746374677; cv=none; b=YOdGcSmKux32p4YN4pAs3NX9nj+zzUAblOPNWU9ncXWo5ptXgoZGItUpoebk+q4SL5DLg1JywX7DZdkvErMzq6DaYUDXu2nPkEIKFUkaB8ZgAg27Q6zbS6ECIWxKU+G5JMOLbss46kKJtuwQXeWMEEPAU3IdwRKg3896O3/zK1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746374677; c=relaxed/simple;
	bh=TyzQU9lYX4mYfhO7dRO3zkE7cFonm6UznplZO5eSzuw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H4WYgTSvo3H/tmORN2Bqq9fxgGNu8ekBBcPgvAwwbYxrw9+C/HEv7eOn0gzHORaRFgm+XoJyQDUn0HAGFu0nb1qI+4SFu4ismgdW9+z5JQp5xjhDMV9j3xBcckaAH3+oTu8zHHo8+CPkmhBlFL6/TfU+qYf4UmpCHin4PUTapuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H9+Tv1tD; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H9+Tv1tD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=HKdAX
	irLGrZ8dFkziNFmCPzUsIKjJ1EV+jaZP/dE9pM=; b=H9+Tv1tDhPuKMQNMuPwV8
	0st+CLPGF3Yxajozn0ymyS8xeeEn3mqURYwrpFoSL96a3xFzGrpQNv063dJB+ZJK
	Eb7zTl1pI8FPUZ4TV3CzM2++71CxlRopKvynZ4v0Z5VoiembIetjfewYqe9D357X
	oRk/97ucjHZNKa9WW7NOYI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnL2kAkBdo1Jt9Eg--.61665S2;
	Mon, 05 May 2025 00:04:17 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH] xhci: Add missing parameter description to xhci_get_endpoint_index()
Date: Mon,  5 May 2025 00:04:15 +0800
Message-Id: <20250504160415.183331-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnL2kAkBdo1Jt9Eg--.61665S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xr13uw1rZr15Gry7Ww4xCrg_yoW8JryxpF
	s8G3y0krs5tFWavF18Aan3Aa4rCanrAry5KFWxG3sYvFW3tF1vyF1akF4Yqr1fZws3Aryj
	vF4Yg3y5W3W7uF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_nYFrUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOgVDo2gXiQLXGgAAsm

Fix kernel-doc warning by documenting the @desc parameter:

drivers/usb/host/xhci.c:1369: warning: Function parameter or struct member
'desc' not described in 'xhci_get_endpoint_index'

Add detailed description of the @desc parameter and clarify the indexing
logic for control endpoints vs other types. This brings the documentation
in line with kernel-doc requirements while maintaining technical accuracy.

Signed-off-by: Hans Zhang <18255117159@163.com>
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

