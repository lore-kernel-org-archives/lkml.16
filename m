Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48661401B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 01:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743989180; cv=none; b=COf0qOC6ySl2moJTjhPOWBdT+CVH9Bgr6CHY6s2dBV474Rk5qNdHN+B4A77Y3gMBM0Rxve5gYSovVhuCkVrJ1Dah+9MiXJxmdMZ14Fzv9XCEPIjc777zLE/FQdx4dzIQ4lnZZGujGjuEhEDgrfHCUvsbta6Ngpi24JvgF0Ucys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743989180; c=relaxed/simple;
	bh=jnGBOiv+RYhuCQ1nIvJ3OOpkXrAHlA2ONpbAI3RjY1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K9401c7iQ0ZEyaowR5TE8V4gqj3RfNo8wrRrwDzDZ8yf0sav9YoG6t9fxH0Gm7GczoyC6DlqF8zQc77qHmN0nUbuGlxzAkToCcHsp8iXbrMt8FIX5pycm/aQfdAxgU/qKFU/yMIoqgP05pFQullC2FlvXifb2updZ0S31bcm1wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=GLkmjS65; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="GLkmjS65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743989156; bh=/OIJU9QPMxtFCYIcP7p8yixB8viOTUvvg7p+Re86knI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GLkmjS65z0djvW9BAKR8pe+FH/J8WKxAesTYsn1P+niqH+XDknnCz8lrr3a85h2tk
	 hQw9nCZmmYIenay/j0EC/b1QQper7xJ0bqelngioLa3RGCEcjlbLsfrj59s2174+zR
	 LvWVv5heCUrzWvozX2AxUvCdU4TynLeMFmox1GdQ=
Received: from [10.42.13.21] ([116.128.244.169])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 675B6ADF; Mon, 07 Apr 2025 09:25:53 +0800
X-QQ-mid: xmsmtpt1743989153tyv7wq22r
Message-ID: <tencent_6A42A1EE91831C3D5B94CECC5F8B12C3B107@qq.com>
X-QQ-XMAILINFO: NySneyYf/AjRBuw7u62X6Bzn4S6kIUfuTENl0LNV/au7n1wtpWG8htnPxbPS5n
	 wNd3KZZpjBZ+A6rYKfcH2bVsYgdfdGk6Fyf6p/8V1KNLEU74KbSF7l5MM1VmG9MDif1P4v6nkBqr
	 kTI4qwk5+hoqANiQ9Qf+pi7OiB2M78kZ3VW7fU4i4IVM5Wi7E3Rsh1BVYhsavZ0GGE7Us5iKsuDz
	 DqRA0As94KaeXyFPDQLMILY8C3rkg5Q9nIINpfydu+56kcPfWAsOC1rEvg20cAv9JP+BYJ3FWONb
	 DsUaAwN6oAJLC57heindqnTTLk2/1ro7XEQnxKPEir68ZR06yVV/YPpMYBxWWr317eRn5nxNX60q
	 d8C2EyweuqlfUF60Q50OzB/Ykm+SrMZ1RkLgifwViv7yx3EucM5KEhmUTvrNWk/ME+pGVRIPgt8B
	 iyeNOrX/tJmBcUvtn+R1WOSrvlFBBVQm8z9j5DObPEeLNArk9fs0xt98PyE0VzB2s7sJyhbjV0Uk
	 uAYvsq29XOq625JN1A27ExrbsU+sot3Pnad5q9s5pSE1sdz9Wxq4eBDnw54DtXApzOmgcEO2CHWj
	 uEtx00/zMHu+dt8tWTHjdaXmCbh3ctKRZ+gXA2BOD4FDXFkBn48CaMGyOvTX+dcSLyoDu9u/dpeC
	 KP92/KUfu2s1Bu5HcSH8gCFMrFrPT26ZQ7wYCpXBTm4jTZsm1ORoV9AT+6uJJJSwr4Pd/WXtcmoX
	 JdyC9xHuwyLCCJuPjiKcq1MpGsv+yA1MzfXkaG+8ldBRHdfY0yPeqMO3isG3GGGninLcZxddCzv2
	 e1lehheUJVGcOoHQF4WjN/LAqmiZdxHMtyUxFgjBPIhsFEvawLPahhvevTcf3GMfqIMV9UbFh0iv
	 VCXeX63ze92vwPeesrOU9goZIwjvGXKZS2sw2tq6fvbRZlrHdEEv1L7siV+EKoAPcztkHqkiIPWr
	 TnbP1sJC0=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-OQ-MSGID: <5f596d63-b11e-4728-a782-4551a0eead04@qq.com>
Date: Mon, 7 Apr 2025 09:25:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] nvme: Add sysfs interface for APST configuration
 management
To: Christoph Hellwig <hch@lst.de>
Cc: kbusch@kernel.org, axboe@kernel.dk, sagi@grimberg.me,
 chaitanyak@nvidia.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yaxiong Tian <tianyaxiong@kylinos.cn>,
 alexey.bogoslavsky@wdc.com
References: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
 <20250403042504.GB22360@lst.de>
 <tencent_D00C9DD2BF00258063B042172328396DB608@qq.com>
 <20250404082950.GA8928@lst.de>
Content-Language: en-US
From: Yaxiong Tian <iambestgod@qq.com>
In-Reply-To: <20250404082950.GA8928@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/4/4 16:29, Christoph Hellwig 写道:
> On Thu, Apr 03, 2025 at 03:05:37PM +0800, Yaxiong Tian wrote:
>> These two patches don't fundamentally change the APST configuration policy,
>> but rather enable users to configure various APST parameters in real-time
>> across different devices. As mentioned in commit <ebd8a93aa4f5> ("nvme:
>> extend and modify the APST configuration algorithm"):
> 
> And who are those users?  What tools do they use.  What settings do they
> set and why?
The three issues you mentioned were actually partially addressed in the 
previous email, or at least touched upon.

In any case, I agree with applying a universal setting for APST, as I 
don’t have a good tool to handle this either Now.

