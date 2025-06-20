Received: from outbound.pv.icloud.com (p-west1-cluster3-host10-snip4-10.eps.apple.com [57.103.66.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597792222C8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750420468; cv=none; b=bv0c5uD1xRZHXJ2S/UVh/ov56meC5Tzon28FfSTMWaM6VEXkrHm+EhTNYarT4Gqpj0ZwdDHD+Nm8JSkgYSI4i6ICeQbLwUuT9t13TQEOrl5A/hJ2WLSqc8Ry/WejE1FoJVYH2iI5grE9MY0g4/G21mXTd1lRctLivnrW4sYrvQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750420468; c=relaxed/simple;
	bh=ssK1d5V6MuFKyPO0EZIFAyqdH1YsEVgATxXMcgWR2yE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G22UEmjOWwJWg5Y/vSgtde+OahKB6QRLicFDBWbPWVsUaEWvzQEEQ9SvgcS60BJLBr/6aPYREo5ljFk9M3NIJhX0lxqVxyfbMXs/uQkk7cGMNFEE4kamnHOSkBfIsBulcQiAovVKwYGqD93qE76UFTfIm8a33RO9lV0k1mL/jR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=spQjCT20; arc=none smtp.client-ip=57.103.66.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="spQjCT20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=aS1AG6XLyuDzBTijzpGWDznDoRfc6P4+vu/eFuToLHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=spQjCT200xDYP0IHtT4wQ4iiJWMKcO4sWEEs00z4zBIXsVPu6wicmknu/7kdNg5Ke
	 ocfUkaGc/eoMbxKbZwMECKh5+sIVYyjkpA66dbOqGBaKgodJvsnS0a+XpVVGqWdXPM
	 BoKJk9k6GAvx2662BfqPz0leIM1jJmbnXSmFCYqKb0+lHUI9aQNW7jpenq4+DvAkZE
	 KkUlVviUMCJBOutpy3VovnDk6wNP/EhXWVxJGHr01Hmzy1+n5qnkEX+SgZ67DDwNw2
	 HODCMXwMejdKhtzQShQ29g+ZhtM6e0xqNl7M5B7oycwMswuAoqzvXNu/58FWgpi+nH
	 paL41sOZDBgZQ==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 759941800218;
	Fri, 20 Jun 2025 11:54:24 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 32B84180116D;
	Fri, 20 Jun 2025 11:54:23 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Fri, 20 Jun 2025 19:53:53 +0800
Subject: [PATCH 1/2] mailmap: Add entries for Zijun Hu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-my_mailmap-v1-1-11ea3db8ba1e@oss.qualcomm.com>
References: <20250620-my_mailmap-v1-0-11ea3db8ba1e@oss.qualcomm.com>
In-Reply-To: <20250620-my_mailmap-v1-0-11ea3db8ba1e@oss.qualcomm.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: a8KKzHwLI6MkKafuGuCC7nVnA4wnruGq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA4NSBTYWx0ZWRfXzRyXSFLr0F2w
 /ceMQ6SZP0oQgJcMnVrjd2iIrO1sTrVjQTzX6WjJ2KpkUvmQaX+nVZOn1/R4gKDXtL0cO5gYy9x
 e99LtMqYn2w0FU+GkTWZequJxchjFOcaTgr4ayez/7W7X0eYVKkDiXp5rXATYUYoM1W5pLxZhvZ
 vZwO5TWiWNt4L09Y1PqNCGWJiMEDQaOq+x3iiEhM0Qla3Y8kxLrz1yPLgvIpkfvFgRyJaRkCCfn
 +iKthBelb9bZWz+u8ICj99OTOjQ9PeyNCOZaUdA4gUC8V7llvnAwmyM8GSVFD/ngDq2dR7ez4=
X-Proofpoint-ORIG-GUID: a8KKzHwLI6MkKafuGuCC7nVnA4wnruGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2506200085

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

Map my old qualcomm email addresses:
	Zijun Hu <quic_zijuhu@quicinc.com>
	Zijun Hu <zijuhu@codeaurora.org>
To the current one:
	Zijun Hu <zijun.hu@oss.qualcomm.com>

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index fee7681100a8466317853d7b225027a7eee89931..3382cacd77be9673949ca8847cf8938dbd15d583 100644
--- a/.mailmap
+++ b/.mailmap
@@ -829,3 +829,5 @@ Yosry Ahmed <yosry.ahmed@linux.dev> <yosryahmed@google.com>
 Yusuke Goda <goda.yusuke@renesas.com>
 Zack Rusin <zack.rusin@broadcom.com> <zackr@vmware.com>
 Zhu Yanjun <zyjzyj2000@gmail.com> <yanjunz@nvidia.com>
+Zijun Hu <zijun.hu@oss.qualcomm.com> <quic_zijuhu@quicinc.com>
+Zijun Hu <zijun.hu@oss.qualcomm.com> <zijuhu@codeaurora.org>

-- 
2.34.1

