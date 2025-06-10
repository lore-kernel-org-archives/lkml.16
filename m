Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8B27A469
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749538328; cv=none; b=dnSN9DFPY6tp1tp0pvPyPMyTTdwa0SWifLuvBZcogeYPks64Lk0A2Q3fJvPrk6iSBdMtdGRpTPjP0iJDOWmCg3/7Srac4zhq/Oj05ER1rY1gjG0PoHusHRQlWYZOkqEykqV3VCTUuYZNJOGKqNRbg56Bpg855IdMtXyrv7J+ciA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749538328; c=relaxed/simple;
	bh=63vKHSyMMH98x77ZhpqkDjIYudxUsrqpcwc5q0Rk+Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GL7JTi1JSgwVir6KZy+EDVp/v9fVj9nKTDACTcLedoF2HdYtM8TNTZJxeGm2YY1lKWJTVYMPai+RJomYBMW3ceDY1vyyCiiMlKlFhp2wQLf/bKtgSozp45B1qduE4zFPTBt4EBK3VbHZttlF0AIW6pDS5RXLh6KT5v4RlnfYkgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S1jDiud2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S1jDiud2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a5096158dcso4330164f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 23:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749538325; x=1750143125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9WA0GWxqKXNqKa1/KXkDFLQZ+thxvXB5fhDogLjWGE=;
        b=S1jDiud2sxjI2owUpNKFWDL/7gCvzvQcTFAq4z2U+rl6KwEpmhXo+QhyD2EqLgb9r/
         duTtS9bZezlLCdCwRCQP3HbPJsXmRnoG1NxNDz8p1NEnNx79jkHI6xQ3uMUWyUVO6hfm
         fzqYJxVkM48c+MpEqJUtGFT7E9bLG5etHypnRqDSV4lACB6s0hJEGrWqFy3WiJsGQrj0
         5nJp0D3DSwii3Ool+qh+IJjb7Jws6ccRjfbmXeVaFOyUxkZtrAG3g6XitAnVOxIr8atg
         pCXBT+K0ggLr88q99v+GsIJhs4NUahtaYtXHsGE9bhjKgwDyRI6hL64QrwnjvHsMUWWt
         dv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538325; x=1750143125;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9WA0GWxqKXNqKa1/KXkDFLQZ+thxvXB5fhDogLjWGE=;
        b=pFIPSktCf975ST9QU4GBMln/jbhn9qeoY5HMeYkPKrIQqfvvXiH2BC4Jsudj/D90LH
         kK5tdY1kcmej5k+fRDgf/e8w0YF/XBvKUk58eadnDyEg0glc69wWjtOlskD+ARHapzEU
         eRLlbgSjL//9aEpuwOhIsv2z+xPGpW88KSDbSQLqtOkq0z0NezEuBQ+X5B3kLkWvYU/z
         DLI2ojtfnarlXS1s+qu8mvqe7OhtVLinYebGUJfSL/PXvrezdsW2OfkjMGSuI5RScFY7
         yBzLCvZ42YB0zccpb4K4+zDvS2snEiIRILJE/ZkBJQ3O2GRA0q133D8vPprw5D7HKlYL
         BzWw==
X-Forwarded-Encrypted: i=1; AJvYcCUH20LfKlF33BZduBC5uIVT9b+2xykTpbaGgJ7duWKl3O0KmoO0Nnm73ySiHbzuTbVyoOaifg9jNlECpm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgqx2JH1hhU1YDBiC8KVyhL+RceKeEr6iHGQOy9W0tlfBufdv1
	u1jwgAxJlXpOsh6oIbIWXs7XxXmUOadXb67pzUNB2P0rhwMNX3oxVqzL26acKFRAA00=
X-Gm-Gg: ASbGncuXWbihP8jJZoImgzvEwtKthx6OCvlIqtID3aj7JInl1XGsABDu19izO0rZ+gx
	rtZRbsspE2qXXy3mwPcxqv0fnoylRFFKMs7RZd8EZFDxrJdpP5LNFay/kreZMpEUDlEjU+JbLgR
	qjCMiAVPR7H+05CUYUuO6vmekZaOw+NQSZBU+F6bRSKUSn4ykzUCVKajhezBgUexe48W+tl0Vw3
	D5iHwYaRpnPLb21IMkPTy/lSGGoAr7I8P/KK8putwOzZafiBEbKX3rBzK23xV7rlJKHLHVKPbdJ
	wxjvKix5mm1ovl+JnYb8Myo3ViTW/an8h4LLYVCYKMeBn9Vtu9z6WPUpd+UggYtNkdM=
X-Google-Smtp-Source: AGHT+IGjxLXmRV1zFEgEiC6eXHaRERXUUvJuTqBOFzsfGaHQ0XwIZ1R6i8g1DzA6FK3xqGtY/MjvmQ==
X-Received: by 2002:a05:6000:ecf:b0:3a5:5149:ed1a with SMTP id ffacd0b85a97d-3a55149ed48mr1314955f8f.59.1749538324746;
        Mon, 09 Jun 2025 23:52:04 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323ab207sm11275058f8f.29.2025.06.09.23.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 23:52:04 -0700 (PDT)
Message-ID: <e969d071-1161-4323-89e1-8a358b3760b3@suse.com>
Date: Tue, 10 Jun 2025 09:52:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/20] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, x86@kernel.org, kvm@vger.kernel.org,
 seanjc@google.com, pbonzini@redhat.com, eddie.dong@intel.com,
 kirill.shutemov@intel.com, dave.hansen@intel.com, dan.j.williams@intel.com,
 kai.huang@intel.com, isaku.yamahata@intel.com, elena.reshetova@intel.com,
 rick.p.edgecombe@intel.com, Farrah Chen <farrah.chen@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20250523095322.88774-1-chao.gao@intel.com>
 <20250523095322.88774-4-chao.gao@intel.com>
 <d1ec91ad-b368-4993-aadb-18af489ea87e@suse.com> <aEaS3i5JhgFX2MCh@intel.com>
 <175eedc5-d82a-4b3a-bce6-2caf625597ca@suse.com> <aEeEbXZglywwo1Rm@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <aEeEbXZglywwo1Rm@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/25 04:03, Chao Gao wrote:
> On Mon, Jun 09, 2025 at 11:02:49AM +0300, Nikolay Borisov wrote:
>>
>>
>> On 6/9/25 10:53, Chao Gao wrote:
>>>>> +config INTEL_TDX_MODULE_UPDATE
>>>>> +	bool "Intel TDX module runtime update"
>>>>> +	depends on INTEL_TDX_HOST
>>>>> +	help
>>>>> +	  This enables the kernel to support TDX module runtime update. This allows
>>>>> +	  the admin to upgrade the TDX module to a newer one without the need to
>>>>> +	  terminate running TDX guests.
>>>>> +
>>>>> +	  If unsure, say N.
>>>>> +
>>>>
>>>> WHy should this be conditional?
>>>>
>>>
>>> Good question. I don't have a strong reason, but here are my considerations:
>>>
>>> 1. Runtime updates aren't strictly necessary for TDX functionalities. Users can
>>>      update the TDX module via BIOS updates and reboot if service downtime isn't
>>>      a concern.
>>>
>>> 2. Selecting TDX module updates requires selecting FW_UPLOAD and FW_LOADER,
>>>      which I think will significantly increase the kernel size if FW_UPLOAD/LOADER
>>>      won't otherwise be selected.
>>
>> If size is a consideration (but given the size of machines that are likely to
>> run CoCo guests I'd say it's not) then don't make this a user-configurable
>> option but rather make it depend on TDX being selected and
>> FW_UPLOAD/FW_LOADER being selected.
> 
> But in almost all existing cases, 'select FW_UPLOAD/LOADER' is used rather than
> 'depends on FW_UPLOAD/LOADER'. You can verify this by running
> 
> 	find . -name 'Kconfig' -exec grep -E 'FW_UPLOAD|FW_LOADER$' {} +


Then just have TDX select FW_UPLOAD/FW_LOADER and be done with it. 
Still, let's hear other opinions but in this case I'd say size 
considerations aren't major so let's make it simpler for the user.

> 
>>
>> I'd rather keep the user visible options to a minimum, especially something
>> such as this update functionality.
>>
>> But in any case I'd like to hear other opinions as well.
> 
> Yeah, let's see what others think.
> 
> <snip>

