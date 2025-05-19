Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1451021FF46
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747695613; cv=none; b=TlMLZx3EWYFdPRT0sI5C/O0gM6wSGFoOAx7wQ/9vOXk0aiaPJbGhl6rTF/LJKJ1aYewxhXiaYWFhpLYd3UXpcdH1DOmQ9Gy37TleEIhQvA1Mk+Evrnx7C3lKWJkccuO9YepD0ht4g0VG94Nqb4DFXxu1L4rF/ZFmr6BZmljQ0mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747695613; c=relaxed/simple;
	bh=Af6s7bS6lpBpNpbJl9hSOqfkStT7xsxkOR1pt3Xodlw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=Vzl9kRviGdEJPifuHKKwYWCxh1jGbFYfYvr367MfO9SbRIDApj2ClW5Jp2jnrwlhwOTN2ipj8szTJoR0am5bqJRfYf1tWqLdJMAP6V0ESmiHuEjfmfmZjzqFtNpBa7dNCuRolW74ZhPTPoBi+SLjb1bMI+6iWS/O/wS/9evdenU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deltaq.org; spf=pass smtp.mailfrom=deltaq.org; dkim=pass (1024-bit key) header.d=deltaq.org header.i=@deltaq.org header.b=DctZN+Ac; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deltaq.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltaq.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=deltaq.org header.i=@deltaq.org header.b="DctZN+Ac"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3da73e9cf17so43898005ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deltaq.org; s=deltaq; t=1747695608; x=1748300408; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aJtRM3UP36+jGGBeMpGiYFYT7pElbdskUQEOB0FjgQ=;
        b=DctZN+AcZU5qbXC3CQwISaIsoC9BInhBWp8lZWT1WYIrKLjNpHLmmZCXSKTSiI4nTv
         lzC4EW6n5zcwMMJUNlaFe5otsjWY7KRQe6KJSxmfMVL4O8xm+KhByjXOIzc9u1RL1N4j
         d2iZvbWYeDDANqK9sijFOOxhraAqf9FWOsKzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747695608; x=1748300408;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5aJtRM3UP36+jGGBeMpGiYFYT7pElbdskUQEOB0FjgQ=;
        b=GyRSS4IW5fNis4DhNrIYJj25pz1b1EvRUg3lIVmE4XiH6iLI7P57DSKviFB4qbw/JR
         UJimUNKRgC/gjzMqhhGyx05a8NPaTEvGJ4u+ysJ9MDm61aSInZBB7F6RufrypnuZBWLq
         wW+QcPHpik67WvN6jhiU6zoCRhwpeRDfo8984M6/hco9lWQNLAHbvp8JWIaXOFFx8BHV
         xoetsNfeYgfLHEqipP8H+3xIm/Noj4BlaRIRIP+Q9YgFA0nUKIQxQatH3GGqUo0fVYR6
         KMJ6FM6Z5zbRooQloda4bMi+Tmz6HQGdALx2zhoGIgXhVge1d6iomCO84Nw5vVssNISh
         MxJg==
X-Gm-Message-State: AOJu0YwKTM/epyUtmiyV1GsAfPP96rlhFrwo9WhmNrpuMbfrd0fWbewg
	TVSDn8LYC4/PpAnuo/6i/uTPZsJNxOvaBZRpG9BAyxCL9bkhKJoxct4p+i1ZVRpi5la7eL5A/uc
	MfGYCsk0=
X-Gm-Gg: ASbGncvJHyIui8Oi6mauEFoYDeGG4TDmRAybXdYqr6Vy4N6afOfcwkWdHkg9Csvoaj4
	Z8JqP1w+7be36mgQ8rHOA+zPQJU1QGVSDiKJXOx7ByM6X+a5Ag8ZcHXaGp51iVFzF7oSzRWDGO4
	eLDx+R9Z1r0rxNfotat6kTuA/P4vNMmTWEKFocTEErpZ/bZJZiKd1rUbxT8PJDnWZ9TOHzxql/w
	ZTAcFAVOSKSOqHr7lDYABOtPCMI0rY6603Au6Ikktab2HNI1cvTkzorEqKvx5g/C176vfnw099+
	wY05HTDwrWEkoK5Kqdd/gW5ebrBsvMgrYF7pdRjLW5EPHGwztoBj
X-Google-Smtp-Source: AGHT+IGA54DBoUqPtnnXdKH8acpqbck3N38be0M73BkHAamQsbgRPZJLNs3oxrBiu6lhcW4zJwYjTA==
X-Received: by 2002:a05:6e02:3784:b0:3d9:6485:39f0 with SMTP id e9e14a558f8ab-3db842bd205mr144487965ab.9.1747695608337;
        Mon, 19 May 2025 16:00:08 -0700 (PDT)
Received: from [10.128.1.182] ([104.246.135.111])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc48c4c1sm1941754173.95.2025.05.19.16.00.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 16:00:07 -0700 (PDT)
Message-ID: <6a40fcbf-7e73-4557-a79c-fea764d1ff3e@deltaq.org>
Date: Mon, 19 May 2025 18:00:05 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jonathan Gilbert <logic@deltaq.org>
Subject: figuring out which monitors and which audio devices correspond
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello :-)

When an HDMI cable is connected from my computer to a device that 
handles both video and audio, the system automatically sets up multiple 
logical devices for it. One of them represents the monitor for the 
purposes of display. I can list monitors with a tool like xrandr. The 
other one is an audio sink (correct term?) for delivering sound down 
that HDMI cable. These I can list with e.g. "aplay -l". Is there any way 
to figure out which ones correspond?

* Is there a way to enumerate these and, from the enumeration, procure 
pairs of monitor identifiers and audio device identifiers?

* Is there a way to find a corresponding audio device identifier 
starting with a monitor identifier? Vice versa?

* What is the authoritative way to refer to these devices? "xrandr 
--listactivemonitors" describes monitors with strings like "eDP" and 
"DisplayPort-8" on my system, and assigns them numbers. Meanwhile, 
"aplay -l" seems to identify sound sinks with the combination of a card 
number and a device number. From what I've read, the most direct way to 
refer to a device is a string like "hw:0,3". These don't seem to have 
anything in common whatsoever. Is there some centralized namespace where 
both of these things coexist? /dev? /proc? If so, is there a way to go 
between the authoritative name and device names/numbers that are used at 
the top end? I ask in case this would provide some way to figure out 
that the two logical devices of different types are actually part of the 
same physical device.

* Is the Device Tree relevant here?

Thanks,

Jonathan Gilbert

