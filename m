Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F09A28C5DE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292141; cv=none; b=cooyin07r8IsKWhnW57huKivXql3EYtdiXsI9x23yVPIQ4HIdX77JnfDHmUdmfLJz7JyZ61nttNyI1h8CriWPtIq91mt+XbYqj1MENfQADfQqaburFd0RBuk2z8pxUtUkxjK5RLW3YqbREt1a7U0VXkG4ROWwseggs5hUOrlAns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292141; c=relaxed/simple;
	bh=+ZmXrSd/aQm2GxE0r/NBTgyZY1o97TCcPHZTmxk28X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lgxer1/2PZfp00AB9YtQPOkUanuKjvseXh6fMQy2WHOybpSEWkRAXdoXuo+mjOGHcli3xgo5Fjo2DLEkLz/sRdgUzHUdU5PWjuAxurFkAqt8TXjgcErTczg0X/WAg3skND0GtKNdkvLc76Q+EtRVVLzm1Q2wwhoHfOr8mGLAM5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O1Da9mM2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O1Da9mM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751292139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QE4qcuwReJRjoAWSX+l6qHylMOR9opoZLSNy6uw6e/0=;
	b=O1Da9mM2C4S392mxidYTzR3wL2eM8TXS8oBS3Kzw2OLccJwH797Za8g5AtU8GNhvxJ0wHG
	s0AFS43Tfk8qgoic/wOxg43GFxuq/LhEI6D/HjKu90qUiU2uhYIZ7p1YeRVpnAnzh2DOHt
	av7aTTzM9xXpedVx33+8XNgyAbKOIOk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-CbMj-xn9OzWHBl8gavr2LQ-1; Mon, 30 Jun 2025 10:02:17 -0400
X-MC-Unique: CbMj-xn9OzWHBl8gavr2LQ-1
X-Mimecast-MFC-AGG-ID: CbMj-xn9OzWHBl8gavr2LQ_1751292136
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a58939191eso710830f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292136; x=1751896936;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QE4qcuwReJRjoAWSX+l6qHylMOR9opoZLSNy6uw6e/0=;
        b=gbmdK9h/tqCDp+ntlxw+lH2gUlUW6hGu3XcM3e3aRPyzhSuSIRYR+1mFUQTfW49UXq
         z3slRgXfFUDZPKwYDOR4u6fyDZc4i2vNqH1aqTthaL0BI6APpQMjNoDn6vYetAzicW7O
         xuwY05XS9CBsU/lO6O+MZqcG2sE4x48A0GC41Pwj1eJhauAEFigSB5lpja1Ou+qziJMs
         fHh/RNuNCiKHovAsUdeTWAwIzLoFXzid//R5i9HwpsntLCYmgedNRPCmazg0eyFcyyyS
         yByYYEA07m4BIRfIiKlC94kn9C6EgBC9syJtNhNnosoE3qTCgLh9kkIEjZWm4bJlfMXT
         xYgg==
X-Forwarded-Encrypted: i=1; AJvYcCVzpabhxoTrXaCoOy85/crtEDeRHn1HjmE2b19Gq+++9+FpeERDK4bO1qikeBJ2d04/7mXtv128rYGHbOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1pl2ujY1wMj73+CKjSQe1Z0k6faV42GoIW1O7nm4//nQPxpIG
	3MmKIU+MB3MR9jldGdZv3LfEewLLeBQL2InhBHZLcH53SDtzKNeyaki6ytXdU8DSGZAIq0VAHct
	tejl1mLVo9DTjWL+cs0pTEFuf6z0eLK8cx8QJddyU6FV5zvHqDPyQu4I4r+G2k/mZ0g==
X-Gm-Gg: ASbGnct0SnLH5hoPOhHyDXQ1x+xxwrrk/n3ItIEG25VOVjneh4bbVAmbvhNl5xLgrXx
	bpUdZASh3eC987D0vC/9RR04/ZExpGBaf2D0dhauCv4nlzrYzouV8S+CNkebNVErQM6NySQTlAD
	RoRcgXS33Wz1hasxJTrYAVAPSycV1d8Vx9OCQct2nsWW/05kPt/PiG3xfpeBAJ49XQlgsd/3obk
	mePbt+qA10lHikNaVPPVz5fe4pD8ZQIeKqX534AJ4nsDSSY5twWj0mYGeoIMr3dt0HrNbtmYdjH
	CuQ+MOlQwHKYlLUPTk5MISVPRtplQIUB0shZVwGCBW5cw1D0Ab8ggsdK/whXebHuZsP1Al2oGmP
	Mn7bGlPQlpVukKcHau6Qw8oUSbXTIgRyFLh6MMqzbNlGPbr1bOA==
X-Received: by 2002:a05:6000:4109:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3a8f4ee1d85mr10717593f8f.20.1751292135811;
        Mon, 30 Jun 2025 07:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6XOPH/wu4Z+k6Mr76lh2132mbBYyiffEPrBCJbJqN3wuNSo+L6mIDiB+liNXL/ferZmn88w==
X-Received: by 2002:a05:6000:4109:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3a8f4ee1d85mr10717525f8f.20.1751292135037;
        Mon, 30 Jun 2025 07:02:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52b9esm10617734f8f.61.2025.06.30.07.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 07:02:14 -0700 (PDT)
Message-ID: <30f2e2ed-00b9-4473-a0b7-29fb734fb3c4@redhat.com>
Date: Mon, 30 Jun 2025 16:02:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Add process_madvise() tests
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 wang lian <lianux.mm@gmail.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 brauner@kernel.org, gkwang@linx-info.com, jannh@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 p1ucky0923@gmail.com, ryncsn@gmail.com, shuah@kernel.org, sj@kernel.org,
 vbabka@suse.cz, zijing.zhang@proton.me
References: <20250624104654.4418-1-lianux.mm@gmail.com>
 <20250628113945.145588-1-lianux.mm@gmail.com>
 <694fca1d-1584-45d9-9e50-5c219b9c7c94@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <694fca1d-1584-45d9-9e50-5c219b9c7c94@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 15:51, Lorenzo Stoakes wrote:
> On Sat, Jun 28, 2025 at 07:39:45PM +0800, wang lian wrote:
>> This patch adds tests for the process_madvise(), focusing on
>> verifying behavior under various conditions including valid
>> usage and error cases.
> 
> Hi sorry to be a pain, but I'm not sure this will get picked up properly like this.
> 
> Please resend this _not in reply to anything_ and with the subject:
> 
> [PATCH v2] selftests/mm: add process_madvise() tests
> 


Hehe, there is a

	[PATCH v2] selftests/vm: Add process_madvise() tests

in my inbox, but looks like only you and me were on CC.

-- 
Cheers,

David / dhildenb

