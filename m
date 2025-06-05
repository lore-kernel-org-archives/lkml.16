Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75A25FEE6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749142569; cv=none; b=cFEuWX4PrQwoaWD7swTGZCt2uEWhBJw3CSl2/rqEtiTgt69ex++3euBroQ6MsXZ41kfIqi0TenwdM7tQapoJuDzBT79LpO1Z28o1m+gW7kKX9Q8JKv/nVxdif79svd02zLqJ/3nJ+REwWp6oKjr1WFGupr+WOEyZKbcxK93WmVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749142569; c=relaxed/simple;
	bh=zfq5wGQEYYPXKJy1KBLzl6se/AvSmjCRFz1/iOsgqGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmtnImctVWU/MIrQmXdnt5Psz1iUnd5imNyjuUob15N4LoqziWidorj0bb/97KQVAHuud7J1TE4MoXThNwIixKKZOm5pG/tIKJ3B+FPmxxsqGD5B2JtY5DjuHOneUUCzSD3hbCySlsREAryynPXPy5SLh1IFcDQb/RSqCev+uHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EsaF69Wc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EsaF69Wc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749142557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XUzjtpH2AknbI6MKSLc/twrL54mOcBPBM8fuNqf7SIo=;
	b=EsaF69Wc6h4HvH7lardPbF5HXZTj12SKt9Gq/JMWnr/A7AXesHtV/Rokz6cbcj6qU7yOD8
	7KVjUQepdxBO25cumJFiNwEDErxojPwjhC0RuiObcgbAlYh8OnQWANqFrb6lpIX4M4u4pK
	H9UO6DJ6tQv4MGu7qLZg8wz0Z+/neUY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-xrRIXVXYMCO380-u6ifJNw-1; Thu, 05 Jun 2025 12:55:56 -0400
X-MC-Unique: xrRIXVXYMCO380-u6ifJNw-1
X-Mimecast-MFC-AGG-ID: xrRIXVXYMCO380-u6ifJNw_1749142555
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so737764f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749142555; x=1749747355;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XUzjtpH2AknbI6MKSLc/twrL54mOcBPBM8fuNqf7SIo=;
        b=QSHDVZvFL4X136djuaAmSPRQt4Ug9YRp7OqZO09Q18JiFRh266pP+MoERIkHSJNHr1
         xuc3sEB/LY5cChVbDPWMWOWQaf/dJU4E7h7I2hBWqXwMPMTBx2J8GTxOpxWrWkrpo9zR
         qROOiCQbEmY17I77+JFNSuVGwJuIUuTN5PCstxV5Gs013dI8/C5RtLceCSr0kEoXQ0Ne
         Nwr5t4++I3UZ+XwdX8t5t8EexL5KeCicLyAxp8Iirqzh98z+r3bWHA2W6mJo9M1VHAhZ
         vru2RULC+JI7lTcluFj0+1ihXQRldqob3f/DmnAyWjzp7V9UbbHhvdhT1WYuKuUn8Lod
         7xvA==
X-Forwarded-Encrypted: i=1; AJvYcCWVB92ZkE/GFc9X9+fDeFmUer3bO48DQ5F/A8F5erzRVn+lD5qtaM6yveBe0EfS1baFPl53BPiTKCJXkns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8z9L/tcsiQACUrS6T0cshzyixmweyxTYWGtcrN5G/6GdKv4z2
	DwT986qLtO2EGg3ctLqy12wl6nTih6LNu0u+/iwGMLVCEuhZWC8yUXM01fQErNnN6tHb2aOCPjY
	04o+3ne5vBdMA1tmRrol1mHutDy3gNXLBKfx4vQFSWQTalatrYc+dDwwDfGtjAy6hcg==
X-Gm-Gg: ASbGncu6kC6OqV8aHwXDWXVX3Hg2173UCvS+1Ndm59KbBByleWCmkr9PgwM6GWSplqX
	+4mk6JZSisseimMieZaB6a0of1VY04ITQimNNTGH5tAgk0WPwN6IAZrtjDB760V3+jwgD6dfK8Y
	h9snBCHAAfCYUi3GS7IQlvmfZIiKWLe00g8SA3ELpn2oIiF1c4YUxhzPUMCln9Drz40vRR5g2/V
	wkYtQhYmfh12YkP0glgskPNSVXrJvbF8Jq08a1DpuLKHGv57zd2FK33dKwv+NgR90M6eLxTB+XW
	Pnx7OkXsRYzE/OIZUeoiL5xk+g4yDTxdukocaE7TlMpIY5pjGlt+pQZKQEV4VzVbeo5vPjkzgH6
	uLkc8jiXmLgNlKi2BM6ciyWTFhWlB7F89R7Ek
X-Received: by 2002:a05:6000:4202:b0:3a5:1241:ce99 with SMTP id ffacd0b85a97d-3a51d92f980mr7261595f8f.24.1749142555457;
        Thu, 05 Jun 2025 09:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl45OMSH2oGOxGFF8fYhZtb/OW/fhLtvp347132i+bd+16jviN+pwNHRIDPdq8viBiRE8Mww==
X-Received: by 2002:a05:6000:4202:b0:3a5:1241:ce99 with SMTP id ffacd0b85a97d-3a51d92f980mr7261568f8f.24.1749142555048;
        Thu, 05 Jun 2025 09:55:55 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b7b0sm25194671f8f.10.2025.06.05.09.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:55:54 -0700 (PDT)
Message-ID: <077b6af0-bef3-4f1f-b785-9e351d01a89f@redhat.com>
Date: Thu, 5 Jun 2025 18:55:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] selftests/mm: Fix test result reporting in
 gup_longterm
To: Mark Brown <broonie@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250527-selftests-mm-cow-dedupe-v2-0-ff198df8e38e@kernel.org>
 <20250527-selftests-mm-cow-dedupe-v2-4-ff198df8e38e@kernel.org>
 <a76fc252-0fe3-4d4b-a9a1-4a2895c2680d@lucifer.local>
 <722628a8-f3fd-4fb9-ae04-2313a52ffb36@sirena.org.uk>
 <66db3d9e-73a6-4fcd-8abd-db65cfff49ab@lucifer.local>
 <661fc4ce-839f-4c47-bc3a-0c864e846324@sirena.org.uk>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <661fc4ce-839f-4c47-bc3a-0c864e846324@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 18:42, Mark Brown wrote:
> On Thu, Jun 05, 2025 at 05:26:05PM +0100, Lorenzo Stoakes wrote:
>> On Thu, Jun 05, 2025 at 05:15:51PM +0100, Mark Brown wrote:
> 
>>> That's the thing with memfd being special and skipping on setup failure
>>> that David mentioned, I've got a patch as part of the formatting series
>>> I was going to send after the merge window.
> 
>> where did he mention this?
> 
> I can't remember off hand, sorry.

I assume in ... my review to patch #4?

What an unpleasant upstream experience.

-- 
Cheers,

David / dhildenb

