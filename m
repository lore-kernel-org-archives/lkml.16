Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CB017BA9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750988090; cv=none; b=qwTB9VUtg5LIIBwFE8UMrsP5cbrUPvIp48EZEiEp47LyzuWEaIsGMX5dZ7WvPMjJ8fZi9H6iqup3RQEzbhSvTw/q7RLgLo18j+ZV1xzFC4ucKb+8JCy53+rSY12fZcKlowF7TodOYmKTaeU2SUCDT7LrpfTR1hvSff38gF/KbaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750988090; c=relaxed/simple;
	bh=Rmob01qK3QFpZfCIwCxr1jzqXeSX03Xi2A0TH4ouipY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/eJnVDxEwFMsf/O1L4XYlcs1e9jxyhnAIG/Xk87rUdjtMZVahPCITHy9ZZzMhyIaJZ6sojaYeHjwMsP5XSCovYSX3B+o+qOgTVutcKw70JcdYp7TISYYhpk6rsIP2VAG09NU6GSaZ9Z6yVTUf8Rjkrtx/fH4vpH4pVmzbxyp/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G7dFk8bO; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G7dFk8bO"
Message-ID: <4f065ba5-f861-42be-b066-f31fff54ff67@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750988075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sg1cxPdxGXjjQzRPbq0XrVPjc53PBcAgaq7+5zxZ9S8=;
	b=G7dFk8bOJQVmK/UYf1QYzD3eFIMBK8VH4EpnX71F86SCwSllNLSmy5OyKqYEqwljd3kfpn
	7X9ZC8aHG0yI/BS5H1Jo1jRThzCOLJMif45i710hjtyhCQa5da7KTgrOzNwVgP/IIia6NO
	Iiaodq7t9U8++Y/zQDEDTc8o6/WsQy8=
Date: Fri, 27 Jun 2025 09:34:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Docs/zh_CN: Translate alias.rst to Simplified Chinese
To: jiang.kun2@zte.com.cn, alexs@kernel.org, dzm91@hust.edu.cn,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: xu.xin16@zte.com.cn, yang.yang29@zte.com.cn, fan.yu9@zte.com.cn,
 qiu.yutan@zte.com.cn, wang.yaxin@zte.com.cn
References: <20250624165039911FXwVWbH9TM62kBeLnxzXg@zte.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250624165039911FXwVWbH9TM62kBeLnxzXg@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 6/24/25 4:50 PM, jiang.kun2@zte.com.cn 写道:
> From: Qiu Yutan <qiu.yutan@zte.com.cn>
>
> translate the "alias.rst" into Simplified Chinese
>
> Update to commit 735dadf894f0("docs: networking:
> Convert alias.txt to rst")
>
> Signed-off-by: Qiu Yutan <qiu.yutan@zte.com.cn>
> Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
> ---
>   .../translations/zh_CN/networking/alias.rst   | 56 +++++++++++++++++++
>   .../translations/zh_CN/networking/index.rst   |  2 +-
>   2 files changed, 57 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/alias.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/alias.rst b/Documentation/translations/zh_CN/networking/alias.rst
> new file mode 100644
> index 000000000000..d94fc38a3d2e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/alias.rst
> @@ -0,0 +1,56 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/alias.rst
> +
> +:翻译:
> +
> + 邱禹潭 Qiu Yutan <qiu.yutan@zte.com.cn>
> +
> +:校译:
> +
> +===========
> +IP别名
> +===========

Trim the redundant “=”. One “=”for each English character and two “=”for 
each Chinese character.

On this premise:

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>

Thanks,

Yanteng

> +
> +IP别名是管理每个接口存在多个IP地址/子网掩码的一种过时方法。
> +虽然更新的工具如iproute2支持每个接口多个地址/前缀，
> +但为了向后兼容性，别名仍被支持。
> +
> +别名通过在使用 ifconfig 时在接口名后添加冒号和一个字符串来创建。
> +这个字符串通常是数字，但并非必须。
> +
> +
> +别名创建
> +==============
> +
> +别名的创建是通过“特殊的”接口命名机制完成的：例如，
> +要为eth0创建一个 200.1.1.1 的别名...
> +::
> +
> +  # ifconfig eth0:0 200.1.1.1  等等
> +	~~ -> 请求为eth0创建别名#0（如果尚不存在）
> +
> +该命令也会设置相应的路由表项。请注意：路由表项始终指向基础接口。
> +
> +
> +别名删除
> +==============
> +
> +通过关闭别名即可将其删除::
> +
> +  # ifconfig eth0:0 down
> +	~~~~~~~~~~ -> 将删除别名
> +
> +
> +别名（重新）配置
> +======================
> +
> +别名不是真实的设备，但程序应该能够正常配置和引用它们（ifconfig、route等）。
> +
> +
> +与主设备的关系
> +=============================
> +
> +如果基础设备被关闭，则其上添加的所有别名也将被删除。
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index d07dd69f980b..e0073087735f 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -21,6 +21,7 @@
>      :maxdepth: 1
>
>      msg_zerocopy
> +   alias
>
>   Todolist:
>
> @@ -45,7 +46,6 @@ Todolist:
>   *   page_pool
>   *   phy
>   *   sfp-phylink
> -*   alias
>   *   bridge
>   *   snmp_counter
>   *   checksum-offloads
