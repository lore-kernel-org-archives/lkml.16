Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239D42C3261;
	Tue,  3 Jun 2025 03:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748920201; cv=none; b=Yi5p1BJVsZH2LEJdpNWvqKvjx6LOX38qlrxgCU+88+4aN7DE9/ZnB5E+55dSUjE3lbNQE2lum9+uKcMBpOTnYGntM3gp5RrV1OB5PdFE/fkfYrLd7QB5BnxVaiYWu89IDtspmq/Bt/bzmnEwrXiVyYyUjMAASVwlnIv1pK1eWhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748920201; c=relaxed/simple;
	bh=d/HNEnZxtNsbml+mpIKxBU2NCJc6lxB9UPGaecti2wM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sphpszqDtcaTTZUhs/qXgrBx+w1CnlAtZJMa0UjlVTwkX7UkPdQV3mpQo2zXVCgeWndQ/K1VPrrnz5Cw2VxMwxn2QIx3xjbXV8lI4n90NTH8H93EQq7xo5UBABcx0DfcnFFybgP9n4JGwb+T6jYkRPvDleqFwvUIi6QFpTcslOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAB3dO5sZz5o9lN7AQ--.54653S2;
	Tue, 03 Jun 2025 11:09:32 +0800 (CST)
Received: from [10.12.169.168] (unknown [10.12.169.168])
	by gateway (Coremail) with SMTP id _____wAX4uloZz5oEow0AA--.38125S2;
	Tue, 03 Jun 2025 11:09:30 +0800 (CST)
Message-ID: <371b632f-3522-4b8e-8e2f-4e3c53a7c047@hust.edu.cn>
Date: Tue, 3 Jun 2025 11:09:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux next v2] Docs/zh_CN: Translate vxlan.rst to
 Simplified Chinese
To: jiang.kun2@zte.com.cn
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, yang.yang29@zte.com.cn, fan.yu9@zte.com.cn,
 qiu.yutan@zte.com.cn, wang.yaxin@zte.com.cn
References: <20250603110337057ZRxTnZrzJ39S_CAoGTJ5D@zte.com.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20250603110337057ZRxTnZrzJ39S_CAoGTJ5D@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAB3dO5sZz5o9lN7AQ--.54653S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3GF4UXF4fKF17Kw1UtF1rCrg_yoW7Xr18pF
	Wqgryxtw47KFy0krW7Gw45Jrn8CFykCan7GF97t3Wktr4fG3yktry7Krn8CrZagryrZFyF
	va18Kry5u3y2yaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jfpndUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 6/3/25 11:03 AM, jiang.kun2@zte.com.cn wrote:
> From: Qiu Yutan <qiu.yutan@zte.com.cn>
>
> translate the "vxlan.rst" into Simplified Chinese
>
> Update to commit 33a1aaf82bcf("docs: vxlan: add info
> about device features")
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>
> Signed-off-by: Qiu Yutan <qiu.yutan@zte.com.cn>
> Signed-off-by: Fan Yu <fan.yu9@zte.com.cn>
> Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
> Signed-off-by: xu xin <xu.xin15@zte.com.cn>
> ---

Hi Qiu,

Next time, please add the changelog here, e.g., "v1->v2: remove rst suffix".

Dongliang Mu

>   .../translations/zh_CN/networking/index.rst   |  2 +-
>   .../translations/zh_CN/networking/vxlan.rst   | 85 +++++++++++++++++++
>   2 files changed, 86 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/vxlan.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index d07dd69f980b..0ef6dd989615 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -21,6 +21,7 @@
>      :maxdepth: 1
>
>      msg_zerocopy
> +   vxlan
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
> index 000000000000..e319eddfcdbe
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
> +这将创建一个名为 vxlan0 的网络设备，该设备通过 eth1 使用组播组 239.1.1.1 处理转发表中没有对应条目的流量。
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

