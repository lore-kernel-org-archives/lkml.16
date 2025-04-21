Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EBD1DE2A4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 06:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745216409; cv=none; b=EE9Z9XQaUAZ7NugPvWpOjZWhcBxP5jY8mw2ThshiDW8sm52X7vKr/14eKAXLdoa6yqtaUG3zeoND0OvxLy2judcUbmw3Js8nc72+kUC2GGkBWPTrSngpcqkrqVfqJVUYVVEqC4onZxY2rsCXUUjpyO+IDrt2cwTv5cBWPfQmYyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745216409; c=relaxed/simple;
	bh=5ShY1vAOjKO9LkFdxOS4Dz8PnV2WVVq3VAPLn3aR2MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5EKYVmgEqo/yxhuneVWDst+cBeWwBA8onBE3ZfWRA2kwJe1/2YGi2GwX/fXZ35Xg4h2j5kIeAr81/rDcorJwKIHpyR5rq5YehkNo4IsTH8M+YzBkOYq/iDVjhd6uucrAPMOtm+bWfZKQJz7DqLniZCegB+d20mtCPx0QIG4F4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A0r6QPBh; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0r6QPBh"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22622ddcc35so54288655ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 23:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745216407; x=1745821207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3yyoS1DmLQn/njuhu79GSmOu58DF5dEFijXO4m2g5lE=;
        b=A0r6QPBhm4p5bXkLQcj1OCOICkvdS+UkrVl1n815IMm8V4xhx0RtWs8iTWi5AWBo7B
         OLMtbbUC/TkNTEnPRJJTihCLvlTOXEnbAMOfOTcmhxBCEu/Vac8N4jO2uaclJyd3ZojF
         5o7WNqzbHAPidlMpkNO6HnogycKcONcwoNfeXsmKDDOqw5Gj5r1ofQWoHuHzjEjwDLb7
         UBncXBdvqEnjt/pCfs27VF5j4jIUOkNp7QtFRAEqsat4VHwy/aFEfhfGHrKqILhJtFnM
         taSzrTeLQjNSnNkFC0aulYGF0+ySa3N0qaSb6IXNFz090ZWjIPv/Vet1X6xp9WfhXbFy
         CVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745216407; x=1745821207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yyoS1DmLQn/njuhu79GSmOu58DF5dEFijXO4m2g5lE=;
        b=a/YahSxyhubFL1xTYa0KOVJzHyDSxNzXj1k6gV8TWJdusa3k8iZHN+OOM7vQeqU57k
         9/fvnW7WciLXfDNeoAUEMF9P0KHZlVOAIILKGUs+JMrHZxh3KFNRdOhNUXpWZF1DVbFi
         gSyJoo1GuBceMPeZXdbEOKq84sGJpV9WjO1xKAw5E/MPgc/X6LK5Xu2XTK5iAOGi0gEU
         3yJSrxewpMKURxACXjk5RhXNnnO3RQwapMeLeiXFxYEpeLCaSd8f0f+mPzRQFczRWhi0
         zA7XTz6ooQ/PbeQHCxTdoBJqr0cFa2vO0cRYkHNU8OC9Hf6hpnKU8ZS3phfqvhhENGyV
         QMQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBP8oqiUa9TL10h0qhn0ZfcdQl6exkXhvPmacljT9PWtD50BkzbZWAgmBbDNy4JNwyYLnQbHLfKMB2EOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRY5iHckTW6AVQY9VPFgKy/Lv3Hu+PdquFbC28tsNzcIp8ZvoQ
	IcruMRvpNxR9tP/3UfejebvuQDzinWD6OHA7jCwlfuuwbC6gsyimf9yTYCAJW1o=
X-Gm-Gg: ASbGnctJYvE7xSFreuroDQKCAa/3sr/HHSw87M7CtN32DpRbez0JYMjUQfdWHu6yt+D
	YwP6gifVcHiVr3m6z3ihwB/oQVgXPxJeG3Nhht2xEBn3hv7m1Pe3VHKDtlmnJqDVgtAKr4BXhvu
	aTn9RFlCIjnDh7vnTJu3FnRILhDihhhBNfrW32lvnmNSN0aiRLtgl1zFIe0SuGSKFg+Za7xZo8S
	xoXy5R5oszlFz5dADuVtkUJKArFRXL2d35eUs9vPVU8z/0LtVH4Wt3GfaKlsqyk+OxhG75HoWK3
	8uZlf2uOOwDDxkgSlTKuZaI42fdjTkqnmAX4YjxrpA==
X-Google-Smtp-Source: AGHT+IE9Eww3HoH4RLAEaMq6rXZiNmV6E4Np474my0w4C0bQJ32+oOoJCrbqu7P7aWjSR6KjdYIX6w==
X-Received: by 2002:a17:902:f690:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22c53618cfemr152910315ad.41.1745216406731;
        Sun, 20 Apr 2025 23:20:06 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fdbc5esm57552985ad.222.2025.04.20.23.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 23:20:06 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:50:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Nicholas Chin <nic.c3.14@gmail.com>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, rafael.j.wysocki@intel.com,
	vincent.guittot@linaro.org
Subject: Re: [PATCH] cpufreq: acpi: Don't enable boost on policy exit
Message-ID: <20250421062003.lbxdxhlp6ulnjq7f@vireshk-i7>
References: <20250417015424.36487-1-nic.c3.14@gmail.com>
 <20250417050226.c6kdp2s5du3y3a3j@vireshk-i7>
 <20250417050911.xycjkalehqsg3i6x@vireshk-i7>
 <CAJZ5v0iO4=nHcATzPyiKiWumdETFRR32C97K_RH=yhD--Tai=g@mail.gmail.com>
 <CAJZ5v0gcf07YykOS9VsQgHwM0DnphBX4yc9dt5cKjNR8G_4mAQ@mail.gmail.com>
 <CAKohpomN1PYn1NPSsxCxqpMfg-9nYgCRQD6dFGQ30B+76vneQw@mail.gmail.com>
 <978bc0b7-4dfe-4ca1-9dd5-6c4a9c892be6@gmail.com>
 <CAJZ5v0iwAsVnvYKjKskLXuu5bDV_SMpgnTTy0zD=7fgnGzHQnA@mail.gmail.com>
 <CAKohponCr6pwgmK+J0WnvY_VZdDhA738JF18L518A2MKJVQLmw@mail.gmail.com>
 <c704850d-1fdd-4f25-8251-5bab03f055bb@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c704850d-1fdd-4f25-8251-5bab03f055bb@huawei.com>

On 19-04-25, 17:35, zhenglifeng (A) wrote:
> Yes, the policy boost will be forcibly set to mirror the global boost. This
> indicates that the global boost value is the default value of policy boost
> each time the CPU goes online. Otherwise, we'll meet things like:
> 
> 1. The global boost is set to disabled after a CPU going offline but the
> policy boost is still be enabled after the CPU going online again.
> 
> 2. The global boost is set to enabled after a CPU going offline and the
> rest of the online CPUs are all boost enabled. However, the offline CPU
> remains in the boost disabled state after it going online again. Users
> have to set its boost state separately.

I agree that both of these are valid issues, but so is retaining state
across suspend/resume too.. There is a difference in a user manually
removing a CPU (offline) and suspend/resume.

With a manual offline operation, the code in cpufreq_online() is doing
the right thing, default to global boost. But the user configuration
shouldn't change with just suspend resume.

> IMV, a user set the global boost means "I want all policy boost/unboost",
> every CPU going online after that should follow this order. So I think
> the code in cpufreq_online() is doing the right thing.

Yes, but any change to policy->boost after that must also be honored.

> BTW, I think there is optimization can be done in
> cpufreq_boost_trigger_state(). Currently, Nothing will happend if users set
> global boost flag to true when this flag is already true. But I think it's
> better to set all policies to boost in this situation. It might make more
> sense to think of this as a refresh operation. This is just my idea. I'd
> like to hear your opinion.

Makes sense.

-- 
viresh
