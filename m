Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607A5A29
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745545430; cv=none; b=cKU9lxn/TYDmb11+invfVk1Tb3vXnDFpAZIAYwAU7AejeX3RjKI0cOIQ/2AcNxF9s7LhmD/oTjSuHiJb49CGj0kuc5RR6PRmLlli5yQgHokCmbCZLi882zfZAXGG0ZQ1sHJNHWquVh0VXcFHqZF9pBs7r5AgCeTO5R2E53TKx8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745545430; c=relaxed/simple;
	bh=FIj/Nrm6Yt0/RYDmzX2pSFrItB3fLjv5qk1ztU9IhW0=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rVbPgEpSr1Ku/q5GoaVqlicVILAAAqaeLsSt0VDHOuMAMAwoEIw2fbjCpoyNGdFYeGLxeqV3G3acrnVQZLUk/rBEjC4XaQvJOmEfJbD9G3VO3+6MpmcPO9sfFDN1+YinqKUZBcqLXvfWWM/3Bb4+Kb/8N6wF+4ofYVSC906YmRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BhhoNaRA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhhoNaRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745545427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCClB33bqWUfAaosnf+MBH1sPLHPMLDQYLjiZVeb+ZA=;
	b=BhhoNaRAYNZLBj9ZnaCWe0nEU+v+T7qOv16yjg7t0oaw0+7uwfOGvAnDXyAS/FIqPVcA9T
	urUQwXeDTNdYj+XnnTnjO54/Dl4qpFzroAIVj2qTHgSH9vBiKNsIDO4BqLsuIUwZQyYnVF
	/Cz3BblryAMuiEyejTU2lmc/QSxlJXw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-8Y_a4cGLMxOqNmbDaJ_GPA-1; Thu, 24 Apr 2025 21:43:45 -0400
X-MC-Unique: 8Y_a4cGLMxOqNmbDaJ_GPA-1
X-Mimecast-MFC-AGG-ID: 8Y_a4cGLMxOqNmbDaJ_GPA_1745545425
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a3ff7e81so295059485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745545425; x=1746150225;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCClB33bqWUfAaosnf+MBH1sPLHPMLDQYLjiZVeb+ZA=;
        b=GusCdCBX9UO8tpiOWrMzTtOadSOlLEG6RWT+PHLsgcP/faVdYK5/L2PB+9vh5auzvj
         oF54+MPkirFTodlutHgKJnGswzO41sw/+WMwwtK9Ay0jvlNOO1G7Wu7lEDY7Gd3i2SNR
         L7is2FxgVd6mTzhldfjTCwvjJAhOGe/qTjFw0BhZMu1RGfjHiknTOqMpbYd17o+5CHRK
         UFD6hQL8GBn39+rcrQh7Anu6Qo9nD0g81IzLJ0CaCbyhY5WMxtHE+QY+g36lKbMXMwwQ
         eg8SS9NTNEuk2FTzJP9sQ9J0CgyH+rxFVGbNFvX9lb6IeE8STKBMw1PS5xBE2LOnerh/
         DzCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyF7QtoubdAa8mKJ1hIMpZxhRlA/Iet52vh4NBA0dK5ijzY4GeV53PH1WQgc0WlSc5EC1naAM4osTO30Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKTtkktPxER5f53He408zcnzjHMdb33TWKCUnQhuzeWM39fj0g
	uTxsX/myUPE64vwmoQ4FGhQcJuSjjvJBPHSMTqu/oOYVTHdr7QDixwi+H+L5n2Isqm5fNEPXVSQ
	fenb3GOX3VA7v345l5Dcik9NUNIrUKSKcTMEGKUmR0Hz8OL6IX+qbfEihyclbOg==
X-Gm-Gg: ASbGnctpqNHwbhib5BLSPA4iP/gRenOJpkya4H7lOdIz1cyG/seF3v8TKaITVOal2E9
	5socaDnLZHQYqmzIfulkuzGYrtyojzfwOuTU8DpVAbLa/tP5sXq8k2qaA0kuJG8XUr7c1cp8GcK
	S0OG69fQdYdRqKoxfqmIQlY+uA6GT8W2Rzn0ov/jWUwwWZI53BR0CcyACyC/+TnnIk0v91pn1e7
	Yq3hrrR+8mNbVnykjVW3riiuddZE7C8eljlZYhQsGrAWtV9coONVjaPYbZdZfStQa+rDjnFhOy3
	BLFeVFSTT+7JkL+c09x60NXq554FXnt7nKYsmzMB+wIB66Q2rigIm/UosQ==
X-Received: by 2002:a05:620a:440a:b0:7c5:5a51:d2d1 with SMTP id af79cd13be357-7c9607cfa80mr128585785a.55.1745545425328;
        Thu, 24 Apr 2025 18:43:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG//NEwXF6JviKiJm8lmp5FnRYUompC92ypydph5SsIh1bKbr7cFsk6XGINnp7DwftF8KhI1g==
X-Received: by 2002:a05:620a:440a:b0:7c5:5a51:d2d1 with SMTP id af79cd13be357-7c9607cfa80mr128584085a.55.1745545425090;
        Thu, 24 Apr 2025 18:43:45 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cdc559sm161890185a.57.2025.04.24.18.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 18:43:44 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <20aa3292-091c-4d27-a77e-c0aef4bbb276@redhat.com>
Date: Thu, 24 Apr 2025 21:43:43 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cgroup null pointer dereference
To: Waiman Long <llong@redhat.com>, Kamaljit Singh <Kamaljit.Singh1@wdc.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <BY5PR04MB68495E9E8A46CA9614D62669BCBB2@BY5PR04MB6849.namprd04.prod.outlook.com>
 <a5eac08e-bdb4-4aa2-bb46-aa89b6eb1871@redhat.com>
 <BY5PR04MB684951591DE83E6FD0CBD364BC842@BY5PR04MB6849.namprd04.prod.outlook.com>
 <623427dc-b555-4e38-a064-c20c26bb2a21@redhat.com>
Content-Language: en-US
In-Reply-To: <623427dc-b555-4e38-a064-c20c26bb2a21@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/24/25 9:33 PM, Waiman Long wrote:
>
> On 4/24/25 8:53 PM, Kamaljit Singh wrote:
>> Hi Waiman,
>>
>>> On 4/23/25 1:30 PM, Kamaljit Singh wrote:
>>>> Hello,
>>>>
>>>> While running IOs to an nvme fabrics target we're hitting this null 
>>>> pointer which causes
>>>> CPU hard lockups and NMI. Before the lockups, the Medusa IOs ran 
>>>> successfully for ~23 hours.
>>>>
>>>> I did not find any panics listing nvme or block driver calls.
>>>>
>>>> RIP: 0010:cgroup_rstat_flush+0x1d0/0x750
>>>> points to rstat.c, cgroup_rstat_push_children(), line 162 under 
>>>> second while() to the following code.
>>>>
>>>> 160                 /* updated_next is parent cgroup terminated */
>>>> 161                 while (child != parent) {
>>>> 162                         child->rstat_flush_next = head;
>>>> 163                         head = child;
>>>> 164                         crstatc = cgroup_rstat_cpu(child, cpu);
>>>> 165                         grandchild = crstatc->updated_children;
>>>>
>>>> In my test env I've added a null check to 'child' and re-running 
>>>> the long-term test.
>>>> I'm wondering if this patch is sufficient to address any underlying 
>>>> issue or is just a band-aid.
>>>> Please share any known patches or suggestions.
>>>>                -          while (child != parent) {
>>>>                +         while (child && child != parent) {
>>> Child can become NULL only if the updated_next list isn't parent
>>> terminated. This should not happen. A warning is needed if it really
>>> happens. I will take a further look to see if there is a bug somewhere.
>> My test re-ran for 36+ hours without any CPU lockups or NMI. This 
>> patch seems to have helped.
>>
> I now see what is wrong. The cgroup_rstat_push_children() function is 
> supposed to be called with cgroup_rstat_lock held, but commit 
> 093c8812de2d3 ("cgroup: rstat: Cleanup flushing functions and 
> locking") changes that. Hence racing can corrupt the list. I will work 
> on a patch to fix that regression.

Oh, this problem has already been fixed in the cgroup/for-6.16 commit 
7d6c63c31914 ("cgroup: rstat: call cgroup_rstat_updated_list with 
cgroup_rstat_lock"). It should be in the linux-next tree.

Cheers,
Longman


