Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD081E833C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159105; cv=none; b=RSongs33yOB7s/n/2zMJ7gXlftSga1LXb8Jha7c9t9EpHVap9uEgRBwKETR8iSzE6GD8XQR3iIUMtuN5u9BSGAf0EOKvZx+7s9Eohnb0GrlS30GVk96HM/tWkr2TY0wZBjM1o7P1yifgJyOmAsikVF0dsTvBT+45glEV9WnGwkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159105; c=relaxed/simple;
	bh=HbA7tMOi1Feho6qYy2tg+QgB3PPhFWttRgsDiLAQsAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jadCZTeig4vrThNdX/3pn89YvEHvJsfJzr8EstwJuvesC5NTgfKA4YEaOUPDriyF+5aSUM56Z1WTtPz3YLkgApnwJd6gF1XYBqcREtnN1dLpI2RwB0YetkSI60KQ3FTbsop7AXJfgmFySg//rxgkgRxTqiclMpQFRVJ7uO4PLoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=exJqj0vN; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="exJqj0vN"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso326403266b.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743159102; x=1743763902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQVoBzYq7Puhz7ziaLimw8gEX/xy907ffqXtK8mC8IY=;
        b=exJqj0vN05hcM2+hdinVcnsUjw9e6snQVz0hTycSaRnGMhBH6itJCGMdgcbZ5Zy52Y
         o66gUkiL89P985vVmd0xlgFEuH9W5AmeLjinpZRMR146sfqSfn1QgZbW86n5sDFKq2KL
         hgZnjEWsZuIaJPOhfSgWuYMbXcRH0MCKzR6YYcTqimXOBeeJgGrEwbADEVwHtcoWhEjB
         XgKb6VRAbukQzbm0i7chP9sYi05hyGVOKTclj6MG4p2CykxTv9tp7I5LQbb6DkhqqqYM
         agjMHpOnmHbgvzkBIRkf5erdcdL37ZHCu3JGrkstLqiTKf0qIawsLz1lmrIkXrJoLov3
         bZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159102; x=1743763902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQVoBzYq7Puhz7ziaLimw8gEX/xy907ffqXtK8mC8IY=;
        b=RIfr7KrmJHpVToGmduyTH4h/3Dkcwv26vooMwBjexpuy6Upalztqy7Me/vnSQV3keu
         vsj7+lLW35j6p8IcqNORo1U/nHeT5p9qThGYyee5kbBlaOCCk/h/+nHdJgHaIQRZ0V19
         K1ipkwt7LWLqnvhHoncymh7bqb3IbbZ6cKHU761u31e+FHqATk0lrD9F4qxZFQugmdRi
         xrIFmmgtJ2hZjqcyNI23k0ywJC4o+5hjzymntDcKNFKLECbduIrULJIgZc+QiZywcJzK
         +PmAYvXViMN6rY2GMNE0Gks3u9WXCs7dVnQqlp2nFmnV3+wWdWR2+J1bJ93KM7q+TbGP
         y/mA==
X-Forwarded-Encrypted: i=1; AJvYcCVVLKjUjbBXl3pTwzKCo00K4yyrcScr5uD+iIDf6+8VJCEhE/bmAQJPOXjJ8MlF6wxKyPO2ZXNJCWXnQlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJgrBTbWzGk4wmGFSBMwsex+nLLQ0RIit88m6cJ1RvcL+vDJ8c
	UhwMgDv7uVAafExWK4ptgFqgbk9t7wjjO3pzveswPYwozpJE+E1LDDnab089KAg=
X-Gm-Gg: ASbGnctj+mIGVpEo8Ar83hFcWjwJT11Vj6SVvdRgkVocKuMa/2y4JF3iaRg1JCLqqZG
	M9t7Q3iE/2XRCtoUvapt6vVwlIV5NbNo9WD0KokdkuDWs5U776E0cK3l5QxqMe7Dcn2CFUGR8bm
	W5q43Q8xN50SE3QCi++Zjk4CcNL/P1tylfCtbmiCzt4cv9SMjhfn/VywOu/WODPBlLvDNwo0VEZ
	M7XOl/GjE/LDXrmiakk2H7gi6MmxMt7oT2xz5M+LR7qGwBSlEHq+T6YbaV0rk6Mkb565fhxLhWI
	phVD/iPj8X6E1x9VpvjOE57bc5G5flX4nHK7bzxO0LCcKNbShw==
X-Google-Smtp-Source: AGHT+IFL4jqPAqUnZ7HDp7n5d8sxsztzpjD+EXPGZF738ZKWCkWtSM+MMvDEWhIygYJX8/2agEkClw==
X-Received: by 2002:a17:906:c148:b0:ac3:47b1:d210 with SMTP id a640c23a62f3a-ac6fb10a79amr784650266b.39.1743159101716;
        Fri, 28 Mar 2025 03:51:41 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922ba88sm143453866b.16.2025.03.28.03.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 03:51:41 -0700 (PDT)
Message-ID: <90b3e063-9587-40a9-90e6-1ad792c4a175@suse.com>
Date: Fri, 28 Mar 2025 12:51:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] /dev/mem: Disable /dev/mem under TDX guest
To: Dan Williams <dan.j.williams@intel.com>, dave.hansen@linux.intel.com
Cc: kirill.shutemov@linux.intel.com, linux-coco@lists.linux.dev,
 x86@kernel.org, linux-kernel@vger.kernel.org, vannapurve@google.com
References: <20250318113604.297726-1-nik.borisov@suse.com>
 <67d9c447ddcfd_11987294c6@dwillia2-xfh.jf.intel.com.notmuch>
 <327a23d5-d5c4-4227-aafb-9d4ddd90289e@suse.com>
 <67e2f315af42e_50a3294d4@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <67e2f315af42e_50a3294d4@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25.03.25 г. 20:16 ч., Dan Williams wrote:
> Nikolay Borisov wrote:
> [..]
>>> It seems unfortunate that the kernel is allowing conflicting mappings of
>>> the same pfn. Is this not just a track_pfn_remap() bug report? In other
>>> words, whatever established the conflicting private mapping failed to do
>>> a memtype_reserve() with the encryption setting such that
>>> track_pfn_remap() could find it and enforce a consistent mapping.
>>
>> I'm not an expert into this, but looking at the code it seems
>> memtype_reserve deals with the memory type w.r.t PAT/MTRR i.e the
>> cacheability of the memory, not whether the mapping is consistent w.r.t
>> to other, arbitrary attributes.
> 
> Right, but the observation is that "something" decides to map that first
> page of memory as private and then xlate_dev_mem_ptr() fails to maintain
> consistent mapping.
> 
> So memtype_reserve() is indeed an awkward place to carry this
> information and overkill for this particular bug.
> 
> However, something like the following is more appropriate than saying
> /dev/mem is outright forbidden for guests.
> 
> diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
> index 38ff7791a9c7..4a7a5fc83039 100644
> --- a/arch/x86/mm/ioremap.c
> +++ b/arch/x86/mm/ioremap.c
> @@ -122,6 +122,10 @@ static void __ioremap_check_other(resource_size_t addr, struct ioremap_desc *des
>                  return;
>          }
>   
> +       /* Ensure BIOS data (see devmem_is_allowed()) is consistently mapped */
> +       if (PHYS_PFN(addr) < 256)
> +               desc->flags |= IORES_MAP_ENCRYPTED;
> +
>          if (!IS_ENABLED(CONFIG_EFI))
>                  return;
>   
> ...because if the guest image wants to trust root why enforce piecemeal
> lockdown semantics?


This fixes the issue as now the remapped address and the direct mapping 
are identical.

Tested-by: Nikolay Borisov <nik.borisov@suse.com>

Would you care to send a proper patch ?




