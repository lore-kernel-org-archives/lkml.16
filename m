Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A15C1632D9;
	Wed, 16 Apr 2025 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811720; cv=none; b=rxSL4tx+xt8J77qn7w2bcyqIHmPTM1Za1BrNPcksL8hf7J/wZyzRwniel2HPq0LRW9St4DuNfoGcAFlHhupNCkSMZeLlWVTf3JSGzNXTjNU9sHTpuyTNMZ3K5fTeX8J97tib2eRwDJBM46UX2QixSY/cfjKgnhC0fNuBI6LX3bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811720; c=relaxed/simple;
	bh=qiiPvQ61c24fg6gBHjzzz6h25Gsizp7JLH/JcH8CRkE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ALfrvFrYO11VdBbhbMPzEKRVX+gdw7DDwjcQtWhLzbT1XxdQJxEYM4Etm2xTOPh2M+OB6cp4w83nruHBLnIK/t1B3NFWB4wOk6lhbEMHrEXZX8Zqu21lKM5QtV3yj7FGTO80y6plqjJ1QCjYmafsjWDTqUEPqSjzm0VaHTe/0mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=hUeoYsD4; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="hUeoYsD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744811708; x=1745416508; i=markus.elfring@web.de;
	bh=eC/SvlKaPq929tASfXDXWJPFipkuKbLgk927TAfU1lE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hUeoYsD4WrHWeqb9nlNpT1YI9rtZCR+Yr+lzpTox1B4vGiL0yLMejlYUON32yQBA
	 JDmx3WWRWJNJmB67M/M/2Ag+PPNOqe9mv8RN6dkTTRi33Tb+tfS0Uv/chJBzABL1o
	 CRcyebprVOVM/p0v3il9eOkld2iili+0XIio2TJYeJ7ZAIWpvipSavU7Iv3MmpWjm
	 lWRfw5XUQ9LHpcweD7IXBoL6XxWJHcGJiVeT7QFxyY8li7IVJd5wL1BuQcdUAUEEl
	 fxuTxWSCAlW+bqmPOo5zvCOhxjLDjg6qkozDI/BB+FhGqg6XW566abZFsHoQmTbV4
	 OBzTizD7yhVDjBD2kg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.13]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mv3US-1tEBYp3KEa-014W1o; Wed, 16
 Apr 2025 15:55:07 +0200
Message-ID: <1145f48a-658b-4745-a8b3-724f33c3f1ee@web.de>
Date: Wed, 16 Apr 2025 15:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: kernel-janitors@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Shawn Guo <shawn.guo@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang <chenyuan0y@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] irqchip/qcom-mpm: Replace devm_kasprintf() call by
 devm_kstrdup() in qcom_mpm_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:INKt8jcYG20W0shtP2ChpmFpFIdIPjQqMchHMamk80DQkbVO7/t
 UhtTxsN6OKVCGk/mWprmPeL2VO4y0lU2qKilCgpYVDJuQ+QuVPL2bkcsRcsFprS5Zd5kP3l
 A7ppaurbSYmw2l04GmL/fMiVfH/6O3EBhDyJawcaH36oUw4AxhE7g0/p4Q3+GiL7SDxOs14
 /bY0mEutYb0iln4/NtQCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y7CfnHNsijE=;liOPZVzq3SFbfQcXZbd7WYjeHxF
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Apr 2025 15:43:46 +0200

Use a devm_kstrdup() call instead of a devm_kasprintf() call
in this function implementation because only a single string
should be copied.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/irqchip/irq-qcom-mpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm=
.c
index 7942d8eb3d00..d3e398e03d3f 100644
=2D-- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -414,7 +414,7 @@ static int qcom_mpm_init(struct device_node *np, struc=
t device_node *parent)
 	genpd->flags =3D GENPD_FLAG_IRQ_SAFE;
 	genpd->power_off =3D mpm_pd_power_off;
=20
-	genpd->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
+	genpd->name =3D devm_kstrdup(dev, dev_name(dev), GFP_KERNEL);
 	if (!genpd->name)
 		return -ENOMEM;
=20
=2D-=20
2.49.0

