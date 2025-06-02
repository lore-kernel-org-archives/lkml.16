Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782E5227
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748868629; cv=none; b=DT/vQiABLMB8X5h9qNj+dXcoAE+RntcF/OU/Bp6/4h2/QQDyJAJT6DEaUkUIsHlsuCbFcviW5fi2+d81BXXv4qF9Q19FwukiGVnFz26eO9kov0h60gp1U4N0HqkV0viPT4PCeTL2kBNpeiguxF8e+gSx4KeWUYGOv7Ldy3axtw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748868629; c=relaxed/simple;
	bh=5G3CEcHjyLUfLhtR42+j+KALXQp0tNC97BMRtb+fTyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmW+I23d1mQ99vVKUrda+ykv4w+kXAOi+0Wfs8TXeQbVSPNt0TZAA8FDHYG0fpKtRxF15gVTK8mE3mfOIsroi/I4frcptrpHZ1wbIWddV2UyHXNPz//BMkNkU9xKYT3G0bNpL7/w8NWBP9mJuXCpNgApVkOmc+fLDfYeaduICpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Uz+qE0dc; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Uz+qE0dc"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60462e180e2so9291071a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 05:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748868626; x=1749473426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AuG7xwjsdNNiPL7hovGzGxZc0DBRkYJ8vtTWBvnDZ2M=;
        b=Uz+qE0dcOSKi5MKpLwLmZdUPvgUEDO1kmbpbJq33C54pBhqjsaCxUPynrHzM/eA7ky
         J7J1ZDlYXxJ+vKuqu1pwYPdsACBTAIO4X09CYEQzYz7fEdwhvXToV3LRWffxcUwkSgkx
         ci7ShmEusYTkiubGGep/Yhs4lxeIN/Re5lJI60hJqZXJkxeyBchbsEo1GOLY5l7DJJLd
         RKYaUEevtyN6KFI/tCjjEyBpyVn21JrxCkXXXMZvQ/7tUZrDD0UkEDFavIYeDuRyQ9Fr
         ZnDQNO/j6TSrxpGCnrvsFC/MDmXQ+nsyNjUQB00JgIxCNBlnjm6WT8/NyUPQYTtw0YNL
         LlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748868626; x=1749473426;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuG7xwjsdNNiPL7hovGzGxZc0DBRkYJ8vtTWBvnDZ2M=;
        b=fPpl79QppsmG5eEsai7BC/Z97zwhXD079rGieNaWbLRDVKXKZApLLjwcZK7Dd6xk2q
         6O5tvqSp7OXQtDzTE6nInPWeO8kU6eUFKeT9fx5npY0p/P2xfrXijXGpxwU9r1Su6nSV
         tXRmOoDLwymi2PErmN0jEyUb4peBvFoK2jvYjneP+cNJbP6x3hcHdqjAI4pC2QoFW+W5
         FxpJoEt7lrC6Chl3YyBx0BZxq7fjo3xWBuK1Y/ouXAMflferPeafkxOJkYxjuPqvcza6
         V3D0lJjOgz3+mLU9cV5Ii5LXCiAsLbDnRYz0gre6sNPihs0aVbwz5YnzAPzNwC0jLaU9
         Vx9A==
X-Forwarded-Encrypted: i=1; AJvYcCWADZmMGHu782ZHMNHA3xacYbPx88oGnGpaUj/G62qvNglwhlYRip+rK8bicYqLrv4G+r/SOE6yqwO3BPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZFsfQe6mDmluCCAob3Z2mWnDznyNI+0bObc1xacY0G6VKHB9l
	WJkOv9oiA6tp/Z74zD46B0a3zmOvcUGbMDlntwJOyx9TKQHWefZIpixTCX9p+G7b35w=
X-Gm-Gg: ASbGncu5oxXB6FFkQH/EiPJzgrNbmHGtN8K3o2KB+rfSE1ZLuJblGPImzF3KKV36k5r
	o2+eSI9TG+jIbFkVTMOR8nkYymjn/kKkcTPdYR8GOBNuIeSXH4D4scjAO0jg72CYl/Ae9QLDNz5
	1OeaQSPpo+Q+rRnEOve8xUiNmyaYGnCHjdmrZ6S+0rSAG4gMFNtVyda/ZS+5ba27+vcNiNt4f+N
	NNrugpZKspw0L1prvs9J9D4r5M+0B7kZDFikzWqNAlWuy5TKUi27X9P8LzGrwxNx8bNs9eEX+kd
	gUPwppy3I8o+s1G91h9Id5686X4ozdgNHFQcBe1MuGtXm5fzuc7RwfAH
X-Google-Smtp-Source: AGHT+IH6DxCLWYrDygQN3QIL9gGZsLQSxTFfge4IINaZgXAw9wAjRpEXx+aSqzh1ccJ2t6FyAOPx4w==
X-Received: by 2002:a17:907:7246:b0:ad8:9c97:c2fc with SMTP id a640c23a62f3a-adb36b31a5dmr1029799366b.13.1748868625763;
        Mon, 02 Jun 2025 05:50:25 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5eb54d24sm784274166b.123.2025.06.02.05.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 05:50:25 -0700 (PDT)
Message-ID: <206656f9-917e-4478-b731-ab7e05bc8a74@suse.com>
Date: Mon, 2 Jun 2025 15:50:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/32] x86/boot/e820: Simplify append_e820_table() and
 remove restriction on single-entry tables
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-26-mingo@kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250515120549.2820541-26-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/25 15:05, Ingo Molnar wrote:
> So append_e820_table() begins with this weird condition that checks 'nr_entries':
> 
>      static int __init append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
>      {
>              /* Only one memory region (or negative)? Ignore it */
>              if (nr_entries < 2)
>                      return -1;
> 
> Firstly, 'nr_entries' has been an u32 since 2017 and cannot be negative.
> 
> Secondly, there's nothing inherently wrong with single-entry E820 maps,
> especially in virtualized environments.
> 
> So remove this restriction and remove the __append_e820_table()
> indirection.
> 
> Also:
> 
>   - fix/update comments
>   - remove obsolete comments
> 
> This shrinks the generated code a bit as well:
> 
>     text       data        bss        dec        hex    filename
>     7549      44072          0      51621       c9a5    e820.o.before
>     7533      44072          0      51605       c995    e820.o.after
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   arch/x86/kernel/e820.c | 35 +++++++++++------------------------
>   1 file changed, 11 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index 447f8bbb77b8..22bfcad7b723 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -483,17 +483,22 @@ __init int e820__update_table(struct e820_table *table)
>   	return 0;
>   }
>   
> -__init static int __append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
> +/*
> + * Copy the BIOS E820 map into the kernel's e820_table.
> + *
> + * Sanity-check it while we're at it..
> + */
> +__init static int append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
>   {
>   	struct boot_e820_entry *entry = entries;
>   
>   	while (nr_entries) {
>   		u64 start = entry->addr;
> -		u64 size = entry->size;
> -		u64 end = start + size - 1;
> -		u32 type = entry->type;
> +		u64 size  = entry->size;
> +		u64 end   = start + size-1;
> +		u32 type  = entry->type;
>   
> -		/* Ignore the entry on 64-bit overflow: */
> +		/* Ignore the remaining entries on 64-bit overflow: */
>   		if (start > end && likely(size))
>   			return -1;

nit: All this function wants to do is simply iterate an array, I'd say
the standard way to iterate an array is to use a 'for' loop.

How about doing this instead (on top of this patch):

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 22bfcad7b723..41aa26eae594 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -490,9 +490,9 @@ __init int e820__update_table(struct e820_table *table)
   */
  __init static int append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
  {
-       struct boot_e820_entry *entry = entries;
  
-       while (nr_entries) {
+       for (int i = 0; i < nr_entries; i++) {
+               struct boot_e820_entry *entry = entries + i;
                 u64 start = entry->addr;
                 u64 size  = entry->size;
                 u64 end   = start + size-1;
@@ -503,9 +503,6 @@ __init static int append_e820_table(struct boot_e820_entry *entries, u32 nr_entr
                         return -1;
  
                 e820__range_add(start, size, type);
-
-               entry++;
-               nr_entries--;
         }
         return 0;
  }




>   
> @@ -505,24 +510,6 @@ __init static int __append_e820_table(struct boot_e820_entry *entries, u32 nr_en
>   	return 0;
>   }
>   
> -/*
> - * Copy the BIOS E820 map into a safe place.
> - *
> - * Sanity-check it while we're at it..
> - *
> - * If we're lucky and live on a modern system, the setup code
> - * will have given us a memory map that we can use to properly
> - * set up memory.  If we aren't, we'll fake a memory map.
> - */
> -__init static int append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
> -{
> -	/* Only one memory region (or negative)? Ignore it */
> -	if (nr_entries < 2)
> -		return -1;
> -
> -	return __append_e820_table(entries, nr_entries);
> -}
> -
>   __init static u64
>   __e820__range_update(struct e820_table *table, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type)
>   {
> @@ -796,7 +783,7 @@ __init void e820__memory_setup_extended(u64 phys_addr, u32 data_len)
>   	entries = sdata->len / sizeof(*extmap);
>   	extmap = (struct boot_e820_entry *)(sdata->data);
>   
> -	__append_e820_table(extmap, entries);
> +	append_e820_table(extmap, entries);
>   	e820__update_table(e820_table);
>   
>   	memcpy(e820_table_kexec, e820_table, sizeof(*e820_table_kexec));

