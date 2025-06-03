Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D91723184F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748956510; cv=none; b=r1j54X2cY9Jx9d+ZCSCPXUuyXrB4iXOs/vyuOdi61PSu8OHduTFPdEMQ5GxhTDOmvJKZUd6KSL6+3n4Z/MUzs4p8atPoCnN7p205sTLNAsMSAemxGJCW8Q8NAc+09agolry8a7ZmMvhRAoIF3wmpj8FXrOrp2S6Qg/zQtngmZb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748956510; c=relaxed/simple;
	bh=EZHXEv6CzmC2j6E4h2GrkDy3swUxHRrQatNMpmBglmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rdtm5EL91laoZFGA5AMkdqHA0HK/IPhd2U7icNPlc4MSeWiEM84CtbCihFHrkLSPMe9MEBr2Mrp2MIH3M1k2h/3us/aNlecadx6arlmyZ6Szogqw3bvJCewqUHF3fTIjx1zHhRwRnIhJYUsrXlOm0wA+1TqsAXaNqeughj+E3MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FhuG+kay; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FhuG+kay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748956507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+xWfLbqfTSGSmFmKtg03EVk6p8+E51Xw5Fvj8h58p0w=;
	b=FhuG+kaytVWbqYhREN/vUN4YgYYuISdJVW0Cuhsfsi6VozGuh+t21RkgtJC2jLr4a28Inj
	qLm4ie+jbhTgL/j3VdDrii5fdTLJ6Hf+fNDeiSviVg5/rxAcOO1oSFeOyaEPMn3EHhANFz
	3UJ5qUlUvCahfbyDEbPcy6UCjPzjadw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-Sb85WwV2MSah5zV0YhUHtQ-1; Tue, 03 Jun 2025 09:15:06 -0400
X-MC-Unique: Sb85WwV2MSah5zV0YhUHtQ-1
X-Mimecast-MFC-AGG-ID: Sb85WwV2MSah5zV0YhUHtQ_1748956506
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso2721751f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956505; x=1749561305;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+xWfLbqfTSGSmFmKtg03EVk6p8+E51Xw5Fvj8h58p0w=;
        b=vhsqPlWkw7gWD15QDsLnUX0MrfBxAvU3sQsbgHyKxtadksYOfUHt4SsehpdSo7DKyV
         x/ENZySePz2ddWGPqELdoZThE/xJV3mv4BgpMgk4sKIUShGmB3nE4RejpWwvJXSNIWNZ
         vYkGNAsBLutYeXZKbPWL3W2m6lvt6d3GjlZWxKjja2y4Ws08viAayh09v+8C6CdL7Rp2
         awYch0LzAMFexXebnLP8EP9EXm5mKMRxHWyiNKZbWbGxw/VZR3ptoAT7A/YRAZMryD6+
         QD1e+gThh6cV1g3Bso6Z+kVhlH2JJpl4X5HQbTqh02uzKYkxkBydvXlfktsiSe/EsuUy
         xemQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHDQAtq8q7RuzLvZDam189SM8lFEercgSSvrJwZl3Wvpt3v/X7vo8J1lmon+zQ6FuzHWLpnoI3nLsqDkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydvHG3gVM3rjvU/zXUpqiPxu9WG8psL92sMGLwv0gQojBFKHsT
	sPk1OcK09U0aSrZt79bCW8bsV1mjuu4aTUl3VAXq2DXuphdd66Y5rTIiOMMa9YkRmwaFx4n9tiT
	vw7Hc5DTH6e5CqQgXGYweb0JtttrbcE8uwrNv2HjEGbTYlYp0GAnxf4aLZVckxvbXXA==
X-Gm-Gg: ASbGncv8KSkqIqzlSiQfVE5Sh97IWNCLX5qeJxqp9b6wJ08GXVwSTinHSTJCynl2uD8
	Ur1QZ7zlIf4ZFOUOWSEzMZJetjTShWhR/BsnBFxM5CIOGnqIqk2ha+243AX4rk7+UnMOZh7rUv+
	wOGnV/BoUQTbYG9uRjokV9znNctCnAjY3H1rjbO4EODeV7Ss50v1Abo4TlaD9s8vz/tKo1QUf0s
	mRBaebKAUauI3w2nrjnXqGPur9b11Rgu7E8vLnFHRspE806XbOiWeGHae46AOfnw8YFZWu+/uSO
	ZwBz5iYXjmNSKCdsiOWjwcQZvu/YVYEDECK8AgoO5DJS6kDHc/296xe85KkBj2anZLPSK473JvG
	GsvAcwBhcTyuTYxv7jAkJzqdLilNW5bg2uxfA5qw=
X-Received: by 2002:a05:6000:18ad:b0:3a4:dd16:a26d with SMTP id ffacd0b85a97d-3a4fe398a8dmr9487293f8f.38.1748956505425;
        Tue, 03 Jun 2025 06:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm7X2APQc9hSinUL6KfAawHmKqJiBkUOuY6N6F0HuQCl/p36WZVpcHHJGlh2ckuW/7E30g1w==
X-Received: by 2002:a05:6000:18ad:b0:3a4:dd16:a26d with SMTP id ffacd0b85a97d-3a4fe398a8dmr9487256f8f.38.1748956504933;
        Tue, 03 Jun 2025 06:15:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fa25besm159610045e9.14.2025.06.03.06.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 06:15:04 -0700 (PDT)
Message-ID: <da52a835-6a4b-4f11-acac-f4ef995da7e1@redhat.com>
Date: Tue, 3 Jun 2025 15:15:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] kdump: wait for DMA to finish when using CMA
To: Jiri Bohac <jbohac@suse.cz>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 kexec@lists.infradead.org
Cc: Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
 Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <dhildenb@redhat.com>,
 Michal Hocko <mhocko@suse.cz>
References: <aDoT08LfXUEkS9E4@dwarf.suse.cz> <aDoVO4H4CpXPjAdI@dwarf.suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aDoVO4H4CpXPjAdI@dwarf.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 22:29, Jiri Bohac wrote:
> When re-using the CMA area for kdump there is a risk of pending DMA into
> pinned user pages in the CMA area.
> 
> Pages that are pinned long-term are migrated away from CMA, so these are
> not a concern. Pages pinned without FOLL_LONGTERM remain in the CMA and may
> possibly be the source or destination of a pending DMA transfer.

I'll note that we right now do have an upstream BUG where that is 
sometimes not the case. I mentioned it previously that such bugs will be 
a problem :(

https://lkml.kernel.org/r/20250523023709epcms1p236d4f55b79adb9366ec1cf6d5792b06b@epcms1p2

> 
> Although there is no clear specification how long a page may be pinned
> without FOLL_LONGTERM, pinning without the flag shows an intent of the
> caller to only use the memory for short-lived DMA transfers, not a transfer
> initiated by a device asynchronously at a random time in the future.
> 
> Add a delay of CMA_DMA_TIMEOUT_SEC seconds before starting the kdump
> kernel, giving such short-lived DMA transfers time to finish before the CMA
> memory is re-used by the kdump kernel.
> 
> Set CMA_DMA_TIMEOUT_SEC to 10 seconds - chosen arbitrarily as both
> a huge margin for a DMA transfer, yet not increasing the kdump time
> too significantly.
> 
> Signed-off-by: Jiri Bohac <jbohac@suse.cz>
> 
> ---
> Changes since v3:
> - renamed CMA_DMA_TIMEOUT_SEC to CMA_DMA_TIMEOUT_MSEC, change delay to 10 seconds
> - introduce a cma_dma_timeout_sec initialized to CMA_DMA_TIMEOUT_SEC
>    to make the timeout trivially tunable if needed in the future
> 
> ---
>   include/linux/crash_core.h |  3 +++
>   kernel/crash_core.c        | 17 +++++++++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index 44305336314e..805a07042c96 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h
> @@ -56,6 +56,9 @@ static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
>   /* Alignment required for elf header segment */
>   #define ELF_CORE_HEADER_ALIGN   4096
>   
> +/* Default value for cma_dma_timeout_sec */
> +#define CMA_DMA_TIMEOUT_SEC 10
> +
>   extern int crash_exclude_mem_range(struct crash_mem *mem,
>   				   unsigned long long mstart,
>   				   unsigned long long mend);
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 335b8425dd4b..a255c9e2ef29 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -21,6 +21,7 @@
>   #include <linux/reboot.h>
>   #include <linux/btf.h>
>   #include <linux/objtool.h>
> +#include <linux/delay.h>
>   
>   #include <asm/page.h>
>   #include <asm/sections.h>
> @@ -33,6 +34,11 @@
>   /* Per cpu memory for storing cpu states in case of system crash. */
>   note_buf_t __percpu *crash_notes;
>   
> +/* time to wait for possible DMA to finish before starting the kdump kernel
> + * when a CMA reservation is used
> + */
> +unsigned int cma_dma_timeout_sec = CMA_DMA_TIMEOUT_SEC;
> +
>   #ifdef CONFIG_CRASH_DUMP
>   
>   int kimage_crash_copy_vmcoreinfo(struct kimage *image)
> @@ -97,6 +103,17 @@ int kexec_crash_loaded(void)
>   }
>   EXPORT_SYMBOL_GPL(kexec_crash_loaded);
>   
> +static void crash_cma_clear_pending_dma(void)
> +{
> +	unsigned int s = cma_dma_timeout_sec;
> +
> +	if (!crashk_cma_cnt)
> +		return;
> +
> +	while (s--)
> +		mdelay(1000);

Any reason we cannot do it in a single mdelay() invocation?

mdelay() already is a loop around udelay on larger values IIUC.

-- 
Cheers,

David / dhildenb

