Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A21D2C3251
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 05:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749013514; cv=none; b=jxrdIRvx8Om47DCQRfdoHas0mbX/BL8SUIsdbTFB/DFgc2ifI4AdXlkfXfB3PmE0y6Hfzn0DW7yJ5PpLbocqFBLMeZEmGumctxgTCrG3R6R6pCedQmh+p2Bl7361PsOzNaHjlWqgIfPwNiB0p33elgVjyopIQ8K/0fH+9uuHFmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749013514; c=relaxed/simple;
	bh=oA3MRedGPBVe6U509o6DPJrbwU3SOykR3KqdtDRO5Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQB4MmvuksQfH7QxL4dTXqPUhZP78963s84qIcpXNpHQq3y2tq8gtbxjjFC28OL0cyqBqnpDYsITqf9ruk01KgzF4XD3gwKZKppydi8m5lkbeMVun+z81f55F6MlO3bTcztRRI2nHEFFLFWEFvTMPLnmtJhOvg6EID+F9ObwoME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xxjlpuOB; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xxjlpuOB"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74264d1832eso7132217b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 22:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749013511; x=1749618311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=arr1cIQDWQ85UNxT0vXH42mAmapJQ1QAA5R92t31ZZo=;
        b=xxjlpuOB+TbsyS62OEgsmjSg/97Kqm3w3OA564CYI8zS44VWPa7cE7rICoIglIBH4+
         f5u+QontORjDtozfMrxmRMSZgkoz3yoSnY1VMiW3Xi6iQjg471ppPyAzhYbTORBlQqWH
         N/OxsoDvugvtUR2UKUQAhipB5hDnvOKecPH8eU0U+ddpy6i6FCry5h+Ns1oPq1/T2Lbd
         tbn+DswX2UG5NXQ9PpCeHUS2EKvzz1qTgrg6mkZFBlANpyGkARZRrYbytmzIbObgTJP0
         2g0bYOrF5gnjyNN31YCEeiZY394nJ0jk70ubyZPaSWTwvIFPcr3/oT1QdBLM3e1cCFnE
         uvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749013511; x=1749618311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arr1cIQDWQ85UNxT0vXH42mAmapJQ1QAA5R92t31ZZo=;
        b=j7Pgp+TfOu42DEvxtMsz45dfWt5cQ6qglKBvmhob5L2KtlL3cWEOsJVYfNZC9FFOdV
         VCkZm+Ww1X0du/aBnEYE8W94qCE442/xdNuV5Y8rbNiebrXi25SDvLMUpaO/QKqCBXqD
         kvvfP0qTWTp+swgq/vArCHqjPwprho3FYM4wGGjSZEQfEW6Zl5Hc9+d87zbu5pzB7tF1
         T/yADSuB+svWg3IiJw9JkN4pzWEwPq/xRl6KMUv2dOO2XjZf4zweL9sEvxHBPPv/gSf8
         SxiTS1neeVVyzYECGlKG0i4Iwk+i5CgIdo+75mYxLElQM3Zrwwk596yLoSxbEKhByXwy
         BWfw==
X-Forwarded-Encrypted: i=1; AJvYcCX5bADkNPZUlenCxyciHd2ACx309TV2vlWY8EhbZkj6Kdi5JF1BqOZk/MnPgXY1ODo1rt5O3s1aC9au34I=@vger.kernel.org
X-Gm-Message-State: AOJu0YycrjvOTRz6p/fFtHV/1n1n3t8B+ZXJaDRzwFxOvKUYL71uX9J/
	eEs5PZ5yNlA6tHiaf3HQa97PXfjX104vZxz3pWzPlLQA05Wehl3mufyVWA+FDiOU/SI=
X-Gm-Gg: ASbGncvSkDQTjWge3pJQSw4DO/lbz0VurwJ0YMIXGcN8sOo2H8g16BwTrvKTtjlmt/Q
	8+Suf1ZOFYkOlO5gThHzTz/LcWg7oUegfkzPZ9X4+nIm2UmXxvWz4EWCOS1qh9cPAFcomGQuueO
	2K8ZDnRFHE72k/DzS6zsgP4GrXmqsMfe0qnndKzermZtKQEdhFUFkzbJGTzj8ZfK9AsCyiBrott
	j/owRqpx+tfnmeE0LGm59Gy0UUqgD6YtpwHE9p5wHbohza0Y2cLFe77UAaONAC0m78nud0H96zW
	E6H+PGGuYMYXqgCqYABdc7JXifQqq5s6CwNXGpKeSukY7WaLNd6MdTg9wthUKfY=
X-Google-Smtp-Source: AGHT+IGXoCzXSG926c8igF9Ar55RaA8MOKgOfyKdu8B04UZV+x5lFohpMa4DlNWuLNw1egbXPvIZyw==
X-Received: by 2002:a05:6a00:14d4:b0:742:a82c:d832 with SMTP id d2e1a72fcca58-7480b4650abmr2704742b3a.24.1749013511524;
        Tue, 03 Jun 2025 22:05:11 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed33casm10249004b3a.73.2025.06.03.22.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 22:05:10 -0700 (PDT)
Date: Wed, 4 Jun 2025 10:35:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Fix struct ffa_indirect_msg_hdr
Message-ID: <20250604050508.wvxggosu5tcwp3ie@vireshk-i7>
References: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
 <20250603-jovial-whimsical-vole-029c39@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-jovial-whimsical-vole-029c39@sudeepholla>

On 03-06-25, 14:00, Sudeep Holla wrote:
> On Tue, Jun 03, 2025 at 04:38:53PM +0530, Viresh Kumar wrote:
> > As per the spec, one 32 bit reserved entry is missing here, add it.
> > 
> 
> Nice catch! Not sure how it was missed.
> 
> If there is no objection, we must add
> 
> Fixes: 910cc1acc9b4 ("firmware: arm_ffa: Add support for passing UUID in FFA_MSG_SEND2")
> 
> I will fix up when applying.

Sure.

-- 
viresh
