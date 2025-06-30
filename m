Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC0A235056;
	Mon, 30 Jun 2025 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282692; cv=none; b=TdpFoG9PoMXsmqk9Iouw1vS7O3URAkaa8nJzVy+17ymBjOuzoafKTAbuiHgIDPjNkVB/qH5HfJddCsbylIfl48xkeLuv04+GCD7u0pHkLVKYrAVENY4jCndGsFRmlcwD190DTmNVXQ162rdlqtY8u2d7x+yq2uiSH/IzCLC/PdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282692; c=relaxed/simple;
	bh=vDmXOaFg61Wb877I3fCvD/03Zl6rNBUVdNz0g55bENs=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=LjenZ+E4dwd8g7qqz7rUO6v+LUChXYyFYRYtQHYQJj98j/ggpKPNVygLQ6G9DoHesZ8sIl61opinOw40ZcGK+AvZSiz1GaTs6m/m1MWqEbhPP65rWncbrhNyf+89+qx/x5wVUYlRb27MjT+0ESziGNHSVQ52yNSegHDRjjnKHSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bW3jC1byDz5DXWj;
	Mon, 30 Jun 2025 19:24:47 +0800 (CST)
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl1.zte.com.cn with SMTP id 55UBOdmB051251;
	Mon, 30 Jun 2025 19:24:39 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid204;
	Mon, 30 Jun 2025 19:24:43 +0800 (CST)
Date: Mon, 30 Jun 2025 19:24:43 +0800 (CST)
X-Zmail-TransId: 2aff686273fb32a-5b8d8
X-Mailer: Zmail v1.0
Message-ID: <20250630192443193j2wDCmmnHGLns9ki1GXcv@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <alexs@kernel.org>, <si.yanteng@linux.dev>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>, <wang.yaxin@zte.com.cn>,
        <fan.yu9@zte.com.cn>, <he.peilin@zte.com.cn>, <tu.qiang35@zte.com.cn>,
        <qiu.yutan@zte.com.cn>, <zhang.yunkai@zte.com.cn>,
        <ye.xingchen@zte.com.cn>, <jiang.kun2@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHY0IDAvMyBsaW51eCBuZXh0XSBEb2NzL3poX0NOOiBUcmFuc2xhdGUKIG5ldHdvcmtpbmcgZG9jcyB0byBTaW1wbGlmaWVkIENoaW5lc2U=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55UBOdmB051251
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 686273FF.000/4bW3jC1byDz5DXWj

From: Wang Yaxin <wang.yaxin@zte.com.cn>

translate networking docs to Simplified Chinese

Wang Yaxin (3):
  Docs/zh_CN: Translate netif-msg.rst to Simplified Chinese
  Docs/zh_CN: Translate xfrm_proc.rst to Simplified Chinese
  Docs/zh_CN: Translate netmem.rst to Simplified Chinese

 .../translations/zh_CN/networking/index.rst   |   6 +-
 .../zh_CN/networking/netif-msg.rst            |  92 +++++++++++++
 .../translations/zh_CN/networking/netmem.rst  |  92 +++++++++++++
 .../zh_CN/networking/xfrm_proc.rst            | 126 ++++++++++++++++++
 4 files changed, 313 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/networking/netif-msg.rst
 create mode 100644 Documentation/translations/zh_CN/networking/netmem.rst
 create mode 100644 Documentation/translations/zh_CN/networking/xfrm_proc.rst

-- 
2.25.1
