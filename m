Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E91411EB
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748596309; cv=none; b=oS2T2W8heVJnxQKR5+/IpVRUxCz4j2CtDWzyGyZTIuPSCOBZ2m2+TYmTkZcmNHVS3A4YMHmbffupMDeuU/TsfNYXdwZt+ONCi6qccboCjuBpebWCERel+fV/BbpRhHNC8InCwCFTrfGyjEfVVsWfbpR1VOg27+FcXYQmqaCqvaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748596309; c=relaxed/simple;
	bh=pA4gDaYrX/ZskPIrVNn7kpuqs8HJHeoR/Xc+f5rMXNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6TYFme9GzPg/y5HFStQ/VdcEEjIykjosEQWqv4pI63dcxjcTZwamqCWopYgKjDlun3Pa8QpPl8CHpWBtjeNR4aDLbyLdq0TUIMGMmC6TOg53Gax6L3TLfqLa4cUDRbTrvrqtG0mkSf+2c8r4zhPv5BmbiV72fwjSPfQXHtTsd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N0oeLiPp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N0oeLiPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748596305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FcLOeL0j8aYWy2M7p1kJWLoT3h6nC08D9zaPSw+D+1I=;
	b=N0oeLiPpZSVm2kJLnIkG0SZiJ2PX782J6jmz2Z44BAJRby6Ql2EykRvXlz15L2bh7SK4YM
	SdLR3u/cgiESCu8upEu3MVg7vjUkKY8uJRSdkteSV5e65JEGSUP1qiAtKLNtNgNUZ77BgH
	/NV+FbXuRwL6gY6B7aHRkvOdPf6aKUU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-FnrbumUNOayNS7kbmM-oNw-1; Fri, 30 May 2025 05:11:43 -0400
X-MC-Unique: FnrbumUNOayNS7kbmM-oNw-1
X-Mimecast-MFC-AGG-ID: FnrbumUNOayNS7kbmM-oNw_1748596302
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4cceb558aso868880f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748596302; x=1749201102;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FcLOeL0j8aYWy2M7p1kJWLoT3h6nC08D9zaPSw+D+1I=;
        b=Z9esl1xkmo+usUooppKMU+qsPRX+3HNVFhlstHYYlF9edEPrqxdyslFaio2lS0PVRD
         OvC+F+5/ksABMLtY/KD8YK5WRcuoIjFvRSiPa2UwFpMEs362m5mmbTNOa7TTVfKjppCu
         xD4xOOnqjKtI/3Je245XaKRMRbrk/pXGiRTK3+4ZzLKqoptXDgJ0MCaGBXMsz8aUv/9Z
         ZywxbJAetDzbls5tQnkVFMpkpTNv4EWQuZ4em4Iyc7uBlJ3iYDrFZcKO0cFKBzAmMECz
         kd4TNv58legdXxdGWGRlIsZft2OGrsTqXwUU6M59Ji7+3aDzmCF5ITMki0xucv+IhCxz
         X7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmJbMNlGWZRMD06UvnBcH35e2wbnlXhDHYpCHhzFbN0CqeAbQmwS1mpc+lOzSLh5g2NP9phQf+oXJgibw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4p8MYfEW9+2umfl1hIU7LIQDNBWT6ZAQ1+AciB7yh86f7TvPM
	grNETo8NtLM9/Y244nHiVuvzo6LXkCCdGWpHS5lckw1UORBvuMiZVAlIk58RZfmHhuVCBMSoI5n
	3fKSBeZGkjmgnqvWMC/wD+WiKpuGM/ocoS7Wr2sn5kDZYe0cKoH3DB3P8DchE5g/FiB4n6Awjn5
	1i
X-Gm-Gg: ASbGnct6H6tbcjShrLz2iW5g808mviwonGQwRlfUKBYWp96rkz6hTEOoxA2kuJxn6Qw
	TFFnOQH7zet+M/8c3liK0Y3awKylKZKks1UHZcu0aPTqSXLripjIKr92uiiIeOjll7Ny0aTi8gV
	HwMTeWbZftrAJnmsELQW5ryQoJvRIzTRfec09GHMx4DnI1W8nJPOFhy7uXv97BU2AAOkFrjQlGT
	PYgJGIFQOdniP+1P2QJL0aZShWYmKfFnmI8mkvEajSfyqhAkbw14Fq20GQeNae1SkWoBXdkedhz
	CiP7BwZVqrgkLTyx1snwYn2R2A4Ldxr0ySGlPQnzBGqznbeZzeFjTeq/r4iCw42AObZLvBmBAs7
	bSnftkSyLn0xc2UaYeDFaIYP5pLIgbSQsEW8ufgA=
X-Received: by 2002:a5d:4ad0:0:b0:3a4:f7ae:77e8 with SMTP id ffacd0b85a97d-3a4f7ae78f2mr1566388f8f.15.1748596302376;
        Fri, 30 May 2025 02:11:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF60h8rKE0nPobuy20ZXqTnSFgBrTuintIRkVxcH5DFZBoUxjL88SfayitoqDnRNANVj/A56Q==
X-Received: by 2002:a5d:4ad0:0:b0:3a4:f7ae:77e8 with SMTP id ffacd0b85a97d-3a4f7ae78f2mr1566375f8f.15.1748596301992;
        Fri, 30 May 2025 02:11:41 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6d0dbsm4192895f8f.40.2025.05.30.02.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 02:11:41 -0700 (PDT)
Message-ID: <04a49de5-eb79-431b-ba5b-eae2536781c6@redhat.com>
Date: Fri, 30 May 2025 11:11:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
To: Michal Hocko <mhocko@suse.com>
Cc: Baoquan He <bhe@redhat.com>, Donald Dutile <ddutile@redhat.com>,
 Jiri Bohac <jbohac@suse.cz>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
 Philipp Rudo <prudo@redhat.com>, Pingfan Liu <piliu@redhat.com>,
 Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <dhildenb@redhat.com>
References: <Z7dc9Cd8KX3b_brB@dwarf.suse.cz>
 <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
 <aDgQ0lbt1h5v0lgE@tiehlicka>
 <a1a5af90-bc8a-448a-81fa-485624d592f3@redhat.com>
 <aDlsF5tAcUxo4VgT@tiehlicka>
 <e0f7fc1e-2227-4c6b-985a-34a697a52679@redhat.com>
 <aDl1ViMpK_6q_z06@tiehlicka>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aDl1ViMpK_6q_z06@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 11:07, Michal Hocko wrote:
> On Fri 30-05-25 10:39:39, David Hildenbrand wrote:
>> On 30.05.25 10:28, Michal Hocko wrote:
> [...]
>>> All that being said I would go with an additional parameter to the
>>> kdump cma setup - e.g. cma_sane_dma that would skip waiting and use 10s
>>> otherwise. That would make the optimized behavior opt in, we do not need
>>> to support all sorts of timeouts and also learn if this is not
>>> sufficient.
>>>
>>> Makes sense?
>>
>> Just so I understand correctly, you mean extending the "crashkernel=" option
>> with a boolean parameter? If set, e.g., wait 1s, otherwise magic number 10?
> 
> crashkernel=1G,cma,cma_sane_dma # no wait on transition

But is no wait ok? I mean, any O_DIRECT with any device would at least 
take a bit, no?

Of course, there is a short time between the crash and actually 
triggerying kdump.

> crashkernel=1G,cma # wait on transition with e.g. 10s timeout

In general, would work for me.

-- 
Cheers,

David / dhildenb

