Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F52421D3F5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877223; cv=none; b=UgZq7M+GNJX9NposdfbGrealhiZpGdYauvfLuSjdVm1Axf1WQhaA1imMd/gVSYUW1ISGLo3/q2P3qDh+4+gmsZsgDSxNBUU5ONzfGwALXvESkSHqMCMjcGaTQsWYrqFnmWnZb20uPe03cmncLQme33Orz/tYIop5t80EwONpp6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877223; c=relaxed/simple;
	bh=oQW7F29atGBld5YpHbUvVkkrHeYES/dxTGRbEkLyYvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6wwtFCQW+HNSOE6a3X8CA6T4uM0Tt9JpHcAt3bkk2M3GUOAGxHjh0/IX25wvOJj7571nyOyaK3PpSuLum34u1iJNgLj3wQT7sBiNDi+dx6ItIE8hwnmTj06dASgW2ZFkbhWr0Vc1MdTydp3FIOtd00y1HOUtHKUFdsGROWWmC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N6GoVa5G; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N6GoVa5G"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2241053582dso7218735ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744877221; x=1745482021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbStn/1mMmnWgEwNfLXRh0m0K6lLNoUi7YPIyXHV8Io=;
        b=N6GoVa5GgRHtKOg+65A/d16DuSfFzCPhjYU+xEzMy6acQfPrIJ/pxlJf6rCCITZKnL
         NgFaajcOk9FVWDA9JWQ9fhB7Eq4ZNVJ4qKREa3gq0tKsgKyXE5lO39NgatufJJxfgEIN
         xfykB7SC1pE4aQ73x+UkuBjVERaqTPXxvTTGCDjysMqRLUtEIHSfTnyzSqgiydtYJ3W0
         +5/Rajn4N2VMHRYfqB1nZ1rUcgI90l9DEtLLgrdhRqQ4w9zbPpe9Ao+GEwtk0luRlPY5
         aeMchopLh6ZRub2EWdJRqhSFviYy9AIyWL1YjAUVKlohMOsPtL3bSZ6OCeeyVh4Uux3A
         +klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877221; x=1745482021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbStn/1mMmnWgEwNfLXRh0m0K6lLNoUi7YPIyXHV8Io=;
        b=NgaXrGfD8m6y7W/fOosy3L/pmqMDDpO6XZEJZFyLjrdE7+KKCcWCa6mwpYz/1Q5/9I
         FNWFjb3yK8YHPApX7FeKu9/DhqkAxhXanDf1bpqJ/DW1sDIrcCmJOQXFsOrUBg5f5WdI
         YVmxbhX1WSSP28ctdlUC9U16b9ELCJ5dV/ivUDENvlHqDSANCqqv8sjENpJEA61OA8TE
         FX8aJb4OdDM/g1xwkg8XVpfu0toe/uszSv3mELC3TFgkwhcQz6q54pl6WhszEcncN71P
         OS9fJvrzCvUtqJXTgaYktTOHY2WNMBEI0H/QiBP1CxcYNXsSZfw35rtzHz0XkmZc+T/d
         Jvug==
X-Forwarded-Encrypted: i=1; AJvYcCVgnKQj4BwDtf4f5M9Eq3LLcdhVRagvw+jfvJOV9SIaw14nkDGe+sxTLxLT7yYJuVXMb4qi+hOW41CM3H8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6qi+reOYzjQC0UmAhTU/WtxqzUVftA2Ph/D3P1SGcg+joMb8W
	d8q0V7qZAVtRgG7u92AGm6FYIeaC0CeEgFGqToCvLUJB7Y2lNUdoJlY4YEhMnB9j44kxBCNYW12
	1
X-Gm-Gg: ASbGncsvVzWHfTyQpxbSFShGzSkT2lHZx3KyRvXPf8F+0MLq6qS0hWjcQ3gMtXbJqYc
	KmwNInRYFWsCYLTn4lI0eIDz33u9lYSROex3MFrMleipXDlVvP8f58vsD4Hzu85TQCY5u+StCtw
	/XtBSy4jvY17w9XuXk9Y5zakNpgNUvYBNBrJmPvEJ9XW2mNNOavD4ZUnanzjGg4dkObWdUkPsTP
	XV5+s8gobcl4fNbEuC7cW4BMBor2bSq6XWJKLQaI7pUuc1zv8PKxv5JKHNcZafgQRnUtpYif/UZ
	BeoO7wZlhzHvT+pTipA8NsJqVYnMZFazHhm9ZCDr7A==
X-Google-Smtp-Source: AGHT+IF8kAlRnm7dgvBGiP4dp8lCId2BiMHsLBv02PsMCD5r3qOQ9HE9u6StR0v7aFBT90CEbczcwQ==
X-Received: by 2002:a17:903:41c5:b0:223:37ec:63d5 with SMTP id d9443c01a7336-22c35916c6fmr82576225ad.28.1744877221505;
        Thu, 17 Apr 2025 01:07:01 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef11a6sm27376855ad.23.2025.04.17.01.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:07:01 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:36:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] cpufreq: fix compile-test defaults
Message-ID: <20250417080658.dccdn6luc5ss7dgt@vireshk-i7>
References: <20250417072838.734-1-johan+linaro@kernel.org>
 <f151f848-d337-4bf3-b88d-8a032e843ae1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f151f848-d337-4bf3-b88d-8a032e843ae1@linaro.org>

On 17-04-25, 09:56, Krzysztof Kozlowski wrote:
> On 17/04/2025 09:28, Johan Hovold wrote:
> > Commit 3f66425a4fc8 ("cpufreq: Enable COMPILE_TEST on Arm drivers")
> > enabled compile testing of most Arm CPUFreq drivers but left the
> > existing default values unchanged so that many drivers are enabled by
> > default whenever COMPILE_TEST is selected.
> > 
> > This specifically results in the S3C64XX CPUFreq driver being enabled
> > and initialised during boot of non-S3C64XX platforms with the following
> > error logged:
> > 
> > 	cpufreq: Unable to obtain ARMCLK: -2
> > 
> > Commit d4f610a9bafd ("cpufreq: Do not enable by default during compile
> > testing") recently fixed most of the default values, but two entries
> > were missed and two could use a more specific default condition.
> > 
> > Fix the default values for drivers that can be compile tested and that
> > should be enabled by default when not compile testing.
> > 
> > Fixes: 3f66425a4fc8 ("cpufreq: Enable COMPILE_TEST on Arm drivers")
> 
> I would not consider original code a bug, but a feature, however I am
> fine with other choice as well, so to close discussion from my side:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied. Thanks.

-- 
viresh
