Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0A4EB51;
	Fri,  7 Feb 2025 03:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738898396; cv=none; b=R72qq8msz/G9BeUyjXOYwsl7Fwjv5ZpYRA8OujFtUtnq17IFZFOPAKH1Z/mlBm8uuw5bJDBnk4IYq0c2K4ytIgiBUDQF3NXWm+jMjQCgET1mo2eK7JalShy0tYXBPtX5vlxLa3tlaBt4kBpZtSAfVGXI0zD7wpTtGf8aeR4fKCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738898396; c=relaxed/simple;
	bh=JG956fzd0jjhmlxEzXChxzrS6pPluJ2zkfnPj+42JTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BgWqNkHr2ngT2o0L3TOzZjC2fV04mcVHnVPU2tAQDPYF5zvb/U+ds6bPLqiG3yyBmnyeGeoudgWe1UCvObshEZkXuMJyeHLJVM94FdIJ5LR4M6MRuyutj1roYjBhI+MKb5138gJo0VP+AVkWUJ+Lj+coY5U/qoqMWYCQgBVEoKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Pyt6U0nA; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Pyt6U0nA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738898339;
	bh=YSXkgYzjJL7wborCG9TYyTnNqOq5SypQ1Pi6JB7VMKg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Pyt6U0nA9QvtcU56VLnjCRbvv5qKHh2ZWjhKmk5BVT4q6SFGflcM0M5AqUrCGdrVx
	 b7iEW9Wb9w18SL5fTJwSpDcxqZ4+TgEMRWo2CB/t4WHvTXsHVHcXpbnOcCMV4VMXcV
	 zuMukEkXD0QefXsVMroIg2D9nuPfPi7FrV1MAVpk=
X-QQ-mid: bizesmtpip4t1738898297t0gn14q
X-QQ-Originating-IP: gjY1fGp2RJL2iF8bGq+qp4sf+tdNAN9lTtRwnSnF1QI=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Feb 2025 11:18:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1343161272209656644
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
Subject: [PATCH v2] docs/zh_CN: Update the translation of dev-tools/ubsan to v6.14-rc1
Date: Fri,  7 Feb 2025 11:18:11 +0800
Message-ID: <EE89209B6353C426+20250207031812.15023-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: MvW0gkkpO9JeUiOgB3s70gG6I0YJZW6apTznjN8tmLJGNRDI8HXwowds
	yAR0mWq8NS6WSk2kHHCbFHZqwhP+czKD8ntZlF1sumnlkvwEEdOZYtnqGiQRCPwXJ306yp+
	ZTtJCADyNsaDaDGHABuyn2oi/UGA0gEFoEUQjBRQznWq0e7VqHaxGFDel9CLQdGMNXd+GuW
	X9/X68gVLEoyZXLZWktsBS5SIzj0FRpWz20QDX4qo/R+ysTL1qlrPHBxyTKUiNUc2gm/SPo
	T6cnEjdGa7lTgyh60FQaq60zoFXrkI5mL1k/uWRFVH0YqPNw2NdVZAxOCLKfWJwGOdVKzen
	r4XnNJPcDGadNDmVtZLB+JxzU5ql89tRl5rQL5zWTRkM8PHF5nCE5E9LjWoHamMBdKRR8+R
	ztEl9XSvwugAfrB+2ezgWifVtslNAQhx6otLvsuteuUhZTxnQIjYCJCcqsGsFFW2Amb/Vwj
	QXKEKhAq/UsZxmk0jp6tIUK0WptbeLNFwPNmjec6CM8nC+uZPnwF5e5w8Vrkm9J5V6hwA/r
	cW4NBafGL/1AZrFoXiD0XCX3vJ3744+EK4rcp6mwB1yl17oeaRKmVJA0+QdQ6Z5c9AGSXj4
	L6UOozbUk8YAhl5rZ/g+fGi12JjHx8YMGcfJNcMBsbkeyBV4hYLmj7H4pZDCbBLKiWggXTV
	Tvp1g/CNDhAElaskrxgKQQxmgSlqFe4mXEyci9HJCIMxIjjXTkJ3woqu73QPkIYdEprtRd4
	fXQM7RHDmBbXdlBqbszSrKA4Pxc8kXbT+klMDf1E/zJz8WTpsmaH93Sorlrvs/F4ynNIMCL
	RbEaj9EGzr6n36qwOri9462NP267JV4ULKJTTnMicUnGuxi8ooOKYkv4DHWaqt9t9RwucH9
	yHltPQZVeTIkH4514Z4IMhfE3Ckzf/Egdj704VygzZKUmCFWrHRBAN2unExctTe1ZQZc75p
	HS8iOrsQDMnAAXL92IzNz1CCXZfPFG+BKi9JIMRdsDJxrvAksNhKYDwKtMve8ddeyChZarW
	MZDxx5Aw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

Commit 918327e9b7ff ("ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL")
removed the CONFIG_UBSAN_SANITIZE_ALL configuration option. Update
the Chinese documentation accordingly and revise the document format
by the way.

Link: https://lore.kernel.org/all/6F05157E5E157493+20250123043258.149643-1-wangyuli@uniontech.com/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2: Update commit title to v6.14-rc1 and add Dongliang Mu's Chinese name.
---
 .../translations/zh_CN/dev-tools/ubsan.rst    | 35 +++++++++----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/ubsan.rst b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
index 2487696b3772..a4d4d4c6d157 100644
--- a/Documentation/translations/zh_CN/dev-tools/ubsan.rst
+++ b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
@@ -3,7 +3,16 @@
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
+
+.. _cn_ubsan:
 
 未定义行为消毒剂 - UBSAN
 ====================================
@@ -55,30 +64,20 @@ GCC自4.9.x [1_] （详见 ``-fsanitize=undefined`` 选项及其子选项）版
 
 使用如下内核配置启用UBSAN::
 
-	CONFIG_UBSAN=y
-
-使用如下内核配置检查整个内核::
-
-        CONFIG_UBSAN_SANITIZE_ALL=y
+  CONFIG_UBSAN=y
 
-为了在特定文件或目录启动代码插桩，需要在相应的内核Makefile中添加一行类似内容:
-
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

