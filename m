Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A504721D3F1
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739376; cv=none; b=c2hY4lSmC+3f/eBtd8iyoCb17P7QUrz7YUoilBKY3bq6E33nFjSd0y84RvqK5pqOGcxxrfbFng8dCN/4LwJV3GHKSGdBSOp7Og8OFzZZxoeGVcIJWnQryM0lhCqrXrBUHrLQEPe3UMQN4uOGAf3xw8//+SXI4zI4JUGPmmY12Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739376; c=relaxed/simple;
	bh=DyjGjmIKPnH7C36i8ffActQ/GQ9mwbRyIId9YRlceUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ne1r3Zvmvy1JeEmrPrYbURjyOiXgCFcJcASPoZmCVRSwJrJ6/JPMCP5FM5O6mmyu8Ub+8xz47HUOIIoQOsDatuUvm1u8EHAiSJJ6+RUlkWJiX15yIAImtCMh5huOY2T/lhNvfO1EvxkMU3MB7xAyd6kcl45t2FKar5hbereOOf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ly0Gi48E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ly0Gi48E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747739373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DARJsHp4jsWx/AeNTG3Ix546yRHwSXlPjjzPU2VmlJs=;
	b=Ly0Gi48EC6Ro1oYwtH1YQy21QYrxKNSW7z8VC3gtjyFYN/72+rWOsg673CXNmmZ1lZna+S
	vipqRQSkWN/Rmfuy5nszAsN/lHMdiS+oBJq5LxADRBbrwwFsHCCjoQE9qHt/LhvqKrpmu/
	PUYpANs2HwQ5C5rjUQ0C1MhUbUpHJMI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-iDBVVQlLP5mrNNDk2AhWWg-1; Tue, 20 May 2025 07:09:32 -0400
X-MC-Unique: iDBVVQlLP5mrNNDk2AhWWg-1
X-Mimecast-MFC-AGG-ID: iDBVVQlLP5mrNNDk2AhWWg_1747739371
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad53f8a49fdso293851366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747739371; x=1748344171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DARJsHp4jsWx/AeNTG3Ix546yRHwSXlPjjzPU2VmlJs=;
        b=BbIgYtY9JhcSlbsQNt8+IcqDAsFZpqWuVMo4HMkNEeVD2eChX6JFvTSDOpH9GFg15t
         FliicVHcfoaYgwQWocj3FzLmtHT2BVFRxO/RjZX3nFBhuiqZxTiz4IOZqrHboGxUcKa7
         KNAiqDx63NSIMi94S+BN75II23/ukm/DaZkZCIvwVVm5SQtwp8ao3KMk8AookxAWLqXN
         0E1pYnESLJbfL1U0vyrcuw91T4jc2U9Gjq0sTas8BxLO4D+3CTnyIRLs0+y8WeI1kyKB
         1rRM0Q6Naj0rJie3FCGEgzT2B1iOW8uyBIVd/nOfOKaM0qdUMN5u72wKbkpz178Z3/nw
         M8Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWxTKX7jD5VcJax51c07d4qoBp7E8BaheySMYI400AC/+TKcwalzXsADi14ptYpE+1Ked7JDqVBIkZfsqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73gkV+Gs/4yG0D1NgRv7nqXl1Paoytg64N5iTZTHe6rI3ft0z
	DJ+Gr3zxex7jwP/7gL/TRdFeHoyHdWpGeeB3ooVPupy0eP9zVWu+wUd4/dr/9lWSzZJfwYn45Dv
	XQVRHYudLlcac5onARnyiriheP+YQTBg13FHKXSF1B23Vq0aeLxqhYnUCNU1aH4mVGw==
X-Gm-Gg: ASbGncs7HNSA3hDptzroznV4LPk4/uGhNQfZGWFCkI6dBFmSK/ouF0LpZj3+uxjkV4K
	JbYjnYSMv9UetT+66eaFuUdGjEXm6CD3QEOkJRPonDbiJYrMlf0bfDdH/RwMUxGZQtjEWKFGvUm
	RfgHNSXx50OiXfDesPZGQlIodIkNWsZq3+BJCyhll09cgClSf3FJyMEKPw3ZWtUXikbssEonrDd
	8CGxzIJ6Sr+3sM1gmnzzfgaG5fKx6BoR959/WeebWEsGApUlE8hp/qyANNQIbjS0UzxRhXknx1V
	e6EPEjOPtL5phduUtuxVab3JmuhoTa/1I29d7dHuO8fJsvrL6hzZ7azcZeJn
X-Received: by 2002:a17:907:d26:b0:ad5:715b:d1d4 with SMTP id a640c23a62f3a-ad5715bd3b3mr675886166b.32.1747739371296;
        Tue, 20 May 2025 04:09:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVmZPA0gP+lVwuu4tl/IU00u142/ZIBl7HKt5LlJNVBoXEwIpfvNF2MTZxVOWT8Ao84FYsRQ==
X-Received: by 2002:a17:907:d26:b0:ad5:715b:d1d4 with SMTP id a640c23a62f3a-ad5715bd3b3mr675881166b.32.1747739370698;
        Tue, 20 May 2025 04:09:30 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm722395766b.69.2025.05.20.04.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 04:09:30 -0700 (PDT)
Date: Tue, 20 May 2025 13:09:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v7] selftests/vsock: add initial vmtest.sh for
 vsock
Message-ID: <w6aizeb2i5m52e2ifqcikgwdbrkkbc46sf4hx5b6jsm7o4drio@n3dzlatb426s>
References: <20250515-vsock-vmtest-v7-1-ba6fa86d6c2c@gmail.com>
 <f7dpfvsdupcf4iucmmit2xzgwk53ial6mcl445uxocizw6iow5@rhmh6m2qd3zu>
 <73a4740e-755e-4ba8-8130-df09bd25197a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <73a4740e-755e-4ba8-8130-df09bd25197a@redhat.com>

On Tue, May 20, 2025 at 12:58:18PM +0200, Paolo Abeni wrote:
>On 5/20/25 10:24 AM, Stefano Garzarella wrote:
>> On Thu, May 15, 2025 at 03:00:48PM -0700, Bobby Eshleman wrote:
>>> This commit introduces a new vmtest.sh runner for vsock.
>>>
>>> It uses virtme-ng/qemu to run tests in a VM. The tests validate G2H,
>>> H2G, and loopback. The testing tools from tools/testing/vsock/ are
>>> reused. Currently, only vsock_test is used.
>>>
>>> VMCI and hyperv support is automatically built, though not used.
>>>
>>> Only tested on x86.
>>>
>>> To run:
>>>
>>>  $ make -C tools/testing/selftests TARGETS=vsock
>>>  $ tools/testing/selftests/vsock/vmtest.sh
>>
>> I am a little confused, now we have removed the kernel build step, so
>> how should I test this? (It's running my fedora kernel, but then ssh
>> fails to connect)
>>
>> Would it be better to re-introduce the build phase at least in the
>> script as optional (not used by selftest, but usable if you want to use
>> the script directly)?
>>
>> Or at least I think we should explain that the script launches the
>> running kernel, because the config file introduced by this patch
>> confused me. How it's supposed to be used?
>
>This is the usual selftests schema. The user has to build and install
>the kernel including the specified config before running the tests, see
>
>make help |grep kselftest
>
>Also this is what we do for our CI:
>
>https://github.com/linux-netdev/nipa/wiki/How-to-run-netdev-selftests-CI-style

Thanks for the link!

>
>@Bobby: AFAICS this now has all the ingredients to fit NIPA integration
>am I correct? the last commit message sentence could possibly be dropped.
>
>Still it could be worthy to re-introduce (behind a command line option)
>the ability to build the kernel as per Stefano request, to fit his
>existing workflow (sorry for the partial back and forth).

If that's possible, I'd appreciate it (not a strong opinion). Otherwise 
if we don't, I'd say take the use of the direct script out of the commit 
messaging, because to me it's confusing if we don't plan to use it 
without the selftest infrastructure.

Thanks,
Stefano

