Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C9F199E89
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 20:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751660065; cv=none; b=Y62DHCj79ufnAVaThlVgj9J9W4MAHCGzuRaGnjN9egv2xEKz63Wt2afp9RD0PDbbVriptGw7pT33dJadGfc/4matHwPZfYxINGXJtzFPKN6HFsXmscBsQDR0AmP96GftntWPxq0w4bhtai4j5mylv8UZXUGPDX3bzdBNuhB1C+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751660065; c=relaxed/simple;
	bh=qF5cFRWUxC1JmJrxNp/jbfTReueRIFQZ8w1klIaj1n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppGDOfMAiBFm1iMwhs0N9folYGAvzWBjDhDqgxda278E/kfAWhOzc5eh79hl/jD/vW/HMtWPSDYfTTA37IJDqszhVsYrA92d3qLH8iD15jS1hAOAP504nK4Dn/5hIcgXwtJxFaJtqJ6ynspa5XaL5Fc6AfqjFCjPHkBnifcTXsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OAZiSFzN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OAZiSFzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751660062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8sro0Umn1NMzGu9F+6MRx/1okjlHv6ILx8WDuiJLxEA=;
	b=OAZiSFzNsXM89fb0nl9YxSXV/F9opk3b1QaBt8D4nuqM8gJXIU7+T9Xs64VStes4NjZ12u
	EaPa1DdvWHTFZfsqAgLtVJku2ogQeY5+5Xfl5Z2X09szZAQrmUG9/1x456x+5l1VRhfMrL
	y9NDYKFdBDJ9GfTWWhBDzTvLcfb+GHQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-ucisKttTO5Gn2AS72XFpHg-1; Fri, 04 Jul 2025 16:14:21 -0400
X-MC-Unique: ucisKttTO5Gn2AS72XFpHg-1
X-Mimecast-MFC-AGG-ID: ucisKttTO5Gn2AS72XFpHg_1751660061
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fac45de153so15755106d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 13:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751660061; x=1752264861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8sro0Umn1NMzGu9F+6MRx/1okjlHv6ILx8WDuiJLxEA=;
        b=OrgsYcPHsx6EE7Vd0JVoU5MP1FtRj+GXslq21jqPHFtdtiPNM+D8kvhrvjJHuWgIQS
         /4mXOuVl2MmMeb2zJ8X46shwYcOEujwNNP7bfHyv+u+cv7JQId4UbdyHnVPTXkqvA81u
         eypad5GqvRCZuaILquQHNh4+K0Ew18NdUK1SF45d3bub5B3jl1gFkHBhA6e2F2f8CEvQ
         GLx6NYWmFsr3zUWHJ65p0jSaaTRp/HCKhytom2bRqdPRZPZM0Axfmlek2xonPMFUobri
         y8eajfwS4gX5PlruA5QruYVsGa9QZ+ZUe3dMvcnv0FxczuZ/HTMQ90lQlnwBE7ToQPKN
         NsTw==
X-Forwarded-Encrypted: i=1; AJvYcCWF+Xez46b6EoeE61nEceGWLBj4stezFK2uXOayxWmXMpWOp2zSMV9ulc32XFyr7S4spFmY+aq056TbcYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs0FDzOHYsc8/4NYRQhPGWrGM2QO4QXVfqoj9+HAAaHGtKIYdj
	Rp7kmMq3ERwUwZLFsPSBaqMmqrUz2772z5W4M0wqSzKYCYg6wpBFhah06YHTdZ29oImKcJTHSRd
	c59bHmeKCUPmJmXEyGR2Qd91EA2qdFOe/89knxl7+ECgxq6V7JF/OIy5LCCtOkLCgjw==
X-Gm-Gg: ASbGncv4UAE/NS06vhSl58xBmvaQihMU5c3BdWbQXjrgZpfbI4BjTJ2bi0ZjjjMJGH9
	eh/gE0BqDvQyMGX320j1m++qr/dUvE3JdDkAPHu9Jqg1tuDSx4JMgNXg2Tr0r4l/9nOhZw1z9xU
	TuCEX2w2uxOdX1HpJKibW6du+zGq6wN4Y8a0W6ro2lRuWN9Evyeah/KzSW08+/e1JZXJtYVhkMM
	lhzJ1e3rfeKwzoVAM7hUeLSQSFhiN9TmCQxvxQVthOPI0JSFeAG2Fqd30Ve4WLqd41yZ9zr7RMe
	rvTPOFNGsNVgCUdQw+DdXvP8+PrH7mVBBTNjeHCYk7JvT+3yY/ewgmQa/dbkz3hvOy8YZenyT3f
	CCODYIkk8PBPY
X-Received: by 2002:a05:6214:d02:b0:6fa:c55e:869 with SMTP id 6a1803df08f44-702c6db7185mr53484606d6.23.1751660061111;
        Fri, 04 Jul 2025 13:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgHvmYQYDzxm6cMa7QAhCGrXjB8ke5qkyfGgtGmtXvg06qWtHT/72WennoBkgBv4qpKyT/nA==
X-Received: by 2002:a05:6214:d02:b0:6fa:c55e:869 with SMTP id 6a1803df08f44-702c6db7185mr53484196d6.23.1751660060710;
        Fri, 04 Jul 2025 13:14:20 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-65-69-156-206-24.dsl.bell.ca. [69.156.206.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc7593sm17760576d6.12.2025.07.04.13.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 13:14:20 -0700 (PDT)
Message-ID: <624c702b-d149-4025-9557-88736681246b@redhat.com>
Date: Fri, 4 Jul 2025 16:14:19 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: fix the inaccurate memory statistics issue for
 users
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
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
 <34be0c05-a805-4173-b8bd-8245b5eb0df8@redhat.com>
 <20250704131142.54d2bf06d554c9000e2d0c00@linux-foundation.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250704131142.54d2bf06d554c9000e2d0c00@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-04 16:11, Andrew Morton wrote:
> On Fri, 4 Jul 2025 14:22:11 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:
> 
>>> The patch is simple enough.  I'll add fixes:f1a7941243c1 and cc:stable
>>> and, as the problem has been there for years, I'll leave the patch in
>>> mm-unstable so it will eventually get into LTS, in a well tested state.
>>
>> Andrew, are you considering submitting this patch for 6.16? I think
>> we should, it does look like a regression for larger systems built
>> with 64k base page size.
> 
> I wasn't planning on 6.16-rcX because it's been there for years but
> sure, I moved it into the mm-hotfixes pile so it'll go Linuswards next
> week.

Wonderful, thank you!

> 
>> On comparing a very simple app which just allocates & touches some
>> memory against v6.1 (which doesn't have f1a7941243c1) and latest
>> Linus tree (4c06e63b9203) I can see that on latest Linus tree the
>> values for VmRSS, RssAnon and RssFile from /proc/self/status are
>> all zeroes while they do report values on v6.1 and a Linus tree
>> with this patch.
> 
> Cool, I'll paste this para into the changelog to help people link this
> patch with wrong behavior which they are observing.

OK.

