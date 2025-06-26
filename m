Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CC31FBCB2;
	Thu, 26 Jun 2025 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750934963; cv=none; b=TvK0lCzFaNHVkfJ9tiiltZXahfeucEPdus+l5dB+JJ/tZIwhnPKXJyGABSNy96IuZA1dHV91G3DI/1txgTrfdz5yv/S1RSZskIf2ClWamTP8Q632gXirIxsmeCAKGP3PpfNK8MA1fx88o1wSAJVG6KYAkkKOQ4OoHsYHJbo2d0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750934963; c=relaxed/simple;
	bh=yyeLGIyAbT5orxPztIHdRGsufDgca+wblmCYmTJMIhQ=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=okAhbRodATsF8nDyuz0atiqok6gXnB7tOWgZ1R2R01WL1d+EepphciBfOBP9PutoinbhrSKe4Pv1KCpepfyCa2tk0+yPxOaAX/YWTK9aE2wXAlajFx5QhVu0gg5Ce7TifzoJgh8kANZD607as8bD5xase6tPwoIfSNMx72oL8eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bSb6008SJz5DBq2;
	Thu, 26 Jun 2025 18:49:12 +0800 (CST)
Received: from njb2app07.zte.com.cn ([10.55.22.95])
	by mse-fl1.zte.com.cn with SMTP id 55QAmwem008232;
	Thu, 26 Jun 2025 18:48:58 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid204;
	Thu, 26 Jun 2025 18:49:02 +0800 (CST)
Date: Thu, 26 Jun 2025 18:49:02 +0800 (CST)
X-Zmail-TransId: 2aff685d259effffffffd74-58fce
X-Mailer: Zmail v1.0
Message-ID: <20250626184902136dyn5tEjdz7Itti3cGeEed@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHQgMC8zIHYyXSBEb2NzL3poX0NOOiBUcmFuc2xhdGUgbmV0d29ya2luZyBkb2NzIHRvIFNpbXBsaWZpZWQgQ2hpbmVzZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55QAmwem008232
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 685D25A8.000/4bSb6008SJz5DBq2

From: Wang Yaxin <wang.yaxin@zte.com.cn>

translate networking docs to Simplified Chinese

Wang Yaxin (3):
  Docs/zh_CN: Translate netif-msg.rst to Simplified Chinese
  Docs/zh_CN: Translate xfrm_proc.rst to Simplified Chinese
  Docs/zh_CN: Translate netmem.rst to Simplified Chinese

 .../translations/zh_CN/networking/index.rst   |   6 +-
 .../zh_CN/networking/netif-msg.rst            |  93 +++++++++++++
 .../translations/zh_CN/networking/netmem.rst  |  92 +++++++++++++
 .../zh_CN/networking/xfrm_proc.rst            | 126 ++++++++++++++++++
 4 files changed, 314 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/networking/netif-msg.rst
 create mode 100644 Documentation/translations/zh_CN/networking/netmem.rst
 create mode 100644 Documentation/translations/zh_CN/networking/xfrm_proc.rst

-- 
2.25.1
