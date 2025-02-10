Received: from mr85p00im-ztdg06011201.me.com (mr85p00im-ztdg06011201.me.com [17.58.23.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0752522F170
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739194351; cv=none; b=UPlqbLs12lzgYtUxhb3iUK0G7tdLNB/E7j9s93TBj/2RisoOSTUFEbNZCVR+ZhnEor31zrIhN/DvoHsHrfwD9Pi/3FDixIEZXAT8a56J77nqAFyR99rbiaZvjxa1mgcMhzQCUUB5MsmAmAVJUp/WaLkoowFUQsxb9LQmI7LvH50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739194351; c=relaxed/simple;
	bh=flqKRrG+cUbNuOxatPRrz3/xQCwHu4Csd5h3eiZGLzI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=plFvoT3o3eaGBQaRZdM55kkyZ2dwZ900rHhlvS6WjDKN0T0khcZn8bHKktvhy3YqRjtl8asqrnSOQvnVhbWXaPy2FRZ4rznSlTX8L4DQ8lQrtYzMvi+6B+PJVwfC2/kDmj+escKO2sO1HafMeW72nAgN+mQ3tXdGBEj0VwkFNkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=eFDPGbOH; arc=none smtp.client-ip=17.58.23.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="eFDPGbOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=b2KIEz2420Bb2pMgV6oZ8yidp4SHbkJXc5kwpa6Ezmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:x-icloud-hme;
	b=eFDPGbOHyYlHpd/Z/72XGVGFO0UMKgBrGTQj1C/grnuVt6SKmhCJ5r25wrgp09lIT
	 g0E1ilNKqD/2AtxBgauqmZHe2CI7SWHJrwp0bl3y8reULFSzotVjtL45MoFuZ0Z/lI
	 4GUVfOY9dQm/FuwAxu78OAMo/uC/FRE0wQQq9nYwMw4W1NcZm0xm8PF+YdEYUYFADn
	 6GVqu/yAKkWdVDOnPH4cjjqO5aeQw6QB9LW6QAWsmpoQfxFpgbGIjeu6a8u3QPfVN9
	 1sHOAr5y54SlrFIOeOMPfU3onZdkSBHpf0DEyUxrMD6u0KhWieQlPa3Iokpkuc11FQ
	 zQm3/tWrlMWzw==
Received: from [192.168.1.26] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id EA9CA96009D;
	Mon, 10 Feb 2025 13:32:25 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Subject: [PATCH 0/2] phy: core: Remove 2 APIs
Date: Mon, 10 Feb 2025 21:32:01 +0800
Message-Id: <20250210-remove-apis-v1-0-2aaa866315a7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANH/qWcC/x3MQQqAIBBA0avIrBN0MIquEi1Kp5pFKgoSiHdPW
 r7F/xUyJaYMi6iQqHDm4Dv0IMDeu79IsusGVDgq1EomekIhuUfO8jBkZmesmTRCL2Kik9//tm6
 tfZenc09dAAAA
X-Change-ID: 20250210-remove-apis-b4e48d4c4712
To: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: GaWjp9J7Wbid0W8ZYd5iahMhvytg_Wi4
X-Proofpoint-GUID: GaWjp9J7Wbid0W8ZYd5iahMhvytg_Wi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_07,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=579 clxscore=1011
 mlxscore=0 spamscore=0 bulkscore=1 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2502100113
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

This patch series is to remove the following 2 APIs:

devm_of_phy_provider_unregister()
devm_phy_destroy()

Both APIs have not had callers for more than 10 years.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
Zijun Hu (2):
      phy: core: Remove API devm_of_phy_provider_unregister()
      phy: core: Remove API devm_phy_destroy()

 Documentation/driver-api/phy/phy.rst               | 11 ++-----
 .../translations/zh_CN/driver-api/phy/phy.rst      | 12 ++------
 drivers/phy/phy-core.c                             | 36 ----------------------
 include/linux/phy/phy.h                            | 11 -------
 4 files changed, 6 insertions(+), 64 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250210-remove-apis-b4e48d4c4712

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>

