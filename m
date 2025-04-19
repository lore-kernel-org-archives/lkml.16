Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D232418C004
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745049292; cv=none; b=j20POzQ9CgjyHJSARIvar68PsiIyrEAW3+3/AqSkYZIMeiACJHSlqsCBLMsX0h8IObwq0PvhQ+RnjT/Se7h7VL9UcxKJwhd2oIX4kI7b1vmBu9CR1Z9K3g2Otzror9xSEeSNQZp/wGxVGL/vwWlCtT8kYQJeEyhSORLf5oopQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745049292; c=relaxed/simple;
	bh=LUxbgbJ5oVx1nAwshmTPPLRQRILWjjmsG7cdfT1j6Ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GaoZTW21ivsFNr17Im+N6yzWT9K+4w45SK90159Y2DtejGjeAM3cb8OHOce/IFcYhC7c2hCV8S6stmf/sOR93Gsgcrtanind6yQCIS7IlaGKh34w7bFzaIqu+yPeo+oDO5ZmDtrOcZ7BBF7Zv2696VhxclAKVfWdeEd5S1gU9DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FxoB3G1U; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FxoB3G1U"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaecf50578eso380099766b.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745049289; x=1745654089; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zb1bzIRjEgSOs4CWP1wIyg4geR/sfLMqOdhecmna95s=;
        b=FxoB3G1U8+9MEviwUsZUwnhcd9GGre40YPkm+zlgIDFokdJm0v6JjDbhtp82sIoreL
         qw4kS7QUw6r0ikuamCdEM2vx1Am6r9Yl7YBieSrXmEYvYHEGJxgXtIuIAF2p+0rEmeLV
         ay6XuB0oN8N5IM/xhnD3pQqKAmC0Qf6ecSIqildz008GRC22UkaP2Rjcdm4lksx2ZBEN
         ahLbVjfDfFciD3oelhv42cZZyxar4Tg4+xDG8jUVQrgW+/LzTaKYbA+0XB1BVjKyZ3XT
         rThnnW68DHpnfmiGD0TojVt826QIzlEVEqLKk54nT5GcQEor+X61toC3VMwKzvKtpExc
         Jf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745049289; x=1745654089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zb1bzIRjEgSOs4CWP1wIyg4geR/sfLMqOdhecmna95s=;
        b=Yp+jTkf0NhzQneUooB6Gcd7BMfAmYez8x4u83oPRbGNo4Xu66naZ8UNmJ1c/OX0NeA
         tx27vXdUV+A+SKAO1SufdpesvMZz4svwACGbxzhCfMtnbPqrit+nkT6DjkUVWogS29AT
         UY2VNtzhZ72shgWBKIVcMFGaoV4m8vNKRmIrwQFFifFTM3fO5Puwalc6zryRgGPvA/VO
         eIqHgTTIdDv091iaoLTxb4PoFEcEHMWMb0fCCjqMc/ebk6PRA1jTXC4IBHqeHP4cY1H4
         Bm1UnNRbyDEEuOLvInMsCVdocEgENZdAR/U2MAIRy5plkyRLsD50qS4j7T5isqqgnw1W
         SKoA==
X-Forwarded-Encrypted: i=1; AJvYcCUqbXYJhnvYnjcKN+RJEQWo57jvA/liH9b9G9wCmKKH+Zg5Y9QLnGwHkHMxElteJRCmjY5nH6l6EbU37wc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+zHjtz64SKmC0cNdCwxwqZyHbJPhZaUWf6iRTA0SCLM+n91oj
	jF7g9qPPtBINVV6j90MNNIBpOyAKPS1Oh9CMwQnfePWY00i+KqAoSkuVECU91pKfESRVApqhR6B
	ML7WQIVvmctywXXBLfbq1doLkI7acSBFKSk7gVA==
X-Gm-Gg: ASbGncukYpsJW2jjgbAVzhir5SOJIgUi46nvCDkeUNEu6xtqOViQhD+urFCQGgu+A9T
	mKrVldfXw5yaoniuU5/NLhJ1gNpcU96+1SbpWWogBqoLncx6dLVovGfhuUcuqLqe+jhKpXUR94J
	3WAHGO9La0Z2gL5ivCJffJBA==
X-Google-Smtp-Source: AGHT+IGwRNWU0rrwUfT4SLBMOGrqTvfLE5G5jO68k1EuN6yuzFM6vTtch0N2rxVxCh6x+MWj8oc4IU/P86M4a/GNVLU=
X-Received: by 2002:a17:907:743:b0:acb:6746:8760 with SMTP id
 a640c23a62f3a-acb74d9a786mr476426266b.47.1745049289112; Sat, 19 Apr 2025
 00:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2c788c2ca0cab09a8ef4e384f272af928a880b0e.1744781329.git.viresh.kumar@linaro.org>
 <20250417015424.36487-1-nic.c3.14@gmail.com> <20250417050226.c6kdp2s5du3y3a3j@vireshk-i7>
 <20250417050911.xycjkalehqsg3i6x@vireshk-i7> <CAJZ5v0iO4=nHcATzPyiKiWumdETFRR32C97K_RH=yhD--Tai=g@mail.gmail.com>
 <CAJZ5v0gcf07YykOS9VsQgHwM0DnphBX4yc9dt5cKjNR8G_4mAQ@mail.gmail.com>
 <CAKohpomN1PYn1NPSsxCxqpMfg-9nYgCRQD6dFGQ30B+76vneQw@mail.gmail.com>
 <978bc0b7-4dfe-4ca1-9dd5-6c4a9c892be6@gmail.com> <CAJZ5v0iwAsVnvYKjKskLXuu5bDV_SMpgnTTy0zD=7fgnGzHQnA@mail.gmail.com>
In-Reply-To: <CAJZ5v0iwAsVnvYKjKskLXuu5bDV_SMpgnTTy0zD=7fgnGzHQnA@mail.gmail.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Sat, 19 Apr 2025 13:24:38 +0530
X-Gm-Features: ATxdqUGTlqtgOT3m9t68FvMqcpoTJ9KYkwTuyPbedz-dsKJP3aFcvLxz2dDkxKs
Message-ID: <CAKohponCr6pwgmK+J0WnvY_VZdDhA738JF18L518A2MKJVQLmw@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: acpi: Don't enable boost on policy exit
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Nicholas Chin <nic.c3.14@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, rafael.j.wysocki@intel.com, 
	vincent.guittot@linaro.org, zhenglifeng1@huawei.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 19 Apr 2025 at 00:58, Rafael J. Wysocki <rafael@kernel.org> wrote:

> So it updates policy->boost_enabled in accordance with the current
> setting in the MSR.

Yes.

> IMO it would be better to update the MSR in accordance with
> policy->boost_enabled or users may get confused if their boost
> settings change after a suspend-resume cycle.  Or have I got lost
> completely?

I wrote this patch based on the sync that happens at the end of
cpufreq_online():

        /* Let the per-policy boost flag mirror the cpufreq_driver
boost during init */
        if (cpufreq_driver->set_boost && policy->boost_supported &&
            policy->boost_enabled != cpufreq_boost_enabled()) {
                policy->boost_enabled = cpufreq_boost_enabled();
                ret = cpufreq_driver->set_boost(policy, policy->boost_enabled);
                if (ret) {
                        /* If the set_boost fails, the online
operation is not affected */
                        pr_info("%s: CPU%d: Cannot %s BOOST\n",
__func__, policy->cpu,
                                str_enable_disable(policy->boost_enabled));
                        policy->boost_enabled = !policy->boost_enabled;
                }
        }

So my patch works as the cpufreq core force-syncs the state at init
(pretty much what the driver was doing before).

Though I now wonder if this code (in cpufreq_online()) is really doing
the right thing or not. So if global boost is enabled before suspend with
policy boost being disabled, the policy boost will be enabled on resume.

--
Viresh
