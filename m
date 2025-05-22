Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020EB23909F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747909326; cv=none; b=NQe6vQ4vGtyKlnvzI7GusEknTJ4zbwoeAFF3L4WsnN9KHhw9jVXQmAPLeiRD/0ng+eEl0B8wLOXzsTA1fWsEHky4dUBCth/ggNznP2+jPO/tULK9bejrO2vk73MUMiVHqCVPF2Co4imdM1gn5JXo9IEe56XwwI7cMFpche7B+Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747909326; c=relaxed/simple;
	bh=V20yHrW8X4MyLRIXk0raBo1x65PievRFgrXUQPB6FcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kj+xaq+zxqM9vJomcFIJHl1Ny9aI2t2iOi9ZjbQUtaZLMfEhJn518ovkx7ftWXwSZEswkY8QzDkg9J8UINZCJGSqZo2Ldselnc/gJAwNgzWdu8qJ4RNGKSeO8rwbvFuqRd7LiO9mQ6eplanTBVo04gHGYZT+/P2o6f1rd2PjDm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b3HT8Elo; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b3HT8Elo"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a3758b122cso2478605f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747909322; x=1748514122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=67Qieb57C3UpFjA2z2sXKaf0EMJiUWpanXXy2qr0208=;
        b=b3HT8ElonFTSOQbofz+8E7cR0hADGHmjPPXVpgtYgg/qBLfzYOCoa848q0MU66bqUg
         zFzdazUyrdcPROtVQuu/l5F0KHWZ1tnQ3jsZpm2h+1XpcQ/YJcz2ncI9bTWP8gtAvrZU
         hvgSfMKwAtoyeNd8CJVZzyfP7pbfqQkyogss1u6hkdPq40KhBNhPOVp83jO1jZzhdc1g
         bUpkJ4WggbpoBLfHHPjCEKpd026q3Acg6c3oNPdDnuIUiZiG/MMDCPcqDoESVyiJ+VJh
         LzLIGzpA1G3Fv6tlAx14m2VnRHX8N2ndgdTxe4dqoxNbhiCCTMXBXo/VI8gIAJzBmozW
         4zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747909322; x=1748514122;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67Qieb57C3UpFjA2z2sXKaf0EMJiUWpanXXy2qr0208=;
        b=MrrzMBnuH0d5eQpfLBm15kbHyKSWMbLFoWXwOVDvPBsAqr+SuclGVGTaVflzfWZfAa
         lHkwrxH69bNWmhaAcGm37mMEvNJ4YSxez1QcL5/uvdHcS9p/pm4ER+mbmVQvvuoH1cgC
         7cfhZnMHEdFr0jIHKPQKNWqX/q5nGgJKJ9pT8m5Mx5UDucmtiqJdqS1XmPS0wPHyYUBJ
         aZ8FaxLl5mWPY+8kMe5kw3c6Uu9Bh5sz5YQuDqeYmQnpobuHri5CdFHo7YUWYBZYopqa
         GvY69daUOhTPrQJtOjoTsHLtuZ2w6LPryYX5NBELaDXvDj0xANik3itFH/qNpTBpxqVW
         lYSg==
X-Forwarded-Encrypted: i=1; AJvYcCWcJZ5zXqJG5BcWuN9/IuoGBvlQNAiMlSPfsCRYqLpHsO/7pko7ALrLHes/cGt39q4zcHZwVsmz69SkD/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqYyXISus/4HzqmGp1923Q0sJ8MtGLN9p1kHfHINyia1Vm5Fh4
	H431kM8qfJeVMc2XhrBNaZXjnFvKTuiP731VPpBnd79ohNawqraceurEUXyfbHrXTZ4=
X-Gm-Gg: ASbGncsWHPYc1DGNiFy/BeUKua0jUvtRpxRK2HvpvwjV8a2l5H2oExYHgujXKDvCr5/
	cjrI4jOCCPa0tbl6+S3pIJEviz9WYQcLAqA2NkcqAwTlHoVm4T2+HqPemM4Q9kSAJK47N19RaPC
	n3l6PASvI4KlwYtQRB59S+aqKS14JnJDqppa3yYdEOcIjcv0C5QDx4e0qP60tbWDD1UG98xO8K5
	eNbZtl6chavQbPI7cD7OPBKUfiHsX0AuVB7Emmfvw4HEpjbVCO0IHbu3bMUFrg/skhAKnl4A5DY
	Ju2wwWjow2toen0Ngm5uSa9GwrXGqcwO5VGFhnjZr3/IDfaETzGQjRqM
X-Google-Smtp-Source: AGHT+IEVm2R1Mna6uJA5kBMvNBgl+7YgyK5p98OBSXt+CBZ0kZyiDitpFJsmut7o3GnT6OOaDvjLUQ==
X-Received: by 2002:a05:6000:18a7:b0:3a3:6cf9:9b65 with SMTP id ffacd0b85a97d-3a36cf99c8amr14129734f8f.20.1747909322186;
        Thu, 22 May 2025 03:22:02 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62910sm23148847f8f.50.2025.05.22.03.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 03:22:01 -0700 (PDT)
Message-ID: <e7453122-54c4-454c-871f-dcb7179506ec@suse.com>
Date: Thu, 22 May 2025 13:22:01 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] x86/bugs: Exit early if return thunk is already
 set
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
 <20250521-eibrs-fix-v2-3-70e2598e932c@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250521-eibrs-fix-v2-3-70e2598e932c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/22/25 05:44, Pawan Gupta wrote:
> ITS and retbleed can both set CDT return thunk. If the exact same return
> thunk is already set, avoid the warning and exit early.

According to the code there is only a single call which sets the CDT 
thunkand its in retbleed_apply_mitigation() if RETBLEED_MITIGATION_STUFF 
is being used.

ITS OTOH only sets 'its_return_thunk'.

While the patch itself is not wrong, the description doesn't reflect the 
current code?

> 
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>


