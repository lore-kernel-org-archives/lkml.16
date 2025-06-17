Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F3B293B4F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152463; cv=none; b=NdeU0aXtCPl2EX/U2lhnGPe/9hTbD/9laDO5u8nvUWUQcYZpzi3S+sjcMugCMUIoN3W/Kd1ZYMLezJ0b+yle2pBfA3e7i7s2TMU8krxrbvECHRbfTgqqaPKllY+6GpcAA9UaLQk6t3QpB+Q/FSu8wynQxA749ku0zM7TMOiNLH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152463; c=relaxed/simple;
	bh=f3FXbCp1zJT2e/y37zile6+NsyCTyyggM8rYqlTqvGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rA8SAbl6sP4b9m2cI4o9+cqS9EWzuk9SaJxb+pUeWRmtd8jowGoKVy7NLBAY3ZhvnAIFdFk80lp7SWF4mizyYlyvBSrj7YUrMaLdJERt1fReE7f8XaPeLbSIPPSv0r0Tf4ZKrzrnJ4c755Fcueqqh2ffylBDFuzevlenTotZ0Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HfaFhXWh; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HfaFhXWh"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso3163621f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750152460; x=1750757260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=boN3t4QQQ5CJaq9F2B9aIVemxFll5K0ZGpv67UpOwpI=;
        b=HfaFhXWhDA6c/ysVVOaYkIshY6amQ6jMyyRlRTgXilO33yD0L5Gwt70j+8+S5hy7f9
         FCKkZrirayOh2DCyT5oll6krNLYGAIBPl5gpc7bSxOdkIYntMGrmw2ioqWPswjXk2kRB
         LpfJv/Cn1f4Uk8SNPEok7e3hzUVmeND3FP5mawsihpE9f3GiwOAw22ENxnCWtWoZGS/8
         of/6VYb+E8tKheFtFsy0XOXrvHLfuusuv7+we0mqDAPMtekgoAaUVUNuGNDzHGR4rMHt
         CKC9mMRca3gsL1G88cpDB9JHJxl1v6ve/WpzGqDFruJVLqUlg7OqrnnK9R5S0L5P4SU7
         FXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152460; x=1750757260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=boN3t4QQQ5CJaq9F2B9aIVemxFll5K0ZGpv67UpOwpI=;
        b=uCMHQSiu0rc5mKbcgre9Jp1nr7aXhVmyemFhCMlpkDsu5g87i2n8J9KTAWXMnfHMfP
         YFX6u03tOB0tepbEJmpVUFKGBXgwvRYEv2160/kbgyZvQnRjPvTvE569A1J4admc1m8z
         OAYtliF8GvNXPGpNWLtFA1fPxmOsGAB/gKYPx99o5MRp+GA84w3lZl+/+dbr90HH2E5w
         Ei/Q3mAbvQYuCDFmgtvJo7rDlbGozt2unNTBMmz851CXTc8YnBXeBdM3VWSzNYV1frRv
         CVq26IEyRYI+QEQmVD8zE+0HlYPBXsnaIqofoRLYPFk1cveux+QzIfdU0OohH/2k98x4
         qCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQjagvHVdqa8hfdTBexvd1CqEAX/LW4lxs2vrDJxERXopCAP4/NOiz9ET02A4/lipkz3qv+ZWaXhJKSiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6YB2fN1NoYwXXKw1QzqMKzOJOpX5BClZLrJ5ZVEv8RS59Hgb3
	BOs1k/u0zeXx3bd48Vzs0uGVksXigHZsr+lrII7742V5etefRzePWmhGcmvGsMgT7KA=
X-Gm-Gg: ASbGncs0oHxZQk4+6+nSL8+qVAYwgj/fXFCRzngriDPdJKzm0d59pZD011reFH0eJpC
	MV3shU25iOJan6BQE+cujPC1ucvJNDhdJUSAQyZkO/JhqDsQ7k3+PEXzrQBdkmEh+S/QHaQthjw
	bdI7HCPLDVJjGo7pP7ncSGSCigBppjxk5dnngv3JVD0eed7GAZBfYDJB+pdjsI9fdVum2UjcgDY
	Xb2CIhrRaxqplqTywXpHFjYbeu5Jd2PGwncog4rh1fDfAFwUVtPDDn68HKl8nF6boQZCr6cLB7V
	+IsVBdDOxkw3InrlYwrETnn1jBc2esECRzi7yb9TnZWb0uyFCwqypAbwlT2/kqdH9w==
X-Google-Smtp-Source: AGHT+IFM9Lj5qJWTtP6+l5n+/04TRA1i4YBOucx2CbKedvvZJIa35JF0Mqa14giJEb7sodnjrvIhwA==
X-Received: by 2002:a05:6000:708:b0:3a5:5278:e635 with SMTP id ffacd0b85a97d-3a572367577mr9469207f8f.3.1750152460099;
        Tue, 17 Jun 2025 02:27:40 -0700 (PDT)
Received: from [10.100.51.209] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b18f96sm13555006f8f.66.2025.06.17.02.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:27:39 -0700 (PDT)
Message-ID: <2cd3947a-63d9-4a79-a24a-eb1ae8164169@suse.com>
Date: Tue, 17 Jun 2025 11:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] alloc_tag: remove empty module tag section
To: Casey Chen <cachen@purestorage.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-arch@vger.kernel.org, surenb@google.com, kent.overstreet@linux.dev,
 arnd@arndb.de, mcgrof@kernel.org, pasha.tatashin@soleen.com,
 yzhong@purestorage.com
References: <20250610162258.324645-1-cachen@purestorage.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250610162258.324645-1-cachen@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 6:22 PM, Casey Chen wrote:
> The empty MOD_CODETAG_SECTIONS() macro added an incomplete .data
> section in module linker script, which caused symbol lookup tools
> like gdb to misinterpret symbol addresses e.g., __ib_process_cq
> incorrectly mapping to unrelated functions like below.
> 
>   (gdb) disas __ib_process_cq
>   Dump of assembler code for function trace_event_fields_cq_schedule:
> 
> Removing the empty section restores proper symbol resolution and
> layout, ensuring .data placement behaves as expected.

The patch looks ok me, but I'm somewhat confused about the problem.
I think a linker should not add an empty output section if it doesn't
contain anything, or if .data actually contains something then the extra
dummy definition should be also harmless?

This also reminds me of my previous related fix "codetag: Avoid unused
alloc_tags sections/symbols" [1] which fell through the cracks. I can
rebase it on top of this patch.

[1] https://lore.kernel.org/all/20250313143002.9118-1-petr.pavlu@suse.com/

-- 
Thanks,
Petr
