Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86822D9ED;
	Tue, 24 Jun 2025 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771312; cv=none; b=ZLgQ9V/nJpW2MqR6VnadYOP5uIpnhEjlMCIIuFyM6z1rPwzln1hIGQOkG8lA3mQG7YNW5hV0yD7GWMGQiUZhdt5Kx3JKQtwympUgGiaC1vZUyKFDmdgDC51gNQbkhPp2fe1fidmXsnlXwscMqyi/dCG23JNThm2XHBs7FLKt5Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771312; c=relaxed/simple;
	bh=DZU6YBpPgIQVFPwzTLHaIpQBBubuJeCfLo61Clqxhk0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=g/pnaWESu5Ea+gymAjGSosfPDAh0xD+mzQLNaZ9VjAcJcmEFgTBDYMZ4uoIZexUm1XxpgN6pqfSipyeZLfNIi1qExKwy4mJGep0+V2kIsxlErqa8uxQ+RVmpNYdIE/9kzCJRjyIBm6bM+D8jS3vDCKhE8QTpHmxyLC9b/uaKrPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ARkii1Ec; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ARkii1Ec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750771301; x=1751376101; i=markus.elfring@web.de;
	bh=qRMSLkuE2eUd/JTqEQFPTKEE5Lezk/EsRWxuxZY3QmM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ARkii1EcnA+16PPab+S5fmRyuyL0yXZqcVPE8NFv16pEzB0pIZ4vFZSxMlCj0R19
	 O1Y1XK7VoU9KVskQ857IXUF5AsxDU46Tnbpay7d9cg8g7T7ChMdqPhr4yJBRELUxs
	 NRPEpyZ9ih9s/cuCIw4I+OR0pUgKkAMYpYaPxi4DN4c64AWYMBPaDi6MSBqOYGei9
	 C29UYDiogpra13M0Rl/nZ/ticzAQ8PAHgP/o6pmTtxhjsh8gUm4XEQ8hRWZ4ZlPyR
	 MF5IUECNomUSnAJtyO52+FJB244YgxSgj+2ss/JxTRoXUDPQ4KZQU4NhM5O2Y8FZB
	 yv2b/iNPP7c6GOcmNA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.200]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MHmqC-1uYz0F0u5W-008WsL; Tue, 24
 Jun 2025 15:21:41 +0200
Message-ID: <f4981e10-a56a-4197-827f-13d43d0c03c8@web.de>
Date: Tue, 24 Jun 2025 15:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Birsan <cristian.birsan@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Chen Ni <nichen@iscas.ac.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: gadget: udc: atmel: Use usb_endpoint_num() rather than
 duplicating its implementation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ygupd27R5j3lu4oMHRpR/dvmACwj91rlGfFyCBHJjvWRbsYWUSV
 BFuVL87O+rHe/BiC/ePHZiyilBbT40jBoWArsd7IB1RLFYbPJ8jElsbXNiUBxBQk2rLgtg2
 LTz46kDimXOf28N+Y3m0T0+C9gG29P5McbGkqRR5zqPeT9BDiDH2J1aqEaw1NtgQDFbMk9k
 wA4kk79BIlPV2scwzJ1Gg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vfBSgLlAv6c=;PkQqSc29Ls7pBjMJBSDoed/R/ly
 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
 Ewlq2oAiAVPSPUck4oJg==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Jun 2025 15:08:46 +0200
Subject: [PATCH] usb: gadget: udc: atmel: Use usb_endpoint_num() rather th=
an duplicating its implementation

Reuse existing functionality from usb_endpoint_num() instead of keeping
duplicate source code.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/gadget/udc/atmel_usba_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/=
udc/atmel_usba_udc.c
index 0c6f2ad81d37..35d0909ab812 100644
=2D-- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -580,7 +580,7 @@ usba_ep_enable(struct usb_ep *_ep, const struct usb_en=
dpoint_descriptor *desc)
=20
 	maxpacket =3D usb_endpoint_maxp(desc);
=20
-	if (((desc->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK) !=3D ep->index)
+	if (usb_endpoint_num(desc) !=3D ep->index
 			|| ep->index =3D=3D 0
 			|| desc->bDescriptorType !=3D USB_DT_ENDPOINT
 			|| maxpacket =3D=3D 0
=2D-=20
2.50.0

