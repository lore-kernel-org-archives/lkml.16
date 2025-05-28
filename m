Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E642288CB4
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443262; cv=none; b=HGIC7VistZZo3RSCZlK7TKa76znNb3ml+sgFoWUH3Lu/FHtUJs5GuI7Xr8dde+iVnO/BobFyPzc+LCQHc7sGyES4hvph83g2z/PtmvlnLhwzIZkjxcPII6zi2H081EuH5T+kjZEwftwFguK7cCtaiVLtJOyJnOIPevqlKOWXx/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443262; c=relaxed/simple;
	bh=Fm5mERkZ5mbb6HoXIl9RdvgtWoN6R79PF710VN5hP1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0XygSRi6+CDW2IrcO179Jh6+nRJ00gZHk8GbEoPo1OmPlW/gacWxmteAL3xwDWHPEGRmi/W2Jb1u4SEEuLErxCJnblrVod4Ag2GgbYfwOlDW6K5whqwqMQ3qVHZKnpQM4c5U69QoZstPrdggcMq8+uOlzL1m3iE46ADoqQfIxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gs3/86No; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gs3/86No"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748443259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cKL8YRgpNYt5G4RoAQa5HP5khXCi0wFujxghLQX798Q=;
	b=Gs3/86NoQmp4j93BtDyZfgf/KGZiRr0UfgNPbDQAXlZxWxOdMdNim1+zOe8y8JZpanUWGI
	/elM/777HT1auje6gCu7poR4NZ5CRzGjK67NdwmSYmQP6CHa75HqmTxShg/23YPGwnbD3I
	tzI3cejm4XKO0wtU1MdUFshbvwjxEMs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-QTM3fYzePBu4wRGkqNqdrg-1; Wed, 28 May 2025 10:40:58 -0400
X-MC-Unique: QTM3fYzePBu4wRGkqNqdrg-1
X-Mimecast-MFC-AGG-ID: QTM3fYzePBu4wRGkqNqdrg_1748443257
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0981315c8so6194585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443257; x=1749048057;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKL8YRgpNYt5G4RoAQa5HP5khXCi0wFujxghLQX798Q=;
        b=NXj452oFZ8v8iIuY3WT6UpOTjg5FTkVyRkqFjTfLRwta1eGYe1d2jLgyuoxSv8a8EQ
         M7Kqg0F7mhQgeENTi9gcyJRRCV3Kyv0uxYpI7rOfhy0i3m7HaSqINUfxAj8VpgjfwgGg
         M1+SgdD9fvhg36kbc+bWkBjNokmb0huPWzNSCJKfY8iGuoEj+Xr39WFbze7acHMBYyNg
         wkXbCa6hpUonlvis40ukF2csrfmbKzAN8kElaWl2KXh2RPrb0NVYyPA95bzHTlU5HhRI
         pY+cmbw80SqkWPp241wLc6mWdTv0jD80u/IMs2BBHPS8hf6AjpTBPc9G9t0n+7OugONk
         WUVw==
X-Gm-Message-State: AOJu0YwXcwYxpgHWx+vF4Eo0ODiNr45XC56iOG2lAlcy6/IXuAcdlzzd
	+SB8Gqk7hxNHLGIDOgDh79cdslu53X8eNoXmOAN5OpsziB5YW3NfzacVPaJs7FeR098Asy2QZDy
	EfwyYTujNQJOET5hR8/AqAa0Xx+MiLWVQgJ+OD3RgADblAkyQp0hfQEkCpx9kUobObA==
X-Gm-Gg: ASbGnctiFgwSmy8bEU4VdwjiT6pXJsXlFaAQK8ljTX8YL0Hw5/b1V7uQLZhPb8RqhUV
	GdUUPLUIPcUAnWr6L+DpHfZyavW5hfywIt2iEeitcDaUAOMFUGODbRF0sgIbqhYuZfp10PowbRQ
	ufgnhEl9S6Od7JeVlp3sGEAoEQ7A7jSElC4cmxloOSxhb2rWiE9s0xx/b5WseAdIcT8eBo+iHRj
	FbSyPRpiCXvzJcQ6ZneMNZ99WaqUzGfbheHvWEiNuacyeAASuH35XTZLYwYGz8j2/2FXVsuo8FI
	tK/i1iFqcUYEIKeXAO0AmcsxovMRcIq7BF8WZcGbe3cSsLUi5emqV3R9IlVge2aJHl4=
X-Received: by 2002:a05:620a:470b:b0:7ca:cd71:2bea with SMTP id af79cd13be357-7ceecbe06abmr2836880585a.37.1748443257483;
        Wed, 28 May 2025 07:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4rSonxKZdNqsFk8pafzF6Bnr5HCcMsto+364S0zQ3gXfJGfRmrOenFL6UZ1DMmdjdyjz1fA==
X-Received: by 2002:a05:620a:470b:b0:7ca:cd71:2bea with SMTP id af79cd13be357-7ceecbe06abmr2836875585a.37.1748443257132;
        Wed, 28 May 2025 07:40:57 -0700 (PDT)
Received: from [192.168.1.17] (pool-68-160-160-85.bstnma.fios.verizon.net. [68.160.160.85])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfb8212465sm77474585a.43.2025.05.28.07.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 07:40:56 -0700 (PDT)
Message-ID: <d6940b24-d78f-4da5-a8fa-6a408528822f@redhat.com>
Date: Wed, 28 May 2025 10:40:55 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 45/62] x86/extable: Define ELF section entry size for
 exception tables
To: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, live-patching@vger.kernel.org,
 Song Liu <song@kernel.org>, laokz <laokz@foxmail.com>,
 Jiri Kosina <jikos@kernel.org>, Marcos Paulo de Souza <mpdesouza@suse.com>,
 Weinan Liu <wnliu@google.com>, Fazla Mehrab <a.mehrab@bytedance.com>,
 Chen Zhongjin <chenzhongjin@huawei.com>, Puranjay Mohan <puranjay@kernel.org>
References: <cover.1746821544.git.jpoimboe@kernel.org>
 <198cfbd12e54dfce1309828e146b90b1f7b200a5.1746821544.git.jpoimboe@kernel.org>
Content-Language: en-US
From: Joe Lawrence <joe.lawrence@redhat.com>
Autocrypt: addr=joe.lawrence@redhat.com; keydata=
 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
 pNzsRQ==
In-Reply-To: <198cfbd12e54dfce1309828e146b90b1f7b200a5.1746821544.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/9/25 4:17 PM, Josh Poimboeuf wrote:
> In preparation for the objtool klp diff subcommand, define the entry
> size for the __ex_table section in its ELF header.  This will allow
> tooling to extract individual entries.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/x86/include/asm/asm.h | 20 ++++++++++++--------
>  kernel/extable.c           |  2 ++
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/include/asm/asm.h b/arch/x86/include/asm/asm.h
> index f963848024a5..62dff336f206 100644
> --- a/arch/x86/include/asm/asm.h
> +++ b/arch/x86/include/asm/asm.h
> @@ -138,15 +138,17 @@ static __always_inline __pure void *rip_rel_ptr(void *p)
>  
>  # include <asm/extable_fixup_types.h>
>  
> +#define EXTABLE_SIZE 12
>
> + > [ ... snip ... ]
>

EXTABLE_SIZE defined in arch/x86/ ...

> diff --git a/kernel/extable.c b/kernel/extable.c
> index 71f482581cab..0ae3ee2ef266 100644
> --- a/kernel/extable.c
> +++ b/kernel/extable.c
> @@ -55,6 +55,8 @@ const struct exception_table_entry *search_exception_tables(unsigned long addr)
>  {
>  	const struct exception_table_entry *e;
>  
> +	BUILD_BUG_ON(EXTABLE_SIZE != sizeof(struct exception_table_entry));
> +

but referenced in kernel/ where a non-x86 build like ppc64le build won't
know what EXTABLE_SIZE is :(

-- 
Joe

