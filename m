Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9356C1531C1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666245; cv=none; b=rXnbKPPImXBy1shP7EyeM8bDQsy4uMd+zVEVOc9+F2k+Im3B89VIXYenPyOPNfxYHz2GsXA6tYPMOdRTVS6FiUtIOy4T8k6pPsBGe/s/X1K1ekN0YDnD6+a2O39Y2mWfHK3TmrjUYWR7/emG53pNAk8NuqnUCGNzMlrCSpDzjOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666245; c=relaxed/simple;
	bh=FRct19OAbx0JJ/siNE7NxXqvXE/tfxAwAybWkm3Xm2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNi9il6bJ6EM0GukrI0AKV4zSXij08Bfu0z+chqElYfQLd/qOGEGbAW+MhV0wqTezuF5PFThPAZJB7KEYOhO37pSQxrBiJBsfNu519+meAoeqFTNbG6VG4g34yuJgBfoq8FFalcaIEuL3oSrFScZtZdOdKoulQw5pIxRUGGfrDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PC31B3Gn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PC31B3Gn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso3332381f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750666242; x=1751271042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CdbQQJ+oM3Ao6FCPJJXeLk0AYTnG+ErtpUOCanma8hA=;
        b=PC31B3GnQG+jsi9XfkD8BzeVf4Y/S1r9/+vlKDxBJiASSpip1EQQNv5LS+QZgXRJeA
         kWmzSnu+JzRku16GFgT/0aUcsKqeFXOO1uCPuYzD3a9SmsDbaOAJRwK1o803V3wjhm1J
         BqpwW+W7nETJg1U50YWe7HK7f7fc1aJNpOMLcM66MKpFFZAI/GMYmJoUOdKmUe/FxRxW
         T0NCI9l7xN7JdDfHbgF+Y5+F1wTXDoVQqwX/eeh0XU0TehbQsfyHisvzfuyxZx4JhtMi
         oEP0fFb3U9+Rg9DUg2Da5hVsxX7SuyNgUL3XGYXLxhaQ3X9tP+6uYa7RhpV/aF7PlWw4
         SpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666242; x=1751271042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CdbQQJ+oM3Ao6FCPJJXeLk0AYTnG+ErtpUOCanma8hA=;
        b=SENWADlDq7BQbO7J+8aDqjOkpVNUQ/v9lKQ9tUIko2J41RuJWHxOhtE6jw/h6UcBzL
         dV/6NSs/IHE3aWlGG0eYnLipPFo6GALHHujOQziFxsg6dvgDSxa49qUUqphK5RBsWBWi
         iOlPcLL67nULUTEhFMH8oZeK7DwZ95dp/tvjvgYVV9++GB3Bh91AvQvv5W0dqzXiNvWX
         0JtlRg7GV4y8/uLaH9Ij+QmoO/l4go/pJFwpevtKs7GSV4Gs+XrJw+dqO5hQVQt7WvTs
         bNTi6yxvBinh3bSq4xr/WiMhVjp0DtFeckEDyABtH5xQFyKUg8HcBJagoe0b92zVnSuX
         MKqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6AZn0Zx1LbWcMDWmezBShQxNFzA1BgiF79dp8OICSbwZHz6F6DigK9bktKkLggFb9sp08VuezaatzqwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx802cANs88R3R5WQ5uekp2LNUxHGuDjRtAMWPMQnmn3EZQ7i1f
	PJhVa9pFtHhIH2WiwDrIthTY9DkIZILX7GUq4qQSRaRT8MdpqkcTldoYdmMFrZXevI4=
X-Gm-Gg: ASbGncsA9BkRDN+HwGNt5Z6A4c2OGySEjtADBXmyJT9AwuPjEZJjyI2arnixInrLpPp
	rISQRQaTsBYqNVFNL3D+JkFTFO66Zg0y0HViJoLSI/t/dtGOZM8wwYwCbSyxsC5h9FPO3kFhKh2
	aLAI24EWrOZ7C8wYgqYabelNlsjDTrRfKZvg6G5KEekT9XvkPXtjLINmlt/PkVjhV+ftPuNVbg0
	3hNMarMzCV3lAF+K4NNIocyKRmSgX/Elew5DXfh5GFVRG+1JjEOLZydIc6hmtLlZI16J1+LNBw3
	DorrUq8qOZCqtLTRvLxFXKd2cxtd7zxp5TKysfW2QVw0zs8uCyHNIPCdiKT871nnmCM=
X-Google-Smtp-Source: AGHT+IG9/WCgHCRLCRdBfUm5EF+Cuc835GyTFmEmRHyzreAZVR+wonfkISgnq+jwxtYSzmlRlgOmfg==
X-Received: by 2002:a05:6000:310a:b0:3a5:8cc2:10aa with SMTP id ffacd0b85a97d-3a6d12fbab7mr6880864f8f.32.1750666241927;
        Mon, 23 Jun 2025 01:10:41 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f17d3bsm8685301f8f.21.2025.06.23.01.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:10:41 -0700 (PDT)
Message-ID: <6f524405-a9a7-45c4-bf4d-9ae33e52bfbc@linaro.org>
Date: Mon, 23 Jun 2025 09:10:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf build: Specify that spellcheck should use the bash
 dialect.
To: Collin Funk <collin.funk1@gmail.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>
References: <e3751a74be34bbf3781c4644f518702a7270220b.1749785642.git.collin.funk1@gmail.com>
 <20cce2b1-eaad-4565-817b-b094aecee0a5@linaro.org> <874iwa71mo.fsf@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <874iwa71mo.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/06/2025 6:40 pm, Collin Funk wrote:
> Hi James,
> 
> James Clark <james.clark@linaro.org> writes:
> 
>> If we're enforcing bash style with static analysis shouldn't we also
>> change all the hashbangs to bash? Recently there have been changes to
>> change sh to bash in some of the tests so presumably the hard rule for
>> sh is no more?
>>
>> In the past I've had to replace bashisms that didn't work in sh but it
>> would be nice to have only one language to write tests in. I doubt
>> anyone running the tests today is running somewhere without bash, or
>> that changing it will break anything. If anything it will fix more
>> bashisms that have already been written.
>>
>> Just for reference there are 34 #!/bin/bash and 42 #!/bin/sh in
>> tools/perf/tests
> 
> That sounds reasonable to me. Writing portable shell is a hassle and if
> we already assume a working /bin/bash in some places, I don't see a
> reason not to use it for the others.
> 
> Regarding this patch, shellcheck will use the file extension or shebang
> only if it does not find a 'shell' directive in a .shellcheckrc. So that
> change will still require this patch.
> 
> I saw it was used in other places, so I assumed this patch was fine:
> 
> $ find tools/perf -name Build | xargs grep bash
> tools/perf/Build:	$(Q)$(call echo-cmd,test)shellcheck -s bash -a -S warning "$<" > $@ || (cat $@ && rm $@ && false)
> tools/perf/trace/beauty/Build:	$(Q)$(call echo-cmd,test)shellcheck -s bash -a -S warning "$<" > $@ || (cat $@ && rm $@ && false)
> 
> Collin

In that case:

Reviewed-by: James Clark <james.clark@linaro.org>

And I'll send the bulk hashbang change separately.

