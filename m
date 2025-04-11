Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E012F278E71
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369666; cv=none; b=kt7t6yfjNEZgbTMNGlQTwkwp9OVYMT+wA//jKKJFdTNaJeSAsmFEgQT3t46g/ZcMDZ+w3TjSuQebeg4FHQVHoRF2c025Vs01JdrhSijHhYeErhlcT8pMuvpzvkd/VDK2YZ3tvdUaUHJh8UkRF+kHMKl6rzeQKMxA1f6YcHYS/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369666; c=relaxed/simple;
	bh=NVCdGWx2oZcWulAlSe9BTNwujDKzfiKzn7HY/Yoerqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7/HepLB7ZjRuza76o4CmLdvIY2f4+JVYfLQsZTNvoa9I302N2oCgDJxlP9rLjhmffTbDaZlMn6vahfbacnWGEb0ZmfE08wPaMfTF1in5Mz0EaY/TfhAi1TbTdw/qjdHujA4HWeXTRvhtS2Bo41Vfpus/PJah1N0XSTr0JRAA28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b=Srs+ghrJ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="Srs+ghrJ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739525d4e12so1685855b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1744369663; x=1744974463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XLG9LyOBwh9wClGUHHGD4bGh+PDIqzBXkT2KKCmZgk=;
        b=Srs+ghrJDkWQkymHwNVvqlJCI/TCPLFmYIxN8j8MVBUIlbL4IPQZgIFhrEHflYO0uc
         TwwG7VU2Ircshb1Vt8qYyVDO3KapcAE6DY5eAM77jd5JPoXX0tMYiGhCfz/P7llePaEr
         NqgEZw3eBX4FRBpUtQKUufE7FEGV+De+/9iN99dgD9wESO04B4ETc/kIMDxs0Z6/ucor
         Pzh/BnS2r2Zd9sMpPI9s/S8u5tEktazdfTsO3+J0nbxWMvL+WOSB88bpW3HuEP2mIois
         gHTOCpKve2Lt6LTmLhmLnz+Sr4jZfFwPxpdfAtD02J6gWAokAk57qpHRDTSKSdQqdn3l
         D4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369663; x=1744974463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XLG9LyOBwh9wClGUHHGD4bGh+PDIqzBXkT2KKCmZgk=;
        b=aclMUy7Ux2NTDM9+3M39SVJ/nbFtqheLHl1+xD/MtaL/bdlUDS9rb4DDaKrOS9w4az
         QHI0cBaGZ55XvsBGoI7gr78dI4yXTzDLKNaaXHK/SPfUfWHvV135K8lBWLNR9UL4aaK+
         F7yE7FYl2eZPkh6dJSQ+VG+ZNEMIkhDncjUUaw1AQT0pHgPpfhjx26hVoACcxcmZkPs1
         sWugF0YW+7E1aSxegWsMQo8NQH2ukxePUO0jXxPYDYC+MVXPDv8rB20sAFrIoJ50qylK
         QjeJq7P1jd8Fr+bUg9QGnwwsUQ8w6VJ3J5VjqR1AtkOSrWUKCfZkyf/curyx4sEJ/UyK
         mifw==
X-Forwarded-Encrypted: i=1; AJvYcCVqfMk6gfFrqC4jwNoduRhRVz6Z5p3gp0cyH3ugjx58bC5TF+EmotQ/B03/A87Ek5hRfmejuwGyE1z4nLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwV7R/ebf+MJyPZOx5IZnjIdi9Znng28NAQWuYp3uusV/qe0ZB
	jv4d3PWplwTqOnn4m4UZF7JXyTFSZQcM2y/VDwu8gvaD7RLCxtStDaczd4oeaA==
X-Gm-Gg: ASbGncthq39bwlD6VUcXA8fjyGQWqU7WpYUnfzjIENu3EDGces+w6jYvtcY2N+U3q1C
	yLPSd8JjzvRhSWwbgBDh1FmAu1MvUBDORPM/BK/+ZcSm0HUzjtqqV5zzOcZYDudYmVdoUQXofMC
	5g/+DqSFPqSGMJh/f+El2RqW3MvGHmPhtuZPyy9xv6yEFWTunRAxwWGyz3F7D7B+FdCloGBmsxs
	pjjTHl/liXzxeu5a1L42h6TohtyhSuRWIw6NuqE9uod97TjjlBw3naa0rXfp/4Xq/Kl1Eb2e9Gr
	NZ1gmNyiMiY4sNGq8kb65tvxJiqFzxQy5N5PmFDyRQ5dNSmprnx8XlODmjV1BkFyVxeQg0ytVxy
	0NRZG/gGnK0M=
X-Google-Smtp-Source: AGHT+IFm7A0VgFpeL1lolsIebnz1iD2c6GvvmnzywiHF9zm6AzHf0EpYuc4cmENBCcGaza8M8Vc0Wg==
X-Received: by 2002:a05:6a00:4608:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-73bd11aa506mr3032337b3a.1.1744369663061;
        Fri, 11 Apr 2025 04:07:43 -0700 (PDT)
Received: from ?IPV6:2804:7f1:e2c3:b109:bcd7:b61f:e265:af16? ([2804:7f1:e2c3:b109:bcd7:b61f:e265:af16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c5eaesm1207682b3a.44.2025.04.11.04.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:07:42 -0700 (PDT)
Message-ID: <c6bd1363-df93-4757-8fcc-96af2f9293de@mojatatu.com>
Date: Fri, 11 Apr 2025 08:07:38 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] selftests/tc-testing: Add test for echo of big TC
 filters
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang
 <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org
References: <20250410104322.214620-1-toke@redhat.com>
Content-Language: en-US
From: Victor Nogueira <victor@mojatatu.com>
In-Reply-To: <20250410104322.214620-1-toke@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/25 07:43, Toke HÃ¸iland-JÃ¸rgensen wrote:
> Add a selftest that checks whether the kernel can successfully echo a
> big tc filter, to test the fix introduced in commit:
> 
> 369609fc6272 ("tc: Ensure we have enough buffer space when sending filter netlink notifications")
> 
> Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
> ---
> v2:
> - Move to infra/actions.json
> 
>   .../tc-testing/tc-tests/infra/actions.json    | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)

Tested-by: Victor Nogueira <victor@mojatatu.com>
