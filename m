Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056DE221281
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211736; cv=none; b=ARGNcgNq3Rxd4heFbejDWClgXni2NXXWWc+r3B4nJbqYof4rI5m6bEjYNqq51wgp1DzZDX+ViK6QmM/SIsJ8rmw/Pd1Oss5ibQ10Mmxy9Rfi773L8jaob4tWwVvEdLRsF2vULvg8wOtE85uFS98ccmvGlTBdgeTxIA4/BQFLj3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211736; c=relaxed/simple;
	bh=LnsVWhwJpBAkpZDh+52MQNw22R/I9maYDg8qpRVBVKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrEkOdX+wjGAV5UGGEdhfOcPVhGlB1xBaNZHPEFlMF4jHNX91jwaZj+CyoAuZmJcvifVRMNk5qBPgCuxaI04ppksTQr3R2+lbLMw+T9un2Jpv/nLXvGO7prLq/Jdjzba1hi3XBEOGzgJdLfZ0nKp6MM+JqYWor4xrFCZXfkSqBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=daTGaeUU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="daTGaeUU"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so3111798f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747211733; x=1747816533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9zd+GoKgmj0lz1D+LN0r99cnHBgUgWB63kqIPzuCsc=;
        b=daTGaeUU6AmMCswrVFzQZN1mjZrlMIXH9TuBa85yg9Ria2TVuVhHfIbn/0i8kNyUL2
         xrovdREeqNFk9mRsJf/yoQOIchMOc+TjrWwc7ormUT673FVPjRAbsabyjHOPXqOfFpm/
         IcEvn3N8klO1XBsFzlxuGikxrhOfaxr33b+Ye8piOOaA7H4gD3Q8D5YlWAUWj1KQ0jXF
         LyLVvKZXnqrFq4onSKfU8ZeGd38rFm3R2IMoSqwog9ngVs40tbvowOtw4OOFkFwHR8+Q
         0ag0BDyqcBTIHJXX6xy6RXhjzB4O34TPXoDSLtO7n4olCEbmS/1VfKEU4DNrtUPQ4oi3
         95Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211733; x=1747816533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9zd+GoKgmj0lz1D+LN0r99cnHBgUgWB63kqIPzuCsc=;
        b=uz9eQfmlDtu/ZcWIbcCVuI2WD+EzDwiyvCvFZ3j9lv7XMUMwyDHjUs1U+xMtUEeDZD
         InTkk9VOYI9rbB4GrTFFnXKJ3bIY9CtQ+AN/IE3+mxfvnIgETF15QVZu5SYDeuz/Xu3K
         LZmuubKL4LNb20+3DQIjfdzC1VAGhT8ZNP9JStcuTCYJ3ju6MANQ30qrzq8QtZ9sc9m9
         rCct/EyXXBbExB0Iy6gthiPuP1VFtjsz9zQxCNR3sKZmm0tHWAKFNY9m0KYm0kKgqTsj
         nl5oDR5LxYIN5cZMo6AKPqESq7+ismmSyO+SoYEAiGQAqHgbYzZSbXkmvlq+xdN379+M
         aJlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmiarl6Woey4VaTGOFq/TDMr7A7cDsXAEEFtUUVNY+uuAM/w9vfki8G2EBiQeXnujlW99F6/1CLAeLWoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzORjQm2sBVssYUf0PFDSNf/iOaLG/YgFIBBXAub+Zfpeil+OpI
	Thm5siDRjalScYiYUujZmX62jPefVw8vDQ6MBvHdNSOeAuy0CiXFTOxv7pfGX9U=
X-Gm-Gg: ASbGncs6h9e8rVFjhuV8fgFgeBX3hycVMbnOHg8f2an7ruwpUU0zoXgu263gbMTDrg2
	GvMTQihySRlQiTDgx/Ud01zKb2WylTOcA/xt+nYXeSRDpdfn8daEama5ogn1/+Al1xf3g4vqLZj
	6ANenEPVIBz56Yzt519JrUNXEoDa4uc3MasJVtLUSCnE67Hmbqj8dgiiI8ZxxUPIUPxC9gqh+VT
	TtRhlYOrg9wQOVv0C0gkmCPeeokNg2PK50+N+kex6HJHXpmnhmadNPkUFzWKJV4Eka88vll4qR1
	SnxzVkN4Rl/PmKMr7Nw7oIH2aJpmu0uXMT/ZApdjEMtewhZ6ecJqXQ==
X-Google-Smtp-Source: AGHT+IGT6wMyIUernPhTKllof9XQpCI1zQrbycT2cwRsu9zmtZYLZ5dRauNiPAUk32i9JzaAtr/pSg==
X-Received: by 2002:a05:6000:2481:b0:3a0:b550:ded4 with SMTP id ffacd0b85a97d-3a3496a47f9mr1500267f8f.13.1747211733319;
        Wed, 14 May 2025 01:35:33 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4df3fe369b7sm6319632137.16.2025.05.14.01.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 01:35:32 -0700 (PDT)
Message-ID: <eb13d6b4-3c6d-42e6-ae58-bb4454297c5c@suse.com>
Date: Wed, 14 May 2025 10:35:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] module: Extend the MODULE_ namespace parsing
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com,
 samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
 nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
References: <20250502141204.500293812@infradead.org>
 <20250502141844.154517322@infradead.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250502141844.154517322@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 16:12, Peter Zijlstra wrote:
> Instead of only accepting "module:${name}", extend it with a comma
> separated list of module names and add tail glob support.
> 
> That is, something like: "module:foo-*,bar" is now possible.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
