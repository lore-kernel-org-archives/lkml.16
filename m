Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6D819F12D
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748034545; cv=none; b=oA+xVScJYITZ/WK5LkNk8LZhNPOEZhbH9DUw+6g3atmK9hLaKgG2KP3kypCgnf3dqKcZ+hfQBE+rNlJXB07xbLl9ANsWnYlKiz7d7UQggcPQAtb8Nt5MhV+pPbG7A2ner1yMyIU4ejD6fgqkTXuAALVEqeQVSzRD+1VrMtFrIXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748034545; c=relaxed/simple;
	bh=Ug/0cek0liAmIOALkolnnoBQY2EBqu8WIDEwQsDxrN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WY4sZTr6NGTQ8CkZsph1o/7MiYjotVOoRIhXel+q2JM4Rvqlz/gokn/yuLOq9SFAKzWCX8mxM8YSYo3XNVzrH05J47dj+ddooPdVlha2F4bTqI+sMyx6CzllwE28nbLVtwm+og3egt8Ao4tBpK7rxohFJVHYcjdTHv+hcDpQ/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iTc2mQ0+; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iTc2mQ0+"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so23852839f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748034542; x=1748639342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHsikEp0hoaPHHq7HEUUN56dIOFIBGPuhUpxjcOnZLo=;
        b=iTc2mQ0+hzDpeE7wmS00+/+bh3MlPwFklfRNOUcXNSZfeRxQou4ReQeARrNEZWq6K6
         G59zFlrjDipTeJ2MYGsvd8ShjmO1p7ApLFwQHK1OW5RHTRraLobi0cxAiG8iXFrFNGgy
         JzyP3TnsGBtznU0JFwDNpzLY1dgsWPTYDKcTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748034542; x=1748639342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHsikEp0hoaPHHq7HEUUN56dIOFIBGPuhUpxjcOnZLo=;
        b=LPzHHgSx0WjtntPg3X/7OhQXMz5LUkl47O27aZJzfsXtzBuozmfjKFU8/ayodGVvhF
         mRV0CwelOElFmPibNXmvRpQEwpJ64hTF4+MZj7ibw1CQfwsY8OwsWKnttB+WlAo/F/SX
         mCFqqeYt6PfoLTn6AyFEfilWEH2FquhePWyBfxB4RgCL9vpB8G8nm83V0EE/XDgBL+Dq
         ZAkmTlI3lwEjaH+AlgfnHSeg5d8rpZ1m+EvEVw33YuVfD2Tx+U2ihpSfLDX6EbuNs4Dh
         P+4438eaMuj+SYz5GpZ+Vl4lBYpAcXEKMFKm5l5slkGtTvjQCyA0zfn2JtAMLfd0JaMP
         8byQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEsIMb1mI2j+dDa46TZ479So+y3Hxkmf533uO4dm02FIipg3wNT2bbjwX2G9KN++a8tKHSIMPyMb4MUJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBhYfvfBnM0Rz/H2DdJEPmgEDcx8fixnw+ycdJg60EoqZaROwS
	4b98RaGj0Px6ZMVAXkcEjJTzYeEV9kLV3KYvDMgR25xqm+Yk6gHMTEFejUs7qL96YGE=
X-Gm-Gg: ASbGnctJtf/B1iZ+C82G+dGKAypZqO6jYFAjWjq4Exxmt1AahzZoHpbDrp8Jlp8sQvv
	UndN8rezLDalD8alv4Mm+QfLrIiQr07t3/dMEBCmywX8iJKtgj73Ex4nCrtppdzy3eXGVlI4cYZ
	4mOCi3FLvd9+tOUrET6kN2Q5sugh6xKOqPYW+HJ7fGkrvniXZCSjFoSDFJn1KLofHPjDH5AbI9V
	6qMy6LWesmJRjQyOHpTJFcwya/8Gv3kJW8ng8LmKSeO2M56ekjPk/RPKeMXIXkNW+08hbTWG4O6
	TRg1D9PvjU34R85bE3wjFBe1R6dyprBm8Ylav9YjqLBpxPv5NBLntxapPhA1Jg==
X-Google-Smtp-Source: AGHT+IGBmLj6tWLPVP17kacCv1bkeh5vDkEH9/sWNCuGqF6TfQj4uoU0k1NisoF3nK/aBveUbZIr8w==
X-Received: by 2002:a05:6602:399c:b0:869:d4df:c2a6 with SMTP id ca18e2360f4ac-86cbb8cd7fbmr116734339f.14.1748034542354;
        Fri, 23 May 2025 14:09:02 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a236e800esm359673339f.29.2025.05.23.14.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 14:09:01 -0700 (PDT)
Message-ID: <41d3b11b-d269-4ee5-a118-6608c804e068@linuxfoundation.org>
Date: Fri, 23 May 2025 15:09:01 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] selftests/mm: Skip tests dependent on a binary not built
To: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel-mentees@lists.linux.dev, akpm@linux-foundation.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250523184312.2647781-1-khaledelnaggarlinux@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250523184312.2647781-1-khaledelnaggarlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/25 12:43, Khaled Elnaggar wrote:
> Hello.
> 

The above doesn't belong in change log. Refer to a few change logs
in the repo to learn  how to write them.

You can also check the kernel documentation - this change log
is way too long. It doesn't clearly state what is being fixed.

In this case, "write_to_hugetlbfs" is missing because the right
config isn't enabled. Test stalls waiting for write_to_hugetlbfs
to run.

You are fixing this by checking if write_to_hugetlbfs exixts
from /mm/run_vmtests.sh

Summarize this in short description so people can understand
the change.

thanks,
-- Shuah
