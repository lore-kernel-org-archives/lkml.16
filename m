Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A055313959D
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 01:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746928533; cv=none; b=WP9+0DawPJ5yFlrTBXS5sn5ByULgGOfaOmvK/Chs+tRkcURU3jV0Axpxmlip1GA2v/tZ7xATpl7mAWltuzezVLzNHaNVDrdgtL+gAqZjE8h853GygCeevp1T80S6qrWvsSUGDh/zd5toSgyV9/P6hdGH7dKppi+FPvVl6Yz7f9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746928533; c=relaxed/simple;
	bh=hM84bVN/7djT/cHH9GKNCaGiCQyYslUZke/3C7Hle+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/qPc7EXS/rrZsF8YNlSe3B2aN3gtuknugtrWMWSFUAu4as6/AiUhLqKK55MHWUevUCoaERhSrXJ4Tn0ZDLx3GVZWusfoDVI5gOpolWNdaEAeRycYG8zyHkkyaUHZyYupW/QoIVstyHgP6oyuzw3nBHC1PP5JeRLsXGTJnYkVFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OIEU3Wof; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OIEU3Wof"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746928530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4uQkbYUBznFuNXz4c8CGp8kAGDKAUw+/namabwsEaag=;
	b=OIEU3WofpDWdZPtXTgTDZdYi2wubCP97rWo8254yNFx+DtR0+SJf5pL72a2UYHuqsDhd5w
	yCAArpUYCy4BP3mPWFDs40CLfU2xFHk6koCrGT8if/+YIqZSd28njMwL9/NUfPJxPgFMlu
	6Tk8ngnJs3jaW8PTD8tanLBTRPfrRZs=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-QSgxxcOpM6W6oGOOEjZLJg-1; Sat, 10 May 2025 21:55:29 -0400
X-MC-Unique: QSgxxcOpM6W6oGOOEjZLJg-1
X-Mimecast-MFC-AGG-ID: QSgxxcOpM6W6oGOOEjZLJg_1746928528
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b00e4358a34so1959295a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 18:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746928528; x=1747533328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uQkbYUBznFuNXz4c8CGp8kAGDKAUw+/namabwsEaag=;
        b=cBLYvxGUIDKGIWxM2cXVb9z4+b8ZsssNbdhgdQW3UJKK0Bau7wge0+8pEwh7dRPDxW
         32Ix8uUjMHSe9VKmpfFlUx6rfDuZeR6tnSDujPLgcfkPxYYZg3uWIaB0Nt1LQRwxwEr4
         x/m31SJCgSh3cVQ9RtQ6J6Je0jWRDcKEZlrHOzwPpNN7xINfNDNUZ4o2NYk4hOWDeAQY
         pgBAP654otmUpqNyM20oVyq2S/qoaxNH5BfiuFhz/69fQOUOQFU3ViprySXpvCOPo0zy
         OWYnd1MaN4H9+t8CIJ2xXagyYn4O7Uad31sYq57cfINPfeCY0Fs1lsNo/YfagSPdKyh3
         zTWA==
X-Forwarded-Encrypted: i=1; AJvYcCV45QCuiU7nxjlk/tce4eRmV8ea0enwJMbFA7XCcNAcFWGut8I07af1RsJkAhx6siR94gcWM7pisn0hAp8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfrf65uWevu/jSPIp+0Bg0338CPrk8cou4KZ63RNX/aTV/1q3U
	Bw0IQFbibvEKp1SBUqHbS5E+SIfMFa0K5LrpU/MZOBXUA2MPZN/vt/FWZDMW0T8VlRHaRoqRwgm
	j3437lT3705ruR2qT3qqmD7xEplygjBE9PF5XFQW5iFzMniv0TmP5RjsiAW/Qv46dtsPXITGMWD
	8=
X-Gm-Gg: ASbGncs4Lda3fuduTAlIeuIYy8dN10CJH1f3WzBYZJIHvQpPeie+nsGNfS5gf+CECzK
	hs0wMPSqeLwrWhuPK9Zfx+ePmpejqdvQ9NG2EskdMikPq5jBvmP3Foi2HE9yyRd2Cz2ee09CXOM
	hCs4McPe9Wv+oyJi8JOg+/6bc7tGkhfblb9GeVKJu/jZ3JRwPfOvh1BUo82ow4up0/3M2cjWJSo
	5wQO8Lo+FAPJq7DrhdbGGdjqdkXtlbkY/sr2JO3x2CWUcWG49v7Pnl/nOO6o+xGhKC1CWYCCpW6
	Cls=
X-Received: by 2002:a17:902:d581:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22fc8b0b618mr110591005ad.6.1746928527868;
        Sat, 10 May 2025 18:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRDx6RUaLbVa6wqIPDY7JA9hMVeUNpQbRiZfwYWvx9E04fi+l1jNbl06XlIH3uqIO3bGNvIA==
X-Received: by 2002:a17:902:d581:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22fc8b0b618mr110590885ad.6.1746928527565;
        Sat, 10 May 2025 18:55:27 -0700 (PDT)
Received: from localhost ([114.222.253.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7555026sm38707635ad.54.2025.05.10.18.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 18:55:27 -0700 (PDT)
Date: Sun, 11 May 2025 09:52:18 +0800
From: Coiby Xu <coxu@redhat.com>
To: Baoquan He <bhe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	fuqiang wang <fuqiang.wang@easystack.cn>, Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <7u55qeazomjmp2ci4bxf6ffzzt53srk2zyyss4ym6r75atxubi@k3dhgprujnli>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
 <ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>
 <4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
 <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
 <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
 <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>

On Fri, May 09, 2025 at 05:58:01PM +0800, Baoquan He wrote:
>On 05/09/25 at 12:04pm, Coiby Xu wrote:
>> On Wed, May 07, 2025 at 10:59:59PM -0700, Andrew Morton wrote:
[...]
>> >
>> > Do we know why this has appeared at such a late date?  The reporter
>> > must be doing something rare.
>>
>> The UBSAN warning happens because flexible array members annotated with
>> __counted_by are accessed without assigning an array element count i.e.
>> crash_mem->ranges[0] is accessed without setting max_nr_ranges after
>> vzalloc,
>>
>>     // include/linux/crash_core.h
>>     struct crash_mem {
>>     	unsigned int max_nr_ranges;
>>     	unsigned int nr_ranges;
>>     	struct range ranges[] __counted_by(max_nr_ranges);
>>     };
>>
>> The bad commit was introduced in 2021 but only recent gcc-15 supports
>> __counted_by. That's why we don't see this UBSAN warning until this
>> year. And although this UBSAN warning is scary enough, fortunately it
>> doesn't cause a real problem.
>>
>> >
>> > Baoquan, please re-review this?
>> >
>> > A -stable backport is clearly required.  A Fixes: would be nice, but I
>> > assume this goes back a long time so it isn't worth spending a lot of
>> > time working out when this was introduced.
>>
>> So I believe the correct fix should be as follows,
>
>Thanks for testing and investigation into these. Could you arrange this
>into formal patches based on your testing and analysis?
>
>It would be great if you can include Fuqiang's patch since it has
>conflict with your LUKS patch. This can facilitate patch merging for
>Andrew. Thanks in advance.

Sure, I'll ask Andrew if a separate patch is needed because both my
Fuqiang's patch and the kdump LUKS support patches fix the UBSAN warning
as a by-product. And I'll resolve any conflict. Meanwhile, I'll need
more time to investigate Fuqiang's patch. For example, because of
commit 6dff31597264 ("crash_core: fix and simplify the logic of
crash_exclude_mem_range()"), cmem->ranges out of bounds doesn't seem to
happen any more because now -ENOMEM will be returned instead.

-- 
Best regards,
Coiby

