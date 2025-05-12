Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D81228C9D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061421; cv=none; b=fGaqAIn7PCsIr0MbaN1l5peNmXEuqz7BQ8xhGIedxZCH8/QoSc8IHJV3OSJvU/jBJJ2L5vmYDcwFvJrKWxRhg73uvYuk4Rlw3YJ33opn6pRI1efd5NMY3jIQ5w4agzs3rk7ic8lgZ/YtwQT8f+LUbmiZaABTVsIBsA86e3NBUwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061421; c=relaxed/simple;
	bh=qRQcaOUpeo+w9STztCfLsnLWPkkRfSGsi9z619ONGvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2RboFP3Q7bu7KAkV7gTI9RU3RnffphnAmns3VPktnMtf8xxgc6OJbY90358QsOjnQveFn/5nk1xBqgpSOfdxCy++0N8ir3Xilmp0D4kfjQN1ZzDMVE2rQN+NHjCPruuSzW8S0+ZiyoFayCaJSFxXSj/LCpThXg5qV7WG21OZ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CUe3jbED; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CUe3jbED"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so10732050a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747061417; x=1747666217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00F8vgPv2qdGuX6Cd8Cq3yaacUVZeZ+szyLkg5+fpw4=;
        b=CUe3jbEDkc4Y4TNfnyPpRbK+dk5tU4RdOlyekKWeW6am0rcUelpzh62wG7kr/BenpV
         wugC1SnTrNqRQ4xo+pbI7H4PV2jPcBO9REK7VoYcwQElgJDYoKzt/We93tEJDqviGrXl
         kFTdr9xn51IIffZkFsG+MfXRUHzvjm4PSIwNoFcKB8ienFcekCedw8oLyMT2x+6p23NJ
         DP9+FHjrMRUDYsHJ03U2mJGluPf/itFBVgJtmn1qO8VaB0oMP/kBlw2QMgjEXgUohi4W
         OpecpjwcQmj/GBKkl8NQHIvj44tcM7fb7Nh3F/u9D7zlQUdlwBu0IHdwjhbYRV2wZb0F
         /ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061417; x=1747666217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00F8vgPv2qdGuX6Cd8Cq3yaacUVZeZ+szyLkg5+fpw4=;
        b=cMDY9UHlrTSVrYjg5D8drve51zoM2UIo5weXvdQSmprlTgrR4ZYtPKzu0C0Ke679J8
         IGW9W2lDqA7e+yicmsCX/tenJ05Rep1njwk5zW3nYbG01fGC5D5J1Y1yY7oPuu9lqqC4
         Q0zRzg0LZBkWIooHhD+e0UousrYW3UCWNohIbWfXIFsUogiCRtuwyVzJbxGkt6zwbHYc
         LOlThZjTgmLT706DutCK9SkJrQsT64FCykBXsAfHQeKxLCIQCnHuWyR0EeYL//uYpMSw
         /Q/VHrBF55EwdzbYjazF0ZtoL8tkGR30clv4I3Hnx9/3pO8oftOPAUfJSMn7cL6DX/Qp
         2nyA==
X-Forwarded-Encrypted: i=1; AJvYcCU0gfyClG+PUneLh7Vr0EYdUGMjpOKxrVJWKFUgHuQ3AgdQk62t2cLtF7gor+zTf7pHiVWdPT4X5SAFuwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfrWkHXFSz2ny9OzryuRp7atcy4tOZbfbLNBfrZAnRNjvbI3nd
	6ViIEUbZoY3sQgBPpw2o4hJDqg55WbOgJ7J7CXd+SvOV9xSAbvbDep/otku7Hfc=
X-Gm-Gg: ASbGncuMqiyMCfERrxSFlnstZ2w4kZgDKpZv58cJsjZv4aIC/wz7MaNvZnPG7QSdDpk
	KS5vEiwt0hlvzdkiA/kWl/WVEGFY4eirquIRnghETdDiAGUWe8WCjo815wf1Cz+piYyYMtB7OLy
	l2oEpLUCURgewaD3NQM6IYkHxlFUYvFVxblf+rvdaBs/5qibH/ynfljuyj7dA+V9WYCAuWl6IyL
	7++j+bsaVpTIY/QW/LVe9rm0I+780TAJClK8DwElRkRQtt7mNPI9QLEPVi+8l1yXxXxnT5YezeX
	nvg+yXB5Oj1331DJ09YGQ7yD5RKZJHgspPHuaH1qanXUaRP1LXcbHA==
X-Google-Smtp-Source: AGHT+IEAugwrNbmdiwL9waoe9elCWs6yrSk4vexACydUYW5x12Eutr3ba2qSc5mhsZMIdM3Hq6hQ5g==
X-Received: by 2002:a17:907:7f2a:b0:ad2:52fb:e899 with SMTP id a640c23a62f3a-ad252fbeb25mr487001566b.12.1747061417129;
        Mon, 12 May 2025 07:50:17 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad24677c9e1sm303738166b.88.2025.05.12.07.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:50:16 -0700 (PDT)
Message-ID: <1b80a538-aa2c-4695-a67b-f253367d91a4@suse.com>
Date: Mon, 12 May 2025 16:50:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] modules: Add macros to specify modinfo prefix
To: Alexey Gladkov <legion@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1745591072.git.legion@kernel.org>
 <20250509164237.2886508-3-legion@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250509164237.2886508-3-legion@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/9/25 18:42, Alexey Gladkov wrote:
> The __MODULE_INFO macros always use __MODULE_INFO_PREFIX. The only way
> to use a different prefix is to override __MODULE_INFO_PREFIX, which is
> not very useful.
> 
> The new macro will be used in file2alias.c to generate modalias for
> builtin modules.
> 
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
