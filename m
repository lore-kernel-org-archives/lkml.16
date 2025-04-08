Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B617E00E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120249; cv=none; b=tPO9a4jx5K9vfT3yNVU8k1FGfEptXU/wXq4q8Zo2cjPwTaufZh2m/LTXhhlFXUtdyQL+k0eAovFGx3MI+Ouumceq471ZHfHv1yuUpjvz2m+LhKixILcw0M17vMSsT+aptAQhrSly8zsv07yLnz1GlbjzYnNpPTVedSUFTTR5og0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120249; c=relaxed/simple;
	bh=NCsWfL0MybYgp+JwS252qiXik2UmAOGQz50Z5XeC1Ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCPReRrTq26h//tj0ot6b+eu8ghj8l4Gn+QOMVR/Q+yefjf8xWZblj7cKrOzwxQM/iHGlCDWoVF8kAoX2PrJZh3MCq+bMFf51RbEC6Kij8CSYAwX06pDcdhUpNeHfHTaIgFA5tUr2G5ebtv28lh+p93BVAZzeDZWTG+jiWyWUPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ho/6hiNZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ho/6hiNZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so756550466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744120245; x=1744725045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5fM3gX3mnntU8mKyK8O/mS1b9O+ReWBswTOnb6yk+1U=;
        b=Ho/6hiNZYSIwTz22vtvQ7tLPj2UbDBPGZCDSMiERo0Rw26WheIMT2kEii46gp4jLHX
         l18y5R7bltZcf5tC1VPGZuSSEtjKZEj+i1JvVmvEVJa4tgzvSIwLpiWgmdsyTsTvgQvm
         khCkt/elQYulfa8saQ537QLrWfUzxrPUCCiSk5Ca9/Uj6SVBs5zqcVFVD/f1R/Cfetha
         HY94Pyd3PuK74cdUah/rwZAaPHNcfVIQQV4q+MpTlk65JUq/kLaPRuCdvTV51PyS6LOe
         o0OaxXksHTjR0yKXayZ7Z8y49xumz11iBJmaRy6qykWaFMjxL4ugLfdFSxzk64BCtwVS
         wYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120245; x=1744725045;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fM3gX3mnntU8mKyK8O/mS1b9O+ReWBswTOnb6yk+1U=;
        b=QyZZgmdZdtG5WA3S0ZARvZypsyVdJqK1O3RyTS/yLVw7VwAd+A9ez9O/xmgDJBEZM9
         UCIQ2fq0+koEAp435ylrfLWUpZgwgjbOGSkJZDvvVZokopBRUUNXHp9XW8txBLH/Z40Y
         Z1Mqa7ZvPKM4M8n687UOnBvTvyxhWUiUiU5ObsZXC1gii/QB7r4eLFbVHobBAu78lXzk
         tTJ8SlVX+cVYygJ3ae/NhyF/j12u11JCoI7G/XvQDyu1K59B2z/cyQG31r9wwQwmaJJ7
         fB1Pr4P5u8oHMlRcxMrU/TSmjKPZ4zVaDqnfjtKTkyNobg4OKjYPMCPO7FgYxeY9mjxp
         shvQ==
X-Gm-Message-State: AOJu0Yz+Qe3tLXIaRQOR97SnbcA7w/zNFlhOxzJMusF2BcfHGT2A/Ttv
	srtej6bJ/lyeWBK0+Kpwf576CT7XZWkVZwl+UfzqmLA0ll+qX+XmiVgj4FHnNUY=
X-Gm-Gg: ASbGnctuS8Bwjw3lMQlvjB3+8NsDkkgqidPmxcgAjQPv6/eMvS8yeVX8vK8HVGTF04C
	XmxIAWX+nKtPJUqMRpFzcDoHLmcELN7TOP7loP4V3lTV+eLfQ4PQYWstLAj+3Heb4ZthMxqzKhc
	FEHcvsseTnoyJDi5t79AV8k+uTnTvtEdK+c9pRZPG5kome6lGbOOyoWqp+x5i+aLSCVgjDMdBGD
	eNabTnvaQn2M3TMNluHSC74Z/5DQ78Z4hKEuOliNbq0aZJyoORmSVQV01Bc1uvNkVlT1Hfry7LY
	NH0Ygt//TthWNBXA7TgYkRtBNbqPFSedYk0/yVE/8JwZz/gFpg==
X-Google-Smtp-Source: AGHT+IHAZbCBMTkJULUxkZ8VSTmMiMLSnh65yKkazUvPoIlJAUQd1W73SQfkwomVlw3lt2/E+H3YSw==
X-Received: by 2002:a17:907:9605:b0:ac3:8993:3c6d with SMTP id a640c23a62f3a-ac7e72b6218mr1158874466b.26.1744120245067;
        Tue, 08 Apr 2025 06:50:45 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe99c7dsm925314966b.57.2025.04.08.06.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 06:50:44 -0700 (PDT)
Message-ID: <b9c081b6-3a92-4c46-be04-19abdb1ca429@suse.com>
Date: Tue, 8 Apr 2025 16:50:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] x86/bugs: Don't fill RSB on VMEXIT with
 eIBRS+retpoline
To: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, amit@kernel.org, kvm@vger.kernel.org,
 amit.shah@amd.com, thomas.lendacky@amd.com, bp@alien8.de,
 tglx@linutronix.de, peterz@infradead.org, pawan.kumar.gupta@linux.intel.com,
 corbet@lwn.net, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, seanjc@google.com, pbonzini@redhat.com,
 daniel.sneddon@linux.intel.com, kai.huang@intel.com, sandipan.das@amd.com,
 boris.ostrovsky@oracle.com, Babu.Moger@amd.com, david.kaplan@amd.com,
 dwmw@amazon.co.uk, andrew.cooper3@citrix.com
References: <cover.1743617897.git.jpoimboe@kernel.org>
 <a305206cd08cde28c46a1ef19f5668a3fff9b013.1743617897.git.jpoimboe@kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <a305206cd08cde28c46a1ef19f5668a3fff9b013.1743617897.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2.04.25 г. 21:19 ч., Josh Poimboeuf wrote:
> eIBRS protects against guest->host RSB underflow/poisoning attacks.
> Adding retpoline to the mix doesn't change that.  Retpoline has a
> balanced CALL/RET anyway.
> 
> So the current full RSB filling on VMEXIT with eIBRS+retpoline is
> overkill.  Disable it or do the VMEXIT_LITE mitigation if needed.
> 
> Suggested-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Reviewed-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Reviewed-by: Amit Shah <amit.shah@amd.com>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
