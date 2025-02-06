Received: from terminus.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181DF148FF5;
	Thu,  6 Feb 2025 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738823428; cv=none; b=Cjwl/SdWcVFF1U4MS44BaqRWED+89EXF2WHpKPOyjcRzCaEOCmFc/1TinT0Kf3lTgpkc9KffNNIjdG4Y7SW6+5yp0hb9XZKytaR5/ViVxZ+asuwgiV6zoVQko7GQIJiRMfGWYT6APCB2fucfkZpulku32RLWgh23eHSO/BHJKO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738823428; c=relaxed/simple;
	bh=9ZLbZg8+Xvk72GIODNaeA+Z7Vu5HANSYPNrUM+hLHiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pD3Bwt6WgwAv4exE6sUIPU6EhACUIgqQaZrbye5VHKbuUidj/c7DSUgOk94j+mKHI5D3sXmbg1zM83buBIbXQzmnFuL1OBjUhpcDI8eoQg6CTDQhvIYeIBgLtRlx9DPw2/fqJNCfAIf5+dSsGG2C9k/uG25yVHUewQr2IQRlX38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=YkIS2IjT; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="YkIS2IjT"
Received: from [192.168.7.202] ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5166Owlh315066
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 5 Feb 2025 22:24:59 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5166Owlh315066
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025011701; t=1738823102;
	bh=fymziyVyp8rJBSGPNwwK+NaZBG6pu4jnw9nQIUdAr60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YkIS2IjTC22HK/o/H3otUopCforsKPkOOz1GuElfg0k/bHYcugHtrT1rtqffLJv/P
	 hscDAs/MrX1+pcs+nwoifMdKe/QzvxfLMw8kuBqfjJ6Z0W0xgKa492RyABPIV3TSiP
	 oZ0sZ427BGIgksgt35JmKB0l+apwZrZL2tqF2MakEaMpvaRyN2BkyvgSoiVWQyHhxV
	 ADpsFiI79ehMO8afkpOp1bJyfsNrGA9/9TER7KgGu07iUzEiPpYt1llSya99r22wBR
	 NfgAXx9E9XXhpagBc92cF30DB/mGh3voHf1IxI3dRbFvyteMzOzmOQPA66sYGZtiR0
	 gG1q5kssrPA0Q==
Message-ID: <ead5a097-44f7-4eaa-8e98-08450b4d51f6@zytor.com>
Date: Wed, 5 Feb 2025 22:24:58 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/23] x86/resctrl: Remove MSR reading of event
 configuration value
To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, reinette.chatre@intel.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, tony.luck@intel.com,
        peternewman@google.com
Cc: fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
        akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
        xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
        daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
        perry.yuan@amd.com, sandipan.das@amd.com, kai.huang@intel.com,
        xiaoyao.li@intel.com, seanjc@google.com, xin3.li@intel.com,
        andrew.cooper3@citrix.com, ebiggers@google.com,
        mario.limonciello@amd.com, james.morse@arm.com,
        tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
        eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <b4298186c0be8db76be4eb74e1d948fbe5c1de7d.1737577229.git.babu.moger@amd.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <b4298186c0be8db76be4eb74e1d948fbe5c1de7d.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/2025 12:20 PM, Babu Moger wrote:
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 8917c7261680..6fe9e610e9a0 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1324,3 +1324,49 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>   
>   	return 0;
>   }
> +
> +u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
> +				      enum resctrl_event_id eventid)
> +{
> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
> +
> +	switch (eventid) {
> +	case QOS_L3_OCCUP_EVENT_ID:
> +		break;
> +	case QOS_L3_MBM_TOTAL_EVENT_ID:
> +		return hw_dom->mbm_total_cfg;
> +	case QOS_L3_MBM_LOCAL_EVENT_ID:
> +		return hw_dom->mbm_local_cfg;
> +	}
> +
> +	/* Never expect to get here */
> +	WARN_ON_ONCE(1);
> +
> +	return INVALID_CONFIG_VALUE;
> +}
> +
> +void resctrl_arch_mon_event_config_set(void *info)
> +{
> +	struct mon_config_info *mon_info = info;
> +	struct rdt_hw_mon_domain *hw_dom;
> +	unsigned int index;
> +
> +	index = mon_event_config_index_get(mon_info->evtid);
> +	if (index == INVALID_CONFIG_INDEX)
> +		return;
> +
> +	wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);

This is the existing code, however it would be better to use wrmsrl()
when the higher 32-bit are all 0s:

	wrmsrl(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config);

Thanks!
     Xin
