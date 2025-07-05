Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC65383;
	Sat,  5 Jul 2025 03:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751684538; cv=none; b=OYN2knfL8tt5sBjQFbyAYhqbzNxi8z06Z8+HVDIH7+S4FUCVKk/Unrq0DxiBrM4VEl84iw1LFWd6MpIdgK/U4vN6HQDxCu0gxbG7eY8As5TmMWNJjnLsibcd8AmbScfixZph6RcGEHs1FWcQwnDdJ5zbSxXgzhMK7p85HidAjAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751684538; c=relaxed/simple;
	bh=fdiGC8bhQaX0BotlomYJe2SFnwBYra8yIn3Yr+p1ClM=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=f0PMDOa3YkyhHzHLwUOB3fRJ+rVLpjXjJ94NqDQduIFEsJnK6lDqvh9hjRH+g0Yqa9mskxhHH/XCkiQwe/1XuNO0+rsQOh55u12kcw1pmxW+ci+SCbczX62ff8FbavNBWMavQS6qcsHTIXWVk20vrENY8oFnefF0jpjnKts5bdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bYwK00mQ3z8R03y;
	Sat,  5 Jul 2025 11:02:12 +0800 (CST)
Received: from njy2app02.zte.com.cn ([10.40.13.116])
	by mse-fl2.zte.com.cn with SMTP id 565327gt064363;
	Sat, 5 Jul 2025 11:02:07 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njy2app02[null])
	by mapi (Zmail) with MAPI id mid204;
	Sat, 5 Jul 2025 11:02:08 +0800 (CST)
Date: Sat, 5 Jul 2025 11:02:08 +0800 (CST)
X-Zmail-TransId: 2afa686895b0728-c797c
X-Mailer: Zmail v1.0
Message-ID: <20250705110208457-jq3LiPPAxR6f7WxKIsfO@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIHY1IDAvMyBsaW51eCBuZXh0XSBEb2NzL3poX0NOOiBUcmFuc2xhdGUKIG5ldHdvcmtpbmcgZG9jcyB0byBTaW1wbGlmaWVkIENoaW5lc2U=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 565327gt064363
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 686895B4.000/4bYwK00mQ3z8R03y

From: Wang Yaxin <wang.yaxin@zte.com.cn>

translate networking docs to Simplified Chinese

Wang Yaxin (3):
  Docs/zh_CN: Translate netif-msg.rst to Simplified Chinese
  Docs/zh_CN: Translate xfrm_proc.rst to Simplified Chinese
  Docs/zh_CN: Translate netmem.rst to Simplified Chinese

 .../translations/zh_CN/networking/index.rst   |   8 +-
 .../zh_CN/networking/netif-msg.rst            |  92 +++++++++++++
 .../translations/zh_CN/networking/netmem.rst  |  92 +++++++++++++
 .../zh_CN/networking/xfrm_proc.rst            | 126 ++++++++++++++++++
 4 files changed, 314 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/networking/netif-msg.rst
 create mode 100644 Documentation/translations/zh_CN/networking/netmem.rst
 create mode 100644 Documentation/translations/zh_CN/networking/xfrm_proc.rst

-- 
2.25.1
