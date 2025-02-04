Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5720A5D0
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738671790; cv=none; b=cmp4thZ4ZLX/g0O45tmS9zfym5NEr1IpaFalp4ZrkNS0Xtz7qfZMc0mVHfAILe2fQJEUO+f/l3//7FsdnErdrghCwcHKtsVaOlntOSjon3n+7OMveDXREG3XG3OPHhNDsjv/kClZAKvNaWW79taY3/TgsoMkPvdOCAcVbhlR+zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738671790; c=relaxed/simple;
	bh=/agiQeXJObC0lGZ42iQ0WTyEcxzrgC5d2xyAvqlIt9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IU6vPLFeca02tEPJ4Pg3D8Afrwq9G+nuRVoMQAxxSnf0m5y2h4MBx4qQhKI7QGw9K/8uedHNqIaFbBb/8fZ4i66r4m1wOmoUPb3IO/dchG9z+mOuFJIoZo0zOPr3g6O8sRefnUEvqoXOUH4pVLXiK8Lc3Fb6QCgY6cXb/x5O/tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ALtya6TB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ALtya6TB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dae70f5d9so258038f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738671786; x=1739276586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=peE9etEk0uyMSucy3ebeGdBeL6jbZ/M2frixZcScfL0=;
        b=ALtya6TBWINwYYGaZP9lF9+loVlMdkiLcJJl/fQLUsWUz2Hr1Sx0BhfLRoKRQHjqpb
         HaoGMwxccS1jY1UEvkgA376BdeJtXLQayvIBNXTB84eVMXS4gL+1xCeTb9Ekd+zCyoSS
         8pnNx0O1JipWDycxyS7L2yBe4cBFRn6Yq5bQl/Gtt23tNFTTr2tkt5VT6jasR4CfFQJM
         V6i5FkJE1zH4iCAPO44w87TXMEMSFeZPuPVySRWbk5+KQ6NAQwLsSI7yUGFDMpSHnM5E
         sF8mDmB56frF9w+8io9MwEfa7QPyHOH/fNwJSN9S+mnUheyNQrTAISKY7uuuKs5JmQ5n
         KpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738671786; x=1739276586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peE9etEk0uyMSucy3ebeGdBeL6jbZ/M2frixZcScfL0=;
        b=JYnlpbMiBJUSoAK6h5xj9zFFhxvAjzVBFWfzDA8kCsQgdKwKESrGmoa571zXh+6pBD
         XXma1hXiwFV/TkO70+6/pp6+5oRqdK1Bd18XBs5RVKz9eLmwqW7cWB+2Wtc8gLSGmIvt
         XNiMK5YUopg/zOXvkSHHbemhuUubIkRAzbG7tieUgkD597wsos2GinxwgfUCEarOAUNU
         1owrLT5zSv60++6xoilS8LdX0vpSupYS4hTmJ5uiPjJZQZOnUuxrBIk7AyGSMgJUuM8G
         zFMG+oAr4WxqIUHQqzzefO7BR1VW0Pb4GRsi13vKxX2swbOI+bzN9rLBaF0mW7L8/SSM
         IncQ==
X-Gm-Message-State: AOJu0Ywwm+1h6rALxaXGdRUTeOvbsAnbYwwiE9c7y+qgUxupyVo41LI1
	/r/xsVVig9ZZYw5E3INPzCHCJWD8A2TCLNy4XZodvh0XbVg851G1/2OuPSmdkG0=
X-Gm-Gg: ASbGnctVm3SS+0f84IABDzinIHEKP5AlThnHu3oOSK6OdfUO3Yiw/O9pAoiTuX0d/f5
	n4V+sWcdgUJYmGVGtrNLmwlctkd8y4xoDiki1vqZ31RMmceYeDODUCpSfrknh/q8VSa0phH/fF+
	D69mv+6JooACWX+4WWCudeWFOGjRLmRlLyfqnSiytUzVosMo+0GF4FwzHuoyLORLsaRHClhlPVC
	NskZey3RmG6I+8xcytGpaoI7sB7O3OWAI3/rvCght7qp++EeD/AbDJBntntFMZBMdG+K49mK7G4
	Wi/YeVwmOGeVDhxtX84=
X-Google-Smtp-Source: AGHT+IEsZpkv+zoEjZ5fZ0CWe/ZZPrwA69+nZDfrSwBHHPJ0erFxxcuxLLPaSL+xt9IMkOSxixoFrw==
X-Received: by 2002:a05:6000:1862:b0:38d:a945:66ea with SMTP id ffacd0b85a97d-38da945673emr1473688f8f.50.1738671786336;
        Tue, 04 Feb 2025 04:23:06 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38da1ca14bcsm4509786f8f.95.2025.02.04.04.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:23:05 -0800 (PST)
Message-ID: <c3ff27d7-d205-4d76-8574-ffb8ddd5ca90@suse.com>
Date: Tue, 4 Feb 2025 13:23:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/module: nix-ify
To: Luis Chamberlain <mcgrof@kernel.org>,
 Joel Granados <joel.granados@kernel.org>
Cc: linux-kernel@vger.kernel.org
References: <20250122-jag-nix-ify-v1-1-addb3170f93c@kernel.org>
 <Z5lAD6uyFnyBBJp6@bombadil.infradead.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <Z5lAD6uyFnyBBJp6@bombadil.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/28/25 21:37, Luis Chamberlain wrote:
> On Wed, Jan 22, 2025 at 11:33:49AM +0100, Joel Granados wrote:
>> Use "#!/usr/bin/env bash" instead of "#!/bin/bash". This is necessary
>> for nix environments as they only provide /usr/bin/env at the standard
>> location.
>>
>> Signed-off-by: Joel Granados <joel.granados@kernel.org>
> 
> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
> 
> This can go through the modules tree.

Queued on modules-fixes.

-- 
Thanks,
Petr
