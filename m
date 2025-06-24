Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690952E62A1;
	Tue, 24 Jun 2025 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776224; cv=none; b=a3Pff/isyShgm+BNDhLix6AFjw++udjnkbZQy+Nw/72AYmm45eV9LKQia3BCHktnTCWv+yoBEYHYlPXd0ZC1aYPJK2NkwLgaKAqxivK98wf79SMc2J5b4QurngEvQypRVmOW76mNiOXpZyMjkFE97RDUok/EjqsGj99dTm7PNLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776224; c=relaxed/simple;
	bh=Y7BP8KdPd8H6cxd2c8dwNisTp7TEPtBxOSdosnEuTr8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jTcSBzOet8qWeFh2bHH4TxG1NpzZ3o7cPGTxTpAoplkXITvjOdeZK3q3wkESEOS+vslYOyGh/aCYqZWuvpJ4qzN37zghlMmzdp+5iWnfa4iFZ2NOHvIcOjCRFn1ZlhOV54JPgHfI87dRxgboIuWH1L5OqGKpgiAs3U0Q+CQBWys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=S3y6qg2Y; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="S3y6qg2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750776196; x=1751380996; i=markus.elfring@web.de;
	bh=slW1HY6NogLYGpkBA3UndyleR92HTWdOgcZcNz1CxfI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=S3y6qg2YxQOAz4en194ljaCRjuxyoyAkS/MvRk/bPNjjCho0wCppuruhe09MS31q
	 0CMp+nYPuPvdfcQ2v1cnuFmKz1BIrBSkQbk4izL9JAMXzHOyEQuaZsDxU+ww7VMkC
	 j/rdygfiv7QUjphvS+hHKP5kx2EyMXC+Wf3sL8a7hm4mYcm2reif/tX6BJwUDGBJm
	 SXdhoGWqTX8Qn3GVGha5+Mup9dahy+tbC7kaDB/JykmVbSWjXFEyBjtxHNOqHlC7H
	 +JxWWMMbFfGT8tfUl4tOUuo7PFIj2ogDawhctLkPuZpwwg9cF8hcKLmjsCrRzncEv
	 RjXGxcu5KA3ARjCA7Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.200]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MWi5i-1uEggu28gy-00Q4GN; Tue, 24
 Jun 2025 16:43:16 +0200
Message-ID: <b4544835-2cac-4501-bcf4-6f105e3667d4@web.de>
Date: Tue, 24 Jun 2025 16:43:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Al Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Yan Zhen <yanzhen@vivo.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Chen Ni <nichen@iscas.ac.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: gadget: fsl: Use usb_endpoint_type() rather than
 duplicating its implementation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I7qV3JknpoGbkjG1a5NsvY0sDnSX3fJTGBJC1TXjonrd3RCs2Zw
 cgUYPHMBS312n6EAGFi+WxAGdCU8b/AI9G7I1f6f1tuAS4GPbJf9Zn3XWmiY8qKVYzl+2PK
 3uTr6yXTta/Fv3xqoGqaGkiAiaTgv9kRBS1BfrW7exkDhhJWEQQGVZnjZc84HSzczaYc1m/
 kCE/33R8XfEtc8b3YOwwg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:njaM1S0s3ZE=;/vbP6Fd1kSwSsr0GwcvLAImMc0p
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Jun 2025 16:33:53 +0200

Reuse existing functionality from usb_endpoint_type() instead of keeping
duplicate source code.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/gadget/udc/fsl_qe_udc.c   | 4 ++--
 drivers/usb/gadget/udc/fsl_udc_core.c | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/=
fsl_qe_udc.c
index aacfde06387c..6ee3da32cc4e 100644
=2D-- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -533,7 +533,7 @@ static int qe_ep_init(struct qe_udc *udc,
 	/* Refer to USB2.0 spec table 9-13,
 	*/
 	if (pipe_num !=3D 0) {
-		switch (desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) {
+		switch (usb_endpoint_type(desc)) {
 		case USB_ENDPOINT_XFER_BULK:
 			if (strstr(ep->ep.name, "-iso")
 					|| strstr(ep->ep.name, "-int"))
@@ -636,7 +636,7 @@ static int qe_ep_init(struct qe_udc *udc,
=20
 	/* initialize ep structure */
 	ep->ep.maxpacket =3D max;
-	ep->tm =3D (u8)(desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK);
+	ep->tm =3D (u8) usb_endpoint_type(desc);
 	ep->ep.desc =3D desc;
 	ep->stopped =3D 0;
 	ep->init =3D 1;
diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/ud=
c/fsl_udc_core.c
index 4dea8bc30cf6..19c74ba82e16 100644
=2D-- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -599,16 +599,14 @@ static int fsl_ep_enable(struct usb_ep *_ep,
 	struct_ep_qh_setup(udc, (unsigned char) ep_index(ep),
 			(unsigned char) ((desc->bEndpointAddress & USB_DIR_IN)
 					?  USB_SEND : USB_RECV),
-			(unsigned char) (desc->bmAttributes
-					& USB_ENDPOINT_XFERTYPE_MASK),
+			(unsigned char) usb_endpoint_type(desc),
 			max, zlt, mult);
=20
 	/* Init endpoint ctrl register */
 	dr_ep_setup((unsigned char) ep_index(ep),
 			(unsigned char) ((desc->bEndpointAddress & USB_DIR_IN)
 					? USB_SEND : USB_RECV),
-			(unsigned char) (desc->bmAttributes
-					& USB_ENDPOINT_XFERTYPE_MASK));
+			(unsigned char) usb_endpoint_type(desc));
=20
 	spin_unlock_irqrestore(&udc->lock, flags);
 	retval =3D 0;
=2D-=20
2.50.0

