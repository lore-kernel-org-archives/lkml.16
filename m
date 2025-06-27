Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B05C2192FC
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026708; cv=none; b=oGQSLCqWaFD36OFQD9w5EVe8AmLSV3RHXOOCV9iF1mcn/1TGN6isMHIli1XyMFFwexYncTVbrAFI1Vb4lhtwDvN5VO4NcuugBwN8+7bNQwuL5FAXTh09AuFccMR5XQApu23zVz/GmobUoK8/TcaZptNUcdPgUtHifM5UT5uipbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026708; c=relaxed/simple;
	bh=rNgw4QRMq+WxkPumB42A5qtcoz7j9aessMfdwDYUy2U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aJbP9hC0G6irazbMuwv0ij12wqFslI8cW6XixyPb6xvI7WgCYu8QuLpgvZy6LtzKVhETO9wHgeDg0XyWJxVVWCtOjQEQ857FX3qwv0KBdjpdU14s+8fZVG/RpKrU5MMvELyilY0bjxsMNEiREG7MLu+runYwNFzTyS/xKHflB2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VTE8yPgs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VTE8yPgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751026705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i6hHJbfwkNH8JHJubPpAZUHGrLRlLHNardCl97LCOWo=;
	b=VTE8yPgsnB29pe1Sf6pmpU+WRzPb3xLN7eJjJtjUq4euSLQiP+sdwzN6v0aKC25JSV/8Dm
	h4uUBwsU/b/fIEjpABRciulbvBwVeSo0K1/U8TN4NMAOur6rxAqHx6ISvFSn1+Vl1S6Ita
	YOH2d2s8rQ/0JufKrD1HorfGB1joHao=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-ypgoc6u8MV-3mTcmQpGRaQ-1; Fri, 27 Jun 2025 08:18:24 -0400
X-MC-Unique: ypgoc6u8MV-3mTcmQpGRaQ-1
X-Mimecast-MFC-AGG-ID: ypgoc6u8MV-3mTcmQpGRaQ_1751026703
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6d90929d6so889676f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026703; x=1751631503;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i6hHJbfwkNH8JHJubPpAZUHGrLRlLHNardCl97LCOWo=;
        b=SZBs1NCw+KCd/134JvbubPEKzvhz0U+HYLeEOEU4Myq96bn2XiN8Pv0CqoedUBpMVC
         hJFMSjYQcddRJgaPOM+EUX84pQEXXAADpiwCC5/0pDlUbnh+2UWmw/tgwVbsj3RvStIP
         8/VDeu/y7Z7xA+5XYt/Q1UPnAJSfEMNf9e+oDvB3IiAk7Dz7+AWpK7BclH9lokLTSXJn
         B1maPxon9SedhK3gQ1+Mc1U1+J8yY3cV5QaYZzY9LKFr+1KOmjfVsUS6lxHhiVuemSTp
         UpfaT5dw0XrYctOF5OokMAgaSjke9qUVRwpmb9b5oTXXWQ4+q7xCeFH6qkM4g3edS02q
         IbjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBMVz2iZwoQadZbciYgome9L+rqnoaGSFuPTKLWLzMQBj2SX9i92Jml9azeNEwWh53Dtzit//fesx7rpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Ph0wZsvviUHBQ1+V0WoxzRH8nBP4x5GKRs1zc28wY2w0Oxhd
	RtXMyqgAk9r58q6/OAJVBT0F+9yDr/cTZGCv9t7c2uJTFKyuSVk48iJER9KxlGoB4Ljm1+RXYgG
	rM8Fe6igGbEqxYRnlrFkqo5OGiMqiTzJ8YOFm3M3eFPnGLnjnDeTF3Y9W9eqO7ErCqA==
X-Gm-Gg: ASbGncuO/dYhUh2HVCGbKMIRHc0d7WmjqJPoetwbJXrnQ5NHZDy3l7T6DRG4ac4vBpK
	53T1SsbonnMgSKx6hf/73zi+0q+NJoidrFY2w/Hz0y6e5VCjpdf6Bi7CrsQ0AWowvvos1B65jxl
	wjl+RT6P2rtxVnM9ia+5v0mHlKZrOuvyFORQriyuf9/ixu1XEiBP7XaV30py7Dx2MJ7uHB1XN3W
	eBe2ROX++s7N36oq1WE5mrDji7m7NRkLGls5MrRaS9qJ+NWDyjC6LqZVivGkWAHQtPIXluUOaYR
	lechUOg0gLwwicNQqptMCL3Jub3Qi0grIvLiSeKIlNKBNcVFbrfois4JOnouoh1eWWdT7ynBK3W
	DOudKptPf7l/CkRg6nWtiysZJslHxfaYrrBsqeieVkbFJRol/jg==
X-Received: by 2002:adf:ed83:0:b0:3a5:3a03:79c1 with SMTP id ffacd0b85a97d-3a9001a1778mr2261544f8f.48.1751026703010;
        Fri, 27 Jun 2025 05:18:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh27GpBRPT47O35Ep35jFFA3XAp0Ce5OuzXqF6NuuiJbqHucc3jFj25/ltwXNU3g0lAOHfZQ==
X-Received: by 2002:adf:ed83:0:b0:3a5:3a03:79c1 with SMTP id ffacd0b85a97d-3a9001a1778mr2261508f8f.48.1751026702553;
        Fri, 27 Jun 2025 05:18:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c8013b3sm2570656f8f.39.2025.06.27.05.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:18:22 -0700 (PDT)
Message-ID: <c5495dd1-8085-4721-af1e-93f34f36d97b@redhat.com>
Date: Fri, 27 Jun 2025 14:18:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] kdump, documentation: describe craskernel CMA
 reservation
From: David Hildenbrand <david@redhat.com>
To: Baoquan He <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
 David Hildenbrand <dhildenb@redhat.com>
Cc: akpm@linux-foundation.org, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
 Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
 Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>
References: <Z9H10pYIFLBHNKpr@dwarf.suse.cz> <Z9H4E82EslkGR7pV@dwarf.suse.cz>
 <Z9Of+RYjpcDN7+ji@MiWiFi-R3L-srv>
 <053f8c6d-0acd-465b-8d9f-a46d50ccce71@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <053f8c6d-0acd-465b-8d9f-a46d50ccce71@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.06.25 14:16, David Hildenbrand wrote:
> On 14.03.25 04:18, Baoquan He wrote:
>> Hi Jiri,
>>
>> On 03/12/25 at 10:09pm, Jiri Bohac wrote:
>> ......
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index fb8752b42ec8..895b974dc3bb 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -987,6 +987,28 @@
>>>    			0: to disable low allocation.
>>>    			It will be ignored when crashkernel=X,high is not used
>>>    			or memory reserved is below 4G.
>>> +	crashkernel=size[KMG],cma
>>> +			[KNL, X86] Reserve additional crash kernel memory from
>>> +			CMA. This reservation is usable by the first system's
>>> +			userspace memory and kernel movable allocations (memory
>>> +			balloon, zswap). Pages allocated from this memory range
>>> +			will not be included in the vmcore so this should not
>>> +			be used if dumping of userspace memory is intended and
>>> +			it has to be expected that some movable kernel pages
>>> +			may be missing from the dump.
>>
>> Since David and Don expressed concern about the missing kernel pages
>> allocated from CMA area in v2, and you argued this is still useful for
>> VM system, I would like to invite David to help evaluate the whole
>> series if it's worth from the VM and MM point of view.
> 
> Balloon pages will not be dumped either way (PageOffline), so that is
> not a convern.
> 
> Zsmalloc pages ... are probably fine right now. They should likely only
> be storing compressed user data. (not sure if they also store some other
> datastructures, I think no, but might be wrong)
> 
> My comment was rather forward-looking: that CMA memory only contains
> user space memory is already not the case (but the existing cases might
> be okay). In the future, as we support other movable allocations (as
> raised, leaf page tables at some point, and there were discussions about
> movable slab pages, although that might be challenging) this can change
> (unless we find ways of not placing these allocations on CMA memory).
> 
> So as is, this should be fine, but it's certainly something to be aware
> of in the future.
> 

BTW, I realize this was a late reply, and that the series already 
proceeded. Just stumbled over that un-replied mail an thought I'd 
clarify my point here.

-- 
Cheers,

David / dhildenb

