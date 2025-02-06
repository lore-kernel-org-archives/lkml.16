Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9C038DE3
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 03:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738812852; cv=none; b=MYsIRAC8ZMPYmYK9XBjZStOMZYTQAsJe7kv49zeZF5vXQmf5wsvoduxUx2KwiGZahT1Gk4rTjgaqut/g83ZLF8Ao/4C0SGL9vhDCI64gur0HCF2givcVytSeie85lLvqiVERV7G5GK6Y0VTUy4lidBOUgODjaiyT5pEwMeeOTpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738812852; c=relaxed/simple;
	bh=0nkvwMag2wJlVpE7+t0H3S/cgoMv4VnZVdqj5ePnD4I=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UjxuC0UNDOl92D6+Tm5go/dCQF7rtQIJZ8OVdU1uvmXAFK5CR71KhliNMOrHwYnPf9lqx04IOaU+uC0cW1U7Ry5wTyHkAYIXGUbX0oUr5Aji0fjXmHHU17lqN7bQSp06wAxI7hKtIb/BzmgDyyNdpb50zB6daUUMz7P/Gu+Li5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HXpXFF+7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HXpXFF+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738812849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgnCO7mXfPIiEEPBciloYom0SGtjBExbfCvcW+zqXLg=;
	b=HXpXFF+7d8tfFG+blJQWxcoca/BtPcxyEFeixLyp6MCdPsGw1xml9mOzMifse2mxYXnMxk
	QqRmqIgoUIfSTMsaR05e9LgZ68aYOfCOjEO5nPv7ehmP+HE7qUc0tkugFSCWpqrkfUW6b/
	ErH83kLgPNfILeJ1faZ8/7qWR72sSrs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-EYiuhiafPtOYTVw3EDCvJQ-1; Wed, 05 Feb 2025 22:34:08 -0500
X-MC-Unique: EYiuhiafPtOYTVw3EDCvJQ-1
X-Mimecast-MFC-AGG-ID: EYiuhiafPtOYTVw3EDCvJQ
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6e7f0735aso79624385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 19:34:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738812848; x=1739417648;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgnCO7mXfPIiEEPBciloYom0SGtjBExbfCvcW+zqXLg=;
        b=SXHVtzSNsuukOFM8UkeK5J8wXy9P7zw/rV4a8BDeG7PYOnR4FHZvkh52YbPe/TSPB1
         7aoiXA8g0QZ6XRGWsx5YflCKMsfdXv5TPKiOIvEaL/dT2Y8vVWXm6J5EC7WxIBUWNQhS
         tTfFqhVntXCD8/w+64iauf/kwHVzfR6l/qxbQl29hp17ayqjwWFvE2h0eMu8XZ9jn2Ux
         RuqbFA8/F/fMwiKQOKyQljS/acOKLrhtzoLuB8kQSPWem2bm1PMCVvITraZwdQ+8bZwr
         5ZNUXO0P2k95F7znpiG5lpTQNxTxWvxksWlFnEnuCPswqDMmFl17iHh8v2D3SNPSrF/D
         mKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHgsHcL2tIQalZduS20xzsOoPiPDo3RKY3iMLm7VBEwImVmRIjYxBWjpbvSXQ9eBQEHHY4UAWpIMG+gAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh8ymKceNLmfJU0yxPdgN212hKWJplr/U2OwaOhLSRTxFdmKiO
	/ccEcH7qV7GMaFG47/rreP/g1qaVtjY9ygOA5KXgoqJtOgRoEdW1+MMz7TjfwVhzFIVDCfvrhYw
	/+S06hqIm+b3eZxea3zX6S25ZT3QKbR6q5zmCBBO4Fj77E6G7Hvfe8aZ0ZKAhJw==
X-Gm-Gg: ASbGncthvnw+KSHkt6+ps9pQoE/Ded/3lC2tPiMWN7CTSF4MCB7WgSTvcZ1MCtA8Zxh
	1eLnO5V8Y51jZJdSQkaiZhmJ172KoxSO1syY5pysYl/fRuyX3MOm7hcur5SXM09Ztu+RhV5Xn4x
	lBix5A0Vp7CSGuXJSao7PAUFLC9Ld0NEA3oVJppf8+JUF6irG7kj3RcMPJTkvrcvahcxJmJo2e/
	6N6cYFbczmWfJnhIVT0XxkbvrP6az6w2FzK3ofTO47K7i0qynZR4zF7ZLD+TVj3F2MCg52Kb1XG
	m+JEaqVYsSJSO+wzOyauSvFYfqOv8ezw21pr/TnmF2Xqk4Lj
X-Received: by 2002:a05:620a:2901:b0:7b7:106a:1991 with SMTP id af79cd13be357-7c039f9810fmr663009785a.16.1738812848117;
        Wed, 05 Feb 2025 19:34:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6QZNT6c0eAJL+wJ+ah9660s9AYmQDkqqf8C6WgMi7hth+4A8aDxk2c+b1xsvcyPFePmHuEA==
X-Received: by 2002:a05:620a:2901:b0:7b7:106a:1991 with SMTP id af79cd13be357-7c039f9810fmr663007885a.16.1738812847841;
        Wed, 05 Feb 2025 19:34:07 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:627d:9ff:fe85:9ade? ([2601:188:c100:5710:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041dfb128sm20577385a.30.2025.02.05.19.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 19:34:07 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <be330e50-83c1-4128-8dae-b0caeea85453@redhat.com>
Date: Wed, 5 Feb 2025 22:34:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: A path forward to cleaning up dying cgroups?
To: Muchun Song <muchun.song@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, linux-mm@kvack.org,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Michal Hocko <mhocko@kernel.org>, Allen Pais <apais@linux.microsoft.com>,
 Yosry Ahmed <yosryahmed@google.com>
References: <Z6OkXXYDorPrBvEQ@hm-sls2>
 <ccd67fd2-268a-4e83-9491-e401fa57229c@linux.microsoft.com>
 <20250205180842.GC1183495@cmpxchg.org>
 <7nqk5crpp7wi65745uiqgpvlomy3cyg3oaimaoz4fg2h4mf7jp@zclymjsovknp>
 <91D2E468-B89A-4DD7-B1B0-B892FA4482E3@linux.dev>
Content-Language: en-US
In-Reply-To: <91D2E468-B89A-4DD7-B1B0-B892FA4482E3@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/25 10:30 PM, Muchun Song wrote:
>
>> On Feb 6, 2025, at 02:46, Shakeel Butt <shakeel.butt@linux.dev> wrote:
>>
>> On Wed, Feb 05, 2025 at 01:08:42PM -0500, Johannes Weiner wrote:
>>> On Wed, Feb 05, 2025 at 12:50:19PM -0500, Hamza Mahfooz wrote:
>>>> Cc: Shakeel Butt <shakeel.butt@linux.dev>
>>>>
>>>> On 2/5/25 12:48, Hamza Mahfooz wrote:
>>>>> I was just curious as to what the status of the issue described in [1]
>>>>> is. It appears that the last time someone took a stab at it was in [2].
>>> If memory serves, the sticking point was whether pages should indeed
>>> be reparented on cgroup death, or whether they could be moved
>>> arbitrarily to other cgroups that are still using them.
>>>
>>> It's a bit unfortunate, because the reparenting patches were tested
>>> and reviewed, and the arbitrary recharging was just an idea that
>>> ttbomk nobody seriously followed up on afterwards.
>>>
>>> We also recently removed the charge moving code from cgroup1, along
>>> with the subtle page access/locking/accounting rules it imposed on the
>>> rest of the MM. I'm doubtful there is much appetite in either camp for
>>> bringing this back.
>>>
>>> So I would still love to see Muchun's patches merged. They fix a
>>> seemingly universally experienced operational issue in memcg, and we
>>> shouldn't hold it up unless somebody actually posts alternative code.
>>>
>>> Thoughts?
>> I think the recharging (or whatever the alternative) can be a followup
>> to this. I agree this is a good change.
> I agree with you. We've been encountering dying memory issues for years
> on our servers. As Roman said, I need to refresh my patches. So I need
> some time for refreshing.

Glad to hear that. I have been waiting for a resolution of the dying 
memory cgroup problems for years :-)

Cheers,
Longman

