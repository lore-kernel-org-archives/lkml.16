Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A95F9EC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744841721; cv=none; b=runUfEZF/N5y6VBK1OPXKiBl141xtKaZqiWmoT2DVlg/sBQNP6j9KL+AwSpN2grtfM/UBv2fu5qC+761/Ck+CBG0bZqwMszUCFLZU7IdxwHWBkNlpuoxSA/wnP5H67AJDi+p4RuBYRG1qWwBcATOA65GkwxVw8+jrxzWadqIrMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744841721; c=relaxed/simple;
	bh=QlSh2EDUuFZtk9HviGRqXS3TrEI/ltT37DwtFrF7lcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/fpXojmFRERwoaKvBu1Vcy/zQYQw0UMaR2aC1UVl3Gxge2LArVFaTEgp2RZCf4rQCpdYAK7F57Ubb8iiRvGI8JJyayWaOiEuR4WIG6FO5tGVTMffeQuVyX+4SmuWY0wk4upoZKflPWMLgpw0eyMkhJcjFTYZKgt73siBAT5y1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf257158fso898685e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744841718; x=1745446518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urTlDNi6wNlnDQZcAqCrbf5dwpRtrlP5FbhK2ehxjWc=;
        b=dFIEiUmPjBjwGeX4mndP71I+iDk0jaD7kyb9Kjzc9xyITXdfrhRcrPUAoIuDG77I+n
         +HW39GPeouA0hnkXKs05dJPyeRknYH+Dx+bI47xgR6TNOTOX+8HNBRH0O1wt6nDU1shs
         Lc+oQPkdV2STvrpJ5D6W7+bctBOf6PXFTunUbvoAM9BcSa6j4wUC4+eh/rXj0LDYZTBA
         St04pTO+PGsjCMYi7hLacKNiA9GetB9QV8gxeub2ImKrB0ieAQPWwKJB6uEV5p40zG32
         3+t1lFAuvWdKwdEuwlyJ+NmqnWu3g+ReAuqjp7gbCvGu8nwgQQ6HcwooGPz8Y2OPoK3Z
         ejaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+jUkb/lNe7mGd4yqs+RK1Cp/2BH6rMqf75DAz0LFeEToj81ockLZD0C/DkYtgg0fHCDaEQlRqqBafzxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxiLalAcDSMkgshhw3oVDtjpdjQ8gfVvyZK//ARuP++UEuipVJ
	OCqqHo4GSoOT4ZnZCCxOgKNPAH2cQ5HYQbd2T8W4M8QQAUKuP70K
X-Gm-Gg: ASbGnctX2/1t2w2eFC4rGb18lTF4fFVmBAVjaLf6ewsrLd6PsmVomGYT87oDkeLnLAS
	HQtlMZoQLVCMOkN/YzWmlEN8NqEB4K4/8vAUXKJkvYyvfAR10KCsps0SHzl0Kqmx9fRzZ37og+r
	MiTSy0oWB1HlTW0DrCDfue9drZ7gSmP8lp7cX3Y/cvOWv3SGS83TvzfhlHDDnf1uVuJIOugS3MN
	tqdaWxcQE5sLjSoerXllx8K03y3xCYzn58IQZa+sykB7/osWeXEJcIYvLrIpT77Tp1ueeUatM3E
	s4kck8mEkItIq9Ciq+u3lJzGv9h96ZHlgOYuFw8M3tgwoeraZahbajYFZKcD6pR58eGhksIqjYQ
	nFbR83Bw=
X-Google-Smtp-Source: AGHT+IEouzx8PT34zhwgAamNvnQSIVYaNgoDyTEr2XAiwMCGDWCjNdamH+nXhtp8UCoea2oUza6dmw==
X-Received: by 2002:a05:600c:384b:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-4405d5bdf96mr37147625e9.0.1744841718089;
        Wed, 16 Apr 2025 15:15:18 -0700 (PDT)
Received: from [10.10.9.121] (u-1j-178-175-199.4bone.mynet.it. [178.175.199.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f25bbsm33081345e9.17.2025.04.16.15.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 15:15:17 -0700 (PDT)
Message-ID: <945f4ee5-3d9b-4c4c-8d45-ec493a9dcb4c@grimberg.me>
Date: Thu, 17 Apr 2025 01:15:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
To: Randy Jennings <randyj@purestorage.com>
Cc: Daniel Wagner <dwagner@suse.de>,
 Mohamed Khalfella <mkhalfella@purestorage.com>,
 Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>,
 John Meneghini <jmeneghi@redhat.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
 <738a41ca-3e4a-48df-9424-2950e6efc082@grimberg.me>
 <4cd2cbb4-95ff-4f3b-b33b-9c066147d12b@flourine.local>
 <4c334216-74d7-4a30-add1-67b6e023d8d2@grimberg.me>
 <CAPpK+O0tmewK7pH458TOxjtimjO9on=4YDRFbS=FPTgM+KFTzQ@mail.gmail.com>
 <8ac6cc96-8877-4ddc-b57a-2a096f446a4c@grimberg.me>
 <CAPpK+O2SBm6-zqbiDbUB0yubVTvTrXWn1R+GAPne_+LGvVXp6g@mail.gmail.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <CAPpK+O2SBm6-zqbiDbUB0yubVTvTrXWn1R+GAPne_+LGvVXp6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> CQT comes from the controller, and if it is high, it effectively means
>> that the
>> controller cannot handle faster failover reliably. So I think we should
>> leave it
>> as is. It is the vendor problem.
> Okay, that is one way to approach it.  However, because of the hung
> task issue, we would be allowing the vendor to panic the initiator
> with a hung task.  Until CCR, and without implementing other checks
> (for events which might not happen), this hung task would happen on
> every messy disconnect with that vendor/array.

Its kind of pick your poison situation I guess.
We can log an error for controllers that expose overly long CQT...

Not sure we'll see a hung task here tho, its not like there is a kthread 
blocking
on this, its a delayed work so I think the watchdog won't complain about 
it...
