Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C88D4C74
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743840607; cv=none; b=JDjU3G3ZSm6+3ih6+NaDIlkA6OLnmQ4riRDcQtWq0OwgMODVzIUYcaMt80k+DjctT/YXREbe4ouQdGl9+itJOuwTFWWDYMsvobY+sc20zMnYuYYSiktn53Bq8bKB+rVdwaA8zbAcqE8w9C6SjwhQaglEpl+KaXVAbOhC9VqD9zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743840607; c=relaxed/simple;
	bh=p0vGFZ1wdWGbnt9FCH999EQ6UIOtZuI8vUy65LhLMKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgwokavhOK+yo7g/wveJZFEai4kssHEkSx0m6TmWRzYvKS2qh9ECDf0OLRx1D0cNATB/vUX6rfeEWV6IkV/xZsdWP39/uputi580Wlx90OtpOVFl4H3wUIK3CxQBGYga/KGlWtkEJdug0wxrUxwTueW0h3ZIUiC/4Y+Eq/NoswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=fNpX/TKA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="fNpX/TKA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso29831045e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 01:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1743840604; x=1744445404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94b9wrxm3hp7XmByM5KKoGfNoSco8/rIY08sCXX4aJY=;
        b=fNpX/TKAHBX3ryHtAKHCaNoHBxknjQmYTtYjO3Sidyhd0JbN/KSvphVl8lHKErpYHF
         E/Jy95GCHHYDFl4lqXEU5CTXvJcWuodxaUSOWRfYPUJ+jC3zx7rODqZC465rhYtan2ot
         dYw6nKazG1MnUtNc+h2Zjl3RkI6oVJznWIVrNb7in98ysmuCAJ/HzwmkecOjXg5i3DI8
         n/eWsTknewjlBSokvcwHfiVumUv1WWyetnS3xQyItfMkFgX1EPepnxXwRPB+NX31rufJ
         Umb63RsNnqSxdryUfY7KbmOzIhN5VzDTrrcAnGRmCWDTY4AXqiZ/ZW04f9FKgv8Uyi7b
         Z2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743840604; x=1744445404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94b9wrxm3hp7XmByM5KKoGfNoSco8/rIY08sCXX4aJY=;
        b=uJxklR7IzK4BkqA6Nn9Zzs9D+hIYAGf6NnnDUioqC/4afZweqsiR5kVnIttgO4Anoi
         CXuTqjZxl5r916V7hzQdD3WHKEKJhPZn49SWbnDUyDQZqT3kQEtxoMCqqai/wrc5iDKc
         YapJ684pdSkWUsDdo5QhikXIxwIThf+u3NksovKmw5iKMUgeIEuWdSYFvxTB1cOthaiV
         v3tHhW23eN2Rbytmxq/KgLI+WAL2HGWfIPreTQVHy+5rjwi0TbNpDG/x8W9EZ9Eus3qT
         165AT7g3iM9/cz3Gsga01KbbAjOtK2JfTRXGPrBgzWpggojcB2YW1CO+ooaWkblIOd7P
         32+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeX7rdVsMpmiTFp1K060esd3a33mY2JW/rhIUzagzxrYE8Oz/ZlTqWqDZXqlmPz2QzpGuuLYjILNlNF2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGi+4sDpx8fE46Ey0U4OEd3VhckfpmtWMoVTFlbofHIPRKh+ld
	ujAxUZuxQeVEMKHc+d6xgf7wt0KrujvYS2DGpAAx+W0TVGlP+NFcWH7ZB9wmO2k=
X-Gm-Gg: ASbGncvlRpMAmP6mKzE2GCFkyjAqvnE2R32oFekL0JXBoVDKLrZC174z9NXQeTS33m0
	58dzqxwZY3zvth1N3lLZuypll+hvCZAkGQez9XgIyu3eAfRWcZEzLKQYYrdCMXdZCNxXgKFVWym
	c8IfEmYj5f4upyB2Iujf9sZXQU6gbLca5BkUgKwrTIjpJmsp8zWdi7FgF8Ax6LkYAlQ5iI5FjhA
	+X6yAQX926hR+kCSmNwuHWZWCsis9sJgY+3Q2hFaTtaSXgW2gMiRawu3FV43vvedITN4iwgie69
	zIQbAfAURue8Nb2OCvvdjeAeBgEjBwMJglSktBHIPJjQZU60W61HbUP7p6j4jTWLW0XXUB/VIdg
	3
X-Google-Smtp-Source: AGHT+IGr3yLaTLf/J+4e1A1EPE7Ku7r1udK/W1EmakfMPotykV3/dJ3b4bi31RRCYO2b3h8RKosMWw==
X-Received: by 2002:a05:600c:1d0d:b0:43c:ec28:d310 with SMTP id 5b1f17b1804b1-43ee063da68mr24847095e9.10.1743840603506;
        Sat, 05 Apr 2025 01:10:03 -0700 (PDT)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bf193sm65515795e9.24.2025.04.05.01.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 01:10:03 -0700 (PDT)
Message-ID: <2f0dfdbc-64fc-4371-ba4c-48f306e90599@blackwall.org>
Date: Sat, 5 Apr 2025 11:10:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 net-next 3/3] net: bridge: mcast: Notify on mdb offload
 failure
To: Joseph Huang <Joseph.Huang@garmin.com>, netdev@vger.kernel.org
Cc: Joseph Huang <joseph.huang.2024@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, bridge@lists.linux.dev
References: <20250404212940.1837879-1-Joseph.Huang@garmin.com>
 <20250404212940.1837879-4-Joseph.Huang@garmin.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250404212940.1837879-4-Joseph.Huang@garmin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/5/25 00:29, Joseph Huang wrote:
> Notify user space on mdb offload failure if
> mdb_offload_fail_notification is enabled.
> 
> Signed-off-by: Joseph Huang <Joseph.Huang@garmin.com>
> ---
>  net/bridge/br_mdb.c       | 26 +++++++++++++++++++++-----
>  net/bridge/br_private.h   |  9 +++++++++
>  net/bridge/br_switchdev.c |  4 ++++
>  3 files changed, 34 insertions(+), 5 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

