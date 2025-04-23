Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AAD20126A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443572; cv=none; b=ZG+JHzumAqJrOGCkvdj7lwqgPsvcttTtuYxZ2FkJkEEJShthOy2/HQ06muRoy6bw1IU8eQLirlzqrbIqROnwuMc6/UWoEhJt4MuYcSePBO2ZTEOcajIExLJOS3jJaYfZn9cT6parcCUC7de8SBQEdpiFlsUgMZDRqhvTYhm1WvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443572; c=relaxed/simple;
	bh=JIAataaF3MAC5dfiIOHAE9jhxPO9qEIVVLyurNzbufk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pldhJPU0wJowbP/az4qgRDRYye35eMNQioVLqf/Cb7QAcKWhJAkpPZ8Ao+qy9cQ6Wit/YJwqDky/4PfRgNHI1WkiD5Mz1PjHOi5KT9qckB3ZUGvLaeL0F9CjY4Qsxg2vqjklzYcnJo9aaJfndgRHuGJgSyGNGEMTcADFtHBySJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F9s9UYiR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F9s9UYiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745443569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aU4NFciLR4UCyMwqNbOWtp1Qy37FjSg/5JGcNCTMQtY=;
	b=F9s9UYiRbOLfhW9Kwhsv76TeWe4A1+TefuoYoWQCqO6tLFqSBhVDTa3g0xjKleGMvXd9zf
	e7w5Ay0iqhWnVTt7l9Ymho0FbV3i80kJ38+MiXyoSx2LPPlYi2dyNu+sLrj6JPMJxV+swM
	+y/D/humE9oLPRbKUIVG6nnFphkY3S8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-g7cRWE4yNcm9v8ESLFA_6g-1; Wed, 23 Apr 2025 17:26:08 -0400
X-MC-Unique: g7cRWE4yNcm9v8ESLFA_6g-1
X-Mimecast-MFC-AGG-ID: g7cRWE4yNcm9v8ESLFA_6g_1745443568
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5750ca8b2so46375185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745443567; x=1746048367;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aU4NFciLR4UCyMwqNbOWtp1Qy37FjSg/5JGcNCTMQtY=;
        b=OUhevJcnEJE5I4CUHiTJb01yMQB2ZtQN70jXh/9EnbbNx/KafJUzVVY0cSU4eYlLse
         gaIz/Wg4m6pdrqYWj3EsPR1CStZ72Fhi+rSz9A/lXXnU6EwG8qWOw508GW3bbGbslfou
         gwMkgRhiWCad0hzGIRrUC1dXP3ARJISRrAfD52KrgAlaSrJ5cgYDdc/mLiO7G4iPexex
         MNhy57WHIn4iXBynZnUlI5MtF2sPMlQY6aWbIdtX7992/X3tkEtxU2TcUuQv25kZ42ux
         +hFGZRtFiSLeqhogAnv2pQ8qQbcZ3gN04MxphUGf/VGUd6+4cGYplQp1RXA0Z7TH3FKl
         I4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8yFKKihGR/Q4rRYgX7no9kOaHTCCCIeZe6vkE3479m9VVNMMFJyZyPPTzD8kxligh9AEMCsfuMBczJr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxALiqEGiuGmC1fktMsnvim0XD5B/k6w5eHaW4DQxJT9H9Qbqwg
	qE4qiyxlq4DDWd4U0dxFYYaKbN67YzuEerbfTKZimtzotWuh7iCuVyr2eqdKThKCkgEKINtAFuW
	ZYPVuUcAkV2LFMugHpHIBdQMN0sKx/NEQRZN+kgLWI96v80WYQQscbiBRjrCjNUaCGBawmg==
X-Gm-Gg: ASbGncvEmFobEnbfBKwUKzefv8Q0kiujzIPfQciihZevrhhOn35D2T8TCwQP5eKLcj0
	+MeK7giQlgdvnGuY1s4sh0QftYtNtsU4MtQKhan4nif1wLEhn4oEfCnekDWFAKlxqAJzjQ+9x/l
	MQVz0BkR9IBPhsJPfgkpnPir8wh32jwELsru0vv3yKV2shfeNudLMlqY3jXqQ7tMAEtzXHAX6Um
	IUK4nyzjUT+uLxV3C/TFrlu2IB7NF4ixrfTzH6VoCC666Wsk35afj+Xt2ky67NYML1SmSHeSabZ
	53pn9FfOlJBxHulv0W/vZI/6NK/1d6vF3BCJGFdaFlIo6ndFlyARiFNsKQ==
X-Received: by 2002:a05:620a:199f:b0:7c5:46e4:480b with SMTP id af79cd13be357-7c956eda80amr54939385a.22.1745443567265;
        Wed, 23 Apr 2025 14:26:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8haqQUDBHoe6I7z1HOjPMMGHldKnDbmOSgGYPeTOaPgqtmaNKn/a8LPm4WITMwLxPdPWBbw==
X-Received: by 2002:a05:620a:199f:b0:7c5:46e4:480b with SMTP id af79cd13be357-7c956eda80amr54937985a.22.1745443567003;
        Wed, 23 Apr 2025 14:26:07 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a70768sm731509485a.23.2025.04.23.14.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 14:26:06 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <a5eac08e-bdb4-4aa2-bb46-aa89b6eb1871@redhat.com>
Date: Wed, 23 Apr 2025 17:26:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cgroup null pointer dereference
To: Kamaljit Singh <Kamaljit.Singh1@wdc.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <BY5PR04MB68495E9E8A46CA9614D62669BCBB2@BY5PR04MB6849.namprd04.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <BY5PR04MB68495E9E8A46CA9614D62669BCBB2@BY5PR04MB6849.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/23/25 1:30 PM, Kamaljit Singh wrote:
> Hello,
>
> While running IOs to an nvme fabrics target we're hitting this null pointer which causes
> CPU hard lockups and NMI. Before the lockups, the Medusa IOs ran successfully for ~23 hours.
>
> I did not find any panics listing nvme or block driver calls.
>
> RIP: 0010:cgroup_rstat_flush+0x1d0/0x750
> points to rstat.c, cgroup_rstat_push_children(), line 162 under second while() to the following code.
>
> 160                 /* updated_next is parent cgroup terminated */
> 161                 while (child != parent) {
> 162                         child->rstat_flush_next = head;
> 163                         head = child;
> 164                         crstatc = cgroup_rstat_cpu(child, cpu);
> 165                         grandchild = crstatc->updated_children;
>
> In my test env I've added a null check to 'child' and re-running the long-term test.
> I'm wondering if this patch is sufficient to address any underlying issue or is just a band-aid.
> Please share any known patches or suggestions.
>               -          while (child != parent) {
>               +         while (child && child != parent) {

Child can become NULL only if the updated_next list isn't parent 
terminated. This should not happen. A warning is needed if it really 
happens. I will take a further look to see if there is a bug somewhere.

Cheers,
Longman

