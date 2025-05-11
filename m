Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D5D846F
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 02:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746930069; cv=none; b=Ub8HLsaUse6fJKQG/nuzGjF1h7ZuFkjbxhimACXRouj54FJ/Bn4h0h8ZOl6iTzaLJH5gFd7wE+NWYaSmoZmUYA688uC2Inwqu3jgEiWs8Pp1CODMij9KSAk4DpDPVgFgqR6GWxULDjw/mcGPoWckV5Rj/6xEHpG0833Dh+cC3HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746930069; c=relaxed/simple;
	bh=zzNc2KGKrEWUyoBiTt/hRy6pNPb9bd3WnZMjXBLO+jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2QdPq5mTlUEvLz3OZdbRgMKYPhIxEKfaxb7rtWtAu86dweit6I5mkQSUeGEUa73oAChU1tIstjfiY5CMMUhCakKXkMSD3Rht2laGulmhqNnqeRPqMKakvzebhWMH+idvUIoUW3SMox6gej4smYeQEw0YcYGjfOIUW86SRpvQ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g3u8B0Ji; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g3u8B0Ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746930065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aWCzDenG4YMv82lLqXoIzRJttzc7mSVDjw13b5sAeGU=;
	b=g3u8B0JijwHUdQlYs5kkMBkYgCGTL9C6CIM0zkL5Qg8BCTraExQqhybLHCx2th6cZzqLJH
	AYKJZRWpyi5inB44OA5iFuw5SrUKVBrtVcY9fmWFkHlB7pldhcoPUT3znv7d9KfKH0GjC2
	VGjX+5O7DWyRR1tAR8+nWfO+8csACXo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-FBgwp7CzMg28klSqQi_D8A-1; Sat, 10 May 2025 22:21:04 -0400
X-MC-Unique: FBgwp7CzMg28klSqQi_D8A-1
X-Mimecast-MFC-AGG-ID: FBgwp7CzMg28klSqQi_D8A_1746930063
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e815dd332so58525885ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 19:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746930063; x=1747534863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWCzDenG4YMv82lLqXoIzRJttzc7mSVDjw13b5sAeGU=;
        b=Pysbv6ha6DzTiUCqm1IYIAt+iJtZwX+mMn5ELpTQSyvS0N1NBgKer5udJLQ29BVmHa
         kVr0rDE+Lk04iuEIuwwSwgsnMI0c58DgALaIqAdrF8O00Fr+Ofoa9/mtMonJR1GCRvqk
         qqvITXo51LCpIMmJED8rNLuUhAeIsMUJcIZZmKf9isw0PMLUh0ApLcxXrROS74FMuBQg
         cKunwh7BvaRd2fWL5x0Alo4cFOBxB02N4Qyp/96cD8l5CdRox+vBAoB3ti/4CRGr8luD
         0u09SRSfGkY8ixDPdDsZVoyRfuxbn2Pvm6N1vRWzkd1Ssr8WDDghG7D/WDVjT9x8Lpul
         ANEw==
X-Forwarded-Encrypted: i=1; AJvYcCUGRkXAwXadgwBSaBNRpZ4bUTOD+JMExY/aO6Lk9/N+gKyYeMuks4AIeL6BDzUREnLtkDMzt7FeqtkxG1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxovrRD8ZOpfV4KWGDwfQ5af2xSVgrD+XCtX+k4ke4K5tUIcYn5
	dCRTAACYWRrjevF9bMyjbonnapC/fpkq8eTBTqDiaG9w9GfZrx8WJcI7vMUwKd/2bDSREWyl63c
	6o27Wirw0+akxotbDORFEf7qd3s2y8f71k/Da7b3UZClLdxOof1oicc1wyqvJtA==
X-Gm-Gg: ASbGnctpZ956ws675fc03j7Jz5RKpovpYOlkSi6f+SOukDTEM2bV22nDkj2SYyxgbl5
	5JEEC5LBDv2FJwWKsnDPRsFi5oN7bz7h5maYBOS22EHo4dAr8hzV6pk2YqsZeF7sqDUKRFF81MG
	pymjIX0B4lqrpBoBizNH/O8z4+RBeHLzvWejNpZl/e4Re69lBQqR3IGGpmXQnRVvX75Jrxl0yDG
	9jby37AW5V774+nSvCzkaq6uxoRj8WDQV/PihJwhSVwMmMPSU6i7BzvCQ2bmN9Z+pcCZu24QeVd
	5eM=
X-Received: by 2002:a17:902:f606:b0:21f:f3d:d533 with SMTP id d9443c01a7336-22fc8b0fb59mr110678465ad.2.1746930063450;
        Sat, 10 May 2025 19:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHopMLru+6d0HG82g8HqTfh28pTOXbR5UK+YON5WLsX22f9UgYDAWtg0wHNgVG28emunjMy5g==
X-Received: by 2002:a17:902:f606:b0:21f:f3d:d533 with SMTP id d9443c01a7336-22fc8b0fb59mr110678325ad.2.1746930063076;
        Sat, 10 May 2025 19:21:03 -0700 (PDT)
Received: from localhost ([114.222.253.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm39552485ad.20.2025.05.10.19.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 19:21:02 -0700 (PDT)
Date: Sun, 11 May 2025 10:19:13 +0800
From: Coiby Xu <coxu@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <bhe@redhat.com>, fuqiang wang <fuqiang.wang@easystack.cn>, 
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <sn775iwfnogyvgxetbcfneuuzsnr5wva6kc4vachyzc7r6uhfi@ozhimoihtk4b>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
 <ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>
 <4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
 <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
 <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
 <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
 <20250509183518.bf7cd732ac667a9c20f1fee1@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250509183518.bf7cd732ac667a9c20f1fee1@linux-foundation.org>

On Fri, May 09, 2025 at 06:35:18PM -0700, Andrew Morton wrote:
>On Fri, 9 May 2025 17:58:01 +0800 Baoquan He <bhe@redhat.com> wrote:
>
>> > The bad commit was introduced in 2021 but only recent gcc-15 supports
>> > __counted_by. That's why we don't see this UBSAN warning until this
>> > year. And although this UBSAN warning is scary enough, fortunately it
>> > doesn't cause a real problem.
>> >
>> > >
>> > > Baoquan, please re-review this?
>> > >
>> > > A -stable backport is clearly required.  A Fixes: would be nice, but I
>> > > assume this goes back a long time so it isn't worth spending a lot of
>> > > time working out when this was introduced.
>> >
>> > So I believe the correct fix should be as follows,
>>
>> Thanks for testing and investigation into these. Could you arrange this
>> into formal patches based on your testing and analysis?
>>
>> It would be great if you can include Fuqiang's patch since it has
>> conflict with your LUKS patch. This can facilitate patch merging for
>> Andrew. Thanks in advance.
>
>Yes please, I'm a bit lost here.
>x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch is not
>presently in mm.git and I'd appreciate clarity on how to resolve the
>conflicts which a new version of
>x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch will produce.

I'll resolve any conflict between these patches. Before that, I'm not 
sure if a separate patch to fix the UBSAN warnings alone is needed to Cc
stable@vger.kernel.org because 
1) the UBSAN warnings don't mean there is a real problem;
2) both Fuqiang's patch and my kdump LUKS support patches fix the UBSAN
warnings as a by-product.

It seems the answer largely depends on if the stable tree or longterm
trees need it. Currently, only longterm tree 6.12.28 and the stable tree
6.14.6 have the UBSAN warnings if they are compiled with gcc-15 or
clang-18. Any advice will be appreciated! Thanks!


-- 
Best regards,
Coiby

