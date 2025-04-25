Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC088F6F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745545795; cv=none; b=TPxoHIDWovmfFVpMvz3UFOQLQG+ecuf7F7vs9T/1/mCaGeVF1HhTYyPh0aQHJFycG+z94+3LST/awXK1Mm7mkeWpfCSWxEbfBOeoVk+fWyRS3VY4KoD5Sdga3QmlHeiS587khwKmFWR4C43JGeYbv8/u17l4f18FMjDuPEa4FQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745545795; c=relaxed/simple;
	bh=gKvGgoDyaqN5CJ9mJmsU2FpaC8qrv6VrrlpgvToUL2Y=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cyudFgT/KW56h3OoEDTJGqikrXBxebcpPg7wHYYI8Wj588+vWEeCPVx+tjM/cgol3u+IUxVKm8dsh3OeKM9bHpDaT3ll8hpIn+RvIIO7ucXBwMAH7o3AQ1rax49A+mZf76doOOlkIMFopf4HdFpjz7vziEjxzkbGuBf71ra9LZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aMKrmlcL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aMKrmlcL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745545792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuIu6FpgSdCcAuTLohsFBTj2vc6nnMTkVfa1ZAvd/hA=;
	b=aMKrmlcLGVxa3yypoL7++swZgecuDgn1nPVHronF+PJys2nOqqBM8/uzu7atP2sROvPQhG
	3wHNAIkYhPmaw6le4usVTdIa5cFGUGE0LhfvVs9jIbNvHNlFghAEaIpw+yMI9Z6BmLGccf
	XCAeXEVCyEvEbomXXUp6KPCoYaHncls=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-SeT2H36ZOKW7rcQODlQmGQ-1; Thu, 24 Apr 2025 21:49:51 -0400
X-MC-Unique: SeT2H36ZOKW7rcQODlQmGQ-1
X-Mimecast-MFC-AGG-ID: SeT2H36ZOKW7rcQODlQmGQ_1745545791
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4768488f4d7so24533261cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745545791; x=1746150591;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuIu6FpgSdCcAuTLohsFBTj2vc6nnMTkVfa1ZAvd/hA=;
        b=L87bdr30AY3LqN7hPSmlgwh/vMm1buOgkOphVdI/K0wVqES+gNKw5p9qsUNkSIUI34
         bDLXOMQCmt/mH6AObl6mJLmoC4xbkYU0IQbp/C95AFHhnApfUDAMg1qK1Uq9url4JdeR
         uk5R1CR2FaTAODEm6P8NocMnZkGsVTMOuwaJt/Ltb2Aes+KcQ6sAIdylhDDFGvFVadcB
         mMcBdS2LZw7AZUDrAUOvCQkEr/TldKbjvr2CnI3QaYCFI6lbVDL+GBakv5NcTH6DvNI0
         Py5b5Smi9t0dSC0g9Z+yPdQUtRVxIO/d9+tUqmXk3DrbMz4eilqC2pm4+7kAmng1ngMj
         v22A==
X-Forwarded-Encrypted: i=1; AJvYcCW44zHJeghfBFqzHB+rFbTrOCwu4/AWr7ySkjfluY6CAyC00NPYlaubwDI9RPRxKSasjDm48roBNnpvSVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3YbQAkA6neu4ATnUCaC3dpQUlmvn1A9wwkmAHu59vR2NJkkIH
	GAI0DhCxzX/j8EvEP5aiwkmB3/N3Vj8iaUaIeq/hHzPpDWmoM0PgS5Pn67aHckZ9xg6LpDVOcTQ
	y5kq2/twSLcrl2R/12zWWcUq0og7nKF6yLc6P5pcdG8ffQPaBSkUvxCJhwDQfgg==
X-Gm-Gg: ASbGnctPQ5qBNM9zdwEvLbg3vy7Ap8ZSurl4FrpLPVpL+rXElLQz9DxZTBjBRxnLPBK
	vHhPlulqrnvi22xB2hNQIXY41O8DLh5x6AU8161//RkY0KD5HBODRpSHHED6OQbu5j730za2xu3
	lhFQmPEJdbN1cHH8rze5FRI7XeFW4ib1mRMdPlU3R9gdoKeWkF29IjRB6S8Pb87aOjKmD+zULSt
	hSOk8A8q4+m1ewjrWN0VSqTRaaB07fZe7Op6BuzjkMboabd0Cy52Xv9IhUHo9tkqKpXm2moS2wh
	CaJRXcFv9bV6ng8LtpXCUtgyLQXAoD2N0sodbXIT2YV/0DPqlREYdr9bHw==
X-Received: by 2002:a05:622a:24d:b0:476:7e6b:d2a2 with SMTP id d75a77b69052e-48024a7dac2mr8362701cf.35.1745545790972;
        Thu, 24 Apr 2025 18:49:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAJgknqPbNDIbXMiiiqKtYRR3XWPVLR30o7wYomwXhVSzOlUPsR/NBaj6Mbpm5BZORkv9JUg==
X-Received: by 2002:a05:622a:24d:b0:476:7e6b:d2a2 with SMTP id d75a77b69052e-48024a7dac2mr8362551cf.35.1745545790675;
        Thu, 24 Apr 2025 18:49:50 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9eaf2867sm19489011cf.7.2025.04.24.18.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 18:49:50 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <642a7d6f-9d8b-4204-bc81-4d8e0179715d@redhat.com>
Date: Thu, 24 Apr 2025 21:49:49 -0400
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

It should also be in v6.15-rc1 branch but is missing in the nvme branch 
that you are using. So you need to use a more updated nvme, when 
available, to avoid this problem.

Cheers,
Longman

>
> Cheers,
> Longman
>

