Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89F6230D01;
	Fri, 16 May 2025 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389176; cv=none; b=Lbb+GSDmaPeeT4F5Wo6e1YcnzuxU/z2jGjja4DmO5FufhejN5VJTwhif6x2Kn7Sv21qhch05QK5TxFR1if9zBfeqZukmohJMLiaXr0t1mQXz9Bm3eSEieI+Z4y4B6ZATbC/TkGl9N4+/I8O0PDiD5LcsSdG5FA05et8Oa1sVCx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389176; c=relaxed/simple;
	bh=2YvD/IjOEk0LmEPjsc7gRx14VlDeI6fFNp6n6M5+kcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QcyTk8/AeFForpzyia+ItHllCGrFuoGLIpNFQOahT2QLlnsjI8tbHHTO84u04qdXfaxHWT7B2CkfhvTZ16XgfQv/owOBbbSNXw8vA+OUngTGGdDhTrz8eeUgVyPQh62ze6GCbS+I9qMJ+Fg3yCeSE8ZsKfUr0bZG8+hWy6fna3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0004758DT.eswin.cn (unknown [10.12.96.83])
	by app1 (Coremail) with SMTP id TAJkCgDn_Q7oCidoz8x8AA--.60601S2;
	Fri, 16 May 2025 17:52:42 +0800 (CST)
From: zhangsenchuan@eswincomputing.com
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	p.zabel@pengutronix.de
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	yangwei1@eswincomputing.com,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>
Subject: [PATCH v1 0/2] Add driver support for Eswin eic7700 SoC Usb controller
Date: Fri, 16 May 2025 17:52:37 +0800
Message-ID: <20250516095237.1516-1-zhangsenchuan@eswincomputing.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgDn_Q7oCidoz8x8AA--.60601S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF13ZFW3Zry7XFy3Zr4Dtwb_yoWkJwc_Cr
	1kurWDGw1UCFWjyFWjyrZ29rWjka1UXryxWF4ktr15u3yIq3y5Xry0y34UXF18AF43Xr9r
	Wrs5KFZ7ZryxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbhkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6a0QUUUUU=
X-CM-SenderInfo: x2kd0wpvhquxxxdqqvxvzl0uprps33xlqjhudrp/

From: Senchuan Zhang <zhangsenchuan@eswincomputing.com>

     Support for the Eswin eic7700 Usb driver control program has been
    added to the Linux kernel, which is part of the Eswin SoC family.

    Features:
     Implements support for the Eswin eic7700 SoC Usb controller,
    which is responsible for identifying,configuring and connecting
    usb devices,and provides interfaces for accessing these devices.

    Supported chips:
     Eswin eic7700 series SoC.

    Test:
     Tested this patch on the Sifive HiFive Premier P550 (which uses
    the eic7700 SoC),The driver was tested to be normal through a usb
    peripheral.


Senchuan Zhang (2):
  dt-bindings: usb: Add Eswin EIC7700 Usb controller
  usb: dwc3: eic7700: Add EIC7700 usb driver

 .../bindings/usb/eswin,eic7700-usb.yaml       | 120 ++++
 drivers/usb/dwc3/Kconfig                      |  11 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-eic7700.c               | 605 ++++++++++++++++++
 4 files changed, 737 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-eic7700.c

--
2.25.1

