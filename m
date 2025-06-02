Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B751805A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748894534; cv=none; b=IeWDIdimk6jr1bulnBD/urRGh/Ch7d+PvTZEzUO1K/4IWggcCFdrYlUc9UjGNSUGltkEX/YU3LC4bFurt+uVDx4wUecWagtO8Q4QjMxNR45GAlz9WO1UuCFGBHeoHQyrv0kLq19nbtTUi1n8sj1cAYy68D8QiuhDX8jIk5gPCc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748894534; c=relaxed/simple;
	bh=/xOHjhw56CdE7pwo3f8+yn8eHn8TaevxVaRTPiHlxv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BqFuaLj+9kc0damyPJFzDMODDngYX4qlC9mEAJa1eS94XvkCX3jVHOq1JP72dcPIA+NAuQiKqnrhjYm2hGsTp/Bs0gXZqz03km+tXXfAO+kML77bz0h3adGy891nBj3u+sHO6sokadP77lGDB5sEEHzE+MHx1AhM1ang6Avjjpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FO6H4VbW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FO6H4VbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748894530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9xzihvSeycwCfHC3PxVJC/qLoV2NCc2qE9/A+8gZl7Q=;
	b=FO6H4VbWCv4+e3iw+wYwAMZjBicuvvRgmlNqv20wCbphSdIweNiFOlBzE1yRzEaIZNmaZY
	3vB2tUg2HBYRZ4QSmKsdluaL/umDUaUB12PQElzSMAY2dR1kQUBTvxsqDYgurPBCw8/KFz
	Wo8tHGyd8CRr/xlwLZ6XMe1fr4qV90Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-hlUqMWQ0PM2KXhYju2U6xg-1; Mon, 02 Jun 2025 16:02:09 -0400
X-MC-Unique: hlUqMWQ0PM2KXhYju2U6xg-1
X-Mimecast-MFC-AGG-ID: hlUqMWQ0PM2KXhYju2U6xg_1748894528
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso902395f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 13:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748894528; x=1749499328;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9xzihvSeycwCfHC3PxVJC/qLoV2NCc2qE9/A+8gZl7Q=;
        b=KWAuH/sRWEvVD2aK6SKxmOZrBcuMMkMxZxZhdcbY134Z1ex3KxaecGEu21SD8HsMSs
         8n7RnvGo0Pa9yL4d/z+EKv2jFjWif1I+3oy1SQt5FyI48hDbd5r1oB0wGnUEAcvdYPbz
         0wpKbG9YLYHcbedVJbkhIi8UpXWPHOfZF22UuYc4Npb9Xn6L21bHAbBuf1nb47ewMbFT
         yc4AKY37HkUmfLAQQl+rYu4+KsOFh3Hqtqk72mTyoB4P0wkhsSxB0K4lRE2xtGdf9z9X
         kJB5X9Mdj2nOLDodvqG/pkHmkpZgZ10A8+S6nVyoVseVYF4umnQfeYm7yx8OMvhkTrCD
         25bw==
X-Forwarded-Encrypted: i=1; AJvYcCXO6qL7nJEpOstQXOyPVGa4a6k3etx9qVFgHPKr37gu6EbfCl8yp07WEujornFonPNAX0fluVGPGZXG8Go=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh/e4YUop43Kzdx+NzweJ2XOgxmwG914iN3y5ZIczc50LHc4RG
	sdNo8va9aK9CrnJt2sB23EA1WYxYu5d4t3BVT9ujN6OMBEUthisrNrpox4hpdi2x8MLRZR6Qa4e
	dMzK9noSIHwbKWNMep/grxcL4b7MueKtsYBTK0Xp2lLLFz2BYcw+ID+xWDj9hNezNOQ==
X-Gm-Gg: ASbGncvyor+DFKElrGud1ZVnK407iyWFAHMnDuVAhscCCKJmmYTzcyS9yNOa2uXMmKF
	d4q7IRvPVDCLA/dX6PcHmy5YDQAi42X1SKpCSQjRvOBYia4TxrFV5JqWjl3x57I5BJKhuwONOUu
	4o2gRSvp1o2jwAhSKloGLCxhd0AAySusg5wgHGBHAQX4LC0DToktgh7rsTuhdy51olygjYhrw2n
	Vy0KpklEr5uoWvRotc2e9Lougp8j3WXbYfnqqQt/YTJZB7h/OZpEjxCAURcpwsrhs4ogS2a61l/
	lPaT8D/HZdQ+TYY2OSJxKW4xp/XJlAZmNkP2dcALQmVFIpHMEXQ1LL0Pbif/smvTpoAf1vQqOx7
	5iPL9i786GuBO4NfvzgztUyi/JrIWLxKCDYGRIyo=
X-Received: by 2002:a05:6000:220b:b0:3a4:eec5:443d with SMTP id ffacd0b85a97d-3a4f89ddde0mr10414309f8f.29.1748894527767;
        Mon, 02 Jun 2025 13:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBUEUfgzZ55JxvWPbzPB5n+xzGAXY+W1aSHd2mFpVCFS79hDcYZsKiTQk7PvOWDfF0CXIE9Q==
X-Received: by 2002:a05:6000:220b:b0:3a4:eec5:443d with SMTP id ffacd0b85a97d-3a4f89ddde0mr10414272f8f.29.1748894527305;
        Mon, 02 Jun 2025 13:02:07 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6ca46sm16277263f8f.31.2025.06.02.13.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 13:02:06 -0700 (PDT)
Message-ID: <e2ca2dab-9dfa-49e7-901d-f5999c1f8f6a@redhat.com>
Date: Mon, 2 Jun 2025 22:02:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fs: Provide function that allocates a secure
 anonymous inode
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
 <c03fbe18c3ae90fb3fa7c71dc0ee164e6cc12103.1748890962.git.ackerleytng@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c03fbe18c3ae90fb3fa7c71dc0ee164e6cc12103.1748890962.git.ackerleytng@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.06.25 21:17, Ackerley Tng wrote:
> The new function, alloc_anon_secure_inode(), returns an inode after
> running checks in security_inode_init_security_anon().
> 
> Also refactor secretmem's file creation process to use the new
> function.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---

Not sure about the subject, "secure anon inode" is misleading, it's an 
anon inode where we gave security callbacks a chance to intervene, right?

maybe simply "fs: factor out anon inode creation + init security"

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

