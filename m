Received: from pv50p00im-ztdg10021101.me.com (pv50p00im-ztdg10021101.me.com [17.58.6.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFF51DE2A6
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739106011; cv=none; b=h5on+3KwxvP9ekRh2UJN+N5mMwofNivCpoiLMgB75huySJUYqh79QcRdBi31utXnekLN8sbn7/okCdtGUKJKHRO6drAW3UKRId07yatP+AllPOBi3JevUG3N5vNhdJ7I9P2Fz5Qufx/yXuChhU1P6wQBR1HXj7hSgZ6CGqS/7+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739106011; c=relaxed/simple;
	bh=llyBk/D8rlTHUuJeik+MIK2sfdpXFGludODcjcY3fB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLrtgWGd2bLbvgzsPxpJVJ5L0/BM3+aUehM/go9BeWVpWUyQCfNmKsFt105FzJ5G+KGico6AkTQnaat0zG8GuneQkvCj8/3TvkSm0FNnVDk6kGN33pd94rk4+bet3udx8vySKm0zQ6fw8mNfVWhMhV6E4yk8Rs0TzUoHG3Wedus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=hXFw7TLa; arc=none smtp.client-ip=17.58.6.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="hXFw7TLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=XIMc4+bWC8JFaNsl7WhlNT4TkWv3ENHhYxdQbR71LKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=hXFw7TLaS9AVUe1ipjkyhalnEqaNy2C5TxT/4cBZUkAT87UrqY2agnw1bV2VMpajL
	 3O6Bc99Z0/jnS/HSJLL9RMSIK62GakKmc8ryFP82IyWEBOekjgrhn1kTzdadob6yUa
	 W4/CzaArTuHUUxLihdQOEMer2fPmO7tyYbmhPFNc0GBaq08eiokRj2t/rRCItZ0iqZ
	 kVyHHbdLkbPfLanz+PUTjLGo32EcdzhHDydrQEwFgy3iDSVhXuUXho66i83nCoy+41
	 BEi4ZGiEnr1NEqkq7uR64vX4lUdKsELpKTZ9AVSVVq4rZ+R71E7ff0oymQtfSo8uzB
	 5jgtOZ7Ik+DFQ==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021101.me.com (Postfix) with ESMTPSA id 678FAD00277;
	Sun,  9 Feb 2025 13:00:04 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Sun, 09 Feb 2025 20:58:58 +0800
Subject: [PATCH v2 5/9] of/irq: Fix device node refcount leakages in
 of_irq_count()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-of_irq_fix-v2-5-93e3a2659aa7@quicinc.com>
References: <20250209-of_irq_fix-v2-0-93e3a2659aa7@quicinc.com>
In-Reply-To: <20250209-of_irq_fix-v2-0-93e3a2659aa7@quicinc.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <maz@kernel.org>, 
 Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Zijun Hu <zijun_hu@icloud.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 6HB4iw6BgEMLlIYIjFQZlNYzx77Mfx8v
X-Proofpoint-ORIG-GUID: 6HB4iw6BgEMLlIYIjFQZlNYzx77Mfx8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_05,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=835 phishscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502090115
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

of_irq_count() invokes of_irq_parse_one() to count IRQs, and successful
invocation of the later will get device node @irq.np refcount, but the
former does not put the refcount before next iteration invocation, hence
causes device node refcount leakages.

Fix by putting @irq.np refcount before the next iteration invocation.

Fixes: 3da5278727a8 ("of/irq: Rework of_irq_count()")
Cc: stable@vger.kernel.org
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/of/irq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c41b2533d86d8eceabe8f2e43842af33f22febff..95a482a584740c3a0f55b791157072166dffffe0 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -518,8 +518,10 @@ int of_irq_count(struct device_node *dev)
 	struct of_phandle_args irq;
 	int nr = 0;
 
-	while (of_irq_parse_one(dev, nr, &irq) == 0)
+	while (of_irq_parse_one(dev, nr, &irq) == 0) {
+		of_node_put(irq.np);
 		nr++;
+	}
 
 	return nr;
 }

-- 
2.34.1

