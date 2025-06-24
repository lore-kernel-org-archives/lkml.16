Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F6C307482;
	Tue, 24 Jun 2025 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779961; cv=none; b=tkH8FTbNbcZqwYi5HEriIJ4iJX8wfwCILYcdwa9XtwrQuyRB0UhjvWQuCvA0JowcAoVJIJ65Vv3ay4LGO7ndgJH3d/fON5mwlMthdQjZyZPvuPgjBGNt0V8nOustRrV/OkZsnUGbsi8b/4MtLW487tTzUtX2VDorP/u90Gl6tag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779961; c=relaxed/simple;
	bh=P2Qa/gv/zq28yLSnvAfc5EzlQGG7eIAdfHf1FUfTNsY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=l4QPHQ9GA2SdBlvZmmfnC3QeJYthrB+ZHBI1eFhIazdcaq6fN+xHIxRMe3Z7GJNBZOdWkYyfFepnjwdw1BtyUqxQCqTrblv+45zQf0y40XexTjch3rk28U2OZdywRh855ezW7Uo7Xoke6f11lzF2seFpLtmZ0+n2D4z3Mnoo7lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=C9SQsR3q; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="C9SQsR3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750779952; x=1751384752; i=markus.elfring@web.de;
	bh=7IzVVHSpxcWsNZBSF/6rNrBgwtKHD1dv8bhImPHkkjs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=C9SQsR3q2jfi+ogC4gfzlFdA8DbYYKRBiPGiHore82/BMIAQJxzJV1LecWpPVUH/
	 mJkujBZ8YdNwB6gPMjISQN7jDyOyy7xcm2IojhnF/TY59oDVk2e/S2TYOebCn21rW
	 b3ra4OE9LiMOAamtEjxBUULq0CAG542I442UOUD3Pj7WgGedeHkTJCIJpF5S5xFxq
	 FcFj9JGfTvT+vhCENWpIp29QyVuW4UP3sHT6nZhEZy9HhbwAJM5w9M9w4V9j0f7a0
	 /no95p7PnXNPE6T+0DKJ+iiZCyO+zIAgKsJYuQR7bcR6dL3YjvE/XwOcNHXTQbErB
	 vTFNQYiISOEdlz8+vw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.200]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MhWkj-1uyUdD1Fch-00pJlo; Tue, 24
 Jun 2025 17:40:20 +0200
Message-ID: <e9b363cb-1223-41fa-8613-73ff9a1d4a30@web.de>
Date: Tue, 24 Jun 2025 17:40:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Chen Ni <nichen@iscas.ac.cn>, Xu Yang <xu.yang_2@nxp.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: chipidea: udc: Use usb_endpoint_is_isoc_in() rather than
 duplicating its implementation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KKLBC0KeDk9cb83s9frQtEzj8eZlxGZ+sDxSz6O/DMAQhcKiACL
 6Gh1so3bdkY8FCVhBDuG30DhtEDib3lWt15Pjv0hnCmcqQRnezx98oO7DuhW4uhmJaLSa28
 EQ0pUbqfVSOv/pyh40xSUQqTaHoz+SD7kSm++hIdsHbMGGWM6NaYSLk1oH0wzEAjBIUdOlu
 bUZdV+iEXu3l5HTgIhz7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3I47LezIaP8=;TLmIqAwZrmbN6ARpCJeomLhReap
 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
 wkCaAAdEzzAG/eyO356c5J6aVaAzw==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Jun 2025 17:30:52 +0200

Reuse existing functionality from usb_endpoint_is_isoc_in() instead of
keeping duplicate source code.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/chipidea/udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 64a421ae0f05..75705089136c 100644
=2D-- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1992,7 +1992,7 @@ static struct usb_ep *ci_udc_match_ep(struct usb_gad=
get *gadget,
 	struct ci_hdrc *ci =3D container_of(gadget, struct ci_hdrc, gadget);
 	struct usb_ep *ep;
=20
-	if (usb_endpoint_xfer_isoc(desc) && usb_endpoint_dir_in(desc)) {
+	if (usb_endpoint_is_isoc_in(desc)) {
 		list_for_each_entry_reverse(ep, &ci->gadget.ep_list, ep_list) {
 			if (ep->caps.dir_in && !ep->claimed)
 				return ep;
=2D-=20
2.50.0

