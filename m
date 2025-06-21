Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7985442AB4;
	Sat, 21 Jun 2025 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750486290; cv=none; b=Ue2ATsCvuBLDEdyKcFZl/Kb6OeOmal7jupYszNsEMpnPiAApN8dsXlg8STOH1Aqq2zhdlMSWKdtczhFXaJ5mqfbwiH5fGGj2dw71oqbPDFlUbw4H2d4KsvqD/VUZp3cq97I9CjOEq171xP39W1WA5B2nGR1Fl5dnr+UFULrZTW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750486290; c=relaxed/simple;
	bh=9mmx6OTtbPPI8z1fZexq9JjJn7cLk6vmTGsaq13W4Yc=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=W86hvnq+pcKV6uR9yiXkN3yHqMGgpgJc1CvhjVztKQvdEOCVS0zYwFhkv4XpiMGDDorj93PsEVeQsvwuPlynywsCTh8kiKXLVnJYT5rCl966gBUxMgnlGBLec1BwOIYTcKhi0fDdvPx4EPHMDTy6oDmpX+/AobU7xaFxoxJhl3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bPP9f3cV5z5DXTl;
	Sat, 21 Jun 2025 14:11:18 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 55L6B2wL044102;
	Sat, 21 Jun 2025 14:11:02 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 21 Jun 2025 14:11:04 +0800 (CST)
Date: Sat, 21 Jun 2025 14:11:04 +0800 (CST)
X-Zmail-TransId: 2afb68564cf8658-ce512
X-Mailer: Zmail v1.0
Message-ID: <20250621141104748JKpvd9iHzc5rfmEKxT0lE@zte.com.cn>
In-Reply-To: <20250613114550088852be6WxL6p3X0fBpGw7h@zte.com.cn>
References: 20250613114550088852be6WxL6p3X0fBpGw7h@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <jiang.kun2@zte.com.cn>, <wang.yaxin@zte.com.cn>
Cc: <alexs@kernel.org>, <si.yanteng@linux.dev>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <wang.yaxin@zte.com.cn>,
        <fan.yu9@zte.com.cn>, <he.peilin@zte.com.cn>, <tu.qiang35@zte.com.cn>,
        <qiu.yutan@zte.com.cn>, <zhang.yunkai@zte.com.cn>,
        <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSMKgbGludXggbmV4dCAzLzNdIERvY3MvemhfQ046IFRyYW5zbGF0ZSBuZXRtZW0ucnN0CiB0byBTaW1wbGlmaWVkIENoaW5lc2U=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55L6B2wL044102
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68564D06.001/4bPP9f3cV5z5DXTl

> +
> +  =========   ===================	============
> +  旧级别       名称			            位位置
> +  =========   ===================	============
https://lore.kernel.org/all/20250613114211728AwwnXMz8tICEzliAEt0t8@zte.com.cn/
The position of "位位置" is slightly offset. Please check again before you send v2.

Except this, other parts looks good to me.

> +    0         NETIF_MSG_DRV		0x0001
> +    1         NETIF_MSG_PROBE		0x0002
> +    2         NETIF_MSG_LINK		0x0004
> +    2         NETIF_MSG_TIMER		0x0004
> +    3         NETIF_MSG_IFDOWN		0x0008
> +    3         NETIF_MSG_IFUP		0x0008
> +    4         NETIF_MSG_RX_ERR		0x0010
> +    4         NETIF_MSG_TX_ERR		0x0010
> +    5         NETIF_MSG_TX_QUEUED	0x0020
> +    5         NETIF_MSG_INTR		0x0020
> +    6         NETIF_MSG_TX_DONE		0x0040
> +    6         NETIF_MSG_RX_STATUS	0x0040
> +    7         NETIF_MSG_PKTDATA		0x0080
> +  =========   ===================	============
