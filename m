Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6D3209F56;
	Sun,  8 Jun 2025 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425624; cv=none; b=GSvDuc7UNSwB0pMFbIjJgvDXVTe9d8zNjpLzop6ziisyn1MKlR6XBHUb4h6bw1KA5ch1kVNsJkPqmDX0hL5qw6j/nlLpTq9rhj0gJXjeA4fZKW/QblJ/A1eoT6qYhFKAAaotFoCSonPshdHxj/h7VFc0CxJKhza4VQYc4NGrSn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425624; c=relaxed/simple;
	bh=/cvVKyHzhQoI48LJcgkMrdv6qtdw4CLFdD26xKbOEl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUs2q9nxW9f5p8LrFQxeMgde0bj4VLxZCL74tk9OuHKO+imQrtVbt1K1d3MyW4N/oTkG+F8FN/PDw2fEjulULm9FuRlN2imiKmvZ4WOOiZdUy4ueOj4Qr2opcELldLnxqzAOFR9+Nhjd0CssRFvKoHxeyXeEgSBe70umbqrtkgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=qxPC5wev; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="qxPC5wev"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=P1RZtMesjHHey3Igxou9b7mtw18agArL8q30UcPKfGU=; b=qxPC5wevDeeW6+N8
	ihWwDIk+yKwxKP1b39etRXnRrAHqoTwSuvlgyaaLbopvXQbill4R1Pn2I9F9BvhCizxnMv+qRZMzN
	R4bXkFH2hXO3LmnuznJ/N+or4BNMrOmlI79vK8p7rdzK75AMcPYoaBkUEE8kkn9qEoYZiTEklblOO
	f5CkN1lTOyrDsw6H5nt0m9tgf+JsVx+brb1FwHjgnhLNN/v7nVkSs8TNwqlpjlymUpOFZZGFTklHT
	+atfG3sC0cPlzTaMPgUrxifL0mtiytPnQPL3m6ei4adZBlZlQQnUbPVVdfF8YYigd4JxDIXV3G/Kb
	hqNHt/UuMMMcr3pGrA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uOPWF-008IvT-23;
	Sun, 08 Jun 2025 23:33:39 +0000
From: linux@treblig.org
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/2] usb: gadget: config: Remove unused usb_gadget_config_buf
Date: Mon,  9 Jun 2025 00:33:37 +0100
Message-ID: <20250608233338.179894-2-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608233338.179894-1-linux@treblig.org>
References: <20250608233338.179894-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

usb_gadget_config_buf() has been unused since 2012's
commit fa06920a3ece ("usb: gadget: Remove File-backed Storage Gadget
(g_file_storage).")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/usb/gadget/config.c | 53 -------------------------------------
 include/linux/usb/gadget.h  |  4 ---
 2 files changed, 57 deletions(-)

diff --git a/drivers/usb/gadget/config.c b/drivers/usb/gadget/config.c
index 95f144a54ed9..256364d4b941 100644
--- a/drivers/usb/gadget/config.c
+++ b/drivers/usb/gadget/config.c
@@ -53,59 +53,6 @@ usb_descriptor_fillbuf(void *buf, unsigned buflen,
 }
 EXPORT_SYMBOL_GPL(usb_descriptor_fillbuf);
 
-/**
- * usb_gadget_config_buf - builts a complete configuration descriptor
- * @config: Header for the descriptor, including characteristics such
- *	as power requirements and number of interfaces.
- * @buf: Buffer for the resulting configuration descriptor.
- * @length: Length of buffer.  If this is not big enough to hold the
- *	entire configuration descriptor, an error code will be returned.
- * @desc: Null-terminated vector of pointers to the descriptors (interface,
- *	endpoint, etc) defining all functions in this device configuration.
- *
- * This copies descriptors into the response buffer, building a descriptor
- * for that configuration.  It returns the buffer length or a negative
- * status code.  The config.wTotalLength field is set to match the length
- * of the result, but other descriptor fields (including power usage and
- * interface count) must be set by the caller.
- *
- * Gadget drivers could use this when constructing a config descriptor
- * in response to USB_REQ_GET_DESCRIPTOR.  They will need to patch the
- * resulting bDescriptorType value if USB_DT_OTHER_SPEED_CONFIG is needed.
- */
-int usb_gadget_config_buf(
-	const struct usb_config_descriptor	*config,
-	void					*buf,
-	unsigned				length,
-	const struct usb_descriptor_header	**desc
-)
-{
-	struct usb_config_descriptor		*cp = buf;
-	int					len;
-
-	/* config descriptor first */
-	if (length < USB_DT_CONFIG_SIZE || !desc)
-		return -EINVAL;
-	*cp = *config;
-
-	/* then interface/endpoint/class/vendor/... */
-	len = usb_descriptor_fillbuf(USB_DT_CONFIG_SIZE + (u8 *)buf,
-			length - USB_DT_CONFIG_SIZE, desc);
-	if (len < 0)
-		return len;
-	len += USB_DT_CONFIG_SIZE;
-	if (len > 0xffff)
-		return -EINVAL;
-
-	/* patch up the config descriptor */
-	cp->bLength = USB_DT_CONFIG_SIZE;
-	cp->bDescriptorType = USB_DT_CONFIG;
-	cp->wTotalLength = cpu_to_le16(len);
-	cp->bmAttributes |= USB_CONFIG_ATT_ONE;
-	return len;
-}
-EXPORT_SYMBOL_GPL(usb_gadget_config_buf);
-
 /**
  * usb_copy_descriptors - copy a vector of USB descriptors
  * @src: null-terminated vector to copy
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index df33333650a0..0f28c5512fcb 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -860,10 +860,6 @@ container_of(str_item, struct gadget_string, item)
 int usb_descriptor_fillbuf(void *, unsigned,
 		const struct usb_descriptor_header **);
 
-/* build config descriptor from single descriptor vector */
-int usb_gadget_config_buf(const struct usb_config_descriptor *config,
-	void *buf, unsigned buflen, const struct usb_descriptor_header **desc);
-
 /* copy a NULL-terminated vector of descriptors */
 struct usb_descriptor_header **usb_copy_descriptors(
 		struct usb_descriptor_header **);
-- 
2.49.0

