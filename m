Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3079E22318
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749784614; cv=none; b=mwfCQwK4/5VqbBlCRoAW38CftVBt8sIpTeq8Sm0fpV9v50FSxnHPadCdLnBmdEpDG2TMy92iGFpwMIskI5l1WqmN0i2jU44mCp9cg1bludepZh3vKKMxUUmxf57/bnfhy1SzUhTme/ehAU3Xx+milG8XDJsmH15Sh2wTRv3s/RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749784614; c=relaxed/simple;
	bh=TulGS3xeFhRMM98s6deFwT2NXoIcoFFPD7Ay9V9fBBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UE+BIfMmrR6SWLcON9m4QHZkNmRurhHmc390KNK4cUGawQQ7lw4qO2pdiQ0xvqUepbaMpJ67hz7b4Rvw7phpkrlL3tOLQwwd16JUx4AFzUF6ENKnkJnT1qxPe29mFCEQG5B0Lb8QoHfHQYR8hDn98c/I2+GujosEcfxpxJQzmOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YfRTC7l2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YfRTC7l2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235e1d4cba0so16358535ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749784612; x=1750389412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap98I+eDUm9/OncRY5L40akvtMUL2MyqVOzfhknq874=;
        b=YfRTC7l20mMPPz88rdZ7bhGYZXtGVY2nQhj2F5VqjEw748yMrVXeHgyXXrPdpd2QcZ
         hpO3ClaS9YXb5Q4GvRfv23Vkx1Anuj6r0OlkXb9lLLwu3rlcxdzi0naT+AAJ591QNfSw
         kVH/L29AkU/aK8Mh1D0gCnr/KyqrxnU0l3AqUFSpjE2HQx7J2ghiMNRvS2cbSy2sC1wR
         Xe6GhXT/Xm1CvQ+L2yDfR/e1tPLtUqI7m9yFBQaIvypGo+TodIHXBJ+YQjXs4qjUAZla
         NPyHbMNruzisDZe9+4yluatuGbfBaPoPhFqJMC3YdYeX4BoYCnyabpHiNStQFvdSEHea
         rG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749784612; x=1750389412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ap98I+eDUm9/OncRY5L40akvtMUL2MyqVOzfhknq874=;
        b=j7YDow8H0FXRoWuAtqlt2eVHF9I/nRCJ1VPpcdAQ+ZrPwzgxQLBRSzi8bJYzo/1NUc
         Za5NdlLBY34kLEem7Jeir+KMG5AxyTvbQKQ+3NAwuNMlSk4ktLV+P9vxJA3zxCPdXaiW
         0TXlYHQDT9jmHAI3u5AXaCeo6kgqpL9BKGJSRGUZgtQblpvaPG2u1t8O/fu9PZOyp1ce
         z0yqPtF5GDXyePKDqxwXHWV7U7PZ6oC07uf5AkmR+bbF87m8VWbVrrtsCwXLYtFqDKSa
         Es4GZomOxOyYC6htvvUXuPxb204FygO/HkzzC348YQkTKuhXBlX9Ad9JvveN16y+bUM+
         Qh2A==
X-Gm-Message-State: AOJu0YzR4Y3qht/lXiC1LuKFnyj3Q6+EO0gpGriiRcORIzISwfk2RLFy
	EU3jJ6Uye9atWMFHkhcn3d7Cr/oyMqOF+mSKfqYWpMn5xRQ/u6blYd+eN/SCawRL+8c=
X-Gm-Gg: ASbGncvx9rvNhAxieKOkXWA6bjFE2EsT+RPT9N4ZPmdflPMGvoP7jB8cD0em9iOSeVf
	g/ZCdLQ3J/sN77RccQzdEapeDSD8JydVJVc3M5tDz/XAVjqlaJHAmuyBJywNU59UEIRvjysiSi3
	4/AM7RjMHcXAhubOxDN4mhiVKDDLP06dzdtlOZeDDGGqENTviMa5iU06/Ltg6tmsbB2EMRC+R7F
	hye/UnnRih1HBW7WivYVlMs9b9mspRhvAFmiT2hVVL93BW3MGqhLsrDtWO5EfWtkqKC7vZLne3N
	d3sRM5ag3I1ipwBKsFCrY/nZGIcUMYyXYnM9tuXvy6Sd1TcaRXAhG1/NsD8jyLc=
X-Google-Smtp-Source: AGHT+IHNXC3txXNOUer9QYDOQjxZSJ6IgCaYAHTJUBWcCsiS3vra7fop+grtC6B10VdAfwH4GdqnXA==
X-Received: by 2002:a17:903:228a:b0:235:f70:fd44 with SMTP id d9443c01a7336-2365d8bf339mr21709775ad.21.1749784612494;
        Thu, 12 Jun 2025 20:16:52 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea8fe6sm4650285ad.164.2025.06.12.20.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:16:51 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:46:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/4] PM: cpufreq: powernv/tracing: Move powernv_throttle
 trace event
Message-ID: <20250613031649.lj5zdvw3wl6dtfft@vireshk-i7>
References: <20250612145310.563358597@goodmis.org>
 <20250612145407.906308844@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612145407.906308844@goodmis.org>

On 12-06-25, 10:53, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> As the trace event powernv_throttle is only used by the powernv code, move
> it to a separate include file and have that code directly enable it.
> 
> Trace events can take up around 5K of memory when they are defined
> regardless if they are used or not. It wastes memory to have them defined
> in configurations where the tracepoint is not used.
> 
> Fixes: 0306e481d479a ("cpufreq: powernv/tracing: Add powernv_throttle tracepoint")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  drivers/cpufreq/Makefile          |  1 +
>  drivers/cpufreq/powernv-cpufreq.c |  4 ++-
>  drivers/cpufreq/powernv-trace.h   | 44 +++++++++++++++++++++++++++++++
>  include/trace/events/power.h      | 22 ----------------
>  kernel/trace/power-traces.c       |  1 -
>  5 files changed, 48 insertions(+), 24 deletions(-)
>  create mode 100644 drivers/cpufreq/powernv-trace.h

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
