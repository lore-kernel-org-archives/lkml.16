Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EBA40849;
	Wed, 16 Apr 2025 13:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808924; cv=none; b=l3EFDIEX+xuvpc46xgh+ue+Ie12eH6T8TGuSZZgV5mRcpW0Qg7Q+BBmtGB+d60Df1JNuSIYPxM+BsjtSaWAWXJeqvnLhw+DJ/HeCQygK/dOvnH/+pEXkzEzoZJfUvLQAJKpxXJczAVSqsBHLBcTNPBhcRFN3sn6R2/anMza6Bes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808924; c=relaxed/simple;
	bh=E+b47x6oKtd1eJR0iUvNQyb2cup/jQzg6qkM4AFRjT0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ZrfdvoMJspFFm3f5g5Nz4usgapGwRb6/qSGrJc1viskfuub7RtcRTi2RoSEik5+oVfjJZzsjiJtJ9Zh5oRJ17WxhNg6+qAucLBa0lT3qgE59jOgbdi+kwGs6whUMUlmsp+pLP7HTzI54NVEu21P044Xa3GAdeYTHVKWKZzQ/sRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=X9CqSjB7; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="X9CqSjB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744808912; x=1745413712; i=markus.elfring@web.de;
	bh=PPl45bcdpybn4S3L1FQ9aweIhu6xGMiofuniVuj6Icc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=X9CqSjB7bZ1HRYaH9fDxeLVN5tec9l6q8nLBR78bclcrRPv0VZLV5C6JUn4itCd2
	 vpKnU4/VmXQCfkVUA1bmngL36RviU/wgSQ0oqULrSq36doHBRODe1GaehG315Qup+
	 m40fo9mdTJS+KxlGZ5FFaG1rxQ4cPwpkiPPo9JAQb503Pzz2TbjvGiWtU4C4claGF
	 UfEpjSMc6J1RTck3N/BaFxOfqq8dqzvh5vi1vpGgFWZwsD8AzEV9WKzlpA3QCU+VG
	 ixYoO7DZ6ENuo576uPXRE1bwIvHijG0UXKlre1tx9DTtAn4jIhnfFeNKnsdrjviea
	 msPK3+KdCpHsJQCZzw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.13]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3m9H-1u4D9n0Phr-00Dmm7; Wed, 16
 Apr 2025 15:08:32 +0200
Message-ID: <3e473ff5-1554-4065-a305-6b3661e0b941@web.de>
Date: Wed, 16 Apr 2025 15:08:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang
 <chenyuan0y@gmail.com>, Julia Lawall <julia.lawall@inria.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ASoC: SOF: topology: Replace devm_kasprintf() call by
 devm_kstrdup() in sof_copy_tuples()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oOK5+bHBAHZDH9yk8Bm8TgfX/hKD4YOaMRexCRmRC1xviV/7qwC
 RiYKXSJPjU3ZayqiCZFP5hKSR3JeUQ74U9tpjWWKKPtpNrpnZcv8MbUoos4DZ7gJMvUE0M+
 GotFWDaZXGSvyMIhxbhlqTjmXB9BPI2pSC9kng5Jl4H/F7Gcargd+yDZlEiuG1N28GeXi1N
 sKH6YuhXp4SRTIHD+T/vQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4bp5+2TEYEc=;gFfEIRgffqIrQlbnRdS14k70N1k
 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
 y1riyODs7+e7KhVyatRIslqq/0LY0/xWm8

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Apr 2025 14:44:58 +0200

Use a devm_kstrdup() call instead of a devm_kasprintf() call
in this function implementation because only a single string
should be copied.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 sound/soc/sof/topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e19ba94f2c80..49462140facc 100644
=2D-- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -572,8 +572,9 @@ static int sof_copy_tuples(struct snd_sof_dev *sdev, s=
truct snd_soc_tplg_vendor_
=20
 					tuples[*num_copied_tuples].token =3D tokens[j].token;
 					tuples[*num_copied_tuples].value.s =3D
-						devm_kasprintf(sdev->dev, GFP_KERNEL,
-							       "%s", elem->string);
+						devm_kstrdup(sdev->dev,
+							     elem->string,
+							     GFP_KERNEL);
 					if (!tuples[*num_copied_tuples].value.s)
 						return -ENOMEM;
 				} else {
=2D-=20
2.49.0

