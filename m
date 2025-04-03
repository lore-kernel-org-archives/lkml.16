Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3F33F7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688132; cv=none; b=RD//ivbZ2zQmFmfEE+nUY33TMygMAJzFy//p7lErjFOdIt8q58e8FSf1KXwVt3srAWQBxzC7e2tVTgcyBY9KuZ1nQJ89qZq0Vrn56Y83uaZ7lEP1ONm4REVzcfwL9ybiBcLQK2i3ae/O9KoOTIrxbwloaOMQ6rHPP2XdtZKBrpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688132; c=relaxed/simple;
	bh=X8K2hZQqJMCGMpB1ml3pgOIG+WSAB71YixBcihVOC/4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kBaFbXkYZpiDOkMvGrxXsYHEYGfDUh3oJMuGEbiegpGZHhX3F4EHrSaLjGTKi3isBiY1qBNWoRthy6dkdjwp4Tg7u4D3uo67iNrEBgjJyAIm0MObGwxCCBiyCq1ZJucYIdlYQexPE+Yk8Fd66mWY+Y8vv8npNhFL+tzPuumWUPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RxuFddhc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RxuFddhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743688129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9lyWZ8gblDVHe120rUXUjARVSAokRrQ5lvfAATMT9n4=;
	b=RxuFddhcpcQW+aUzlq8UzlU5/I1i6g2uZGG8bu5ObxfSb7y79VZdDGskT51z8woEr70nPA
	3yhmXKtkCdKopuDYsJEZN4rV9ibwE2bJpQmBT5Gx08cdAZaAcqDrsbySqBMPNRmZ8KwNs5
	0mYg3U6bZlcMnYdZdeb3uwBEA36agX4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-gy4bIXoCO6ecsTanYcVMtw-1; Thu, 03 Apr 2025 09:48:48 -0400
X-MC-Unique: gy4bIXoCO6ecsTanYcVMtw-1
X-Mimecast-MFC-AGG-ID: gy4bIXoCO6ecsTanYcVMtw_1743688127
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4769273691dso15355531cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743688126; x=1744292926;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9lyWZ8gblDVHe120rUXUjARVSAokRrQ5lvfAATMT9n4=;
        b=j1HvILJ+RZDHHSs6Icls4MSPCj0U04xVfzgsrkQeYRkrIZWh0G8OL5svirpyVHGPwI
         1gJ6mfPF1GcoHt1HZGNoAbhQ95gnsfoD9UN3IKRBq8sPxBRu3lKj78YgmHZtmT5WxZAn
         gu1qyS3FwQz6OOIOmIFYmc9G+WsERYLPLsZhIL0CDZ0u0WBlQPf/r5OhUxL3q8VYHKI1
         qwfKuUKnDUbjnUYH7YlFKrVipLWEGmrt/aX7lYKEkW9bx1Lqrfkh7zVWcKtaTCAwuBcH
         IcLi3YjyB11ZwG4Rz5POnd+Jn4f9+5JZcXscjPlMnhlCdNDo6Lk5nc6vzw9qjcQamjRB
         R3fg==
X-Forwarded-Encrypted: i=1; AJvYcCXCZ+WjvELy7x/AkYjXr3UERUXn0sevECXKmxYRfwqTdzn8oiW86MWGenL6aHK9FxcdFUT+rNKy4Ka86c4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx63k5l6tuB570jIyRGi3UGfN2z4x0xJVJADoXkNDV73OOVNOL
	ZoNcJnr2lMwsiduBGfslgknP3PqusCjg79FuvbJ3ZG+xwB88sLNA7BzWi4agRjrYPMacYt8SVvv
	CJAIQ7OD5Xg1qdIo4gxzBtPzNUiDBl7hQR6JerOxD3/CjjHn3FzFUqhYH8epXXOphyXVVpw==
X-Gm-Gg: ASbGncuWCNPTvDcByhk3PZdUA52N+n8vQAgHKkXjD3v1Z3d7fCH2Xy0RSJld673lA3f
	P+AyCiTjO2OF1xpKz7SAvqDZ+qZevcU1+rp52GbYCZ0YMWSuCisHERiNVAcGnI0QrTHIwwrbgHU
	N7PwXoGFpAoTHc0/zXWgs1QgPsDgQox8EHUbSoEkpKWzQTbYdp4jd+j5d6SJEvxZNRhvtrcFaP3
	0/Tt5VF+n+0XPuGyTPIT0gjwEJdk2RWxPFwP92LrzxKa6TiBUhmU9X9nnaJl+Nz76tRwiJt5+4N
	SAmr6nPb7z3aC4yC6iulpit/FvDXczxLZ3OROlpN/8oe8W56eXAr+HCUyatYLA==
X-Received: by 2002:ac8:7d84:0:b0:476:98d6:141c with SMTP id d75a77b69052e-477e4b66bedmr383982071cf.18.1743688126648;
        Thu, 03 Apr 2025 06:48:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo7x51vzTVDAQ2P95L9od9uzm0Cwj9FDry+VsenXXfp21aleo/hYZIXBJiuOhWfUblZcxwtQ==
X-Received: by 2002:ac8:7d84:0:b0:476:98d6:141c with SMTP id d75a77b69052e-477e4b66bedmr383981751cf.18.1743688126419;
        Thu, 03 Apr 2025 06:48:46 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b088346sm7967391cf.41.2025.04.03.06.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 06:48:45 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <2d1b9c9e-a63b-4385-b706-0eee73688343@redhat.com>
Date: Thu, 3 Apr 2025 09:48:44 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] cgroup/cpuset: Don't allow creation of local
 partition over a remote one
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250330215248.3620801-1-longman@redhat.com>
 <20250330215248.3620801-6-longman@redhat.com>
 <c5akoqcuatispflklzykfwjn65zk7y22pq6q6ejseo35dw5nh2@yvm7pbhh5bi4>
Content-Language: en-US
In-Reply-To: <c5akoqcuatispflklzykfwjn65zk7y22pq6q6ejseo35dw5nh2@yvm7pbhh5bi4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/3/25 9:33 AM, Michal Koutný wrote:
> On Sun, Mar 30, 2025 at 05:52:43PM -0400, Waiman Long <longman@redhat.com> wrote:
>> Currently, we don't allow the creation of a remote partition underneath
>> another local or remote partition. However, it is currently possible to
>> create a new local partition with an existing remote partition underneath
>> it if top_cpuset is the parent. However, the current cpuset code does
>> not set the effective exclusive CPUs correctly to account for those
>> that are taken by the remote partition.
> That sounds like
> Fixes: 181c8e091aae1 ("cgroup/cpuset: Introduce remote partition")
>
> (but it's merge, so next time :-)

Commit ee8dde0cd2ce ("cpuset: Add new v2 cpuset.sched.partition flag") 
is actually the first commit that introduces the concept of cpuset 
partition which is basically the local partition that I am referring to 
now. It is that commit that did the  partition cleanup in 
cpuset_css_offline() which is now being moved to the new 
cpuset_css_killed() callback function.

Thanks,
Longman


