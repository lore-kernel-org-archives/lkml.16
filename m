Received: from outbound.pv.icloud.com (p-west1-cluster3-host5-snip4-10.eps.apple.com [57.103.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC681624DE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750420466; cv=none; b=b4A6sUjUFm2eNTtG5xL+YtWRSNWpnR8lI2TIIh06cm8/dv/xGjQiRXiptUwmAP8tKSi8FnlFS0EKcKzQvshf+dBSoJt1SCuUDlkWuZ1lx7HVxA8hoFPIbJI9X6YIqpet/4zGzKRuMz4lphHvOkMNg95ov/3TDyN13KZ7rnPEJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750420466; c=relaxed/simple;
	bh=9FZNJG6KpB/GZjSmFw1wq3HWSNf2shk48yqrjuPFF58=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RDy3TeKqp0LqArpg4oHHsDYRqnhMf9o6qQe+6U+xfwB5bcnCJkByqAC0F3TAPqAJfIV2oboWsx1bwSE5DufzqoOydREVoTmnVdu+pBBkOGbWNuAA7lC3Po57SEyKSL+PSu4zJ3Ib0bKe9e4AXl+axgdfMsYFY9WcwDmFqSuXabg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=onnyPvYO; arc=none smtp.client-ip=57.103.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="onnyPvYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=9/kJJFs3qC4DxbTlDr+8XarDzKmh+I7711THva8vGUA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:x-icloud-hme;
	b=onnyPvYO7uNYkmzkHfZSbzfPr1J8pXPCilic+12mOym5ZQZxpgNgAWwGbrVUYur9H
	 Ij+AYtml6/5Lb2G8BB6AHcA1fsX9z3+fb9My9YwRDu5aOj9ATcxiUmQZR2ad271qwo
	 umNVfS2IgO11FEc+dRrnzqgMO9798c1qFXBknyVUrsVUZjyBjfWzigZiqgFUu4olc7
	 heEvZaXxvZ7APobRWGtsdZUIer+zuRKAAFYTh/nAhACPBRnu+ffEiGe9MncAQPHDZ4
	 OBoyx5evdsRadXtetSaVYkp0oNXXONy7dOUxKbMmNVRBJeI3EEyLaxS8EshUFTi3Cb
	 DiKnH53w4YAEg==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 4B4B818000BC;
	Fri, 20 Jun 2025 11:54:23 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id F2C791800137;
	Fri, 20 Jun 2025 11:54:21 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Subject: [PATCH 0/2] mailmap: Add entries for Zijun Hu
Date: Fri, 20 Jun 2025 19:53:52 +0800
Message-Id: <20250620-my_mailmap-v1-0-11ea3db8ba1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANBLVWgC/yWN4QrCIBRGX2Xc3wnT6aa9Soy46rWE3JauKMbeP
 Wk/z4HvfBsUypEKnJsNMr1jifNUgZ8acHecbsSirwyiFartuWHpe00YHwkXpoL2itAPTmmogyV
 TiJ9/7DIenOn5qs31kGCxEHNzSnGtH0YMwnYDogy6c6iE9cE43nvlNbfe805JaSSM+/4DVBe8l
 agAAAA=
X-Change-ID: 20250619-my_mailmap-5f8d5ead7c58
To: Andrew Morton <akpm@linux-foundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA4NSBTYWx0ZWRfX6/EHxnjEoyaD
 ZH3PRKdLl/f2b9sMVb5hnTe3vCrQKJzzOU6fAosVPGAv6WsBDmHgNA9xtAvCLkDwSma935BAFFm
 2VgzPUMfNaRcHsLEBdwtsZQDQYkXEddK+6lEk7PP+wUuQ1oz7KGQzKn9pQQv5zNyR9a32Mygqmu
 wEzU/ZY7zIb3CGHXeMR9rvAK2BRBtqaUPSAfBU6H0tqsPbIJNy0YJjMFO/hf3gFfn9zfAf19kCQ
 +MiWdv1aZYi4xXeUrYRSpcEGnIqhZb2aoKlFLtbIuh2cZOgs1SP+WxNneB73+exQX7VLYy+bk=
X-Proofpoint-ORIG-GUID: -_KqdgF3lTd85t8CDsT5VUZyPDDV-nSz
X-Proofpoint-GUID: -_KqdgF3lTd85t8CDsT5VUZyPDDV-nSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 mlxlogscore=705 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2506200085

This patch series is to:

- Add qualcomm entries.
- Correct name for a historical email.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Zijun Hu (2):
      mailmap: Add entries for Zijun Hu
      mailmap: Correct name for a historical account of Zijun Hu

 .mailmap | 3 +++
 1 file changed, 3 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250619-my_mailmap-5f8d5ead7c58

Best regards,
-- 
Zijun Hu <zijun.hu@oss.qualcomm.com>

