Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB283987D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751262398; cv=none; b=d0/rQZ3sqC0giiASGjNApFSGYEf43n0uM2qw+K44K/8hqd/4pqOt2F9Yz4U5UvSDyRsNkGiwLb9tsK51BFIa8oJa3B0HNCTQfvIuuriDgcOx3wO6VfRwyvRX9Z/TKuj/HiQW+O1mcyEFxVof425AwVGapGMxoCncx1YtkOzVr3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751262398; c=relaxed/simple;
	bh=vSOzRne14JlU94xeMdnMdVZdut1+dfhDJWu8jSNU4co=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVpPEJV17RmQbbdx3WOgmzSlGeublJq8ADRz56U7EnrAHUH7qxCL/1ntBHOVL3a7g/MhlDxlmyhrlAk0OtlSqx1b4tN429ySJS3685Iu0kF5IVl1hq0rr+5jwIbffdPNJUG6ySpb5BiHD1gH53RflHIWiP06xcwEd9yT118TVpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ciBi5XLv; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ciBi5XLv"
Message-ID: <2070d1d5-d1d3-4653-83c0-ec13e4a9b0de@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751262379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1SFI+2RTNSLf2HFfmb12EMAYVqKRoDz3A5tt6oW5UUE=;
	b=ciBi5XLveZFqQ3Q09ThtON/lNT87QyUn/CkRoB1bilzs9ElHMhe246n/skcV7NDQefzc/V
	9RJJY/2Db95dqmNF+r2JpzJYI9fIcZ6AIiuCPyuSwC+s/+JCFmo0BjdbvHzVDO8sP7M1S5
	Q/Av30SDbb3C3GkqRHlxZYsWtbdutrI=
Date: Mon, 30 Jun 2025 13:46:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/3] Docs/zh_CN: Translate netif-msg.rst to Simplified
 Chinese
To: jiang.kun2@zte.com.cn, alexs@kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: xu.xin16@zte.com.cn, yang.yang29@zte.com.cn, wang.yaxin@zte.com.cn,
 fan.yu9@zte.com.cn, he.peilin@zte.com.cn, tu.qiang35@zte.com.cn,
 qiu.yutan@zte.com.cn, zhang.yunkai@zte.com.cn, ye.xingchen@zte.com.cn
References: <20250627141707799nmybVYALZSRANqHIwCTCi@zte.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250627141707799nmybVYALZSRANqHIwCTCi@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 6/27/25 2:17 PM, jiang.kun2@zte.com.cn 写道:
> From: Wang Yaxin <wang.yaxin@zte.com.cn>
>
> translate the "netif-msg.rst" into Simplified Chinese.
>
> Update the translation through commit c4d5dff60f0a
> ("docs: networking: convert netif-msg.txt to ReST")
>
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
> Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>


Thanks,

Yanteng

> ---
> v2->v3:
> 1. adjust table format.
> 2. update commit id in commit message.
>
>  .../translations/zh_CN/networking/index.rst  |  2 +-
>  .../zh_CN/networking/netif-msg.rst           | 92 +++++++++++++++++++
>  2 files changed, 93 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/networking/netif-msg.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index 07a3933afe92..4dd75ec27dec 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -22,6 +22,7 @@
>     msg_zerocopy
>     napi.rst
> +   netif-msg
>  Todolist:
> @@ -100,7 +101,6 @@ Todolist:
>  *   netdev-features
>  *   netdevices
>  *   netfilter-sysctl
> -*   netif-msg
>  *   netmem
>  *   nexthop-group-resilient
>  *   nf_conntrack-sysctl
> diff --git a/Documentation/translations/zh_CN/networking/netif-msg.rst b/Documentation/translations/zh_CN/networking/netif-msg.rst
> new file mode 100644
> index 000000000000..877399b169fe
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/netif-msg.rst
> @@ -0,0 +1,92 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/netif-msg.rst
> +
> +:翻译:
> +
> +   王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
> +
> +================
> +网络接口消息级别
> +================
> +
> +网络接口消息级别设置的设计方案。
> +
> +历史背景
> +--------
> +
> +调试消息接口的设计遵循并受制于向后兼容性及历史实践。理解其发展历史有助于把握
> +当前实践，并将其与旧版驱动代码相关联。
> +
> +自Linux诞生之初，每个网络设备驱动均包含一个本地整型变量以控制调试消息级别。
> +消息级别范围为0至7，数值越大表示输出越详细。
> +
> +消息级别的定义在3级之后未明确细化，但实际实现通常与指定级别相差±1。驱动程序
> +成熟后，冗余的详细级别消息常被移除。
> +
> +  - 0  最简消息，仅显示致命错误的关键信息。
> +  - 1  标准消息，初始化状态。无运行时消息。
> +  - 2  特殊介质选择消息，通常由定时器驱动。
> +  - 3  接口开启和停止消息，包括正常状态信息。
> +  - 4  Tx/Rx帧错误消息及异常驱动操作。
> +  - 5  Tx数据包队列信息、中断事件。
> +  - 6  每个完成的Tx数据包和接收的Rx数据包状态。
> +  - 7  Tx/Rx数据包初始内容。
> +
> +最初，该消息级别变量在各驱动中具有唯一名称（如"lance_debug"），便于通过
> +内核符号调试器定位和修改其设置。模块化内核出现后，变量统一重命名为"debug"，
> +并作为模块参数设置。
> +
> +这种方法效果良好。然而，人们始终对附加功能存在需求。多年来，以下功能逐渐
> +成为合理且易于实现的增强方案：
> +
> +  - 通过ioctl()调用修改消息级别。
> +  - 按接口而非驱动设置消息级别。
> +  - 对发出的消息类型进行更具选择性的控制。
> +
> +netif_msg 建议添加了这些功能，仅带来了轻微的复杂性增加和代码规模增长。
> +
> +推荐方案如下：
> +
> +  - 保留驱动级整型变量"debug"作为模块参数，默认值为'1'。
> +
> +  - 添加一个名为 "msg_enable" 的接口私有变量。该变量是位图而非级别，
> +    并按如下方式初始化::
> +
> +       1 << debug
> +
> +     或更精确地说::
> +
> +debug < 0 ? 0 : 1 << min(sizeof(int)-1, debug)
> +
> +    消息应从以下形式更改::
> +
> +      if (debug > 1)
> + printk(MSG_DEBUG "%s: ...
> +
> +    改为::
> +
> +      if (np->msg_enable & NETIF_MSG_LINK)
> + printk(MSG_DEBUG "%s: ...
> +
> +消息级别命名对应关系
> +
> +
> +  =========  =================== ============
> +  旧级别       名称 位位置
> +  =========  =================== ============
> +    1         NETIF_MSG_PROBE    0x0002
> +    2         NETIF_MSG_LINK     0x0004
> +    2         NETIF_MSG_TIMER    0x0004
> +    3         NETIF_MSG_IFDOWN     0x0008
> +    3         NETIF_MSG_IFUP     0x0008
> +    4         NETIF_MSG_RX_ERR     0x0010
> +    4         NETIF_MSG_TX_ERR     0x0010
> +    5  NETIF_MSG_TX_QUEUED   0x0020
> +    5         NETIF_MSG_INTR     0x0020
> +    6         NETIF_MSG_TX_DONE    0x0040
> +    6  NETIF_MSG_RX_STATUS   0x0040
> +    7         NETIF_MSG_PKTDATA    0x0080
> +  =========  =================== ============
> -- 
> 2.25.1
>
>
>
>
>
