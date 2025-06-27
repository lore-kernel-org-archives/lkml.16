Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A0E225795
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022147; cv=none; b=RsKcOd3WhXdG0Rtxwex1IQNE+evyDZ7M3Fp99nMlwmctmY7oW41vebMr7EfnbaoTxaqEOHBkuDyXfUDmzqNShCc9Bv3rDYXcZp94CqtAhaRu05sIkNr6ECyHurUk8FxfzLQbhxGtoFOtGnZ70KuKXlhb19tZQ4ruN9LFjMTZE58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022147; c=relaxed/simple;
	bh=UbocRxrPuinG6iYFnuvEcRqpEfvfqq9ovOc0tDbRGtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7v4jofoRtGWqNz0vREWHBxpbll1mA7T1QT4Y81+9VkTeApr5u4PwBH8UaTGyVWm38bflk48J2YcliBkVJ6z4Sb4CU1aCL/BP2mbZaUYZEdfW9Q7O0caZlf4yEJtdb9IllVp3uUy27DFrt7UIKZbJjyTgGmC8SpJGjxc+93r36I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZQUl37sN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZQUl37sN"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so1189353f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751022144; x=1751626944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5MB5U8bqYDJvjeC9i1OhQ7bFIZu2Wa/gbdobERtzeqk=;
        b=ZQUl37sNLgIwffCNus2cKZAu9Uzh5XeMjDhwKWFUBV9/TLxQrYWpKedzdQSg9xGMTI
         AY9YQ7J3eOiJ5DFCSOt2tvXSma8zjhxUNEGuHEbHWMH6kq6fciIiIURtEU8Qj2xqEA59
         AU19Ec9SvCI7gQNGKtVbvotIqZiSXTtLDVzVo5vATPPdGA92fupFMB+uqnjs2WX9paxg
         9JTG/V+ZR6bJT9+vymVOMF4L27MiIKsFIdcZutiubRbkfghTxdz807LZVV5iSo9Az4J9
         J8z100MTOjHHWg1kHYzaA6f6V5p8SSKltli1CZc44QDL5nXJTULtpc/gfvapuCOoHEZI
         7Qaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022144; x=1751626944;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MB5U8bqYDJvjeC9i1OhQ7bFIZu2Wa/gbdobERtzeqk=;
        b=PxJt5fJoVrHKnKfAoG76rGTJINeGSBuW8oJ6FhjQApzH2M9ZKA4EdW2wBL3SO77Pqx
         K4cOU/dkKzuT2JiaRNSRNQfdkp9w/rBjSRDYVo4QrRGP2g0pR405KuzBxt7E5cDCqTx6
         hm3p+7bW98lWM94Bx8BN0hMfJsZV4jvfOwcbWTM5FCUemMK3ykJI9O4yJdxIN53z1jB9
         07UFufqjuNqeV1+9o1RXSWCBkdIQsZSB2SK60frWa4NXMGA75sxlFg1zsCOEiUpH03Dp
         GOISaI9QvXhQQ3Mdjz5PKkvdIYDR8eHnqbqveibLZY/UKJ4LonKPHNnwDRcB8kKlaNd4
         wVWw==
X-Gm-Message-State: AOJu0YxH8zoj0KDO6KBEAf/OnZrXOmrr9NOT0clIfMm3R4JWH5L+ZqMJ
	M1B9MVq6tNElpoRg0gfAhHv2b3k++qlgvKHOZN21N5YA8m+LefA8MUu7pn/o3xfrl30=
X-Gm-Gg: ASbGncsS12S6Shk+BqlTNOgCcqdNW5d5arSlo36IreMUpe2JIZJ40PE9hdCLNWD46xH
	xUyBj8fMjDaX1N/D0TukEKLGgSznxJpaR+jYDhedSvOINoRz0MwNAMNShqCGtAEIYXCLXSjtcM+
	xMdyAnRJozA2cfjikv47PbxIkl+zeb9ewTlj7kx4ZwzUmVvRnPAjU9ockMLilq9xrkOfn/+eJoz
	YL8ORB9cHIZFXZXztm/UcJCnj7ujqokx24n3d/grqLSbBJ7mIKIUuxeql8jYolNRtP7GXTHXLSC
	Em+c67Su4tbx8dYthI68YVvNG6EuQlTRS+e/pG0p2wi6ig0kqByC+lB+fg9tgtH4DhpkeaAlnHb
	F
X-Google-Smtp-Source: AGHT+IHdTlXlXAt6xlaCQO8aQcUU0g1Gwno+uw9Gk0I0YiQJvSGgcSxuFvYNh4HIOayLHeaO/O805w==
X-Received: by 2002:a05:6000:2809:b0:3a5:232c:6976 with SMTP id ffacd0b85a97d-3a90038b991mr2054599f8f.44.1751022143774;
        Fri, 27 Jun 2025 04:02:23 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa8aasm2361784f8f.27.2025.06.27.04.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:02:23 -0700 (PDT)
Message-ID: <c161e5b3-0719-4bf9-b7db-e5dd0fa8902b@suse.com>
Date: Fri, 27 Jun 2025 14:02:22 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/22] x86/mce: Separate global and per-CPU quirks
To: Yazen Ghannam <yazen.ghannam@amd.com>, x86@kernel.org,
 Tony Luck <tony.luck@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 Smita.KoralahalliChannabasappa@amd.com, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 linux-acpi@vger.kernel.org
References: <20250624-wip-mca-updates-v4-0-236dd74f645f@amd.com>
 <20250624-wip-mca-updates-v4-14-236dd74f645f@amd.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250624-wip-mca-updates-v4-14-236dd74f645f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/24/25 17:16, Yazen Ghannam wrote:
> Many quirks are global configuration settings and a handful apply to
> each CPU.
> 
> Move the per-CPU quirks to vendor init to execute them on each online
> CPU. Set the global quirks during BSP-only init so they're only executed
> once and early.
> 
> Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
> Tested-by: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>


After this patch the code ends up with 2 sets of quirk functions with 
very confusing names:

amd_apply_quirks/apply_quirks_amd
intel_apply_quirks/apply_quirks_intel


Better naming convention would be something along the lines of:

amd_apply_global_quirks/amd_apply_cpu_quirks and the same for intel.


> 

