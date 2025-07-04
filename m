Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087121C28E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 04:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751601622; cv=none; b=uJUucNsVWBqEku3bE02zegkTh3KmGu2SvfkntOaxpDaR8bU5OSttjIy21h3j7EGncmlD/sW+42XIYRFPtjsTFGrx0db0OQFX13UeV7FMhFhZgAKb3G1+MjCOc30P5YeaWNUX+Rt3xh97QOP2mYd2emtdwPclo+gEt0yZ9y+5xBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751601622; c=relaxed/simple;
	bh=70HlwFGz4/xkQt96tmzQI9PdhzymJpHWbK/YZVKOeNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FR+yJ0EEU8ykJah1mYNbihUKEdwlJPCgB9ao95Lv9b5Dqub546xHkbH4mB6s/g19GO0FZJUVh0aP54Y4GoXh17iuw4dZCR/Qu0SARJotKebEYIsM0AJeRQtUc8ArMTr70/49A3j2FhzInjF+EIKNk2bmVwkgUCpcDsegr+l8r5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Rdl8Y4KC; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Rdl8Y4KC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1751601607;
	bh=5WdAXnpdN01wWizT19/bRBejCrM46FxmZi0oSOJeQfs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Rdl8Y4KCUnuNzb9QTE9tbJCIOVGEy6f0sJKS5ViWUDRximtiYEXpbHHmV4Dqt9nzP
	 FlzP1pgiioQkbko6hbQBljLcz60SY8UzyaosZ/FTpTKa3kA/ZbyQxctuTJ91+wOEx1
	 DTEIRxBCp3Ksno0KXF+UNTh8Iro68sT7fIj5Ufq0=
X-QQ-mid: zesmtpip2t1751601591t0f0f8d84
X-QQ-Originating-IP: VGp0x93czLDnQk1UNsF6UZDHq9AcP6vBf9swN7t2mU8=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Jul 2025 11:59:48 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16936787269720412939
EX-QQ-RecipientCnt: 17
From: WangYuli <wangyuli@uniontech.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	wangyuli@uniontech.com,
	yujiaoliang@vivo.com,
	cvam0000@gmail.com,
	colin.i.king@gmail.com,
	jesse.brandeburg@intel.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	wangyuli@deepin.org
Subject: [PATCH RESEND] drm/uapi: Fix typo "restictions"
Date: Fri,  4 Jul 2025 11:59:26 +0800
Message-ID: <35295656C43C4A38+20250704035926.259228-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OHdwp/wHqRH6LxBu5s7Dmz47Eqf4A7eTudRc6PHkXog7K9MNS0EICh2K
	MYByEkdjOzVvCjK7HKunxU6RWXimxUcueOIpiaXJiWAykBFHJKNOUpygtnTusjCJcCbRi46
	l5f8sMPEXisFxxGpvIOP/2G/F3lAKNlMzami8zTcbwSeZeXsaBtHalUO6yHACid9HTKyiPT
	a0Ps+AfKenAI9AD8mCLv9kEuwP3Zxz5ITfDbMv5429RFh5TlAefxPmcPk2WkeAhVK1VVJX1
	Yk+hojQMwKR5x5xgxA+ou6FHCNkWrx3X6j+aakMMt8WBew8y3GcVFgRHWSZDHxo7clwdEnt
	IZMgbK886a6UEJiMyE/MrfbXuKTVk/ZOzafUMjGIbUXNi0SyJi9MEVfRQ2HxirjBNnym1E0
	AkirvlNpsEUNBOeNoCTALk8E6oajTapFf8G6BYDxWTdusNx6WkpkKH3wwbrx0XqLLTPWQvq
	f4vRfE9Xrvu2LDVHitoR8EHPmseJCYaV5dSTNi8aCcdQwyJZgAPEe5tWGjte80lC+0I6HuY
	UOga08JJTl+sFDBHxcDXLhdC7U1fh/ZtgefVAjhz1+GLGgTR+qCldAXpsY3y0hwF4EtaU8x
	lBx2s3HkEwQeohnozSMV9gkAeIXA/QKYNWhELY+ytVBoCaK5hjQkTja7nYAeRg9WXwyS+HM
	Nv/9hEcBSJpvzKxbfoU2M03Ouuw4uXTF3x5D9ML5GfNN1PumQp+3mdLfAyk39vzLcbOBBrN
	w3Y80Bn0+I7nyhH7cvjyb7LeDIPfDqLmvR35LyxYnT4k+MlL0chgtrX+NgHzdbYEz5Nmfh3
	PjePlp6ZuAOAWiN/BhzRawRVH+qNBfRuD8a2/94CaHJKqsVk5rDuGviLhxLJw1HSTjdMa/w
	MFtwl+KwLiRrlgUN41rCrrSpsvK3//2ahVyxRvCNPBvMonfhgQd62rnKv5htGoDQ3T9xjun
	1knZ3vSuxJjiTDH8mq5t2ZPZ9JCqXjNvtFAGV0Jh6qrXt1IBFsS7JFvxWS2Okj/NwUoCyJV
	5Oqzg7dY/EwzcJX9UuqC2sw5mMPhIWOH9KURSnlbIQIzl5wDKCoaMiQYDg91P12NK3t13Jz
	A==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

There is a spelling mistake of 'restictions' in comments which
should be 'restrictions'.

This typo was not listed in scripts/spelling.txt, thus it was more
difficult to detect. Add it for convenience.

This typo is reported by GitHub Copilot code review. [1]

[1]. https://github.com/deepin-community/kernel/pull/796

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 include/uapi/drm/drm.h | 2 +-
 scripts/spelling.txt   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index e63a71d3c607..c996d19cb2de 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -860,7 +860,7 @@ struct drm_get_cap {
  * cursor and have correctly set hotspot properties.
  * If this client cap is not set the DRM core will hide cursor plane on
  * those virtualized drivers because not setting it implies that the
- * client is not capable of dealing with those extra restictions.
+ * client is not capable of dealing with those extra restrictions.
  * Clients which do set cursor hotspot and treat the cursor plane
  * like a mouse cursor should set this property.
  * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index ac94fa1c2415..c33128db7163 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -1406,6 +1406,8 @@ ressizes||resizes
 ressource||resource
 ressources||resources
 restesting||retesting
+restiction||restriction
+restictions||restrictions
 resumbmitting||resubmitting
 retransmited||retransmitted
 retreived||retrieved
-- 
2.50.0

