Received: from outbound.pv.icloud.com (p-west1-cluster6-host6-snip4-1.eps.apple.com [57.103.67.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6711728FD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430464; cv=none; b=tSPTNjqbsROH0SHWU+u86nBCdURB2QoOIBJWMBMWLC2Mj1vLuWL9BHACLMaXHwWRUpp8ZRJYZ6cF0TvME7d3QL2RJNQoohfUS/wvp0l/QTT+By8i5dHvhDSe3JVv0tyGyyt0Lre7pJv/E97D45Mqiik1CdvhvwnanMq8eJQH+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430464; c=relaxed/simple;
	bh=Yr+ep9SP3wZo2lIt6ezTm0HZej0HrNsBVylBhnhIYUg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fxDHxkBJc0Ndnfhia8Bxhrl82c00tSfJZkkR9pxANv0KK6gDTNb2ZF4RwCOyweVYK67uB2nZ2KaRwVXcwROm3B3tn1jcAEHXnSldx1vbnYCcvA1wnWbfcgDcT1e8FWKp3540MCrTYPzHgFcn1MIMgzERxW9Mfmy2kWOMZ86km+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=Q66a8I1Z; arc=none smtp.client-ip=57.103.67.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="Q66a8I1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=wF3Cv7ZPj3TEQM73gyxKYcZbCi2Jh6tueIr0k8ljcLo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:x-icloud-hme;
	b=Q66a8I1Z/aR2b7RGm5Q6sYI6Iw04iUOaCjS2C+7CMPY53xHQYOScXel6aofQ46fwm
	 MnB92lgBZMtOqduOKQhYUB8bFw6nRcOT/OdLJGLamcyTDBp681UFGq39OV1jlh99FA
	 GAYiK5e9zQmLri2sQicdEJk99d4rNUeUVzqiaZD7tg6b+zqmmiyZl7iuKPqYIlmrfE
	 e1ijUm1nkhu7Sky2YTq3SJ5dJCZaLMTUjflcJ+6WR6JcOm9GFJ/YtJhUIIVPAG6E1i
	 o4XjIrlu7RgIQ6+U+KXyX4RLa5YBMAFZxvg5i0JyLyjHmpBtkOUrlI2SVh7wkgLPrr
	 NwnK3s8n1TfHw==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 53A94180509E;
	Fri, 20 Jun 2025 14:41:01 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 577A51805FC2;
	Fri, 20 Jun 2025 14:35:43 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Subject: [PATCH 0/3] char: misc: Trivial cleanup
Date: Fri, 20 Jun 2025 22:35:17 +0800
Message-Id: <20250620-fix_mischar-v1-0-6c2716bbf1fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKVxVWgC/x2MQQqAIBAAvyJ7TrBFC/tKRERutYcsFCIQ/97Sc
 RhmCmRKTBkGVSDRw5mvKNA2CtZjiTtpDsKABp3p0OiN3/nkLDLp3ttAFp13HkGKO5Ho/zZOtX4
 CmZYmXQAAAA==
X-Change-ID: 20250620-fix_mischar-794de4259592
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX60BpvrXIp5Li
 18Nu5haFSxSZL55W15zqb6Damaha4qZiKz8YhoMB2YCsU9ZTVhMIyOJK1rhizeS3zWhbmoJ+3UD
 fnZgY40USta3g9blHJeIxlIjPFFR1RRQbQ+R1K5RvU7z7iDPtto7MhxiEtaPAIdl2wzp+mOymdA
 yjoKZ1L+zwUyAuE6354Ota7ALm8dr6JZ3xPLvSlRqx5B6NJb9kpc/jkqsuYiLyFDleAjknvz/A9
 9pidiPGucde/MFCOBzi+K+vekfww0S8mruEldEEB6TuqogM+6iCbA5LYj5H5b6F4Ac0i2yQ5g=
X-Proofpoint-GUID: ZX_ekh5SYk3MZHbTtQB2DCwtFzG1Hw4L
X-Proofpoint-ORIG-GUID: ZX_ekh5SYk3MZHbTtQB2DCwtFzG1Hw4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=958 clxscore=1015 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2506200104

This patch series is to do trivial cleanup for miscdevice driver.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Zijun Hu (3):
      char: misc: Remove redundant forward declarations
      char: misc: Rename a local variable in misc_init()
      char: misc: Fix improper and inaccurate error code returned by misc_init()

 drivers/char/misc.c        | 10 +++++-----
 include/linux/miscdevice.h |  3 ---
 2 files changed, 5 insertions(+), 8 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-fix_mischar-794de4259592

Best regards,
-- 
Zijun Hu <zijun.hu@oss.qualcomm.com>

