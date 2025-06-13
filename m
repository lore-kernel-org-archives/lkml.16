Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BD715278E;
	Fri, 13 Jun 2025 03:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749785057; cv=none; b=dW99rrgXTYlLtfSvIXAxXoUfWfF2/Fe6+d1KygXj2KrhYsTduljDwZPwzmCNUKqF0IWeG1q9E9Ivhy7NOe9k1FFiZDh8C7SLv95brUqJ35NL4JQFjtgCAIZjvUyfUnYdAgDO6LLbWLZUWqQgmqfeEp4w+PElUtQebkUqeTr3XLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749785057; c=relaxed/simple;
	bh=yyeLGIyAbT5orxPztIHdRGsufDgca+wblmCYmTJMIhQ=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=bp57Tuejc/mDnd9yBdWd7g/OXB/Sp3M8njFR0nuMU8e1wtX5vr+IQQVnLC8YbN47+O45U0+4VPGXvBIhNdfzmS4UkzXjO/86CJGAetpVUuXh2i2s1iupkN4inmzNhiZa72m+ACUutNv8BHobex6r7mlXdhOBnFBLLF6/BAAW/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bJPrM44Q6z51SWc;
	Fri, 13 Jun 2025 11:24:03 +0800 (CST)
Received: from njy2app08.zte.com.cn ([10.40.13.206])
	by mse-fl2.zte.com.cn with SMTP id 55D3NulG075308;
	Fri, 13 Jun 2025 11:23:56 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 13 Jun 2025 11:23:57 +0800 (CST)
Date: Fri, 13 Jun 2025 11:23:57 +0800 (CST)
X-Zmail-TransId: 2afb684b99cdffffffffcb2-bef5a
X-Mailer: Zmail v1.0
Message-ID: <20250613112357830opyPb3DK8AEbbNPPJBTrM@zte.com.cn>
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
        <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHQgMC8zXSBEb2NzL3poX0NOOiBUcmFuc2xhdGUKIG5ldHdvcmtpbmcgZG9jcyB0byBTaW1wbGlmaWVkIENoaW5lc2U=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55D3NulG075308
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 684B99D3.000/4bJPrM44Q6z51SWc

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
