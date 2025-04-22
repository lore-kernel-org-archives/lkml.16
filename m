Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AE227510B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330970; cv=none; b=GzdOI7Ce0DykH/vsEty2ZS1rdT3jqCsC0OexruEr2RoYWDRUgh8bOnJrhIXL7lnko52LqPOsF/9ebxKBysAzHhTFtVJOexSUi12nzN1DzzqwyXzNMW9N4dAhw/oMUvpWlZWnOWDddttbYZaOop/ZVMdXbFXd5IDSCEKvzqlSjYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330970; c=relaxed/simple;
	bh=4WUL+kRVdXJ4YqP3HWnBAaAj2sgwvzUpdes1f8Ws2HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHmu+An9ld3BaZw/h+JX1K5Hq1L1GBpsj5XYPjrcaT2i+lPBKnfeUklSRhRNUcdTM2YSgj6sGFzXX+IMHsZ4QQqtLjD4PLVUS2W0I1i9I+3gQnlLVNk+FZquLAIB9HqYBuIS0bK1m3uXfeMMnDn8tndiSJeqyEq69gUdWWaSSm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YdzaS3FC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YdzaS3FC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe574976so38554655e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745330966; x=1745935766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=etzYKPdfFIVAafOh3+s0YxsgTDS1jvvGazVnTpn/4ZE=;
        b=YdzaS3FCEI75gUzcFq0ZR/CvKwjx+7LxlMwUyeZH7WtmKdAPCUam9nAspSIJw8AS59
         3XGeAs3luRIkjeDoKNG5J9L5Ewlt/7y8PJk3uclWV0SPuERI9frxconG3GkIARcThGr6
         Qbf2J6eC7E/65UA/49BOLlZNXyKFOXn0Tbc7jZ7Te2sXFyvaAivdOtq1pQ6vDK3MBvbj
         HTElDg7g5weo1g+7d0lNIGK7HDRT5zys21TxvbnsjnOwmpxoZRIA+nUmMcp518B7BQVz
         mmxD/x+REBksY8O0/LzdaZY+a8ID0Kh/BXypVgdypvq58tlgz9Hpt+bvWhgs/DEG2KEc
         xQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330966; x=1745935766;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etzYKPdfFIVAafOh3+s0YxsgTDS1jvvGazVnTpn/4ZE=;
        b=CQmdR7HIR07UywGD3F9+2gUqu0goB/UddNmGRB/cn7zHvOeIFv6wV4nf6uKvAmNXkJ
         ved6G5+WzLreVeS3GWUuZUd9paBe79TfQkiGnQHK6QU1MhImTailFNtdLM9RFz6P3gc9
         nz7LwkneEUfoBeLEz8hQR+5dvqdfNjgTe9pC9k7o+AZCN6HH25kA02lz8//3nlhfo+XV
         /EucOgw9pOnJhTFwTZ3MmRYG4/wjkkgio11DeSujnBQqjOZfJDWHlKV5JkPteLsKBOgf
         UYLLA3h4F7QLyoFK4Bcf8KXn9hjhaKOslLxQrDV7gSm7IVM1kvOnH4bN8XApL3hWvknB
         DBcw==
X-Forwarded-Encrypted: i=1; AJvYcCXP5F4gfJ5ETNhm3uXtbjkdiht16614b7lx5CmLU/dBiRvcwXgVURUlmRuT5Sq7FsUKb+4UnymtYHm4RJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLleNuB7yamf8AJs2dI+5jXJSKXlzH/IpsA8PD3mbaxPBImTEp
	/7Jbmge1w6Z0pCFksQoaAQQt3h93kdxnwjamcuN/zUAYONJXPU3JroJ+9fuj6hI=
X-Gm-Gg: ASbGncvAqUNPmmVNiokSWhdUwe7BUEfdQ5iBkASETv7paIfxaJdw9WRBp2zunTAALEd
	Vcm6uEYNjbIWT0TLLSW9jbJ0AI9OiWDzVKYu8VRfxIk1dIg2d8dlk6Qr0VcXnunqlvO0Dw0D/1i
	7hjZVFqoKbSFKSPa25ssdS3e0pUDoVo1zPhbW1pWGwG/h3G5bjh1xxtWTB9sy4ik2Msa8Nn7/aa
	Bzr6LiBeGnQdxGrZ9rQMzw9dbraYkgaUnCdMMdAYDYiQX21fLxxwTtZZWjT4HsSpQMu3ufcRAzz
	z04TlecPofvqj74YIMVueuwFeAwk5qfVAFVlX5g7IFAK
X-Google-Smtp-Source: AGHT+IGbEm6WLpkN1s6bPsy2k4y3Qs9ExG7sHa0JjGc3i8w4ykBTzS6UnnOmFNbB9lH6qijzORtc4A==
X-Received: by 2002:a05:600c:1c12:b0:43d:7588:66a5 with SMTP id 5b1f17b1804b1-4406ac21bbdmr166257855e9.31.1745330965876;
        Tue, 22 Apr 2025 07:09:25 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5aa100sm178139995e9.7.2025.04.22.07.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 07:09:25 -0700 (PDT)
Message-ID: <99902694-65b0-4c0b-bc71-b082efb15625@suse.com>
Date: Tue, 22 Apr 2025 17:09:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Restrict devmem for confidential VMs
To: Dan Williams <dan.j.williams@intel.com>, dave.hansen@linux.intel.com
Cc: Kirill Shutemov <kirill.shutemov@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>, Kees Cook <kees@kernel.org>,
 stable@vger.kernel.org, x86@kernel.org, Naveen N Rao <naveen@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev
References: <174491711228.1395340.3647010925173796093.stgit@dwillia2-xfh.jf.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <174491711228.1395340.3647010925173796093.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17.04.25 г. 22:11 ч., Dan Williams wrote:
> Changes since v2 [1]:
> * Drop the new x86_platform_op and just use
>    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) directly where needed
>    (Naveen)
> * Make the restriction identical to lockdown and stop playing games with
>    devmem_is_allowed()
> * Ensure that CONFIG_IO_STRICT_DEVMEM is enabled to avoid conflicting
>    mappings for userspace mappings of PCI MMIO.
> 
> The original response to Nikolay's report of an SEPT violation triggered
> by /dev/mem access to private memory was "let's just turn off /dev/mem".
> 
> After some machinations of x86_platform_ops to block a subset of
> problematic access, spelunking the history of devmem_is_allowed()
> returning "2" to enable some compatibility benefits while blocking
> access, and discovering that userspace depends buggy kernel behavior for
> mmap(2) of the first 1MB of memory on x86, the proposal has circled back
> to "disable /dev/mem".
> 
> Require both STRICT_DEVMEM and IO_STRICT_DEVMEM for x86 confidential
> guests to close /dev/mem hole while still allowing for userspace
> mapping of PCI MMIO as long as the kernel and userspace are not mapping
> the range at the same time.
> 
> The range_is_allowed() cleanup is not strictly necessary, but might as
> well close a 17 year-old "TODO".
> 
> ---
> 
> Dan Williams (2):
>        x86/devmem: Remove duplicate range_is_allowed() definition
>        x86/devmem: Drop /dev/mem access for confidential guests
> 
> 
>   arch/x86/Kconfig          |    4 ++++
>   arch/x86/mm/pat/memtype.c |   31 ++++---------------------------
>   drivers/char/mem.c        |   27 +++++++++------------------
>   include/linux/io.h        |   21 +++++++++++++++++++++
>   4 files changed, 38 insertions(+), 45 deletions(-)
> 
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8


Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
