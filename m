Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8C91D7999
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747853852; cv=none; b=TXpczPEwlp46/ZmwHsq1Lz9+h2ieGUfObkNabFts4VOYCve4eUkTGMWsOVTatkREAoMU0yH2viq4urbbfcrxY1VlGkZDus4E4nMnMo7KM09vXD4yGoe+3IX1xwzEHAZ6IvdXswsZHB+hnzkbWODf21NkqJokgYwNn8T/+1cJq5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747853852; c=relaxed/simple;
	bh=k2elYg8hDgZT2hWIWlT2Vld7InAVkC2ziHcimQmJalY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rUlcGLTpBWuKFNaN32nEJ8cWOt8NaphV9ostIlyqTPCiy+i3yL5n5WwLL2kzx96MHQhLEO52ZQobm2bff6EtIGBl+qS+9aemfEklsejnSCQvEb/kL12PCzYlbFMhFr4tdiNKEKqNaYmqzaQX4AYCqjlmz7lvGwMbCFINFGlj8bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UzhHc2p3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UzhHc2p3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747853849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZX3oSNR/OiJ1Y9Pq6xf64GYTpDGG51TH1sjZ6Ombb8=;
	b=UzhHc2p36yEUuJKLjqo7CWPEM8fwLVGdbMZbwLc9ku9P31Fdf5chyoyAVCPFeD4TIVhfj6
	D7dggcwRd7ZXsDFaT0+f3lDdRna0qO6vmboaj+bBJLaprwEUCiDqWgEFcBwsNeuGMyhxDv
	EzJwJFR54i528Cvl0yQKO+GCwjMvgVk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-FSskb9s4MEGF1rAt0YXNDg-1; Wed, 21 May 2025 14:57:28 -0400
X-MC-Unique: FSskb9s4MEGF1rAt0YXNDg-1
X-Mimecast-MFC-AGG-ID: FSskb9s4MEGF1rAt0YXNDg_1747853848
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caef20a528so1836713685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747853848; x=1748458648;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZX3oSNR/OiJ1Y9Pq6xf64GYTpDGG51TH1sjZ6Ombb8=;
        b=oxXFU4uYorrUGc8gcWPIn8NhT8zTB5V7emJmS7gTP3K/YDbxyAWaMbr+zlEKmhFPkt
         RxSlyVSMxffCAV4SyGo8y7PHOnNEpxEnZqlDOhr6lmnYVQsgiz8wC20PLnpdS0j9WA+u
         vodybIyMcsLbGJNCZJp3Peb98wE/HwyM6/34/uXdesWphLZiBD1e3D/vGEOQkjFawvQj
         Pjs0GR/4ceITbRioEq0I/Dl1zheOH/Ev5vym92RJ9dD4OpnKhaq9zNbHZO1nc1bKazOY
         saM+66CK1lQVGpoR8h3ZfdV8rzuKpyYK8e8KGTspTfIrOHqxZ9BRAG3FzKmjR+wrZgzE
         8png==
X-Forwarded-Encrypted: i=1; AJvYcCVnoEihwfWIwRZSfbMlnA9FCrecGbKyMS7bqIlm2FR5S++xTJB4CARdw+QRpuqpjy42zLVosFwGh+v4buc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKjcG1n9XJeG2/BYK86S6YTLMDOuLtKDThYXVkNFSi4ja8zYyX
	r+q5+sumCKiSnjCztd0nQVQtB7WAuY5nW0DHF7+0FLkPyHEJYbrETXEHXH3UFP8NI1u8ERbhyLb
	2mvDKn0KJAidR7fWtzz8+y7zkfRGGD3hr9HoPGBCYiSEyhuva7ysdCI3i7UUQYS4mo8oP+I8kaZ
	6KX0w=
X-Gm-Gg: ASbGncvm8mok/xKPFd0srs4dtWRfPeODRQAZoX1WjBoUKgkmdPq4eVpxMgTPn76Y0c1
	u/gKdUsxc+mm997Oye+6cyG+YpDx2r2JpLqa/DQb/7Eznd0QwYMdOM1VFeuQyRB1K6LzsuZx2+7
	Xbsywob/WFs6/Uvfd+JfziQib4zlp+nOXlf1Ns48kugVW5piK8rOO6o7NgqT7abk59HtQRBHUJP
	oXUGy34mFMbJ4t7W4W210mRGG0GVTNkKPsKDjMsilLx+nr/IH6Ta67H4Y646YSHB/6e7uSWWAaE
	99UFb6t4sMfeWdBmWjGqT9PcYrzX+hhrl0KQrOO3LTcqu04lmfHdBr+pPrs=
X-Received: by 2002:a05:620a:3194:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7cd47efff63mr3121622085a.1.1747853848077;
        Wed, 21 May 2025 11:57:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnvoFRahZcZi6WjpnTrtmy9zuSJztpTCLgI9ec8JwApSBatPo0Ayv6017ChDQEfE2ZP9lO6g==
X-Received: by 2002:a05:620a:3194:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7cd47efff63mr3121619885a.1.1747853847768;
        Wed, 21 May 2025 11:57:27 -0700 (PDT)
Received: from ?IPV6:2600:4040:5308:eb00:a77e:fec5:d269:f23e? ([2600:4040:5308:eb00:a77e:fec5:d269:f23e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467dae90sm912153585a.46.2025.05.21.11.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 11:57:27 -0700 (PDT)
Message-ID: <9501613e-e8e5-4734-aa2f-ca3a3e4ca990@redhat.com>
Date: Wed, 21 May 2025 14:57:26 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Potential heapify performance issue in dm-vdo
Content-Language: en-US
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 jserv@ccns.ncku.edu.tw
References: <aC3riPZ6GV/dlr7Y@visitorckw-System-Product-Name>
From: Matthew Sakai <msakai@redhat.com>
In-Reply-To: <aC3riPZ6GV/dlr7Y@visitorckw-System-Product-Name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/21/25 11:04 AM, Kuan-Wei Chiu wrote:
> Hi Matthew,
> 
> Recently noticed that the current heapify method in min_heap.h may
> degrade performance when the heap contains many compare-equal elements,
> compared to the previous version.
> 
> In detail, the new heapify reduces the number of comparisons by about
> 50% when all elements are distinct. However, when all elements are
> equal, the comparison count can degrade from O(1) to O(log n).
> 
> I don't have enough domain knowledge of dm-vdo, so I'd like to ask
> whether it uses heaps with many compare-equal elements. If so, I'll
> work on fixing the issue.
> 
> Regards,
> Kuan-Wei

Hi Kuan-Wei,

dm-vdo uses heapify for two different operations, but in both cases we 
define heap elements that can never be equal to each other. So I think 
this is not an issue for dm-vdo. (We have not noticed any issues with 
this in our regular testing, either.)

Matt

