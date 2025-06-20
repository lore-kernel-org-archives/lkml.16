Received: from lf-2-31.ptr.blmpb.com (lf-2-31.ptr.blmpb.com [101.36.218.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE223229B1E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.36.218.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412961; cv=none; b=tsdAp5HsgswNqQnLdDTa5826kvuK/SdnmqrH1GlLcjk64Cv28zI6dT/dHg7N04Wt8zyQkZKmwAG1ZeH9otywW8NNXNjS+yCdUPL0aGepSdqtYMd0NNlNnl4/FHoRgbkeZE6bfUj2YjQIby0x53dQIgXEero4RdN/LgaC3kes/dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412961; c=relaxed/simple;
	bh=wojTjQClLQ48UTC77W0gkindItOoWRV1+r38k6nb3Yc=;
	h=From:Mime-Version:Content-Type:To:Cc:Message-Id:References:
	 Subject:Date:In-Reply-To; b=aqUcBxKSWiwmptrvCPjP2bJq7oZys2q8krzr0UCWxzmRMK5SJqSpEmKd23wIj269vQz2DUmEoPnvivkBMID0z5T9XF4UgmsmN/iY0frdKTyQMBbpaSDBvktqCr20PzN424+5ATd6LzezBgBvisJcrNBE+uRO9PwUC1HbVvjVfXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com; spf=pass smtp.mailfrom=lanxincomputing.com; dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b=AF1ceC70; arc=none smtp.client-ip=101.36.218.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b="AF1ceC70"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750412220;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=oeXxAIqzohSWPmedTEZHs1J1ce2tPrIZS+IBTNkDcr8=;
 b=AF1ceC70Y+GV1+D5xXqF8udpzakQZUwAaNT0se6YcyniphkrwbqLYF07pg7LFWVsj6AXhn
 ucJsWNwhk0Pc2leTiU3TP4ZBO0g4f+bhz/5VpimV1wsuuPGV6k2pz9hDJGEoxrE7C7mDpo
 iBduWSrtu80KrA7BPBWMls5kAbnv8Md5ytYL/Jwu2SSRatUNpYL7ykWF4yEIdpdxAaQx/Q
 nVP91BdtnmUaNCozzGXNhqk3byAgjosMXepeX01JU7vEDOugHXFNEn50O1VHKIXNsR5YNo
 bOSZBeeGmtEeFPk5krB62IYteWYdUdyYO7h6qi2K/Bc48uRVg7XsYRo0eBo80w==
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Received: from [127.0.0.1] ([180.165.3.105]) by smtp.feishu.cn with ESMTPS; Fri, 20 Jun 2025 17:36:57 +0800
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+268552bba+7b8ac4+vger.kernel.org+liujingqi@lanxincomputing.com>
To: <zhouquan@iscas.ac.cn>, <anup@brainfault.org>, <ajones@ventanamicro.com>, 
	<atishp@atishpatra.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>
Message-Id: <193a6972-2498-4661-8b76-4303819ca0b2@lanxincomputing.com>
Content-Language: en-US
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn> <553bacc4f66e815975bb8ee0e4696397407b0a82.1750164414.git.zhouquan@iscas.ac.cn>
Subject: Re: [PATCH 1/5] RISC-V: KVM: Provide UAPI for Zicbop block size
Date: Fri, 20 Jun 2025 17:36:55 +0800
In-Reply-To: <553bacc4f66e815975bb8ee0e4696397407b0a82.1750164414.git.zhouquan@iscas.ac.cn>

On 6/17/2025 9:10 PM, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
>
> We're about to allow guests to use the Zicbop extension.
> KVM userspace needs to know the cache block size in order to
> properly advertise it to the guest. Provide a virtual config
> register for userspace to get it with the GET_ONE_REG API, but
> setting it cannot be supported, so disallow SET_ONE_REG.
>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>   arch/riscv/include/uapi/asm/kvm.h |  1 +
>   arch/riscv/kvm/vcpu_onereg.c      | 11 +++++++++++
>   2 files changed, 12 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 5f59fd226cc5..0863ca178066 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -55,6 +55,7 @@ struct kvm_riscv_config {
>   	unsigned long mimpid;
>   	unsigned long zicboz_block_size;
>   	unsigned long satp_mode;
> +	unsigned long zicbop_block_size;
>   };
>   
>   /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 2e1b646f0d61..b08a22eaa7a7 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -256,6 +256,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>   			return -ENOENT;
>   		reg_val = riscv_cboz_block_size;
>   		break;
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOP))
> +			return -ENOENT;
> +		reg_val = riscv_cbop_block_size;
> +		break;
>   	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
>   		reg_val = vcpu->arch.mvendorid;
>   		break;
> @@ -347,6 +352,12 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>   		if (reg_val != riscv_cboz_block_size)
>   			return -EINVAL;
>   		break;
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOP))
> +			return -ENOENT;
> +		if (reg_val != riscv_cbop_block_size)

Seems "riscv_cbop_block_size" has not been declared.
Otherwise,
Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

> +			return -EINVAL;
> +		break;
>   	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
>   		if (reg_val == vcpu->arch.mvendorid)
>   			break;
