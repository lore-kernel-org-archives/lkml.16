Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0EA1E0E15
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744313248; cv=none; b=c+XX6I/rJnyQGcoGpa2ulMs8V5JFSV972QiK0yvCfjSziquP4yLjrx3f/rK5AUrJ5NGDk3genVchMPXZ1VRzo+KAAMvqNnjph4Zl/4WyYXa1g73tl7+7aZepTXH8fgfBlJUGsCqzTvNcQvgyUHv811atHwoBNWgjeWIuxllI+tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744313248; c=relaxed/simple;
	bh=YQ4nkvKpRuTZrCGPqBDsfJdbG1p2IYURAYsSu5WUCBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VN1oAXf/qfc88shsmxH6gENtjjCsVhl1CrOKTeTU66ZLVwplHZVYwvsJ+8mlArsOdA7oVmzxIjQ9JAfPcvJQ5gzri579evdO9tFTg2jln8mnFynd3Kh/H3Q9EROcHVc0E4MVTJEnec6bh8v3rdRqPEz6JrtYkFRlLEVYoJlGKvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=beycj7EQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="beycj7EQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf848528aso9265085e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744313243; x=1744918043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5bSl8e7o8CwEQkSt7I/ZxblQGIKY/++dgN9t2+FjKE=;
        b=beycj7EQNglY6qaahaxPr6kyouIHk7YLPL8wYsHu6Mh30drC9fndSIzDTvUWVypkPU
         jUmtt6ZugqoTw8O1ifkatzgbT6eoxxRxDBiCvlgsI4AIuf9+XWOj9jqG/1EaHZvn/L/h
         aPxQY7MJHmQXGAMNiYUeVGmlqTz9c4WthrOfv4AJIRgXSW46dZMXkNJN1vRvyYbaMAk1
         rItiACQlaXMhyWhKd+l/lFG/dkQ7BZBBE7/Bno43D1E/GAdM28v4N3abB7SfTqNEQ8Ej
         CyQ46I0Tf41B2QOp5n47fp6Jl73UYM8wnbaCeXKOeCnsRAUSaaKKL24po9fajq6JPxOr
         agow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313243; x=1744918043;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5bSl8e7o8CwEQkSt7I/ZxblQGIKY/++dgN9t2+FjKE=;
        b=hFOFQDrZsdr4AKwKf4KhK0OD1MFtGYehI1zUZ3vn/kOwYxcEdYrMcBCnWZzXQfTUbw
         47N49eJzsZfwqXI3OEwQu2XAEY1SF9mycI10XgFr6tWOfdJON4IVk1he+SV84as2aU2U
         TBTT5jej4INyq8PNOKCnCgsv4RnDoNYL8ZnGYA5+K2TTjevrqdzyGSmbhXHtouQepE9+
         qQm9L9+wHI0woflhX+HR8Htwespqvq8JAo0qZ74AJjExF5B4LdcO+fUQrvjSd1gIq3wv
         SXtECoHgTlYGoxj/TbuSqkBI8GXkdI10wmdhihyidrkpaPTsKzsUzey0BFdfJXtqQs5Q
         Drsg==
X-Forwarded-Encrypted: i=1; AJvYcCVRAZIKtdCsF9LfBktjElMQkXYSDz2KSwe76CdNv7aMpYwBXbsL+TDpSJyfDiBpBXOZU2cQi7XLh5ZYfwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF+O+Y+wgsAYsVH1MlkaAwlPLRsxKDc55EX+re1exk9hESJ390
	J4+WOAjt6GUZz00A2mXNiSvP1wyqSmN5NJlV4dUH6O1Rne2wvlQfivMxxO7cbkE=
X-Gm-Gg: ASbGncsqe1i3gztP7ChRLcJly1vYecioj0h4ARIMds+BFKAWYQIbPvTY4fjwb9JwZ+i
	FMqqWFa9qddIVP1+M/E7ZLgytXg2XYU7VbeQvKOQy1jGYuuphHRzTL6gpH0Brb9PlhPZhCKJySc
	MClTnoOzrsuBnbcmHsXLBUwK2A11iSJ/rGlQe6tZ+SDpbsc/qMVMiAMa0hEaY9+2CCCECVwWGq2
	HCDBQUtTx3xev/kLKGB1Baf6UI8OzOlUXl0sViGMXmynMbuPzpnvrg3o72JMxnG4n1GVRmVha9J
	yWfzGTPrZHbTV3crsvo6Xnyw/iWlrDXHhH3nY0rCRH2Heg==
X-Google-Smtp-Source: AGHT+IEdVe2mD+cwO4qCB3YFgTnoYH0uwytzAg/jIFK4xqldbmRS8WVHtkNc5j1+SnW32WvdtqridA==
X-Received: by 2002:a05:600c:511c:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-43f2d7b88d3mr44317825e9.13.1744313243547;
        Thu, 10 Apr 2025 12:27:23 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2f08sm61061875e9.12.2025.04.10.12.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 12:27:23 -0700 (PDT)
Message-ID: <e11e9b17-a9e0-4f3d-964f-c8b656403f65@suse.com>
Date: Thu, 10 Apr 2025 22:27:21 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region for
 SEV-SNP guests
To: Dan Williams <dan.j.williams@intel.com>, Kees Cook <kees@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Naveen N Rao <naveen@kernel.org>,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
 Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Vishal Annapurve <vannapurve@google.com>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>,
 Kevin Loughlin <kevinloughlin@google.com>, Michal Hocko <mhocko@suse.com>
References: <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
 <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
 <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
 <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
 <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
 <202504091038.5D9B68A@keescook>
 <67f6bee647aa5_1302d294f5@dwillia2-xfh.jf.intel.com.notmuch>
 <e2933f6e-4bda-40ee-b69c-d7222082fcfd@suse.com>
 <202504100931.DEC3D3B79@keescook>
 <e67bbcf2-02f4-4ce1-8ad0-b1f1381c65fb@suse.com>
 <67f819faa4e0b_71fe294e1@dwillia2-xfh.jf.intel.com.notmuch>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <67f819faa4e0b_71fe294e1@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10.04.25 г. 22:20 ч., Dan Williams wrote:
> Nikolay Borisov wrote:
> [..]
>>>> Can't we simply treat return value of 2 for range_is_allowed the same way as
>>>> if 0 was returned in mmap_mem and simply fail the call with -EPERM?
>>>
>>> The historical concern was that EPERM would break old tools. I don't
>>> have any current evidence either way, though.
>>
>> Right, but we are only about to return 2 in a TVM context, so chances of
>> running old tools are slim to none. Also it's perfectly valid to have
>> mmap fail for a number of reasons, so old tools should be equipped with
>> handling it returning -EPERM, no ?
> 
> In practice that is yet another return code since the caller does not
> know why the "2" is being returned and it is not clear how safe it is to
> now start denying mmap in the !TVM case. So, perhaps something like this:
> 

What I meant by "returning 2" is returning 2 from the call to 
range_is_allowed in mmap_mem and handling this value inside mmap_mem, 
not returning 2 to user space :) In essence something along the lines of:



diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 169eed162a7f..8273066b6637 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -359,7 +359,8 @@ static int mmap_mem(struct file *file, struct 
vm_area_struct *vma)
         if (!private_mapping_ok(vma))
                 return -ENOSYS;

-       if (!range_is_allowed(vma->vm_pgoff, size))
+       int ret = range_is_allowed(vma->vm_pgoff, size);
+       if (!ret || ret == 2)
                 return -EPERM;

         if (!phys_mem_access_prot_allowed(file, vma->vm_pgoff, size,


> enum devmem_policy {
> 	DEVMEM_DENY,
> 	DEVMEM_ALLOW,
> 	DEVMEM_ZERO_RW, /* XXX: fix mmap_mem to install zeroes? */
> 	DEVMEM_ZERO_RW_DENY_MMAP,
> };
> 
> The hope is that legacy tools are either fine with open() failures due
> to the prevalance of lockdown, fine with read/write of zeroes to BIOS
> data due to the prevalance of CONFIG_STRICT_DEVMEM, or otherwise would
> not notice / break when mmap() starts failing for BIOS data in the TVM
> case. The !TVM case continues with the current gap for mmap.
> 
> Or, rip the bandaid and do this to see who screams:
> 
> enum devmem_policy {
> 	DEVMEM_DENY,
> 	DEVMEM_ALLOW,
> 	DEVMEM_ZERO_RW_DENY_MMAP,
> };
> 

