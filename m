Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990E92DFA36
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744760107; cv=none; b=p/w4l02V2gx0MLYb53C+/pEQgBnJp+5miuD1SNQxac5UzJvIg9z/rV/2ooj8gDuC3y2SNRTQ4ApMbhv9p9ZoQJbeGLpGoFBsOheoEX10x7qyVdrOr0yrfwjUXMyLWwk1C8VbKJ5XZxaMszI508c5kvsMN/JydEcrJLfwj4yI/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744760107; c=relaxed/simple;
	bh=pbmWK4r//BEuTIyzV4jvJ66bZE4MnnJ30YMPf3eztU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1mN6V0AdmbUo7R8b9BQ4Do8oJFhEM/Js7jB3zmWOjrTgk3uKguZJf4INUx0gN4dsy1W8YjAJUjxo1dixI0934OLMqPk682Tk5Ax2YokGzsXecxqaATwxI/8ycoU1p5gS9tw9P/CSHWvvPmic97MHnmr4s0Phs9a8tWXiJrckxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c14016868so5665892f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744760104; x=1745364904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBcr9WsbeIKsnAkSQ/F3sSiJdnnZotvh+jmpVWwHeMQ=;
        b=q6tdaIlRZSmuZUQKKe18oaN/jbgQaSyi4MZzZayLzSFnv6qKwtBJBg2y/J52unWPdY
         m+SPQHSQgnP6BPTdRouFIAf4zNYepQmsCeOUHIRBKXBkH5GHMWigCjbqmNw3zY3nMQYO
         8IP2w0zCy90rg4mh+BzvOAWRVYNyWDUW5FSyWzbLa9ziRI3ewKUxNh4LjxOnrQz5FE15
         CnNrLQn/JIbxuls/woxegfjaEIpVwpaaFHUfiLpIsyDaV/AB7vho9IrSvlYwnnngoiGW
         wb/Acj2T5bMoTn8ZO5/l8oEZIq6ARY9An7ir3cYvOHAbTJm9eAYkAY5rfjUG3u1uwYyN
         hatQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVPqRb7ARvNwEU13u4+hnVl7Z1pW+yNzxvLdJbi+6qlOK+fXzvYj9PH1RP7GAK6EiZ3BRBoQXWgjDgLsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWK8VAhVCJJp4VOtkwVMWcFO2HXaWs0JGV2SqWJXSuY/XJTQG6
	I6QryCWAdISy9ECkGE3w/uAVCJjNJ+QYMC0guDgTB+wl6ODup20p
X-Gm-Gg: ASbGncuTkRMunOClYvh5Oou+2rUiry8dbFNg+uDiq1g1DIgAb/+QfdXptJy2+Fd9wOv
	HDH/rD480EkpSnpLO07CnevL/EIDkM+7WMMcFoQ/ozcaYpGdyF3rnptlS9OfHWQZtEhajyVooo8
	6qgURCZC+qx2Mg9yg5b8afZmWfxb2SLPLELt/+xk/J+J9lcOyfM68nzggwDwiuJAV70p7Lw6di8
	Q3BhLBzYJzUFB9MHpTc2goz6Lk9Gy6SChc8ROwZxbV8t8a3cVZfEODPfjJjDGaanxdhMuTe2cSn
	gH9sywm6GvfyvUUpkRrUjQOm/uYUCBnv3WqY9px6suh0e16XkpW7bbB/VbGrfJwyPtIfnnss
X-Google-Smtp-Source: AGHT+IGFQoDsrhXlcR5Lo9INVTlZxYBloFpMd7lmfTTWayLAqAGElo+qaSjvY0LXPXIoy97Vsmyhcg==
X-Received: by 2002:a05:6000:250f:b0:390:eb50:37c3 with SMTP id ffacd0b85a97d-39ee27561bbmr970069f8f.27.1744760103585;
        Tue, 15 Apr 2025 16:35:03 -0700 (PDT)
Received: from [10.10.9.121] (u-1j-178-175-199.4bone.mynet.it. [178.175.199.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445270sm15341737f8f.81.2025.04.15.16.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 16:35:02 -0700 (PDT)
Message-ID: <8ac6cc96-8877-4ddc-b57a-2a096f446a4c@grimberg.me>
Date: Wed, 16 Apr 2025 02:35:02 +0300
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
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <CAPpK+O0tmewK7pH458TOxjtimjO9on=4YDRFbS=FPTgM+KFTzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> What I meant was that the user can no longer set kato to be arbitrarily
>> long when we
>> now introduce failover dependency on it.
>>
>> We need to set a sane maximum value that will failover in a reasonable
>> timeframe.
>> In other words, kato cannot be allowed to be set by the user to 60
>> minutes. While we didn't
>> care about it before, now it means that failover may take 60+ minutes.
>>
>> Hence, my request to set kato to a max absolute value of seconds. My
>> vote was 10 (2x of the default),
>> but we can also go with 30.
> Adding a maximum value for KATO makes a lot of sense to me.  This will
> help keep us away from a hung task timeout when the full delay is
> taken into account.  30 makes sense to me from the perspective that
> the maximum should be long enough to handle non-ideal situations
> functionally, but not a value that you expect people to use regularly.
>
> I think CQT should have a maximum allowed value for similar reasons.
> If we do clamp down on the CQT, we could be opening ourselves to the
> target not completely cleaning up, but it keeps us from a hung task
> timeout, and _any_ delay will help most of the time.

CQT comes from the controller, and if it is high, it effectively means 
that the
controller cannot handle faster failover reliably. So I think we should 
leave it
as is. It is the vendor problem.

>
> CCR will not address arbitrarily long times for either because:
> 1. It is optional.
> 2. It may fail.
> 3. We still need a ceiling on the recovery time we can handle.

Yes, makes sense. if it fails, we need to wait until something expires, 
which would
be CQT.
