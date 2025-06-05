Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3819C78F2B;
	Thu,  5 Jun 2025 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749134233; cv=none; b=at8UI+r8aQZzvlL+/atTTK6yR+o4xXUG+/6d3NYVi79Ir5fLWm/gPUyd36m3U2WmFxcykhgecDOwN7ELoq6KhvsMlEUejegC8jzh5HFIuxHgrv8Wsp3fnzyN3vsd+Rmb4he6tO+R5db4TYv4Qn32b1xx7YJqThCoOhpgK9srOwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749134233; c=relaxed/simple;
	bh=Rgv3aEFT01W6pBFbvtgJnQIouV+GXwKPnoeK6d1BPpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZ7m0jHGf2C+OtZEdY9NsmzaK1ilAveoiFzyMvqYkNVtvdFvU9Gu6I8NaA8QTC72guFCaLEv5ZOnMCAfruvd8SsqLQTg5lPXNFCbSSyoBWZ3KSIUs7wDLTIxxuOG1zZUSBShT7Wkcc85KfwuTeRAX5tQNsPn8PGRhtQrrN/4KBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiIZhS83; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiIZhS83"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso925590a12.2;
        Thu, 05 Jun 2025 07:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749134231; x=1749739031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNn7a9qROZttKIZEwUmD1+YxXegVVdWl/LW5vkAVcH4=;
        b=iiIZhS83FRxd1kcfyGuFqu6OHnTR6F0qmS0+twNMeqao/WofmhsYhn/sbXvUmOSnoc
         Y/nikgNIbXtFqPakSZPSEzobkf/i7NH2wedmcGly/5oPL4cYmZw0HyKr0EqFzwg7EkRH
         rMsos5X+mZTje2+IIzxlW2zXFvN26MTgKLU3RhStTH/L0tiEVT7SVCoe4cjCfAFRRaEH
         9DRrvB0ftinnFkYcvs+DBnGTZ3prfhjVnBWvHrWW53jolS3qUPwwSIiFMpxAmRaRrldD
         Cp4zkWhHFBxpaHvXYiWyokDF3Y4p/sy/WtNbyg8ecc+jJctK7R9Tgc+CZatXRh8LvFJX
         DYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749134231; x=1749739031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNn7a9qROZttKIZEwUmD1+YxXegVVdWl/LW5vkAVcH4=;
        b=ZPj4ZFS+ZfGOH5kO/9FPgXIR0RvnP1l0bSS/NbiT9oflFfTZxke2cQgA0xjtRJc6c3
         ZGsB98oOetpL2WTMTulOL8CQePBP7iC1drScl9V49D1fzTxP7KZGrhaKhQER4+oaWcYd
         twigb8E4leJcxsDJUpct9qEKxa+ul5HkR0RIh9rflLRrrvD96/rr4CjENGz6zCadDvVj
         LgEfE8aNm3shcAlHdzIt79v4HoCmjbZabwWjOlN9QZprIYcnFfFznbK/EkMMCrFxleCG
         s5rsPiz3zKr1mEaU5EUnKup7tOzvlszrwFdSi7otwWj2VirhFyT8zEPa8/KBbliPUApl
         6vOw==
X-Forwarded-Encrypted: i=1; AJvYcCVg9Fln3uz5FOKHUc4dj+AnTc4ZbTTDu3xlavOKQqskbrrEo7LIPzJOCmviXriqEs2l6MyRR7Xsk82dow==@vger.kernel.org, AJvYcCWHk5oc9qRl7J+7qjx4s12XaVQ4ztUwSCeeX7A35Ox1JBFrt/TSsiTl1HdVzEzUUc870pfyh5D2hbwB8XC0@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEIsTeTNijxkB+fxMmtjzE4BQVub7D2wKaLHdcH7xGZqXibbB
	tblrT+lpaTe9Fas+zNmX9cgXGew5xNh4c1/iY/xYZkK+MmhJQvJiGEVo
X-Gm-Gg: ASbGncslEApcJ697aYIYs6u8Gzpjf2N0L+TH9tlCtSuaybSdjeRH9aAPutkhmVstOIE
	U9Ig5MwLYVERnBWWiPwhGcltooCuvcSLY3GirSXV7HgUnjo9eVdx40KvD6UE5BHROlpxvkGPSZR
	7W3X11Q/xXcvNIUKIATiypreYFNoUZ1oKnYWNmXf4+pHZSblWIMMiNI3+GdTNTUaE46a4a5YitJ
	5muZ3ifDIx22+o3pf7iOsVCZ5AVmk++ySQYGrjnl7tDEyeYDuK6cm55dt91iHHRFaDfVBiVeqnl
	pgQY8/N+2klS/+mP+wJS5PPEMd1UfpZ/OUoWP/cLQG1NBeQcK/1JjEGJeYsbjKrZ
X-Google-Smtp-Source: AGHT+IE8N25cN9MB83DxlCzn/Mw1Qu09btXYxMfWgyAPV41dG8BeUQkQo4iTDpTTRdjVq0EgIbYTCg==
X-Received: by 2002:a17:90b:4e8f:b0:311:da03:3437 with SMTP id 98e67ed59e1d1-3130cd6a9ecmr10669485a91.27.1749134231359;
        Thu, 05 Jun 2025 07:37:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c003065sm1613381a91.13.2025.06.05.07.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 07:37:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Jun 2025 07:37:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: vt8231@hiddenengine.co.uk, steve.glendinning@shawell.net,
	jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] hwmon: Widespread TOCTOU vulnerabilities in the hwmon
 subsystem
Message-ID: <3401727c-ad93-42df-8130-413eda41ab3a@roeck-us.net>
References: <CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com>
 <3f5feb87-330c-4342-88a1-d5076538a86d@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f5feb87-330c-4342-88a1-d5076538a86d@roeck-us.net>

On Thu, Jun 05, 2025 at 07:33:24AM -0700, Guenter Roeck wrote:
> > 
> > I would like to discuss these issues further and collaborate on the
> > best way to address them comprehensively.
> > 
> 
> I'd suggest to start submitting patches, with the goal of minimizing
> the scope of changes. Sometimes that may mean expanding the scope of
> locks, sometimes it may mean converting macros to functions. When
> converting to functions, it doesn't have to be inline functions: I'd
> leave that up to the compiler to decide. None of that code is performance
> critical.
> 
Actualy, that makes me wonder if it would make sense to introduce
subsystem-level locking. We could introduce a lock in struct
hwmon_device_attribute and lock it whenever a show or store function
executes in drivers/hwmon/hwmon.c. That would only help for drivers
using the _with_info API, but it would simplify driver code a lot.
Any thoughts on that ?

Thanks,
Guenter
