Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82821C6889
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743058408; cv=none; b=mfdLMoHqp6/QLhFF+psVWMIHuPZmFW0pUl7Icy1pc+aqUNiKCubdM8bjrWwvAsCcGU6RJbQJQ4aRbAdmDHcnEe30ybj5DdMPDpkjOhkjckDjjzQ/wMBskCpU+TB/gEDd2wMRXuQ/jP8KiguNgZkQNyywBzVclKRJCEMQLEGuvyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743058408; c=relaxed/simple;
	bh=gmjJJW9kLnwVf4ojgXk72+SIvB4JBqU2VPR6QGUBIts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMY9fX4vcYvdx242G23N0RJdHmRGIw0zQiYrrDnna/vt2w2KMuM9Wah/9mUz9AQXwyfZhy4MBr3IKToIIo0l8Hbv3PYaEvN52l3RG9ta+3dCqbvLKzX2+F8CMzAC7bklRue42PTiRKOj77zSjLFWeKaf4zfEwTpFK68GzhEhtBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MZB1yeTF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MZB1yeTF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43938828d02so1329255e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743058404; x=1743663204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1PDL49wsR8t3oK5tOwSBTXVuxib+JRofPTqoaO+MbY=;
        b=MZB1yeTFQ8mRh0f5GXjlgMS+V+spjjP/SjhnbjzqHy6MA6QSjU6U5SRApZAajA1vtU
         +wi050IkNGHrSHwng8FVrTrfpjGxGWu4UpL/xnGnsdtS/TWTFskxFHQ4m33dUKHh+Cz7
         01RcmbIXS5pstDtVkENM2DJ7wUUTl/mG+JIptU07a/BducP3i5tyQDLBgV2bHY1G7IyW
         VDVSm912HCmshkF/qx6xlyYy/d4qL2f2D5/zvxxMLzE4564KZVuqILXBSaCjJ1T84QYL
         fX+Z4wW+oE6I9GpZAMfpGmNbfLyowAKloTD1BPGSfF48sDlGE1qnz9NbOLLfxBJ5/CmW
         QpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743058404; x=1743663204;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t1PDL49wsR8t3oK5tOwSBTXVuxib+JRofPTqoaO+MbY=;
        b=IdUc42d9XmxTiFvLHD2GJ41+UK9CYBHt4hAmxKWsvTnf51v9FwsLV9+JBIkPshL4Jk
         +x2zcr9T72XxxGS1cVMACc/f+bXTP7OMedtIPS0zefqC0t8h39sUUhk5n1044Qxmz6S9
         wEbziDWQqySQwP6yj5DI2B8PLlr1xlnSh9dMXba50utGbcjEBO5HC21cxZeiej65cuWL
         zMN+UC+22sGmoDryzIZE8aEhHlrqwdv3e1NOxCz5fYt6KrD5GGvKU1hRmFz+upe67lxA
         qvXAlgf8HyS09l4MnhmbNNzKWVUShNRvO39NFMPCuLCD/IgWfU4z5CqiHz28VSltiew3
         U3yQ==
X-Gm-Message-State: AOJu0YwOABAPJisNMQQMHx1sygIo6UtkdzPgLZXa3mz02M3CDow4BqU1
	ZmnRDF6msUR8g4T0VE7gfH4roPDYvGI1eGVZ1dYHsk6kf8ILfz2Y/sfYeNd9DSk=
X-Gm-Gg: ASbGncun8Pa+NdqIwJiHZBoUANtD7bf36I8b5mdr8LFMuxVzMZJSnvhwmneauZepqNw
	ogE7s+WVo6vC6ksZyggdPbg0yocFLkyW9mZQWmacj3AOSjgtlj8km4aze8pn17ao0sDJEGWGrmR
	4vzl9R13+WOwBLS3yxtS6/hheEE9p4dK4QEeQ09ecyaGPWN7ifSvd/jbWJYK5VhAKOm6A+VDlhv
	GbrKDQ+r6IyEV5KKx9vMXU46QEEPKHNVyEeHCU3U2y1WNxqdFXrDx9DLfIHZp7yD/CGofnnhHwE
	A5AjDQfdEMNu2Ccrq7p94tc4knwlo8T8UiLDPGItlyNircxr7mI=
X-Google-Smtp-Source: AGHT+IEdkz6q64rsYV3VZmc/ZfV6ChqPaq/S6W1mt38Hq+RVFgHVVbpHCU3NX5s/6fNrItFngbvoXQ==
X-Received: by 2002:a5d:47c7:0:b0:38d:be5e:b2a7 with SMTP id ffacd0b85a97d-39ad2b19b7fmr398048f8f.10.1743058403991;
        Wed, 26 Mar 2025 23:53:23 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45e9esm121332185ad.88.2025.03.26.23.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 23:53:23 -0700 (PDT)
Message-ID: <bcce4e5c-d739-4b1c-86bd-d165ec0780be@suse.com>
Date: Thu, 27 Mar 2025 14:53:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/1] ocfs2: fix write IO performance improvement for
 high fragmentation
To: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>,
 "joseph.qi@linux.alibaba.com" <joseph.qi@linux.alibaba.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
 Rajesh Sivaramasubramaniom <rajesh.sivaramasubramaniom@oracle.com>,
 Junxiao Bi <junxiao.bi@oracle.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <20250324054851.2509325-1-gautham.ananthakrishna@oracle.com>
 <199205d8-20fb-463d-9065-8021b3cf7cb8@suse.com>
 <DS7PR10MB48784AA2A065605733B79499F7A12@DS7PR10MB4878.namprd10.prod.outlook.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <DS7PR10MB48784AA2A065605733B79499F7A12@DS7PR10MB4878.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/27/25 14:21, Gautham Ananthakrishna wrote:
> HI Heming,
> 
> Sharing the test suite may not be practical (it has shell scripts, python and C binaries). However, I can take a look into your patch and run a quick test.
> 
> Thanks,
> Gautham.
> 

Thank you for your quick reply and willingness to help.

- Heming
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> *From:* Heming Zhao <heming.zhao@suse.com>
> *Sent:* Thursday, March 27, 2025 11:39 AM
> *To:* Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>; joseph.qi@linux.alibaba.com <joseph.qi@linux.alibaba.com>
> *Cc:* linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; ocfs2-devel@lists.linux.dev <ocfs2-devel@lists.linux.dev>; Rajesh Sivaramasubramaniom <rajesh.sivaramasubramaniom@oracle.com>; Junxiao Bi <junxiao.bi@oracle.com>; akpm@linux-foundation.org <akpm@linux-foundation.org>
> *Subject:* Re: [PATCH RFC 1/1] ocfs2: fix write IO performance improvement for high fragmentation
> Hello Gautham,
> 
> Thanks for locating the issue and submitting a patch.
> Is it possible to share your test case for this bug?
> 
> The key of this bug is ocfs2_cluster_group_search() comparing with wrong
> bits size. I have another fix for this bug and will send it to this mailing
> list later.
> 
> Thanks,
> Heming
> 
> On 3/24/25 13:48, Gautham Ananthakrishna wrote:
>> The commit 4eb7b93e03101fd3f35e69affe566e4b1e3e3dca caused a regression
>> in our test suite in discontig extent tests. Upon troubleshooting I found
>> The following issues.
>> 
>> 1. The function ocfs2_cluster_group_search() was called for discontig allocations
>> as well. But it checks only the contiguous bits 'bg_contig_free_bits'.
>> It hit the ENOSPC in the following case in one of the tests.
>> 
>> ocfs2_mkdir()
>>   ocfs2_reserve_new_inode()
>>    ocfs2_reserve_suballoc_bits()
>>     ocfs2_block_group_alloc()
>>      ocfs2_block_group_alloc_discontig()
>>       __ocfs2_claim_clusters()
>>        ocfs2_claim_suballoc_bits()
>>         ocfs2_search_chain()
>>          ocfs2_cluster_group_search()
>> 
>> Looked like the commit did not consider discontig searches. To fix this,
>> I have split ocfs2_cluster_group_search() into *_common(), *_contig() and
>> *_discontig()
>> 
>> 2. That commit enforced ocfs2_cluster_group_search() to search only the
>> 'bits_wanted' number of bits whereas ocfs2_block_group_find_clear_bits()
>> fills the best available size and the function ocfs2_cluster_group_search()
>> itself is supposed to search 'min_bits' at the minimum and need not be
>> 'bits_wanted' always.
>> 
>> Fixed the above issues in this patch.
>> This patch fixes 4eb7b93e03101fd3f35e69affe566e4b1e3e3dca
>> 
>> Signed-off-by: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
>> ---
>>   fs/ocfs2/suballoc.c | 146 ++++++++++++++++++++++++++++----------------
>>   1 file changed, 95 insertions(+), 51 deletions(-)
>> 

