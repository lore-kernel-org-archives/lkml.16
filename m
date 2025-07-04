Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F35520FAA4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653352; cv=none; b=big8H0br97GZn5qkapS70z19D9sp9MYLqR1he4oLM8E/lzGiKHRErIxH7GsdMEjDHPG/CKQRuy/nDF6YjebtA+A1FiYLqzAv13l8s8mP2/zK2DkGVEP2PV3phfiC4eiwFW2fIPuHJEvJ+hMfh3xhkK3azx0twZQDMzZAYWxFqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653352; c=relaxed/simple;
	bh=y7Hbl1pAqGjQzF/82eshc8yF2u6xa68k61bwAB5tTzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhZzI6EEVgI2dbbXu/uCKptaZ4o3KRrnwRYPF9q+e5YrN88wnhW9g/P9M//39Ezzg8iVKP+48U60lH32rTBCxZ1M2kRY96iSDgvdwTVnXUYcG/j4+Wx/Z1HQQMCI1r1hyXYc9DTPmSvkR2yAKwf/nI2MelB3rn8204xJAyVv0Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JPZ9YQdJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JPZ9YQdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751653349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ao5yV0OWlWrLaBBV5SLduZ6Vw0gfsxB0sugrEeYXGWQ=;
	b=JPZ9YQdJqLIRS7c7QW497UVPE5oGN8Ly4yq8GsSbCNajIOJQXhFoj0SHUqN4tauaP1rM29
	Nv8+tKbFtTmbWPQdoI0lq7YOC8OTjpUfwBLEbAmoYje7Ggw3oix4fiZLYu/g4xnak2isca
	xbJ9pGIoGXyvs05IBuhG2PNomtFRB5E=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-zZ8puU_gNxiCIKJ5Qols3g-1; Fri, 04 Jul 2025 14:22:29 -0400
X-MC-Unique: zZ8puU_gNxiCIKJ5Qols3g-1
X-Mimecast-MFC-AGG-ID: zZ8puU_gNxiCIKJ5Qols3g_1751653348
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fd75e60875so22059506d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751653348; x=1752258148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ao5yV0OWlWrLaBBV5SLduZ6Vw0gfsxB0sugrEeYXGWQ=;
        b=nuD4SiqmkSN90kgMMtThxHOZ5NrFR5ovfUaRUXffCxY1HPNTrmJBbFDFNCBZFWeG2+
         kjdPmwxnuR+epVTagPu0+ZQmKs4yHWzd27EGbepKyrkvqMrldUQr4fAtz2fyr4ty+DHo
         DofRBJthHv7sgldEqzwZZG8OODBUM9chZ7GcSMbNwqx56MD8MOeM/nW5F/9rktYdbJjz
         ZB471QLM3McmpWI/o+RTskZW9M7H1ZmW+VZb2S6Kzf3O+uTVa7rLpH8Prl2ci+jONf7l
         g2o3e8jrQWTdiQtzbEmbPNISD/Qp5wTrv+Lz/OV2kwn7I/hJD6AgGMQvYeCVNI17OIuW
         AnWA==
X-Forwarded-Encrypted: i=1; AJvYcCWBdBX8rDlN1LBsa4WHOmwsKxDySixj9zwSwvWLnqD8qUcqrqubFGjea659XdaWibPRfolTMNWkF64MfK0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8+ubt8JdvpDE9jOwjGGu1STBGYdsVzQKwYuhMGaxYpScOA7sM
	6d6nptZQcftby4rEJHvCWFJEW37JqVN06IETFhB2S3hYM+xPLZQ82dklYXE3ueXkpfFlRS5fLg1
	91mXZ5F727TwGaJyh1sFyImTLYQEPcAaltjUgOq+6arVP4noJtjteBoqdSBpDoe8pAarxtFCOsD
	Zs
X-Gm-Gg: ASbGncuOuaBoWM8n/AzrYbj2Yjol3ec4Iab/LnS9zpWZqhL64GdQqiV/hr61xrEAJR8
	yGT3MoqfxCkOkTU1+tZtBppbkLOJDQh/JNoQnedMlWNhnaitkHuFL1Xq3r4qZ1Sj3vNoPOpv9iz
	1QTL7xsEF+Df6ryftVRG+lGJcsUVXG0ErfStppoqv4CrCMzMF4b7Y3hpxdAVUUVlIgE9QZhCgL0
	a2+YM2Rcob/2IFwAIBWE/76zzTv3XYWclJeEZ1Wr4JVHmGcjKGxQNHlNcFlsqIgi+b6oFNTNgBO
	MIH4CHwB3wUGBjmXZp4ydPka
X-Received: by 2002:a05:6214:e4b:b0:702:c15f:3291 with SMTP id 6a1803df08f44-702c6d7a145mr47718036d6.22.1751653343417;
        Fri, 04 Jul 2025 11:22:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOOAnVJ2nhxq4q+rgZ9MWxRastPRZ+F+UsTkduj/PWXspmSODVR5v/cT1qpEPk5qddOrytUA==
X-Received: by 2002:a05:6214:e4b:b0:702:c15f:3291 with SMTP id 6a1803df08f44-702c6d7a145mr47717576d6.22.1751653342959;
        Fri, 04 Jul 2025 11:22:22 -0700 (PDT)
Received: from [192.168.2.110] ([69.156.206.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cd2c1esm16472856d6.50.2025.07.04.11.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 11:22:22 -0700 (PDT)
Message-ID: <34be0c05-a805-4173-b8bd-8245b5eb0df8@redhat.com>
Date: Fri, 4 Jul 2025 14:22:11 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: fix the inaccurate memory statistics issue for
 users
To: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Michal Hocko <mhocko@suse.com>, david@redhat.com, shakeel.butt@linux.dev,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org,
 surenb@google.com, donettom@linux.ibm.com, aboorvad@linux.ibm.com,
 sj@kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <f4586b17f66f97c174f7fd1f8647374fdb53de1c.1749119050.git.baolin.wang@linux.alibaba.com>
 <87bjqx4h82.fsf@gmail.com> <aEaOzpQElnG2I3Tz@tiehlicka>
 <890b825e-b3b1-4d32-83ec-662495e35023@linux.alibaba.com>
 <87a56h48ow.fsf@gmail.com> <4c113d58-c858-4ef8-a7f1-bae05c293edf@suse.cz>
 <06d9981e-4a4a-4b99-9418-9dec0a3420e8@suse.cz>
 <20250609171758.afc946b81451e1ad5a8ce027@linux-foundation.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250609171758.afc946b81451e1ad5a8ce027@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-09 20:17, Andrew Morton wrote:
> On Mon, 9 Jun 2025 10:56:46 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:
> 
>> On 6/9/25 10:52 AM, Vlastimil Babka wrote:
>>> On 6/9/25 10:31 AM, Ritesh Harjani (IBM) wrote:
>>>> Baolin Wang <baolin.wang@linux.alibaba.com> writes:
>>>>
>>>>> On 2025/6/9 15:35, Michal Hocko wrote:
>>>>>> On Mon 09-06-25 10:57:41, Ritesh Harjani wrote:
>>>>>>>
>>>>>>> Any reason why we dropped the Fixes tag? I see there were a series of
>>>>>>> discussion on v1 and it got concluded that the fix was correct, then why
>>>>>>> drop the fixes tag?
>>>>>>
>>>>>> This seems more like an improvement than a bug fix.
>>>>>
>>>>> Yes. I don't have a strong opinion on this, but we (Alibaba) will
>>>>> backport it manually,
>>>>>
>>>>> because some of user-space monitoring tools depend
>>>>> on these statistics.
>>>>
>>>> That sounds like a regression then, isn't it?
>>>
>>> Hm if counters were accurate before f1a7941243c1 and not afterwards, and
>>> this is making them accurate again, and some userspace depends on it,
>>> then Fixes: and stable is probably warranted then. If this was just a
>>> perf improvement, then not. But AFAIU f1a7941243c1 was the perf
>>> improvement...
>>
>> Dang, should have re-read the commit log of f1a7941243c1 first. It seems
>> like the error margin due to batching existed also before f1a7941243c1.
>>
>> " This patch converts the rss_stats into percpu_counter to convert the
>> error  margin from (nr_threads * 64) to approximately (nr_cpus ^ 2)."
>>
>> so if on some systems this means worse margin than before, the above
>> "if" chain of thought might still hold.
> 
> f1a7941243c1 seems like a good enough place to tell -stable
> maintainers where to insert the patch (why does this sound rude).
> 
> The patch is simple enough.  I'll add fixes:f1a7941243c1 and cc:stable
> and, as the problem has been there for years, I'll leave the patch in
> mm-unstable so it will eventually get into LTS, in a well tested state.

Andrew, are you considering submitting this patch for 6.16? I think
we should, it does look like a regression for larger systems built
with 64k base page size.

On comparing a very simple app which just allocates & touches some
memory against v6.1 (which doesn't have f1a7941243c1) and latest
Linus tree (4c06e63b9203) I can see that on latest Linus tree the
values for VmRSS, RssAnon and RssFile from /proc/self/status are
all zeroes while they do report values on v6.1 and a Linus tree
with this patch.

My test setup is a arm64 VM with 80 CPUs running a kernel with 64k
pagesize. The kernel only reports the RSS values starting at 10MB
(which makes sense since the Per-CPU counters will cache up to two
times the number of CPUs and the kernel accounts pages). The situation
will be worse on larger systems, of course.

