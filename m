Received: from outbound.pv.icloud.com (p-west1-cluster3-host4-snip4-3.eps.apple.com [57.103.66.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD98E28A419
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750420469; cv=none; b=RDp1AFs7AdU0UPShXdNE4/18lrmmK11FOmowsL0sGqt7Wyj/oMEr60tNq8uNzEwIXfg88r/7tYmiIwQo2MfgtrRRyPyfYcAUEMrPJS7YvVedFRRfPEdwTwnXtM4fcxJ9qED2+J/CDdSXB6gfGGgsaDvMBk9ih5IZs7n0wWP74Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750420469; c=relaxed/simple;
	bh=ACmDLlc+SAFxrXYLHzx+T8WD/35NNe0VJ7/t7KV+f6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mjI2lBcauW04SoZ64nsSevY1tlGIVgvXhDEwow9vjkIW2JfCMTwWcDksJJXUqqfccmbJNaUl2El8oi+TSGf0mjQpe+EJaYAsWRvFnRprL3pT2D2LJAEZnaYtWPivE6Uu7AVFXe7jIvU2mHL593xPs1oMkpnjo5ytlM4NtiyJjWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=DiYldwhe; arc=none smtp.client-ip=57.103.66.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="DiYldwhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=CgflN/UnYkZsI7sAU4DoSG5tUnOsbhIXdR+7NTWnTG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=DiYldwheue2uMNvNIq+fudX+7LACXGvb+vWmDmb7GUogENQ1Hw+LCmZD9ZOVp+tp6
	 8Tb4MJhF4Tx2ebj7WnNzUkYa3H08tnGDpH5+Br300oI4qk8LsTirHATxu3Fgx96+BQ
	 E6wdPXT+4Ek2cMjF/qmaCdcKaHJnp+YHSBw9N/zZKVenPqEEjrlk5dbDu626CGQmEP
	 uTI1dSQbwtDm6ou4/UEUC+ZWg6IguOjT9EIIqF/B2Q1/Ofiglo9sN1f8qG+8N0VW1U
	 Eegf2PUrScVbUcH/R97MMmAYUD41S4jB2vfT5ZGN0ksUQhf/EMzv+AGJB9v/Cv9z9O
	 p4pV6DUgDX7dw==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id B0B371800D64;
	Fri, 20 Jun 2025 11:54:25 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 660AE1800213;
	Fri, 20 Jun 2025 11:54:24 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Fri, 20 Jun 2025 19:53:54 +0800
Subject: [PATCH 2/2] mailmap: Correct name for a historical account of
 Zijun Hu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-my_mailmap-v1-2-11ea3db8ba1e@oss.qualcomm.com>
References: <20250620-my_mailmap-v1-0-11ea3db8ba1e@oss.qualcomm.com>
In-Reply-To: <20250620-my_mailmap-v1-0-11ea3db8ba1e@oss.qualcomm.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: MfWnw62gmQbx5Ip0Nm2JO2OXwOQRzNRe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA4NSBTYWx0ZWRfX4Sct8fnPXbR/
 Np39YjAYF4Gq/mCIHnPAO118yvzAjPbeU98C8Q0A0jVfuo8vCzTSYE1a76UacoCLX5j9eTC5ksU
 /p90dolXkogPzGq9j29fe3PC+IkFbWZyZ1Z8rcsS4NeHmFQ0CddghCLKpthqiq5i4Pzgu+hxdIf
 lawuP2Mxn0R6kbHRROfqsRRSNSg9BAaSemdkVim7VS10KHsDCKMJ3/Qk8D5hWv3wA1uPq+ZKRB+
 8fGYPkLAI25qqHfeSOADyZnsMf3cJL7z/YLGqT1KXMD2CLcvFXzdZ3Pdp6tT5gAbT2buNsqA8=
X-Proofpoint-ORIG-GUID: MfWnw62gmQbx5Ip0Nm2JO2OXwOQRzNRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2506200085

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

Correct the name for <zijun_hu@htc.com> from 'zijun_hu' to 'Zijun Hu'.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 3382cacd77be9673949ca8847cf8938dbd15d583..a66788df35996760ad8e9dedab41b1e1b77f2152 100644
--- a/.mailmap
+++ b/.mailmap
@@ -831,3 +831,4 @@ Zack Rusin <zack.rusin@broadcom.com> <zackr@vmware.com>
 Zhu Yanjun <zyjzyj2000@gmail.com> <yanjunz@nvidia.com>
 Zijun Hu <zijun.hu@oss.qualcomm.com> <quic_zijuhu@quicinc.com>
 Zijun Hu <zijun.hu@oss.qualcomm.com> <zijuhu@codeaurora.org>
+Zijun Hu <zijun_hu@htc.com>

-- 
2.34.1

