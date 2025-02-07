Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CCF1A23BC;
	Fri,  7 Feb 2025 08:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918202; cv=none; b=qZl8SeS9AfeIV7zegByx1zLFuyWJzl7ArjnJl1fSi1hZ8+koC7MzoyNMbvdWUdhN1Qn/+RlhyxRu74MNas6m6aJMV6TsjduwqAiDCVGVS62dLTatQUFcp+V/EyQhTaMHL+DgjA2ESfQhCL5l8iOSC8mmgaD6G7SRPH2aWwRq8Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918202; c=relaxed/simple;
	bh=RvT7ceav2ulZoumLYX4OwfPhasbCecJb0uc/GuUMOrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S9Z5U6BGkW5/WrgaaQJBtwJCOUSSVEwjWoSlbLCvdyQlfah/YeW/4fDi3d3ZSlqnPQkBT9jq9Cf5hjeJRQMRvn54krXqKgcNYPo/3aqoRmbZm/4Msab27IJWErMq83nYJDqxmcRBhdpaIICi2/ElcOU4noMjpySoXDIkKoQ3DWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=cJi8w9l7; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="cJi8w9l7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738918167;
	bh=Lyjfzo43hCAvlzwr0teZPXFO+ZX/A/SuD8AQPlwn05c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cJi8w9l787+1xqnhmOIhjQxajz/MNmFfjPCG+BiuK4z1P1SuXjvmg3OU+dr7p5H1w
	 ICzuwmNT8VwW/6O4k9Uee4ldBD58uKA6cX8AqqrA0yM6fujKxgvP2JGuChwqzCJ4EH
	 +qLOC9+GfGy5YwqeKLvv8J/iTzioh/yZsuUV0KMk=
X-QQ-mid: bizesmtpip2t1738918123tw48m81
X-QQ-Originating-IP: N5s+X+DLJ3KmALzUkgFeLnEHeLXAFOMpykKZVnwzkvE=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Feb 2025 16:48:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13814370064081462953
From: WangYuli <wangyuli@uniontech.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net,
	wangyuli@uniontech.com,
	dzm91@hust.edu.cn
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com
Subject: [PATCH v3] docs/zh_CN: Update the translation of dev-tools/ubsan to v6.14-rc1
Date: Fri,  7 Feb 2025 16:48:20 +0800
Message-ID: <2B33A00C9F5BECC7+20250207084821.251531-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Mbko2vceDzPNyxRtgX2+YpyJ3k9b2AS3SKjOoRv5xbewraptVQOxjPSD
	qwn4viLz07GB9AhL30YdDSgMlgTt17Tn5qxxjUy3NQLGGhPtFwOa5CukD7GU2dm9K/FI2Zr
	DmKYBHkijhmN20lh3b9iYLYUhqEs7GSARmhP9kKTBLLJGR9eMbOxEB2YJGKUjTH4zuBL4qQ
	oOxjWdi85MLSPkfQDvSyXPKrmoEJcljAc0njpKRBQezaeDcYfARmmEwmwXsg0ltqJqpyaub
	Z7WmoWMXZ+ZMSOzsqzF2zN39IGNAc2uPHqhajOvEiiYxc0dItCF2TwEsCfwMGMI+BmL7vWd
	eCEdfXNEQhBaWrBcTay0yNiiN2AiOWeQXedA5hlloY8y6s7Mp695gSppRCVIpQQZ5YXKZnr
	Y9bNODOJW4QQ4SkJo7mTBXkxJkmlYJw3nimEA9WMT7/T2VHUpVqzC1hQdrJjlrp/xZxtz+v
	8FGzZqy9BPBbMiwUEC9dyucgVbR0hUkTceRu9oINitKlgmTXblwQanU1YZtWDMipkpL868G
	j88vOVPH5P/DjFjvrRSdP9HQ+AicILiO+Y+260VJk0IxhnAe4EIQec20XnQcQrZqSjitVO+
	GMP0qkVHHCVAQcFizYEPlGT2sq2Z+KH9pntQ0aP1v3vfuoSZuQ0/iU7OjDAMx+heJoJs8ys
	zq6RzgxKo9FYL7Klx5XoBw5JqQaooFsC97wd+T69UyDK0ucp67V2XRZJh6Ob5BdXnx2s7va
	I/aL6Hp44dnSrzUPAedU4mR4C6Ig0HiqAhCeOuT9Xiz8AHx2Wu+ulhAhdXLLebpk6YdjGE3
	9FwCWjIF9wJ5ko+3mMkm3GH12YGmr+Zp1mIJ8VZDx/0+uSQLZSjTIBDvfG3cy6q6gUS6b+P
	0gc1IFZHGg2HjbatzyKE6yN2rxQDfLF+9GwxKfnnaRiq6PmLTnwxthoqXZG57hnw957lfVd
	A7n3HMMAw2hKf281ztWdjgt7umMKk0dZ4u4lOWGgaCgNUSOCHQds6FTDapx20KbR+9X+S3s
	5FfnoelccyX5msjTG0
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

Commit 918327e9b7ff ("ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL")
removed the CONFIG_UBSAN_SANITIZE_ALL configuration option. Update
the Chinese documentation accordingly and revise the document format
by the way.

Link: https://lore.kernel.org/all/6F05157E5E157493+20250123043258.149643-1-wangyuli@uniontech.com/
Link: https://lore.kernel.org/all/fb3c5ec4-eabc-48c0-bf0b-d20cad978b4f@linux.dev/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2: Update commit title to v6.14-rc1 and add Dongliang Mu's Chinese name.
  v2->v3: Remove the ".. _cn_ubsan:" tag.
---
 .../translations/zh_CN/dev-tools/ubsan.rst    | 33 +++++++++----------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/ubsan.rst b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
index 2487696b3772..81ef6f77caeb 100644
--- a/Documentation/translations/zh_CN/dev-tools/ubsan.rst
+++ b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
@@ -3,7 +3,14 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/dev-tools/ubsan.rst
-:Translator: Dongliang Mu <dzm91@hust.edu.cn>
+
+:翻译:
+
+ 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
+
+:校译:
+
+ 王昱力 WangYuli <wangyuli@uniontech.com>
 
 未定义行为消毒剂 - UBSAN
 ====================================
@@ -55,30 +62,20 @@ GCC自4.9.x [1_] （详见 ``-fsanitize=undefined`` 选项及其子选项）版
 
 使用如下内核配置启用UBSAN::
 
-	CONFIG_UBSAN=y
-
-使用如下内核配置检查整个内核::
-
-        CONFIG_UBSAN_SANITIZE_ALL=y
-
-为了在特定文件或目录启动代码插桩，需要在相应的内核Makefile中添加一行类似内容:
+  CONFIG_UBSAN=y
 
-- 单文件（如main.o）::
-
-    UBSAN_SANITIZE_main.o := y
-
-- 一个目录中的所有文件::
-
-    UBSAN_SANITIZE := y
-
-即使设置了``CONFIG_UBSAN_SANITIZE_ALL=y``，为了避免文件被插桩，可使用::
+排除要被检测的文件::
 
   UBSAN_SANITIZE_main.o := n
 
-与::
+排除一个目录中的所有文件::
 
   UBSAN_SANITIZE := n
 
+当全部文件都被禁用，可通过如下方式为特定文件启用::
+
+  UBSAN_SANITIZE_main.o := y
+
 未对齐的内存访问检测可通过开启独立选项 - CONFIG_UBSAN_ALIGNMENT 检测。
 该选项在支持未对齐访问的架构上(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y)
 默认为关闭。该选项仍可通过内核配置启用，但它将产生大量的UBSAN报告。
-- 
2.47.2

