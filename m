Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7978D22D79D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128808; cv=none; b=lUsUVwn9xXFkxg+PPZaMatMhsb5JH01unWId4e/LuRpUUt4OXps4Ryg32YHic5b4TxNCsZCqtqp5CMxHQiAWIhGLi2qUOk4n0rEwftx7jqG7DGs/XbM8PucgEoAMLP/nmLLB7IagFZ6xB7nN7iQ/AP585XjD5JWSkJTUHglLeCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128808; c=relaxed/simple;
	bh=/8Lgt7AKgNy/yDj5PsFIIZ/OI++yjozIZZNWQd0Jg2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E2ky8HwoXhjxm0ZS23tZnDR/Zlm9FLoaiviBw5yVlO3oan4IpK1PYazIuW3VFIYBTVSJxYCAFWXs6T03pjwSYHuaPH9dRF8fnkJdBModWoVaecnOKy3Q7yQnAAhoHFP/VF9g/FXouExuGGRQ38jzvmLlL5IeryjzpNb7wF64zF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=T9Mw1ZCd; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="T9Mw1ZCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744128769;
	bh=/8Lgt7AKgNy/yDj5PsFIIZ/OI++yjozIZZNWQd0Jg2I=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=T9Mw1ZCdw6VmCwcNeQ8NyuErcuE70NIe6GHvHBoSCslDNc/geczEXqIH8WfJ98S9G
	 mdzBbKL4IIrSPUAT/tFYhqQw3d4MWElJ55GzfJIjLHUFXq5aQmhK4gKAgP9ieY6nn+
	 4xM68HH+OwhHKOA0cZlKOFQxEvQvxxGAjH3JmlR4=
X-QQ-mid: bizesmtpsz9t1744128763tb211cb
X-QQ-Originating-IP: B3aoT2lfQT7lhb4CK9eX2m41pUeTGC7vlEq6PnA9Zbg=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Apr 2025 00:12:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14729311663327765348
From: Wentao Guan <guanwentao@uniontech.com>
To: yangtiezhu@loongson.cn
Cc: chenhuacai@kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH] LoongArch: Handle fp, lsx, lasx and lbt assembly symbols
Date: Wed,  9 Apr 2025 00:12:39 +0800
Message-Id: <20250408161239.1023788-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250408092907.22856-1-yangtiezhu@loongson.cn>
References: <20250408092907.22856-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-0
X-QQ-XMAILINFO: NRN3UPsLzYKVqIrPzeEpHTRKRq7s/4DCgNDwMWIe0+UiIz4mph4S3ZU1
	LWI1eS7ChDVbMfg2oou0gd2elwvFTwy7tkX8jL0dEB5GEcANibimH4Z+DsJtGc8TDsL5pjC
	+zuuWmzuCzd1QXUhoztriJA0ge4o4cBKTikEPsw6SZQDM0RSg8xRStaf0RyBqAAIqNyleSu
	G8krFAVl5tla39YHVGKUNydR3kzgkuGQ3I5rB7CQtPp56URfMsZUQ3aa+FSe/Qo21XWLKoA
	FJqm+G65FS8QHEqYrns+LqWsYXOmckxLfSHeVI3x5isZwPKMBMVm1qDgt7LAoLvss0LjrI2
	5wN4ZjxBJXnXR+YOmGr0GG/+kBOFGUkfArXGFxzfzlyND2QY5R9QDYRZvnP62DeTjTsSAzG
	Kw+nrNf6KLCBmPu7YiFpCEKKrxro95hL8VkDDL1RNCaY3ZQ3KTqMUFsXy1iTdSommaAwC2p
	/gulo3Jx0A6qPRL+d5FCFSWX9CQeUHalQDrTBjeXrQQKroRwXy7g4vFMSXS5xlERD3QpiZb
	XZi0WzhFlsCV5+eM/Ohx9iRtbYeAP96ywt528SPweH55v5kNz+RGwCynIXsmxucQJPe4AIa
	0ufi/rUjGny1IcKKjOI7Ql7ZUiuePMe6a9I3J+aeLbd8ybK6LeALiokmh+WfGCetvSOOLEc
	78OSmEiMAMSL8SholdfBahMTcg2dbFT6fuJefdqT123k0FF9Hq2mfsqenzCOYxNY9uVbOmR
	1McDOixyhdtCBFDlGr0Hl9aFizxtRZoRWDzA1USKlHz0n7SE1PUoLBPesFoIEltWBo4sbJF
	xqrS7orMkYuxhsPuwF+cpDjC8BLLN3n7Cz7Frib4bf2eYUd630tAMIwT+5LzRb25meN5zmm
	K8aDA4/1hPCa8A0NgttnVgx8jL57CIa18ySjeNtlLC0DW+Hn405pmKhXS+4mgGelwrclEry
	UcJPF43fAqLhDnDVpc5hUxG/Qfo1JRYnIal0e1a8+ovzlFPE1yxzJBN/A
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

Hello Yang,

I don`t know why change it defination remove "asmlinkage",
why not explain it in commit message?

BRs
Wentao Guan
