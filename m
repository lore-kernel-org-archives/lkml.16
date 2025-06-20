Received: from sg-3-11.ptr.tlmpb.com (sg-3-11.ptr.tlmpb.com [101.45.255.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA91B283C9F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413511; cv=none; b=RVFKPtLV3rHxW2oEWqNoaGoLz2PLndIzdwwt63gW/WvbNYp1O22A4MPw2vQZ9vyvb5z7HW//nHbbl0EVKBxJYyOnvPhNTkRLNnP76z5qlbUctJ5C2GEE9YVJ5lVCGsooG051R1ExHCD5xT7s6rHCoJTURTIVR7PrCEzKGbFy350=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413511; c=relaxed/simple;
	bh=behs4AX21Izj48SjT6T4oG3pPpVVpt1LKhlwYqGqHbE=;
	h=In-Reply-To:To:From:Mime-Version:Subject:Message-Id:Cc:References:
	 Date:Content-Type; b=jLHR0SpFXpLZMOUZVaStAe9ABC86kOE0h4zHevbhPS1SzQNcjCJEdm91BQpcC64mwr7FR+037zSFHHIAtlneKqU69RzXSP82Zj2y76wXlpuCgKaqx9poWQ/bL2DBHZ1BeuubuQccAWLXtjkJt+BD4f3lWSKmdwoBul/LqCzs58w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com; spf=pass smtp.mailfrom=lanxincomputing.com; dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b=Km4FNtyV; arc=none smtp.client-ip=101.45.255.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b="Km4FNtyV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750413498;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=FVhWcbFwI9NYT8NXzHPcEd8gEtJB2JUO9bsshkN9xEc=;
 b=Km4FNtyVFfhKs2cnZKAq8JiccVO1YIzAr6CensXwObqAJYs27KLkXKu4J9fFX2Nq8UXuRr
 SscAwL6yrbl7vdo/9Q9+p6cKnTBIYdxVKStFP22WAQEPCyVPESFsncrfQ1JGi/usqoslbN
 9/DUAblAB9wsTBJeGRNLNwxLtowjgPgLyQ1WZIAhncOTzmKlZVm1/RXbwfKJx3CvON+KR+
 +BlKOmgtuAJH/uoBoPbxC7TkrtD1rgYipyu3Rwwh7+yZjgMjmXb6+hzs2jngQd9qpUXlQc
 ubNCar8kPU5uWBjxWEQjecC7VV4xFjhSLTRl7nUSNSZlr8QUl0ZmxmEFRAkBIQ==
X-Lms-Return-Path: <lba+2685530b8+2b57de+vger.kernel.org+liujingqi@lanxincomputing.com>
Content-Language: en-US
In-Reply-To: <3591f5aed544f9026d8375651936e006b57defdb.1750164414.git.zhouquan@iscas.ac.cn>
To: <zhouquan@iscas.ac.cn>, <anup@brainfault.org>, <ajones@ventanamicro.com>, 
	<atishp@atishpatra.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: Re: [PATCH 4/5] KVM: riscv: selftests: Add Zicbop extension to get-reg-list test
Message-Id: <ad888bc6-33c7-42d3-b5d1-be191dcded0e@lanxincomputing.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
Content-Transfer-Encoding: 7bit
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn> <3591f5aed544f9026d8375651936e006b57defdb.1750164414.git.zhouquan@iscas.ac.cn>
User-Agent: Mozilla Thunderbird
Date: Fri, 20 Jun 2025 17:58:13 +0800
Content-Type: text/plain; charset=UTF-8
Received: from [127.0.0.1] ([180.165.3.105]) by smtp.feishu.cn with ESMTPS; Fri, 20 Jun 2025 17:58:15 +0800

On 6/17/2025 9:10 PM, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
>
> The KVM RISC-V allows Zicbop extension for Guest/VM
> so add them to get-reg-list test.
>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>   tools/testing/selftests/kvm/riscv/get-reg-list.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index a0b7dabb5040..ebdc34b58bad 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -83,6 +83,7 @@ bool filter_reg(__u64 reg)
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
> @@ -253,6 +254,8 @@ static const char *config_id_to_str(const char *prefix, __u64 id)
>   		return "KVM_REG_RISCV_CONFIG_REG(isa)";
>   	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>   		return "KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)";
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		return "KVM_REG_RISCV_CONFIG_REG(zicbop_block_size)";
>   	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
>   		return "KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)";
>   	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> @@ -535,6 +538,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>   		KVM_ISA_EXT_ARR(ZFH),
>   		KVM_ISA_EXT_ARR(ZFHMIN),
>   		KVM_ISA_EXT_ARR(ZICBOM),
> +		KVM_ISA_EXT_ARR(ZICBOP),
>   		KVM_ISA_EXT_ARR(ZICBOZ),
>   		KVM_ISA_EXT_ARR(ZICCRSE),
>   		KVM_ISA_EXT_ARR(ZICNTR),
> @@ -864,6 +868,11 @@ static __u64 zicbom_regs[] = {
>   	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
>   };
>   
> +static __u64 zicbop_regs[] = {
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbop_block_size),
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP,
> +};
> +
>   static __u64 zicboz_regs[] = {
>   	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicboz_block_size),
>   	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ,
> @@ -1012,6 +1021,8 @@ static __u64 vector_regs[] = {
>   	 .regs = sbi_sta_regs, .regs_n = ARRAY_SIZE(sbi_sta_regs),}
>   #define SUBLIST_ZICBOM \
>   	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
> +#define SUBLIST_ZICBOP \
> +	{"zicbop", .feature = KVM_RISCV_ISA_EXT_ZICBOP, .regs = zicbop_regs, .regs_n = ARRAY_SIZE(zicbop_regs),}
>   #define SUBLIST_ZICBOZ \
>   	{"zicboz", .feature = KVM_RISCV_ISA_EXT_ZICBOZ, .regs = zicboz_regs, .regs_n = ARRAY_SIZE(zicboz_regs),}
>   #define SUBLIST_AIA \
> @@ -1130,6 +1141,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
>   KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
> +KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
>   KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
>   KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
> @@ -1204,6 +1216,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>   	&config_zfh,
>   	&config_zfhmin,
>   	&config_zicbom,
> +	&config_zicbop,
>   	&config_zicboz,
>   	&config_ziccrse,
>   	&config_zicntr,

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty
