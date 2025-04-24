Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5DF1EB5D4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478908; cv=none; b=G8GGQerHSjw2EtPCvoSr9uUuFczQl/AJCEjWLQtRfxW7wyuZDnplkeYorJlweqo7G54aLX3Id8w2ZeH/aaXOa6Q485m/Ue9H6djjcIS/uSp7i7mC1dD2j1gKeEO5MG5ECZ3R4Yz9+o3PbPaRjiTl24dsAWpD7b4usZ100/c0FcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478908; c=relaxed/simple;
	bh=HLF6aCv6C5wEiEROOgDMQe1Qv0eWgRpHCqlfkMScl2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYo2ucQzHuKyxZhn2xr2Je9y1mI+X0T4qWL+xbxFfC5+2NSOn1seoVnEylQ+3wWrCcso7J1o0VNI7dnhf17S55ay4STh2qQg5i6jRBGyYn7/D133EMMtMrSh/73uZ9Xqb5oe1+uW1NESYJjlR+o574SgLzbwRgEG0XOIrROW7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TssHAO+Y; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TssHAO+Y"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22438c356c8so6967425ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745478906; x=1746083706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g4hIW6QfieiutszXA0t3nPv2ey02o7qfmGs6Yu69D7U=;
        b=TssHAO+Yp3AwbOyRs8yXet7o+JeUsxAibiR0+TPvxmwMCsjku9/L0fTRXiEQggaPPq
         Uu3I34TibIyvkn9dOrk6anPVh4U9Df8DyFKozDLnevQs/75c86Fe6tXstL/BJb/iPz44
         Zk+eA/J1qu9NUEpdczNXrQYTXza3618Iz3vT5CVPpw1GQKNk9etnmMuBeP7a58ni5Dby
         JLpSSwHpaU4K+5VZY3i+vBvv05VhETzA6Yon3uI3Jpo4XsJTK+JR0HsTtbwlTsw8r5Mj
         2DlZel958CQU5c/zfEkdGkz6GBEgvUBNeY8AwBC0PY1fX9+eTx0CxFNh+XEWImFYFAPu
         vMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478906; x=1746083706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4hIW6QfieiutszXA0t3nPv2ey02o7qfmGs6Yu69D7U=;
        b=RbH7bO29hkzIMPzvI8fegmTTlKE/Oyu1JhLL+0RAJ3iRNSrfkQvSU7N0TWsOs5t3+8
         g0LROdaf+5ny4Jx8ZPp2f4fCXSduHchRahobzOq11QryHwmqCV30/OC11nydwo5Tjedh
         aKRh8tHXAPsKubjesiYQ5QVN21oNr77J7mRKdskdt4VlMkPiarqPhlWPSMpizdBR6R+u
         /UFxxLhmXhkW8EH3teLzm0MePmTauE6kfTTtWa3VRRy8ziB0qpfu9aaODr6P/FyW2Q/h
         KVxLqKe2xRaWueg8WGpkokYNMIi1nNBG2jOq4kwSi8QbfMuKFCqkJfPeOehcyDgaAKFG
         uOlg==
X-Forwarded-Encrypted: i=1; AJvYcCV28ql6qbUQQEWBx+drYxXyejm6xx1B1WWYGTkhM6UZeBzTOx9cI3dp8Eg9BZTUQyanHS6MV0W/mdRXHgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCDYEufR5SZ8MTKBri15VfDowwYo4TiDxeuSZ8f+M1A/6bUfYa
	UOMkxtAwuZLahtHG9WBJXBppP+npH1es+tgt5acvzyxcQUJwgqDnFRwOnnfeOx4=
X-Gm-Gg: ASbGnctETBa4kapbHHyLpHhGT4WHXhDyYGCWKDJGzt+3A4I7SGLVmdsz4SLQM8+GFuU
	b1FfnWCyW+M4VzvoPbz9Ty1vFsUeW8eoc4EPmWYLSHBk9dNMQiXD4A/j9mqgsw1qLO6oCozTsFp
	pFqZ0pae8FeeVv/Aiz4+Ih+mABXcu83wYLCgt2zR1YoYRk8VQbx6N+5fJMp7lotbh7NjPMbw8gk
	LkBAwCPkkfJ+Di+jMXTOL/fYUfaQAwpN7dhum5W1ZFPoPg53K+mrDM/I/zpCWe42l8oG2i2Ojiw
	MoAdn/GK9XKx+zB64aw8dNOR8fOSIkoI/dAYU5leXafeBru3ZfQI
X-Google-Smtp-Source: AGHT+IFUA3CFU1cnWJg1SQjByjtnMsCuSRrIGtPclWuY/yN5NfiaQKwIcJo9x+tWDpK+DYGspM41Mw==
X-Received: by 2002:a17:902:db05:b0:224:249f:9734 with SMTP id d9443c01a7336-22db3bd4cd5mr23000755ad.4.1745478906561;
        Thu, 24 Apr 2025 00:15:06 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db510219bsm6148735ad.165.2025.04.24.00.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:15:05 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:45:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Lifeng Zheng <zhenglifeng1@huawei.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] cpufreq: acpi: Don't enable boost on policy exit
Message-ID: <20250424071503.2uhc4k3jxy7x5mo2@vireshk-i7>
References: <cover.1745315548.git.viresh.kumar@linaro.org>
 <7ce4ffb166beef83cf1bd703a41bf91622011585.1745315548.git.viresh.kumar@linaro.org>
 <CAJZ5v0iCrQeKs=4S-x83Fgf-W4u=2JYLA5VmgKPaLCvYAkNpig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iCrQeKs=4S-x83Fgf-W4u=2JYLA5VmgKPaLCvYAkNpig@mail.gmail.com>

On 23-04-25, 16:14, Rafael J. Wysocki wrote:
> Even after commit 2b16c631832d, the code removed by this patch does a
> useful thing.  Namely, it clears the boost-disable bit in the MSR so
> that the offline CPU doesn't prevent online CPUs from getting the
> boost (in case the boost settings change after it has been taken
> offline).

I didn't understand this part earlier (and even now). How does a CPU
with boost-disabled, prevents others from boosting ? I have tried
looking at git logs, and still don't understand it :(

Also, IIUC this and the boost-enabling at init() only happens for one
CPU in a policy, as init() and exit() are only called for the first
and last CPU of a policy. So if a policy has multiple CPUs, we aren't
touching boost states of other CPUs at init/exit.

And yes, this patch isn't mandatory at all for the 

> Moreover, without the $subject patch, the change made by the next one
> will cause the boost setting in the MSR to get back in sync with
> policy->boost_enabled during online AFAICS, so why exactly is the
> $subject patch needed?

Right, this is merely a cleanup patch and isn't really required for
the next patch to make it work.

-- 
viresh
