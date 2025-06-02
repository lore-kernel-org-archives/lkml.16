Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43A42C3253
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748895202; cv=none; b=ciDvedjv+qVGirHjvxfLhwaMmJfsa7Jx4IVV1TH56N61ajgppoiHAL4aUCOYi4Tc5j1LG/QDxe/vODn8/23Kj/hQEQWxj0YjOYcdt1d/uKwhUl6C231jz9/PXYqMRXyfLSi2U7Wb1UDnnSVJ0bU+g1ifpLQkaxPxkoVu4v+MeKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748895202; c=relaxed/simple;
	bh=dYgH6l3af5qbaadPI2dscgIuE+H0ARXJ2qgwrm+ADmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFKc17tT2rclOVDXGBzJ3UH/JKlwPvYj9G4CWOUIROFCO4VcyksoYWcNqeVqQF1F9e0/pIYvcxzKz596SB+4CXGT8FRVtT1Wh8v7RJ/+0TCA6wI75pOAiZUsvYuA+hvM/LqYvAxZT/3iOFiqjZaBY2KqCRcjjef3L+vjMNM6bvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AtfJMFb6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AtfJMFb6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748895199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L2fRzpvIq9Ro64GdJ8k47s16Damg2UH127tvBjvm2hA=;
	b=AtfJMFb6LidzKpE/FbZuS4BeKkojis/FvWI2YpHqj/AbzpgijDOQocpZzaII6EzgOouakb
	hEdo/H8/FtWSJGZLpFhFsNs+ukon7RtyxzxLKI9DPAT/PhzFkUxiwPO2qGHTYI+q6qoj1e
	PqpiRXNzuJD7riwIo0misfo5crvgIOI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-wEozRtF6NLmLiA-3IV_GeQ-1; Mon, 02 Jun 2025 16:13:18 -0400
X-MC-Unique: wEozRtF6NLmLiA-3IV_GeQ-1
X-Mimecast-MFC-AGG-ID: wEozRtF6NLmLiA-3IV_GeQ_1748895197
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d50eacafso24590645e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 13:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748895197; x=1749499997;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L2fRzpvIq9Ro64GdJ8k47s16Damg2UH127tvBjvm2hA=;
        b=lMp2LaQQogZdSZynLRvlZSgoyJTWSxXkMXFVRXkZzbrQbftisF1rn2XFYEVQ6g4EzH
         L+Dq3xYuD3RtudrsUQPKGBYUgd/Vhs57qo/Oa4C0kmfG6bechH1Lt7jihMegpA8uF6nq
         iyaj9TsZSLCywzaUx3FmUq+mvKAPYaHPP4177+K4Xu6nC2Rz0JvYVEJ1url88hdY5UHw
         0ot7kAIOhLqJawxxYypVsG598xqyLtkiWfP0H7wvQ52Rgq5xSk/Qad7gT9mDrgCuFBLm
         5ZaTeGP2dnXNBRqg7qnrIPTx8//PJjr5nJGXwZ88XkvUDaotQ7ZRTdZ4v1TsYQKk+lD4
         2MyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF6wjLBdvPeBDMhbkeXyvc5iKk8d7Lrp8R1H/ujZ8cE6+eBeMz0S5PmJmvC0cqXe4xhhH1k9VE6P60DW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcXFfjHq88Q0ta0txAW54PKVvTUbVJguHRXNyZ/lcPlLtsFT64
	Dbu1ME9CxMt528TOTJbRJd6C9ibaTKaNE93GdZGLy2aOrLb+SZ34YQWdukPcyJ3lc7XiHp6S0xL
	DNkRv5h7lUSq5+JTL0hqE+oOlNh6Eh+fvOc5xBwxTcNXWzTsSw3UPUpSmetw8wdZrFbf+zPZdZw
	==
X-Gm-Gg: ASbGncvel0zFMj5JauKSjmTF0sU6Qi2tGRQe5xWf/yKDAjxNwKDQWPhhbVXhopyG92s
	LYOCGIZUAw994WUd1Aeewtlbmg8+3X0yRSOeEiqO0yRQ2n9rJ9lKkRHKQ0sMuteGYuCdNHAsqon
	FUgU+uJ1eUn37ge/CNYxYLe8N4LmZK8ufa9KSR7Ylp8nJO+3KoQnJ53DZxVANMZrVqzcN8jiA6V
	0XszYjvMSY1QsJS1miUzWcL5CYF3kxH8xhan0mU8msA7t6nVhPRopI3OaD9oAIYcH2Mfz8Y3800
	7mcRp5m8k9+zSquARFlIombNANM6/eUF6InGMU8/f+iFhvaAyDsEaXbw02xLHyJuAP4UNoKEcYS
	DzbvkSO8jmYInQbCLHjBKUmQ8HIUvKBmNrZT73V50DVXK9PvqHg==
X-Received: by 2002:a05:600c:34cc:b0:441:a715:664a with SMTP id 5b1f17b1804b1-450d657fc48mr128062195e9.20.1748895197163;
        Mon, 02 Jun 2025 13:13:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH11BXrDuMAIzEqX9WuHxTziGBMSqS8kYX6yOgI2wQ1XPSqok/pAnnVfe2f25ZB0Lml2ZGfRQ==
X-Received: by 2002:a05:600c:34cc:b0:441:a715:664a with SMTP id 5b1f17b1804b1-450d657fc48mr128061835e9.20.1748895196755;
        Mon, 02 Jun 2025 13:13:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000d8csm134568095e9.24.2025.06.02.13.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 13:13:15 -0700 (PDT)
Message-ID: <42226b18-7cf5-41e4-8a0b-5b35ee50f119@redhat.com>
Date: Mon, 2 Jun 2025 22:13:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] KVM: guest_memfd: Use guest mem inodes instead of
 anonymous inodes
To: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-fsdevel@vger.kernel.org
Cc: aik@amd.com, ajones@ventanamicro.com, akpm@linux-foundation.org,
 amoorthy@google.com, anthony.yznaga@oracle.com, anup@brainfault.org,
 aou@eecs.berkeley.edu, bfoster@redhat.com, binbin.wu@linux.intel.com,
 brauner@kernel.org, catalin.marinas@arm.com, chao.p.peng@intel.com,
 chenhuacai@kernel.org, dave.hansen@intel.com, dmatlack@google.com,
 dwmw@amazon.co.uk, erdemaktas@google.com, fan.du@intel.com, fvdl@google.com,
 graf@amazon.com, haibo1.xu@intel.com, hch@infradead.org, hughd@google.com,
 ira.weiny@intel.com, isaku.yamahata@intel.com, jack@suse.cz,
 james.morse@arm.com, jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com,
 jhubbard@nvidia.com, jroedel@suse.de, jthoughton@google.com,
 jun.miao@intel.com, kai.huang@intel.com, keirf@google.com,
 kent.overstreet@linux.dev, kirill.shutemov@intel.com,
 liam.merwick@oracle.com, maciej.wieczor-retman@intel.com,
 mail@maciej.szmigiero.name, maz@kernel.org, mic@digikod.net,
 michael.roth@amd.com, mpe@ellerman.id.au, muchun.song@linux.dev,
 nikunj@amd.com, nsaenz@amazon.es, oliver.upton@linux.dev,
 palmer@dabbelt.com, pankaj.gupta@amd.com, paul.walmsley@sifive.com,
 pbonzini@redhat.com, pdurrant@amazon.co.uk, peterx@redhat.com,
 pgonda@google.com, pvorel@suse.cz, qperret@google.com,
 quic_cvanscha@quicinc.com, quic_eberman@quicinc.com,
 quic_mnalajal@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, quic_svaddagi@quicinc.com, quic_tsoni@quicinc.com,
 richard.weiyang@gmail.com, rick.p.edgecombe@intel.com, rientjes@google.com,
 roypat@amazon.co.uk, rppt@kernel.org, seanjc@google.com, shuah@kernel.org,
 steven.price@arm.com, steven.sistare@oracle.com, suzuki.poulose@arm.com,
 tabba@google.com, thomas.lendacky@amd.com, vannapurve@google.com,
 vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com,
 wei.w.wang@intel.com, will@kernel.org, willy@infradead.org,
 xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com,
 yuzenghui@huawei.com, zhiquan1.li@intel.com
References: <cover.1748890962.git.ackerleytng@google.com>
 <425cd410403e8913b42552d892add6ca543ec869.1748890962.git.ackerleytng@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <425cd410403e8913b42552d892add6ca543ec869.1748890962.git.ackerleytng@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.06.25 21:17, Ackerley Tng wrote:
> guest_memfd's inode represents memory the guest_memfd is
> providing. guest_memfd's file represents a struct kvm's view of that
> memory.
> 
> Using a custom inode allows customization of the inode teardown
> process via callbacks. For example, ->evict_inode() allows
> customization of the truncation process on file close, and
> ->destroy_inode() and ->free_inode() allow customization of the inode
> freeing process.
> 
> Customizing the truncation process allows flexibility in management of
> guest_memfd memory and customization of the inode freeing process
> allows proper cleanup of memory metadata stored on the inode.
> 
> Memory metadata is more appropriately stored on the inode (as opposed
> to the file), since the metadata is for the memory and is not unique
> to a specific binding and struct kvm.
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>

The trailing SOB from Fuag is likely wrong. Probably you wnat

Co-developed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>


> ---
>   include/uapi/linux/magic.h |   1 +
>   virt/kvm/guest_memfd.c     | 134 +++++++++++++++++++++++++++++++------
>   virt/kvm/kvm_main.c        |   7 +-
>   virt/kvm/kvm_mm.h          |   9 ++-
>   4 files changed, 125 insertions(+), 26 deletions(-)
> 
> diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
> index bb575f3ab45e..638ca21b7a90 100644
> --- a/include/uapi/linux/magic.h
> +++ b/include/uapi/linux/magic.h
> @@ -103,5 +103,6 @@
>   #define DEVMEM_MAGIC		0x454d444d	/* "DMEM" */
>   #define SECRETMEM_MAGIC		0x5345434d	/* "SECM" */
>   #define PID_FS_MAGIC		0x50494446	/* "PIDF" */
> +#define GUEST_MEMFD_MAGIC	0x474d454d	/* "GMEM" */
> 
>   #endif /* __LINUX_MAGIC_H__ */
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b2aa6bf24d3a..1283b85aeb44 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1,12 +1,16 @@
>   // SPDX-License-Identifier: GPL-2.0
> +#include <linux/anon_inodes.h>
>   #include <linux/backing-dev.h>
>   #include <linux/falloc.h>
> +#include <linux/fs.h>
>   #include <linux/kvm_host.h>
> +#include <linux/pseudo_fs.h>
>   #include <linux/pagemap.h>
> -#include <linux/anon_inodes.h>
> 
>   #include "kvm_mm.h"
> 
> +static struct vfsmount *kvm_gmem_mnt;
> +
>   struct kvm_gmem {
>   	struct kvm *kvm;
>   	struct xarray bindings;
> @@ -318,9 +322,51 @@ static struct file_operations kvm_gmem_fops = {
>   	.fallocate	= kvm_gmem_fallocate,
>   };
> 
> -void kvm_gmem_init(struct module *module)
> +static const struct super_operations kvm_gmem_super_operations = {
> +	.statfs		= simple_statfs,
> +};
> +
> +static int kvm_gmem_init_fs_context(struct fs_context *fc)
> +{
> +	struct pseudo_fs_context *ctx;
> +
> +	if (!init_pseudo(fc, GUEST_MEMFD_MAGIC))
> +		return -ENOMEM;
> +
> +	ctx = fc->fs_private;
> +	ctx->ops = &kvm_gmem_super_operations;
> +
> +	return 0;
> +}
> +
> +static struct file_system_type kvm_gmem_fs = {
> +	.name		 = "kvm_guest_memory",
> +	.init_fs_context = kvm_gmem_init_fs_context,
> +	.kill_sb	 = kill_anon_super,
> +};
> +
> +static int kvm_gmem_init_mount(void)
> +{
> +	kvm_gmem_mnt = kern_mount(&kvm_gmem_fs);
> +
> +	if (WARN_ON_ONCE(IS_ERR(kvm_gmem_mnt)))
> +		return PTR_ERR(kvm_gmem_mnt);

Hmm, is this WARN_ON_ONCE really warrented?


Nothing else jumped at me. I hope some fs experts can take a look as well.

-- 
Cheers,

David / dhildenb

