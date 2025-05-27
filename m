Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D925F2882B4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374148; cv=none; b=Odn+YyqxpRLMb7iCjOkRVAs0v1PH1H8MuKTkpfCLihs0x/hORrAi20AezPZMS+LkVSEyfViwf+lw1y3aZzBgCo9gVrjoVUHJ98UpvKyQEwe6b8AMcMrqra6wvUDTmKHPg6cQ6FeWvhrlT64HPhCfVqz4nKtIy9IRadTKiBRBg7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374148; c=relaxed/simple;
	bh=OaOOAtSnweqXyIU06iIEfTg9eKG4w+IbHK1wd4iDOr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JW12810fIMDkCEdn8Oh0i7ClKXecHqWacCuDaeY4LnMX1eaANpVTI6L34aC+atbL1f91pt+Ax242fH2AEPYs1VNccBX0vzFUMVsGthFiQlQHtYkiSkAghnFI7jR7suWong7jKRqEYL9m7nTtEiYy5M0jeXfpTZr7ZrDxUcL6jdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=hWz3gCbk; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="hWz3gCbk"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acae7e7587dso502634566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748374145; x=1748978945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d8f8cRXBIaSUiD+jqzQPTTySxAp12ySeCn5E8hwZTzI=;
        b=hWz3gCbkFiiPfzVzlxPJDkjVqYvKqYfHX81RR9XfcVuQC3uQWEO3jfrgF5oJythDmb
         7VmyQ0DWQATa3yJrYYnkZusl1Qkt68u+ybO2940tEJdy0NVgHqYLxG2g7jWrYZnDHvQW
         5VLDDcaCx8ojD3ssF60oG94tFvMhipcSjiYks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748374145; x=1748978945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8f8cRXBIaSUiD+jqzQPTTySxAp12ySeCn5E8hwZTzI=;
        b=FKc49kQ971KZhkNbJlnUKc/Cq1WXWPsgRkv2fyupy2HDdsoL+Iwkmvs0KJHy+Exvno
         1OTkqckotfTRN9WHDA+Ju7dIJ/d7vexeg0j2Jb72pBeqzG8kSmtjM3ifVdBz0qRLBZrG
         I67UtxtSPRbHF4mE0GXTKZ8GlMpIXKyI0tKS3gaU3QpGUAUTi+TWrgyJDCsaCDfdXpfH
         uxZcpAtu6vJemry0likBFs4esciJGP/kEeWy5ebEM12NoNr++x8Om7hPdnA9jiS5JJAA
         4oLnD4PWcrFF4ab0XAk3adVnUb5vTyHvuOU+jHWaUfQRvHu+apeVUb7eib05zew9w5Ha
         Wz5g==
X-Forwarded-Encrypted: i=1; AJvYcCX6e7LD5Rhv2a5JdvP6QGDdEQiPJAXUbOY12ay+qm877c0t1CqDJGnZ+iFpYgsu39kZvvvl6OjaoTAxcN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfsUv4GLtXg8BMI6xH9kDg7YyCdCnkrmZ5dXJ7WDbl5w8+u1kI
	oWUr+65qj/FNOPGCbiytNcWe1FDy37paDNCtlvmnos4bc9kHpYCUK+9QYB5CW9Wb7u//Yal6qC2
	M0Gxj
X-Gm-Gg: ASbGncvf71TVn+xVaBMFJM6av81xy51XqSb1D7Y+VtqsJzdl4KnOZf7XkxHcl/p6gw7
	QXYxT7A4BvKDBx0Hg09DxOJrmM5z3AkM926ZPS/CYWNKtXXFEGON63XXt+qltCre9RfXCtf4l4w
	S7st9ongCJWJhSH07RR2bPoYIxHGVQsg0VvgvnYO9GNFkEoyXynNOp/fVp43/KwcsmdkhZu3qBV
	niJfU/ILlQOZnooZxBv/Ee7LVYJOD/AO4fR2hNjOscDC2QnHqsQwuSy7INvbkcmoMaFfxd1OCoj
	CVQBP16vahfr1eBu/6TaTwAcNljDcD2q7FtnCxLUFrTxa2vdjZ0J9metdwxmuRk4bbz4LfLGjJe
	bJObzmcmt99Lggtxr
X-Google-Smtp-Source: AGHT+IHjM7F6Vh28qgT6ieIonz5jPf+BRrLp65zVgJWKEWSTyGpNkeLcqb9bTaZiwdxiIrXswAv5aA==
X-Received: by 2002:a17:907:7e93:b0:ad5:520a:8e02 with SMTP id a640c23a62f3a-ad85b1de69bmr1189279066b.39.1748374145101;
        Tue, 27 May 2025 12:29:05 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad89f089b04sm144166b.68.2025.05.27.12.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 12:29:04 -0700 (PDT)
Message-ID: <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>
Date: Tue, 27 May 2025 20:29:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
To: Xin Li <xin@zytor.com>, =?UTF-8?B?R3Jvw58gSsO8cmdlbg==?= <jgross@suse.com>
Cc: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Zijlstra Peter <peterz@infradead.org>,
 Hansen Dave <dave.hansen@linux.intel.com>, alexandre.chartre@oracle.com,
 Zhang Tao1 <tao1.zhang@intel.com>
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2025 8:21 pm, Xin Li wrote:
>> On May 27, 2025, at 11:36 AM, Jürgen Groß <jgross@suse.com> wrote:
>>
>> ﻿On 27.05.25 19:54, Xin Li wrote:
>>> On 5/27/2025 10:46 AM, Pawan Gupta wrote:
>>>>> Attached is the serial console log and my kernel config.
>>>> Serial logs aren't telling much. I do not have a Xen setup to test, without
>>>> Xen the config that you provided is booting a KVM guest just fine.
>>> Yeah, as I replied to Juergen, the same kernel binary boots fine as
>>> "native".
>>> Unfortunately when booting as dom0 on Xen, it keeps rebooting w/o
>>> helpful log.
>> What about booting Xen on bare metal, i.e. no KVM being involved?
> The same exact problem happens on Intel Simics.  And I got to see it’s a NX page fault in dom0 kernel during apply alternatives.

In which case it's likely that there's an opencoded PTE update, rather
than using the hooks (which are suitably paravirt'd).

> It takes a while for me to set it up on bare metal so it won’t happen so soon.
>
> A more serious question in my mind right now is that who are acutely testing latest vanilla Linux on xen?

Only upstream Xen, and we're looking to try and change this.

~Andrew
