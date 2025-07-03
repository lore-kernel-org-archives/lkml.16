Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3592D23A8;
	Thu,  3 Jul 2025 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554866; cv=none; b=tXYFsjA5YYXK1mxky4lxJ8UjPLDg/6hQ6EKFVejBNyRiXPOFgA3aX1GUkuqZI/8y3UIsRnAF/BQwrpQpS3BHa8lYix9bktL2fCeXMmqUoCbzxQQSQEcTzPAr6lWVidLFituL+GYUBr5YIFc83Ujaf1o5ddbGOn7nwg7StQzBAl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554866; c=relaxed/simple;
	bh=el0o3M0zkU7z9g7Q1pJxrHM31eRPr6gbMRcoUhikrpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZIJVmBCejVtP1tegezE1R8lnqRgQtIBmiAtEq2tQuos5X0ShVTLZWMfMqVQQS/K6XbYk5b2eX9sgwft8YO/YW+ySP+tpvcoUlY80N2dfp+xCgRRCLq66AG4GYIH+cuTHwH6SnMhW/QW+CFTzqYhisKU6etIz1eIDoUSKCqGa50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7QEr8Z1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7QEr8Z1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c3d06de3so97819b3a.0;
        Thu, 03 Jul 2025 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751554865; x=1752159665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jRIMr70cEdsRYDNitPV66z3uXOJDgD8O0O4++yS5jrw=;
        b=h7QEr8Z1UTbC9eDp6gFWuFBe++uHTNHCqTOfOus/3Xi0Dpb0TxhfDcbILZTAYFs/Af
         stn+yfsX/XtuzftHUIWoMkBzITD4iDIdHyvXMnOVA1puP8TWbNKuqiZyg+mD3+tmE4JT
         2wWPxzKwMMgOxTsSp0Ev1tTviKQNmuA9gbcvG6+0t+cPegZn5RMK0jDSNHk+EruduEpi
         7GLjP7Xdo+loodQX6c47b2SEG+MyjW+uoUw7F3Re5QoEsJWYPfTuCD7kLS0eFURbx0D9
         Hn3HeBTRu3V8ECfGfHYa8t0VmCJ5yvwENU2CCOZ7Z9VWm7ow32HqKxxChDjcOL5+IMYZ
         /fVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751554865; x=1752159665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jRIMr70cEdsRYDNitPV66z3uXOJDgD8O0O4++yS5jrw=;
        b=BHgwKoGBuXlh/OqgnCQ49uBfBmD2jdVRISpppg5zdYMn+zvqZIrj8Mc1KrHXcDgI19
         wjOr484GrDoM8i/lCdGIHYVKl+PdHqJ0XL3TNxr/qWr/C4UeFjo1/hj2umRg26vt+9ss
         IJVQrTXC5DWGEQMszx0+wW1zMZGSzkgW4zZx0/Ay6ATuzBaodP9NJz2ZlBhFTIxDRRlX
         d0lnEhLXVSg+rKQDYzBGUKU9HAVSZz2QriVC9tNn5qeSk0KqT7xPIeblWK14e8Qm1FM7
         5Pwxtr9AVjvvnH2oCK5wCVFvPyBJURrKBNIZaXXs8VlbTMsWoQvAzF3AX6+6l6sclN+6
         HCbg==
X-Forwarded-Encrypted: i=1; AJvYcCVhbBT/BtqsO9felQm7zg6cYhask0Rh8UhkJqc19Yz7E/V6xaw6EFtvkeRhxeFbEoJxD6+o1F/98ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YweNOJ+uMkJ/RN51sSqE+c04yz9YSKj09zY0cmjwshZ7RIgYCTK
	J7xbVMk1na/2Qgdh6U0bKnRfBspAzmU6bT16/PfWzVyti1FaJ1uUU5/VR/WgCQ==
X-Gm-Gg: ASbGncvgcHrojXZgCHd73pxyktha7qCitp4HJWmGVVg3sQ8zP22f8Q4WTnGmKwP2jil
	sEVDqPsEpB7u1EvozMbe3ZB4h2Twtcd51/WV1vryGVciz3EcZKteRCiO+Whnlhx/8BPwr86TCON
	q3tGLniF/iGEqpDRgZUFhe9vXCSLzYvtXAFQMuTgLgOSHXbrpt+LhfqDLGQZsgdzKdqkFrbV3Tt
	H9QdN8yf14ekIASW7uA0r7wOnO60DCzXwcu92C9PyP92HE2OW/SNkWfmAzkKnyuF6oXOX0LBLsx
	ujx8CqpuxZwEerMFLH6c7NFWwaX9KHGS96C4d7T5di3mt3LBbpiGAsthDRzHlZzeEBM4wQEB+7I
	6qiZ+4KjyeZ0LgLF/NPrJBUg3i/zyD8+sdFJSLvZ/kOs=
X-Google-Smtp-Source: AGHT+IF2AyQ/T+jo85+RX/J+eooHOaBdAa2IKwiPA3c2Ki/KqYoh3sI8gVSeQikMkyBu1g83oWoDEw==
X-Received: by 2002:a05:6a00:4fc7:b0:748:eedb:902a with SMTP id d2e1a72fcca58-74ca8470f04mr4127702b3a.17.1751554864383;
        Thu, 03 Jul 2025 08:01:04 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56d49aesm17692161b3a.139.2025.07.03.08.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 08:01:04 -0700 (PDT)
Message-ID: <e675d05d-0d81-47cc-b431-641b5b8c57b8@gmail.com>
Date: Fri, 4 Jul 2025 00:01:02 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Further kernel-doc tweakery
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <20250701205730.146687-1-corbet@lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250701205730.146687-1-corbet@lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jon,

On Tue,  1 Jul 2025 14:57:23 -0600, Jonathan Corbet wrote:
> This is a set of miscellaneous improvements, finishing my pass over the
> first parsing pass and getting into the second ("dump_*") pass.
> 
> Jonathan Corbet (7):
>   docs: kdoc: don't reinvent string.strip()
>   docs: kdoc: micro-optimize KernRe
>   docs: kdoc: remove the brcount floor in process_proto_type()
>   docs: kdoc: rework type prototype parsing
>   docs: kdoc: some tweaks to process_proto_function()
>   docs: kdoc: Remove a Python 2 comment
>   docs: kdoc: pretty up dump_enum()
> 
>  Documentation/sphinx/kerneldoc.py |   2 -
>  scripts/lib/kdoc/kdoc_parser.py   | 150 +++++++++++++++---------------
>  scripts/lib/kdoc/kdoc_re.py       |   6 +-
>  3 files changed, 79 insertions(+), 79 deletions(-)
> 

I just applied this set and got the error of:

---------------------------------------------------------------
  File "/<srcdir>/scripts/lib/kdoc/kdoc_parser.py", line 881
    	    else:
    ^
TabError: inconsistent use of tabs and spaces in indentation
---------------------------------------------------------------

I didn't look into individual patches, assuming it should be an easy fix
for you.

I guess it'd be better to test (and hopefully to review) other pending
series from you and Mauro ...

        Thanks, Akira

