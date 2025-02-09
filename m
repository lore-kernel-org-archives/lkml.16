Received: from pv50p00im-ztdg10021101.me.com (pv50p00im-ztdg10021101.me.com [17.58.6.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4628C1D6DB5
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739106030; cv=none; b=b4rW3CFf4p62R0nLhi4fPb4/NfigrEu66pAuycgxIDO3CkwBpOKDuZGXc7dXHgq/5MovdF5RDZDY0yJ/zQAFZsH15xPjeN2cyXiUnntNE/NAVrd80zE0MaNJV46lVAPdXALPjA/HGN/J0uOfc0do3h1mIZPETIYfetXhW42hDc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739106030; c=relaxed/simple;
	bh=LGxPN32FZV5puJ/82QGfCx5ohZJoHjfUizQCqjrtyt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4R8oZj38SPmkAw4M1VFzvXxxQ2ZoKd1jKSulrM5uDHYEJIEjik4/zMNpVH/jiT0bgqTT+9IvxX/NrzKLPKOaZglMtIn3fv0NNvBLZN3PwjXSuWmUl/dSCboqfbNPCA010pFLR+nOqnJ999pjcPF5DVjHFdAwYgmrr5Zx9JdCDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=TaXAX0Oj; arc=none smtp.client-ip=17.58.6.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="TaXAX0Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=/WWMYR9GDJolz5esQMrY5S1Zc09zsLZyulks3hRVEVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=TaXAX0OjiZJhqrW3F9Chtt8+2jr9GkOOQ9tE3lzlrHN3yVhsQu4x+HyZai0bu0UZf
	 PWRXjJ9ppOMwFXBX1N6DUk2ccJZxExHecphfuZW3JYu+K3UQnPEubfwY4jBAyuaAGE
	 NJtjvmAasyKBHIKg4X85DbHlrC+//DxUFlLlo74vjp4RWu7SSGJKiXMA2Fz7S1dvd5
	 6W3p0SXkUhAE+XdY067P4F9r/BQASoj6b8ASTyIeJAjEkktEYknXb7J2dwuzN5Vhdm
	 i+alP9M5Il5aAyFBnU+UqxF7sO2H/mMnSJltx9+fDRZBIt+qN52PbvubPJlwjX9N6Q
	 4CZJrFPgbZ9zw==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021101.me.com (Postfix) with ESMTPSA id 686A3D0026A;
	Sun,  9 Feb 2025 13:00:23 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Sun, 09 Feb 2025 20:59:01 +0800
Subject: [PATCH v2 8/9] of/irq: Add comments about refcount for API
 of_irq_find_parent()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-of_irq_fix-v2-8-93e3a2659aa7@quicinc.com>
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
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: TysRMhn4wYspCWzierMrcaMBBl7Peobp
X-Proofpoint-ORIG-GUID: TysRMhn4wYspCWzierMrcaMBBl7Peobp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_05,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=665 phishscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502090115
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

Add comments about refcount of the node returned by of_irq_find_parent().

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/of/irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index ded2a18776671bb30b3c75367e0857494a5c8570..b947bee81434c5303d37555bada4564be01426ab 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -54,8 +54,8 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
  * of_irq_find_parent - Given a device node, find its interrupt parent node
  * @child: pointer to device node
  *
- * Return: A pointer to the interrupt parent node, or NULL if the interrupt
- * parent could not be determined.
+ * Return: A pointer to the interrupt parent node with refcount increased
+ * or NULL if the interrupt parent could not be determined.
  */
 struct device_node *of_irq_find_parent(struct device_node *child)
 {

-- 
2.34.1

