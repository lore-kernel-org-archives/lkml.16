Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAE719A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749606961; cv=none; b=l+BAXVVMtVWu/IyKXTjDxRN4HdkpSzwHZ538z/rRlW7lGHbxce5rQoAX4bSr9S79v93Mlc4TbQFlm8315xPYh6V3QyrXJnFiujSZreej9ijgTKy2c9xApiyjEyHy9Rk5A0lxmPg9BZeLaG6p4j4FYMnUGcZJN1T+AY9XrKYAdDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749606961; c=relaxed/simple;
	bh=1SfWLNL/FC1rT/iKltN1seHXevO1sVSorCDWux9W8hI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FlqMswFcsFv4TpqfzzL6JafEFiV9fULmFnkpFbrQljq7wg+QXVgl1oeUbChDuHgLtRRWl6sf+YLNV+nBM4gO+FtluQvJF+Lur1IuIlzf6RINhjq1gKPw+LBIjBwi91j9JFtugkfB2OLBh+ykeD20EvdfI8beCSt78DlTyleBPXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=A0Cewj5K; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="A0Cewj5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1749606799;
	bh=+SFJe2eZwTIqWqiWQneNj9pXOnIVJCo/JcdPa2LLTRY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=A0Cewj5KHhVJlHO2MdfwVJ+4MhNPmSMPDlxyxb8ZqXonxmrLiqZdbUdlR7poS17jF
	 4NSX396rpBpUokm27o1ZIZIRpBr7M9z3dpeEKrbCBs9R2Ch9S6o2GC7kk5qXjQ2/Pz
	 4Tnvz8HFqbKaSs1xuEeYZ3SFOF+zWxpk+MTwPjz4=
X-QQ-mid: zesmtpip3t1749606781t4de0dd61
X-QQ-Originating-IP: 0QfxBbaRoyq0UsyyyeAxau0tGO52HYOorYk3QNPTCA4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Jun 2025 09:52:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8701054459565002582
EX-QQ-RecipientCnt: 12
From: =?UTF-8?q?=E2=80=9CChengZhenghan=E2=80=9D?= <chengzhenghan@uniontech.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	ChengZhenghan <chengzhenghan@uniontech.com>
Subject: [PATCH] x86_coco_sev: Fix build warnings about export.h
Date: Wed, 11 Jun 2025 09:52:51 +0800
Message-Id: <20250611015251.13258-1-chengzhenghan@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: My3twBFsYv2y4h3d1+xVvDbiSGQUaPszPaSMFHkm9WrxLJHqnQAFxU87
	BI5tQLvxC6vyJFamwMeM1ZWFQD/k2239fQexoYuC1NXt2PQrjYh1jCJ0ToOjtYmtztyc8Ef
	RaShNyodNvO5DUZkdHSJFUgJQItOcK727J+w6V+46oFdN7TiD7mFXoh90PhWd9/ILvzkMVv
	13+NJX/8u7dhW9im7ll0HS4EKyIjWHg5HUG4yED6Tnw2+EG7xfiHYMg5ePMK1DHaZqJTTzj
	2c2SgLOcgwS6PgcVZ3QB2ORB6g9YCBy5VNBFKd0lcCdKqM12fPfqoJNEMyw0H0P42IXSxZu
	6jMVOSSSxAZA1AiqbzNwrX1TpycQ5Ya7/ESzWmwCRDp6HJhUIIb7GlajEf0Ck9sYXs1ONGb
	77VsCI/QR8BGg2Rb9SlLjMFxpODA4+bLmAgK8ldtU0Rm24A7hzXygfPv9mIB5EXYEadqM/s
	WCStw3g15+2j1fnx2wgqpU9n9BigdZzQ2XEy740pIdQ3tQGl9Zzcm/ULiD4Ui2EwuhrvDmM
	QAGHDEiX5yzcFXL4rWCnNogbq4iRQqHnYpezSVq4uyCY7Zl60IKsbK6NfWiWD+LLYSa31qw
	q/1CkzWfiZn7s42rTbI3Yc1zESSrUWqC5LpeNrBiME4bGyQ0/Nw1YGuxhhtZAbiuETZa2YX
	UoHf3zT93NOulTc/7Tn2pKBmm7oUTWdeJVdOoJBse+XOutPsbTRDYn2opNMYgxhw22blmYT
	rYR5BFe9h58Tx6xZURCOLbkKTQzsEt53BK0tTnTAsUCN8xOwuHf3uNPYAosgdRHnh8L2SJX
	kC/S/CpoMK7k5d7O9YZWIM9oBD1jIv7FBUqWM26BNRaoWjsUXOYLRrVwoNuBVdgZvRnLt+J
	OlGKd3sI4PZ+z2BWle4Ft0CXRdDHQp21LbhD6gb9sux5Mec48aTLJOV45SFboaQ0fSaC4y1
	BH6Q=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

From: ChengZhenghan <chengzhenghan@uniontech.com>

I got a build warning with W=1:
arch/x86/coco/sev/core.c:
warning: EXPORT_SYMBOL() is used,
but #include <linux/export.h> is missing
so I fixed the build warning for x86_64.

Signed-off-by: ChengZhenghan <chengzhenghan@uniontech.com>
---
 arch/x86/coco/sev/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index b6db4e0b936b..4b5d41bdd58d 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -20,6 +20,7 @@
 #include <linux/mm.h>
 #include <linux/cpumask.h>
 #include <linux/efi.h>
+#include <linux/export.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/psp-sev.h>
-- 
2.47.2


