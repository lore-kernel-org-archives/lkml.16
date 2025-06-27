Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700121E5702;
	Fri, 27 Jun 2025 06:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004897; cv=none; b=dOIGEaolPkOkWXdr1piDNOfnKHw6oXarozTMx7KGlcbuPs7IDTy6T45y+JoXKmOFXlQaizDt1yqBovT56tHZ8UVrQcPLUHGmMqNFqSKSEnV6KHbDiUDH9fdf/P7SGSV3KjBBq6MWdMi7bq3VO46HEXH2mU/tJkDfSbLxsodW/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004897; c=relaxed/simple;
	bh=vDmXOaFg61Wb877I3fCvD/03Zl6rNBUVdNz0g55bENs=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=t/za7AwrF8+PVOoicggXJ5QZKMlmP+Vz4AQHXPzJb7QhPkg4sEVBpaccPAgLkvH4SKXjaLhMTILQjHRPMXj/5lriiaGdCZv+0hscKJeXY/XPzUvp6h0pe/7b/5pijtFeUFG3xcU73zfP1cADdE9oGRZJDeh32i6yO+ObvX7wjOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bT4yv2PNxz4x5q1;
	Fri, 27 Jun 2025 14:14:47 +0800 (CST)
Received: from njy2app08.zte.com.cn ([10.40.13.206])
	by mse-fl2.zte.com.cn with SMTP id 55R6EWhc085784;
	Fri, 27 Jun 2025 14:14:32 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njy2app01[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 27 Jun 2025 14:14:33 +0800 (CST)
Date: Fri, 27 Jun 2025 14:14:33 +0800 (CST)
X-Zmail-TransId: 2af9685e36c96f3-85425
X-Mailer: Zmail v1.0
Message-ID: <202506271414338240Wfd8DAvsUIAhMka4zvEZ@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIHYzIDAvMyBsaW51eCBuZXh0XSBEb2NzL3poX0NOOiBUcmFuc2xhdGUKIG5ldHdvcmtpbmcgZG9jcyB0byBTaW1wbGlmaWVkIENoaW5lc2U=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55R6EWhc085784
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 685E36D7.001/4bT4yv2PNxz4x5q1

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
