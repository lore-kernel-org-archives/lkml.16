Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978CA28BABF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028212; cv=none; b=J2OFFLia0mWWUWFFZpk4f3Bvnz434zkLznc21yZSUnEvTc1RdeZ9DmXoE8ETiGwW5h6aN6LgFXhzWPpKQzNrj9RQsdEfz0OsZJW1MpOtTSKnGn2U3aF8/0YDutAkEPzZWKAI6XOTLvWr2MokgaOEalCFE1MtqMVz9OFEq3MMjMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028212; c=relaxed/simple;
	bh=oMW4MaSwYK2mtMHKkMAV4IJupcfvcbWA0rhfA8QumkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyTHkieUONaHNKjZtFRTjBga0L3FN1SEJRjaqvV3sx/JLxZ5L45jNQGELBBANwGjZ5HnHlHLsnFJPfO3jmPi9U+Le8GZE/Iz+hBOLOjYKMDFPguAk6pLn+VcGc/CZpZDolMLjCA7Je1A/MStBUMuipnj1Sq5/vkqouWryjJx0iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WxZFvWXm; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WxZFvWXm"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso4062851f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749028209; x=1749633009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwmthOPo3ZeLQxOOTrEK+OkcJyUZaBTnj0LjrMJahQQ=;
        b=WxZFvWXmWUyomFHlC3XbrdIdOPi/tsaJ3iKX36VyBqNPlfZsk7/CuWYTdpBAZXcfZl
         n+pbUrGPvRyd1leBkaCDvhYitVP44K+WSPbYLnH1sV4WSDuERuTH5esa4KMWYbZSlGOn
         kh+v6mEkZdIypchHCjVff8rqlSXDq+hZr99VkK5NVP5P2k/SPJsVruErjCpTVxgMz8mX
         2WOUpsNq5qWl4yKo6r2MvX7cLUryBkF2xsrlnbNu8YB33RCgPjdpXAJ3UzpfmVEU+D0y
         uduETeb0VxtapyjwN+RRFG6t3DiKh96zhZL/242U+j+9cCDE83KP7QiJ9vaiqdBqnmCH
         c9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028209; x=1749633009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwmthOPo3ZeLQxOOTrEK+OkcJyUZaBTnj0LjrMJahQQ=;
        b=kyw07BnQMz2je4W/reMZw1/359p1hONXQKF8n0bxklPlnwSi+FxMCiYzyxst+L4w7H
         pjrHOzbKLATVXcoifuqkH4O0/Tor+UhgWkJJgibTd0LcClpO2+emAxQ9UMtDmDZOwaaE
         pyz32YSX3IFZTb8c0RciJlwsdnGvZsjFqHQfvw3c4sYWTLQ/jClsvHPQHRDj7vT78Y2s
         9qRkRZ4emAtWiZML4dx3tADew6zfxj453+p6LGsGzgdq/8ChaR6OCqFpLOM9xRmdu4Hw
         WA5hEYKy3p+mFl0B9b3l2OSyFMK6xv6v2bpPKVQTw7Iwj7TM7Hh6eRsYFbCYi3PNhUT7
         pigA==
X-Gm-Message-State: AOJu0YyYbpEU3+MB8xO6DwinMrOcBr7ycuX7xxneJecGMhsN2qRSInIH
	/Mq8sa2e5tNuwtkW4QEGeMKfQHED+uc7QNu0Vfwr50cLRWqNluHGUu9+QnhgziMQK7M=
X-Gm-Gg: ASbGncuDhuv56Vzms8tYLmc4aH4qlXyjBhi8rVcbGbUL4b0AzXktHTCBuZzkgw5l5rK
	2tIQOQ0Pe8c4k0MHj6vDk5u6kX6CR+gSDBkd3LSZ+pO8Wj2HJKOxiEWl21PBLf/6iZOcEmL2Z5f
	9uzdwMaT/lZMIEaZrH5ESxCvBGRczyQ4XlvCWosHwWc89w4guojt3ATGwiBpRniFFPPmzLEpPdm
	Md1XeaYnKv2cbppRcJZMi+z0VLwvs5l9VCH7OPdvcwrW0ZJfTpyZGO+ToBaocRUSG0Z7CyeWA2V
	yzinS+YuxHxydLUfconMU62mXY8Um/LTPZ1A4n/3VWPGJuZY35InDIkr1beeDOPmTLHqpQ==
X-Google-Smtp-Source: AGHT+IHwbnqda0WUALZPR6BH5wV/ac7KPGSXsO6qAre2G/QftXFom+glyTD0clAk18FXdlE5JE+qRA==
X-Received: by 2002:a05:6000:4011:b0:3a4:f7df:7564 with SMTP id ffacd0b85a97d-3a51d6832f3mr1560987f8f.0.1749028208696;
        Wed, 04 Jun 2025 02:10:08 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-248.rct.o2.cz. [109.81.1.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5215e4ce1sm877352f8f.37.2025.06.04.02.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:10:08 -0700 (PDT)
Message-ID: <95f14895-5c30-44e6-b185-824aacf0f997@suse.com>
Date: Wed, 4 Jun 2025 11:10:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] module: Wrap EXPORT_SYMBOL_GPL_FOR_MODULES() example in
 literal code block
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Matthias Maennich <maennich@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250604005110.13040-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250604005110.13040-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/4/25 2:51 AM, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warning:
> 
> Documentation/core-api/symbol-namespaces.rst:90: WARNING: Inline emphasis start-string without end-string. [docutils]
> 
> Fix the warning by wrapping EXPORT_SYMBOL_GPL_FOR_MODULES() example in
> literal code block, just like other examples in symbol namespaces
> documentation.
> 
> Fixes: 707f853d7fa3 ("module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250526180350.06b825de@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

An earlier patch for the problem was sent in
https://lore.kernel.org/all/20250526211039.163449-1-khaledelnaggarlinux@gmail.com/.

The fix should go through the kbuild tree as the problem currently
originates on its for-next branch.

-- 
Thanks,
Petr
