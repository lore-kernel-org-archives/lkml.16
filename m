Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25221A8F60
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 07:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748849065; cv=none; b=DHT5F2XXXdCJBTfs8ahAsOxXfJ46B6UOw1sicpnR6P/jJ38p4XdgWvYi7+rnQvlLH3g4jYtEZuaOTC3L5lXtw0CtNapCQnArwxSoVyb3fkhq+AeERPHhLV8en9WhXTyTmnfT1faucd3hNcyiWGHSkD7oRG/PvK/aZCKcnXFKXB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748849065; c=relaxed/simple;
	bh=Q21PoUgOrkYVhLx1T3USs15A8eDhsrRdYr+FrSfT+1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfCINuPqU3JGry6eMPBBpvPfQprvus5pdhHTkp+JNrPetkS2yX443jcxBDEcltKLH7p+v66cxCPAT+jQTh7xINxkdZ02qaWCzSM/n9HZqnAk48+cytBzlqQfaEEV21t06zk68633KPMz3HhCItjhVrTNOjPJkKoLDmCceiOYYQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yiVj1q2F; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yiVj1q2F"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so43382955e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 00:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748849062; x=1749453862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx0RaYDb88MYeeNdBYIWya8sxL0SHlDdzkxwTt2TDWc=;
        b=yiVj1q2FM9Z8AaN/mMdWYDuxgzf2QZ3dBN7R+zzUPbG2YPdGDgyowIa2qxNJY54CC1
         gBBY4uk2uueK01HesT/E2uWjQPX1mH/hryqusENNSomrHrZeUEXNEUggR2GyQkHQnEta
         JmC7PRsIPh3Za6E56KSVhPJdlJceAJ8YGKixtsGOa1+D94NvjtyUbCaDd5cUxCzd+XIN
         mmXD8BAgPmvJ2ReSYFb3IZAvyYHhT0n6VZZBVECg86LVFdrbB0QdQG0MXnGull7eaHbP
         +/1oAKdlOv3iKAIpSIsCAyTviyB/MaVli3GIr8rAUip7VW7ud75g6x8znXgDcR4TuFex
         OtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849062; x=1749453862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cx0RaYDb88MYeeNdBYIWya8sxL0SHlDdzkxwTt2TDWc=;
        b=w8zJchTME11IxFcKnHkf0CHpdvuLoAR/s8IOyu44HK1yPVodTOWDbXggYa2gIQcuo6
         E3Z59i5Ja4aM/R3Ow+C55tCa4YWzde3W5Ukpx4PhjL11l4a/wS3rsEjb8ngUZJw1+HY7
         03/EMqKTOjgLgnAc9pfkwZKFrspsjtMwbZczYGbId7dyxooneK14Fa7X62ilLXic7/vs
         keQv9gargGRGflDulsV48nxPh10SKMxbQMO7bLYipQvZiNsccrmMiagkubFcRSdsmQVZ
         GCNSnB0gCUq8huv9teuZpcmhWQWhyLZJ+2A3MLgnwv5JJTK14cR+Liq8xcJJaGygEhuH
         o2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5WKeQzgtOVYP8/KoWjRNA8saZqo2d6wg6Iq0SsnWQcRbeB08NY8VBIqXEZCfeZEkaHMRzhc462+ALSq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYMrQR435FuTmyJBOEU2tDnXDoBgIRfOTiw8LdyPv+hoAAmyQK
	Q8J6mJgoR4CJVvpRvuhOLl0ImKHxAg6TvPQTqZyJh+iRT9Ho70tCLEyFwT63j1ZpxWo=
X-Gm-Gg: ASbGncvUvpZKgm/GH0/tDScT2lGOP+OGKa2zZAiqu8fKN5REgyquPBZcowoRC3Mt00R
	EJR5kghY4b48RcBWmA0E9I8Ya9Lk+gGwAWNKQ8KYEOU3Zkllsq/HLQ7rwY/FkDI+Omgq3RcQGAM
	cx4IRtkRvRmN3swuCxBhmepOmEsndiCAr873VaVk+3x5xJ8BsWmetoChTB0dCjZtmxmvPiRFidM
	AINoFOfD0ABVNidk3vepZA6ROIeDPzfl0/X2SMmJOJ6jCnWQZkPGGifSs/d6I9oYu/2EI74RqTy
	Zdfy2cYG1WaDvx6NaCXnpfz1Bxmko14jAAArOou5T6fTCEQ83kV7QeI=
X-Google-Smtp-Source: AGHT+IEVNyhdFOejr0L1LpDA1g7jRxs4kNrwm5NxBxAJbrQF2oeNR/IcwKlZ4fxQVZ9FMa1DqjLp8g==
X-Received: by 2002:a05:6000:144e:b0:3a4:d6ed:8e2e with SMTP id ffacd0b85a97d-3a4fe395675mr5771680f8f.41.1748849062063;
        Mon, 02 Jun 2025 00:24:22 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d8006952sm109189995e9.32.2025.06.02.00.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 00:24:21 -0700 (PDT)
Date: Mon, 2 Jun 2025 10:24:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] kunit: Add support for suppressing warning
 backtraces
Message-ID: <aD1Roe-z6o1Y5K2V@stanley.mountain>
References: <20250526132755.166150-1-acarmina@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526132755.166150-1-acarmina@redhat.com>

I like suppressing warning messages but there are still many cases, such
as mm/kasan/kasan_test_c.c where printing the warning message is the
whole point.

We should create a standard way that test bots can filter out deliberate
errors from unintentional errors.  This would also help humans who have
to look at test results.

#define intentional_warning_marker(type) do {				\
	pr_err("Triggering intentional %s warning!", type);		\
} while (0)

intentional_warning_marker("KASAN");

regards,
dan carpenter

