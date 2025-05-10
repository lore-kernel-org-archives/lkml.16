Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF21B21BF
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 05:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746854724; cv=none; b=fr/kaM9N2mv4MVzQaTJmTdCcPb4f6/vN2sjsyKfGkqyAs68+Xc14lEPDAWjRJU5a6N5l2F6FLxBb1x3Y1wysJHC3u2FzwAkRAW5yveukUanfiwzgtXoelaBRc/rcjXVwa5nATmf3rZ7Z4qSKLvlQ+f+oUxkGZZF18Ps3HWzacPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746854724; c=relaxed/simple;
	bh=wnSpCN0SlQvDTbj5w2gtJ0EQde4v02WPBAxkEXxIs6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cquOOUQPiLLJU+jStq7iUzA8TqG+h9LgQ1LXpTkGRqW5cUqpeZKfOxh7S+R6Kn3wxQGKfYb2ii7Daf/F9QHRvAC9PM1LKqoig00bNfoQei/aeDhtnOTTY86IsVgAVZm4oPTmKnaSDnxCwdoml+RWxBP7zflilCkwwUEBb0iQOcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AkBL3hNN; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AkBL3hNN"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acb5ec407b1so501729966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 22:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746854720; x=1747459520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAPjzM4sAakR9ZKfNitQt3KlBJ5tW4NoE0Hpkn5Csq0=;
        b=AkBL3hNN5ODIPzG0tqatLibz5XWckTDGFlEVxQQlozt8f7vMmYFSYxf+ox91B6efpQ
         QbtUYOdGVH9qpyXu0axHHzD27fpnvivx5kFsS+zlUoytvWuQ85/cERMvIGs6lTbKopOs
         YbdBKwhJW2xerBFaMCFL6nFgNOzeVjmTsAm1yBW8bj4/2RqNNClDn2G94dVMFIOyLmmm
         +vY0Pe8NmAdFzZDmJZjgbPp3Pg0K9LADwtpmAOlSb8Azp4v6lJst55mIWtTnNuSZaXRe
         9WH4hocdlQBjDmu7Wiae2s+VFAIRqJUUaKIK3qoIAcjQdE1fLYRdF9owZCZm9f+3HBT4
         IzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746854721; x=1747459521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAPjzM4sAakR9ZKfNitQt3KlBJ5tW4NoE0Hpkn5Csq0=;
        b=ZRBRPSZnZj4whsWrJXwgsLpQyzgY13ZlQPVLNiTZTL351jARxrPWBZt+/7TE2M272p
         vun+zJm3trMHXbMzaRZb5drePjIRvIIKHXlcFVqIy9xMwhNFquY5Tb0UYYaTpF7XhESA
         f2Ej9ImHMguXOqRo45sel2JczD2Z4igbotq53HQAWVLwT1N/4EgbfTgtozvSFc25BCRB
         8W74WPeqI07CJhJDLm19U50qsiYQnrzVJ3dqh4rNqAtpPtd/tG7sb7NqvnO/UUSYbB8o
         hH8BGXEopiODroBoO0I8jmRvjnJiXOYPwssR1HfZmgjmvN0i8xwmb6ZGsV5SCgxF69rg
         F89g==
X-Forwarded-Encrypted: i=1; AJvYcCVcaGXfh+sXAKEXMXpaPgwJg6xsMLDcbNw+/7NXtxlhOv6kCVWlEHdnOimUP0EYQBOIcCh6ReFBdumCmXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzob9CFxFrXyq9k+0WHm05zhhbUpf5Mpsssb+TGgCvVXYcGRV0M
	8mve4uynu+23PLRRIFzziqOGSHjRpQNJDgMNqIS2wMLRzOP/72VY5Wtj+UELDMI=
X-Gm-Gg: ASbGnctxHYZmZV25jAuDqdO59OWVHOk0YZEJUusgfKIPk27+XYrO4n2k3DzZkorFtwr
	jY/x6pv4MC9GNrfIStGaS8rDiRNEj2f1DM8vxXMdKOkFsO44G+/11mcELxzU3PBNEMpsEJ4Xl2g
	2a4ijdHvvE0/H6RuDMfMpIezJutc+g8GV0+Sb8LwnSd6kfL60Hr6LltGr2JrJwuZuXkKpetIwHM
	idBm3xmEv1NvBI4L0ENknq12WsmDyJSzllDqk92wVx/rF3tqeTRCHK10xFYbilfoMjUB6lTYsuX
	F5gkeMf+yPqUNLcYhX7KwFk0Pi265vsKWKx4b5coP76uSKrcYqiPEg==
X-Google-Smtp-Source: AGHT+IGRmRcIxaVSii8qJ1fAKjH2Bcn8Hmyb1tMv2VrSZGKJXfOxDkWWHmeUJttXj/PSzLp0og3pSA==
X-Received: by 2002:a17:907:8687:b0:ad2:3efc:dd7a with SMTP id a640c23a62f3a-ad23efce2b7mr34772366b.4.1746854720571;
        Fri, 09 May 2025 22:25:20 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2198532d7sm260830366b.170.2025.05.09.22.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 22:25:20 -0700 (PDT)
Message-ID: <c804cbe9-3777-46ec-9df2-db76c1139137@suse.com>
Date: Sat, 10 May 2025 07:25:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Modules fixes for v6.15-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
References: <0e82be0f-a305-4aba-b9ab-79596f595277@suse.com>
 <CAHk-=wjNj0vHh9v6-LTrbgtq=o6OS+RN3u3m03nV3n9V+urGtg@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CAHk-=wjNj0vHh9v6-LTrbgtq=o6OS+RN3u3m03nV3n9V+urGtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/9/25 18:19, Linus Torvalds wrote:
> On Fri, 9 May 2025 at 08:09, Petr Pavlu <petr.pavlu@suse.com> wrote:
>>
>> The fix has been on modules-next only since yesterday but should be safe.
> 
> Hmm.
> 
> At a minimum, the *description* of this bug is garbage.
> 
> It talks about an "uninitialized completion pointer", but then the fix
> actually depends on it being initialized - just initialized to NULL.
> 
> I do believe that it always is initialized, and I have pulled this.
> but I really think the explanations here are actively misleading.
> 
> Because there's a big difference between "uninitialized" and "not
> pointing to a completion".

Right, the description is in this aspect misleading, my bad.

-- Petr
