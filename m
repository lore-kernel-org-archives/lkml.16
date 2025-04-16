Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2120199947;
	Wed, 16 Apr 2025 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813831; cv=none; b=OoaollBTXfUyxPGLz4OJyr+L+LZzRfCLIm4gP0ac7J4JfzHTeQKQim60WiRCRw4S7eofIIL3PbtP2uEdX6IlArAOIVB413V0U3Yjkh2HAIhZ7bfPL/ysIarnbzTyEb/+GQl49jxsFwiTJZlzD5lFVVp1rqo0Ae3sl3ogDL+bmn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813831; c=relaxed/simple;
	bh=mYbW2DT1w5X3RypUfXyK5Jb3D1YRyHwDKvLTIL0PwNs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Tucmh3PNc29A/Cfoyr91FqAeSANgQjFGl5E7H3vdOlKf+awUceIsJb6TlRDyGvi7jHV5LtE5vvnZD8/bAh8iTuYVnxp5MYwCG5x4BZORAuPHGTsWwYso+BThRWvNTBzcGLY6N8y/gBg4q1UVS/anmpHfUEXJPUq/OOYPSQC/u08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=hIUGtH2u; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="hIUGtH2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744813821; x=1745418621; i=markus.elfring@web.de;
	bh=hxhI6gqX3pyMrwjZJ35l5Ur1hW8wIF3MipU6G+qRRVU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hIUGtH2uhSUFudeesZSfc5Z6gOWbJPGUZaJufYdPXjyyN8/vyiRNZcXoPOPUwnWN
	 D9cp2l2U0iryJFWf/9IiRT1K7JuC1IZBYMbr9RWo2tKw7UXY9lVgzAUXepOhOSxRq
	 oE2BHICp1+a2T7U720/FPviXpIOyLEGex3ShqgB4euCBnBVSVrFlsXSeKodSMM4SG
	 qZlhSFvROLHYe2qDoMGeNYYiq3u2Dy0fSx3ErqskobX2lIcrW3+uSwYqJ67nczDQB
	 0LlMiQoaATehdJ6PHcPkYVsZQF6IQSNz1XVC+PTEhVdAYMfy86Dy0S+Cz5z4BLKo6
	 0Ct22NTc4yaBv6tzDg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.13]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MGgNS-1trFzb1Nn0-006XH2; Wed, 16
 Apr 2025 16:30:21 +0200
Message-ID: <44df2f04-655e-47cc-8785-0855377c4bf7@web.de>
Date: Wed, 16 Apr 2025 16:30:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang <chenyuan0y@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] misc: sram: Replace devm_kasprintf() call by devm_kstrdup()
 in sram_reserve_regions()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K53tmICETy4fXmGeOgvtXGZxjBjBzMVwyv4pfrf/l+kb6hZ/9cn
 GoAEHLmXpLGZ0tnVvSR8a6+s/0h+FiaWPmlaJHcRkOuPSOsPDm0eS0s1r/X8TU8m923sEUs
 0urRHA7o6zYWu2unSNp65YrF29zNAtIcUQf24eBFBETXtVX2he5RtJr0PZw0WzS6rnYngJ5
 eyCyPHr1S4sOt14vlcIvw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5F83Olip9cM=;+IaxY4wEj1mRWiTZA3DNz8D7Zio
 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
 A/hA6ALRsExkE=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Apr 2025 16:10:06 +0200

Use a devm_kstrdup() call instead of a devm_kasprintf() call
in this function implementation because only a single string
should be copied.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/misc/sram.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index e5069882457e..5a2412ca43cd 100644
=2D-- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -235,8 +235,9 @@ static int sram_reserve_regions(struct sram_dev *sram,=
 struct resource *res)
 				goto err_chunks;
 			}
 			if (!label)
-				block->label =3D devm_kasprintf(sram->dev, GFP_KERNEL,
-							      "%s", of_node_full_name(child));
+				block->label =3D devm_kstrdup(sram->dev,
+							    of_node_full_name(child),
+							    GFP_KERNEL);
 			else
 				block->label =3D devm_kstrdup(sram->dev,
 							    label, GFP_KERNEL);
=2D-=20
2.49.0

