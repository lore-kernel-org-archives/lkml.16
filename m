Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7239A42AB4;
	Sat, 21 Jun 2025 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750486428; cv=none; b=DD5NK3iLYHbQRlXutZLtUHTXfEf33gwsitndDuA9hHdXox1M99kf1k9rHT+YSHWNQATlIy878TWUCt4TVMlW8JXKN3oD0gKiTRoG8QpMsqzd0BnGCfzZcZjEjxol/WsvTPONjPB1jkVgLMBgr9Hjv5Wmf/jI5Fon5vCFgf9xsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750486428; c=relaxed/simple;
	bh=+MFPLH4Gx4kKmyet7Yf7HYWSSo7bAmrt3yU2CCSMjR8=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=MCVjnrZT2C421B26rb/umpUx8XM8LfoeDEGP5VsqaKvejaN0r/VMk8awFfTa6yLoZrC7sl1JoaxSckowP6bM4gJ1OS0GnynUjW8s6yW/MiohVycsunTUBzPhKbOGYI+waXFFR2iJo/4lL/GyjVBCaSq4+bhZNcnAUyTsovNCkpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bPPDP6T0gz8R03y;
	Sat, 21 Jun 2025 14:13:41 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 55L6DUru045308;
	Sat, 21 Jun 2025 14:13:30 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 21 Jun 2025 14:13:32 +0800 (CST)
Date: Sat, 21 Jun 2025 14:13:32 +0800 (CST)
X-Zmail-TransId: 2afc68564d8c4f6-d43aa
X-Mailer: Zmail v1.0
Message-ID: <20250621141332600IBeDo5rQkiGqGJB-pegOm@zte.com.cn>
In-Reply-To: <20250613114413940fzngS9J_4rTlJabuvcRv1@zte.com.cn>
References: 20250613114413940fzngS9J_4rTlJabuvcRv1@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <jiang.kun2@zte.com.cn>
Cc: <alexs@kernel.org>, <si.yanteng@linux.dev>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <wang.yaxin@zte.com.cn>,
        <fan.yu9@zte.com.cn>, <he.peilin@zte.com.cn>, <tu.qiang35@zte.com.cn>,
        <qiu.yutan@zte.com.cn>, <zhang.yunkai@zte.com.cn>,
        <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSMKgbGludXggbmV4dCAyLzNdIERvY3MvemhfQ046IFRyYW5zbGF0ZSB4ZnJtX3Byb2MucnN0CiB0byBTaW1wbGlmaWVkIENoaW5lc2U=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55L6DUru045308
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68564D95.000/4bPPDP6T0gz8R03y

> Subject: [PATCH linux next 2/3] Docs/zh_CN: Translate xfrm_proc.rst
>  to Simplified Chinese
> Date: Fri, 13 Jun 2025 11:44:13 +0800 (CST)	[thread overview]
> Message-ID: <20250613114413940fzngS9J_4rTlJabuvcRv1@zte.com.cn> (raw)
> 
> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> translate the "xfrm_proc.rst" into Simplified Chinese.
> 
> Update to commit 304b44f0d5a4("xfrm: Add dir validation to
>  "in" data path lookup")
> 
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
> Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>

Reviewed-by: xu xin <xu.xin16@zte.com.cn>
