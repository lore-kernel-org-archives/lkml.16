Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2405221FC9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572912; cv=none; b=mzlcWByAgJ6ZbbRbY1VqrzJmdrQ341JMRoLKPdBGRWG2FZ3g8Vr3O5Ni02laYUIushVdCfwAxjdDBbHzaIzjaWhkC8oM5FtgvTOKmaUuur9hYL0gZ8z61A49+jHvLjN2BpRsr1qYtcg4CWGsxH8XfOI3hXJl9AxNew8PTNwbkIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572912; c=relaxed/simple;
	bh=+Cc4XgcuRnFG3ImbtI2i0gsz68YEAnCa9wPNZnl32VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtOxx3JUbtnUUOLlwMY4LRUCETxSWjWcH0NsidDQvjqUwZ+GXPgrEv8JT280kqNAK2QdUMSlOIM91wrlJQnXUKK7EHmqlzstySE6KdOkJ/Nr45Xf2z2ssMnycWhwZBqwhm1t93A3nIFgluy7J9IZVOQz3WZZ5glNTGyId1LN5XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LaXMq+RT; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LaXMq+RT"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so3118250a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745572909; x=1746177709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ex7ttFFeolAsCiQiimZfezkN5TbzPUbUsFH3429aqKY=;
        b=LaXMq+RTre51+C41fw0TjupVjQB99fe5H4CUP/5fwpXlMg+Nlq3UV+RxTk/k9f6mel
         pkUnLL8MrBbE8CGlaHhIgApubipKUmIURhgEU/V2bfksoFgbud3E6FwZ4zk0Waq4TjzN
         Jq4UqvBL0mWJYtadQR2ycny4ROgOUQTXzsaXEPbc5WPg52C02V2pmk5C6paqVLL5Z04O
         eUsY1gKhiKGKrOB8NIUi5y4vhZ7/BeIk89STEKw9XGbg7hJPB2PPPrk0/+g+WGAa5FkM
         q3ceHI6Wi17eJfqJ+9MT4RmPEJ4VpeOhLP4vG49bCHowIVAXZWWR9tOvSMt4NV1QYZrg
         lTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572909; x=1746177709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ex7ttFFeolAsCiQiimZfezkN5TbzPUbUsFH3429aqKY=;
        b=W2rroY3gJ5iN16aXNqkoOB2S01XtpipoM7b4nZdoffTkVC9u4MRfcy5qCVRIrigz2Y
         Xmv8pSMF00MIveJuFQ/AZzEa4uxKzFSbdq1wc65zumtQnKRe38KTIbbIh5GhpPmoELCk
         79Ps1hcy96Sk2iHoa3fetF6ytfiXHSV4yqGZoQzLSn2fZUSdrNL6jC9qhdZMk0i1Lxhx
         LGn4FEQBfY7Jq6cPHccNZr4XAsqksti/ctDTJQksPn+49acNv66u9YQXkuvAX/ScxSwT
         rQFqS9g24sRIqXGKBqSpJXWdWSc2U3Hly5qy8ilPH7/GoEdwl8X2kopbtkMbtTP1srVk
         7zcg==
X-Forwarded-Encrypted: i=1; AJvYcCW24W9EufL/EvHlCGXY6olk0/o0rpo6NdfyLK3z1zFp07V/uDJVn9qWHysph3csCsfPcWHM6yNrpj1uMqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDb+OciBiyJfWKEIK1dRN5YhayaGYy/5Tz8Dq92OrHsQkzGkLD
	mqG5jtTJChDtzPG2Aua+rmwyEuhbcAd7kwcDGocY+XwS5vgH0+AMx99XHQMX/80=
X-Gm-Gg: ASbGncvgLJnERi8u0ESYpIUVeg21/fpJZwJYtaM8b6p+xsHmQMl2b3D4AcVsyIkNbK/
	X7RuU1BwqmwWWZfzYkEcAzHM3KqjeqIc+NhmEAnh31JTDYmpuc8RI3heKIdxWntY2c0bBbfK6l+
	AGwel/d8TOmnqL+kewri2uiQXg71ifvoP67M6pOPCb8CHtLXAkCC8ZJxFPglO0ppCBu7pvX3sjT
	hYn6Gb3dOUr6SY7SgJO6f3801V+DgB7YuFQC1/gEFzVBnMkA5oIZor8IAA0J3kv7WCsfbFMNXbq
	9X5rxF53n1x/81QwQjo5iMNqPfr6jb0CgS1j0K53yWm++rIKXA==
X-Google-Smtp-Source: AGHT+IHN1tq8lZGPw+yObmv5OBFBiAlAdlprz4LzswEniu88fbB371A57pfYn5r7p7hN7qREYYhCSA==
X-Received: by 2002:a17:907:9721:b0:aca:d5e9:9ce with SMTP id a640c23a62f3a-ace71047947mr108851466b.9.1745572908825;
        Fri, 25 Apr 2025 02:21:48 -0700 (PDT)
Received: from [192.168.0.14] ([82.76.212.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e726dsm105543966b.40.2025.04.25.02.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:21:48 -0700 (PDT)
Message-ID: <8b222d93-927a-4685-a44c-bdd5d7b34c74@linaro.org>
Date: Fri, 25 Apr 2025 10:21:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: exynos-acpm: Correct kerneldoc and use typical
 np argument name
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>
References: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/24/25 9:33 PM, Krzysztof Kozlowski wrote:
> Correct kerneldoc warnings after commit a8dc26a0ec43 ("firmware:
> exynos-acpm: introduce devm_acpm_get_by_node()") changed the function
> prototype:
> 
>   exynos-acpm.c:672: warning: Function parameter or struct member 'acpm_np' not described in 'acpm_get_by_node'
>   exynos-acpm.c:672: warning: expecting prototype for acpm_get_by_phandle(). Prototype was for acpm_get_by_node() instead
> 
> While touching the lines, change the name of device_node pointer to
> 'np' to match convention.
> 
> Fixes: a8dc26a0ec43 ("firmware: exynos-acpm: introduce devm_acpm_get_by_node()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504222051.7TqaSQ48-lkp@intel.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

thanks!
