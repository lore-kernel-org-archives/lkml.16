Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9059476
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748576311; cv=none; b=i696PmaJWFFERO5Tthd8zRDgrGGXaklSA0+loLGJ1lxctAp5P40+lIDe7lTBvgZh7hRaDsO2psfVZU6Ej5werPrHGNrDV+IgQbCU5VZPIfxxWwPfO7SnhsLs1LLtlNcDLU1OdEuqRyQlnfOPegfh2SKBSdZtVhaS6uSQikKaTiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748576311; c=relaxed/simple;
	bh=aIICxjROYO+OwyuZW/nb0jLjTiLlixKVhk7YG2FwyLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYnpGfhnCcDNIOu5gkZ+Qn9dlDa2rO3p/Sd2zWwsBXVDAr3ihu81hPjn6KVHx3J6/QlNad6pByIONdwZPhMySV/xdfyAWANOxTsalaSUgxVXiVsN8g0KScfACeWM2G4d+0d1J75fi7OihRsx/eXXjHhGgo5zjCjNtlD+08Bz97A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cnTzav7H; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cnTzav7H"
Message-ID: <63cbb800-0040-4f41-8a82-90251da6914e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748576296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MfkkJbAGy6/93fUv29ZuYr5keyGXNJjkwskr1G9pMkU=;
	b=cnTzav7H0qZUeyltvR8pE6JBWZqTAuaCI/GHgDRQ9faREnggC9FyRO14gMDdi7xiE72CXe
	2SWDxFqC0ZLeojAkHxkHPYtpoPq1KhgiVe4OQ5hzeKmvb7zCMLpi+4/Zay8akqfshmtbE5
	PwLN+Vdly7CIGeSB//A5T4R7Z7SGt/o=
Date: Fri, 30 May 2025 11:37:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH linux next] Docs/zh_CN: Translate vxlan.rst to Simplified
 Chinese
To: jiang.kun2@zte.com.cn, alexs@kernel.org, dzm91@hust.edu.cn,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: xu.xin16@zte.com.cn, yang.yang29@zte.com.cn, fan.yu9@zte.com.cn,
 qiu.yutan@zte.com.cn, wang.yaxin@zte.com.cn
References: <202505301132492152dM75edlCkVrcPL71Omc5@zte.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <202505301132492152dM75edlCkVrcPL71Omc5@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 5/30/25 11:32 AM, jiang.kun2@zte.com.cn 写道:
> From: Qiu Yutan <qiu.yutan@zte.com.cn>
>
> translate the "vxlan.rst" into Simplified Chinese
>
> Update to commit 33a1aaf82bcf("docs: vxlan: add info
> about device features")
>
> Signed-off-by: Qiu Yutan <qiu.yutan@zte.com.cn>
> Signed-off-by: Fan Yu <fan.yu9@zte.com.cn>
> Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
> Signed-off-by: xu xin <xu.xin16@zte.com.cn>

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng

> ---
>   .../translations/zh_CN/networking/index.rst   |  2 +-
>   .../translations/zh_CN/networking/vxlan.rst   | 85 +++++++++++++++++++
>   2 files changed, 86 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/vxlan.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index d07dd69f980b..ed62950c6a1b 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -21,6 +21,7 @@
>      :maxdepth: 1
>
>      msg_zerocopy
> +   vxlan.rst
>
>   Todolist:
>
> @@ -142,7 +143,6 @@ Todolist:
>   *   tuntap
>   *   udplite
>   *   vrf
> -*   vxlan
>   *   x25
>   *   x25-iface
>   *   xfrm_device
> diff --git a/Documentation/translations/zh_CN/networking/vxlan.rst b/Documentation/translations/zh_CN/networking/vxlan.rst
> new file mode 100644
> index 000000000000..b1a67d2e7b8e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/vxlan.rst
> @@ -0,0 +1,85 @@
> +.. SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/vxlan.rst
> +
> +:翻译:
> +
> + 范雨 Fan Yu <fan.yu9@zte.com.cn>
> +
> +:校译:
> +
> + - 邱禹潭 Qiu Yutan <qiu.yutan@zte.com.cn>
> + - 徐鑫 xu xin <xu.xin16@zte.com.cn>
> +
> +==========================
> +虚拟扩展本地局域网协议文档
> +==========================
> +
> +VXLAN 协议是一种隧道协议，旨在解决 IEEE 802.1q 中 VLAN ID（4096）有限的问题。
> +VXLAN 将标识符的大小扩展到 24 位（16777216）。
> +
> +VXLAN 在 IETF RFC 7348 中进行了描述，并已由多家供应商设计实现。
> +该协议通过 UDP 协议运行，并使用特定目的端口。
> +本文档介绍了 Linux 内核隧道设备，Openvswitch 也有单独的 VXLAN 实现。
> +
> +与大多数隧道不同，VXLAN 是 1 对 N 的网络，而不仅仅是点对点网络。
> +VXLAN 设备可以通过类似于学习桥接器的方式动态学习另一端点的 IP 地址，也可以利用静态配置的转发条目。
> +
> +VXLAN 的管理方式与它的两个近邻 GRE 和 VLAN 相似。
> +配置 VXLAN 需要 iproute2 的版本与 VXLAN 首次向上游合并的内核版本相匹配。
> +
> +1. 创建 vxlan 设备::
> +
> +	# ip link add vxlan0 type vxlan id 42 group 239.1.1.1 dev eth1 dstport 4789
> +
> +这将创建一个名为 vxlan0 的网络设备，该设备通过 eth1 使用组播组 239.1.1.1 处理转发表中没有条目的流量。
> +目标端口号设置为 IANA 分配的值 4789，VXLAN 的 Linux 实现早于 IANA 选择标准目的端口号的时间。
> +因此默认使用 Linux 选择的值，以保持向后兼容性。
> +
> +2. 删除 vxlan 设备::
> +
> +	# ip link delete vxlan0
> +
> +3. 查看 vxlan 设备信息::
> +
> +	# ip -d link show vxlan0
> +
> +使用新的 bridge 命令可以创建、销毁和显示 vxlan 转发表。
> +
> +1. 创建vxlan转发表项::
> +
> +	# bridge fdb add to 00:17:42:8a:b4:05 dst 192.19.0.2 dev vxlan0
> +
> +2. 删除vxlan转发表项::
> +
> +	# bridge fdb delete 00:17:42:8a:b4:05 dev vxlan0
> +
> +3. 显示vxlan转发表项::
> +
> +	# bridge fdb show dev vxlan0
> +
> +以下网络接口控制器特性可能表明对 UDP 隧道相关的卸载支持（最常见的是 VXLAN 功能，
> +但是对特定封装协议的支持取决于网络接口控制器）：
> +
> + - `tx-udp_tnl-segmentation`
> + - `tx-udp_tnl-csum-segmentation`
> +    对 UDP 封装帧执行 TCP 分段卸载的能力
> +
> + - `rx-udp_tunnel-port-offload`
> +    在接收端解析 UDP 封装帧，使网络接口控制器能够执行协议感知卸载，
> +    例如内部帧的校验和验证卸载（只有不带协议感知卸载的网络接口控制器才需要）
> +
> +对于支持 `rx-udp_tunnel-port-offload` 的设备，可使用 `ethtool` 查询当前卸载端口的列表::
> +
> +  $ ethtool --show-tunnels eth0
> +  Tunnel information for eth0:
> +    UDP port table 0:
> +      Size: 4
> +      Types: vxlan
> +      No entries
> +    UDP port table 1:
> +      Size: 4
> +      Types: geneve, vxlan-gpe
> +      Entries (1):
> +          port 1230, vxlan-gpe
