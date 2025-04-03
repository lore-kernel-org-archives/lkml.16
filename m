Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FAA24CEE9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688198; cv=none; b=GT6XHVx1AXDNvR43NdZURzQ8/lh+10Bq7C0C7Kq6nex/KMqw4HxLMhZw5NdUiELIinwQ75oXh+yky/zwFUsBIaSlXIDUKtO60jvUhHjiz6gZfPca0Kz2ua7Syv2YAupRXns5Xz8lrkhZd/fmTbLS0KPttaC95aNuDvg8kkDWNkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688198; c=relaxed/simple;
	bh=8wd++/QS/xpM3EXXxc69GzFn6SgURG8H5mMkQefQd1M=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YM0SpbdArLoAn1styfazkbmEliFa7ro0GR3CQ/FCU+vzCL9cqg9ToJGDhV1a2QC3+jBj7DkgzNHpDAK62nyBvwoYkuuQrJjOmdtUFy7q4vM54hdAfOzE9+jxJ7UBPvK+PwUqc+9xVwthKZNP4RLUJ+6h19svS/rWsY2B+jxVrfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EGe7An1w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EGe7An1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743688195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eAoy1aQ30yuScjB2LdD2aKFWnFzP7D/Q7jd8pjdm/k=;
	b=EGe7An1w60vMu0idRaQLbb8TJHgfNkLzRggtUllvcsvv4F5qEpgsU6wxOrmWrEPtovYdz6
	hQJYzwcHE/Dd2YLmh3DkjVsh+YgB9KVk4uSIvljly1crAQGCwHlJPxnWzxsh1I7AtiiDuc
	N3XINdJLbux401MCNMLAajCuxM4elOg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-ytSdaI2uPFy44Ocj2F6wLw-1; Thu, 03 Apr 2025 09:49:53 -0400
X-MC-Unique: ytSdaI2uPFy44Ocj2F6wLw-1
X-Mimecast-MFC-AGG-ID: ytSdaI2uPFy44Ocj2F6wLw_1743688191
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e905e89798so12996546d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743688191; x=1744292991;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0eAoy1aQ30yuScjB2LdD2aKFWnFzP7D/Q7jd8pjdm/k=;
        b=hBIo662CVSstV6tBvSebHS2v+6tfNVnysrR70ZUn+So2WOsRX6taI3Uw91yj1OO9EJ
         JqLc3LD4rj2w2lauMVd0sntYFyb4yUh7pfWnrHd+jxylwW4N6vPWYcpuHpF6HkJU4t0z
         ifr21FhbguFdVkuECHv5M4a0pnqIjlITpva6XdeHsmghsbsQflIBkvZgJWL+nxDYdhKm
         9YHyrU0gm9TP0dNz/Q27+xJymmro1wr0c8SdvsCK66vMY3vGjlkNUPVbfp0aEcOdAD9W
         ZP6qergvoVZ0ywOzhO6+zfmifsz0mEWQWlmF1lAO0lk4bzMVo3clwCNA4ldFwlO/3Zg6
         rNXg==
X-Forwarded-Encrypted: i=1; AJvYcCXUM0sfw/UU5vEyAZ3xcI/6Z1GxDsYEPxXF6pc+/k6zWnduS0kTn1hfl4U3axb1XIyOhDClvC8xdwUdr6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe2sarg0pC+++GQrZoycIfVLtrCdmoR7u0+n7Qwj0iEl0yHWuy
	7lnW5fMoQb/wdL90GVe39sfo37gww+PMTOgpV5AI2Qvi4jeh8WHRVbO+Nzml/Jhtfg33Ra4pH5i
	rd9Fgggp9vSuNgXAh2N0PlnbW/DTAHBenC90vt88I2U7PqvihrL3BO/LFJIY0ag==
X-Gm-Gg: ASbGnct/GIZJ8aQtfQtHy0R5QKUNqYXU+yQ1kK6nvh+HgyfS/u8tk2KHnETHLm/b6Hu
	o7er14iCyFDTXD3CkzMX6OK8ZHDDWzYj5UJOSRYKoU/bV0dkFpRX1LMAxnZJ7D4foLo08KeTQ/l
	98M97gekqnhqzVTCAPqmVZ8uGCAjHSY1GmfAhZ++3TFl6cIOgvF32tOnBR4SSJtaC2OeV2Vvt2j
	4mBXPs3oAwzWNJ9HibNLH5X2mI5xx68FrcS8ZfPEr6MTTJ03k9T0fVHZDi+jgr0QgkMIEP8+3Ti
	T7U5PVrm83hp/DMGEJ2uCnWXi7F70cqkMxN7ZiR6v4Hjc6c/cxq4+ZZWHfMG9Q==
X-Received: by 2002:a05:6214:d45:b0:6ea:d604:9e59 with SMTP id 6a1803df08f44-6ef02b7fe83mr105374956d6.9.1743688191331;
        Thu, 03 Apr 2025 06:49:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbzjYUkcoGjF250F0Pl2Phd2PHHM5mJucKy2fKCWScw+uUZHWYUOwP0vKoI8Pljh7xHfeTTw==
X-Received: by 2002:a05:6214:d45:b0:6ea:d604:9e59 with SMTP id 6a1803df08f44-6ef02b7fe83mr105374666d6.9.1743688190985;
        Thu, 03 Apr 2025 06:49:50 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f14cf41sm7678356d6.105.2025.04.03.06.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 06:49:50 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <2fa642e3-4ee9-497f-8c3c-49abb712a679@redhat.com>
Date: Thu, 3 Apr 2025 09:49:49 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] cgroup/cpuset: Remove unneeded goto in
 sched_partition_write() and rename it
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250330215248.3620801-1-longman@redhat.com>
 <20250330215248.3620801-8-longman@redhat.com>
 <t5gojwcnwdb36ppkhq6hpujmyatckg5wd5eigsnmt2kndfofe7@ymc7tiury62o>
Content-Language: en-US
In-Reply-To: <t5gojwcnwdb36ppkhq6hpujmyatckg5wd5eigsnmt2kndfofe7@ymc7tiury62o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/3/25 9:33 AM, Michal Koutný wrote:
> On Sun, Mar 30, 2025 at 05:52:45PM -0400, Waiman Long <longman@redhat.com> wrote:
>> The goto statement in sched_partition_write() is not needed. Remove
>> it and rename sched_partition_write()/sched_partition_show() to
>> cpuset_partition_write()/cpuset_partition_show().
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   kernel/cgroup/cpuset.c | 15 ++++++---------
>>   1 file changed, 6 insertions(+), 9 deletions(-)
> ...
>
> Also noticed (here or for the preceding comments&cleanup patch):
>
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -3525,8 +3525,8 @@ static int cpuset_css_online(struct cgroup_subsys_state *css)
>    * in the default hierarchy where only changes in partition
>    * will cause repartitioning.
>    *
> - * If the cpuset has the 'sched.partition' flag enabled, simulate
> - * turning 'sched.partition" off.
> + * If the cpuset has the 'cpus.partition' flag enabled, simulate
> + * turning 'cpus.partition" off.
>    */
>
>   static void cpuset_css_offline(struct cgroup_subsys_state *css)
>
>
> Next time...

Thanks for catching that. Will fix in a follow up commit.

Cheers,
Longman

