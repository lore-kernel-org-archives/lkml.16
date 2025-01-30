Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC4EC2FB;
	Thu, 30 Jan 2025 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738222460; cv=none; b=aQckF4qooJlF1Lpy4estjlOSEliGIh/jcrxUMhQYR0k1wkI4DtcaxFU8BObtrXMIbGGIEY26OeLgxsB/9AofaDr118WoATMVKg9LvDAHtZ8uuqsHYkSV86uRd/oax39NpZ/N5hP/VpiTZNNafCpVLTdk7qn8q+LS2ySsF0sXuqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738222460; c=relaxed/simple;
	bh=J3Qk07pqcvI+wbmn8foJFF49O7OniSQcX0rmyLYOvTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGQ3gnc+VYZZFjqDOb3om1nlfNDFYNPdhOQuKPbUw/dlpXrILSDDjI9z7IsSVzM0T6Uc/x10Fmal8vhQrw297e5Ou6LLvT4DixQ5PeQto8ZVywJV+YcdHo23eJjusNxivh0wjsXGj3cTxHRuXCVq+ar/IOR/Tfn/QvolohiCdw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOVJVjBx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOVJVjBx"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2161eb94cceso5005085ad.2;
        Wed, 29 Jan 2025 23:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738222458; x=1738827258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3CgWJISKzdTZACVuBmpiGCI6lASxkYNY+RSmNM1bj4M=;
        b=KOVJVjBxV8g8L7B2Obh9WDIhaBMn+ulpaD3vjujvW5cK8Wn8sNY7yHYFYXMz16THb8
         G2D++jpA+qLxnlo4Qi46I66mgvY5lUAq9iJ97zSqBU37INX5S/7Kz0LCku8rmYUlYQ2i
         KC98RGM5MxehI7Qxnf0ekSA5BSGjSuzKCv+EtVLrkLwgXeltSXk9eBN5Ut3j7F2x9KO6
         B3nbSywUZJwAZvc4dRk0rQm4DZM3K5mKE62+vp42gLRBLENlHv4mm1NdWPyy0aTEfeYc
         60s/9mxX3ywlkenMtMCD/5PhfJbu/OvvIOpfYnzZhCaeUQmd0SPtbF40fgUdetBny6S6
         IiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738222458; x=1738827258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CgWJISKzdTZACVuBmpiGCI6lASxkYNY+RSmNM1bj4M=;
        b=DH+HQI+FrUu0zmumh001BU4tbVUqvsx/UtlYwMqqyy+F+6n50X+YsnM1VdhcC3izay
         QaXzEPG1Ut7dB4gV7DOyELwtQG91BMtgHdscW2pzJJxi8S0MyXxXGm4cDo5TX0I35oom
         rQzp/nbljsK2RiJxDOuH93FDDmzZZ1Gtu0GhJmnnpPE25P1cQIh4+nTNwqhyGIrcHVcb
         mWrktY4Wn+hasJ+HnJUeag6k0KnPQascDcHCWGqc6yr04zy0qWrepKUzbXwqZP6y9Dqc
         MFfoc4NX//cmQzBuWt5vEsGTYeH69c5RTSTJ7+fvPVJ+Hv2f0T4lMFSQJgR3o/CP5Qpm
         7KLw==
X-Forwarded-Encrypted: i=1; AJvYcCXEief9sESTLvSabfKvmTDRC9wKM/gAssOyPPt7eBJ0U9lIMxr1zYumc6vyppdPUVp6oITvLfOZvxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVHLtqapeC3pYa9+BfQYGh6SeCv24YZa6GYR6tqimgUeiQOHM/
	pFbiZ6YU+TOybs50K/AO4UxQ8VvP0oyaCNDq/Mdc0arByWN6sDkclcNlFg==
X-Gm-Gg: ASbGncuLuQI5hjfFo5u+BLHjJYyX6mLzU0T6eKHlmo7AqFFZ5/MY/U1kmZ52usALarg
	XzuglifGizg6j7cCvLIzyNUGDRrn+TwXLvCyws4mG677DiTUlz52TvzecWtXrP9DGe+FqNFbkuu
	92wh5gFFmJudISi8AJCl9ow5uWfhWrIDPjNDbAj4BUZowlploAVBEdOmX+Ql+oBxJmJqQ1ndTn8
	JN1kyfyDGKWMQ/vFuBmNylqfdr0WMQDwElC+nso6yIjxJyiPIp5dvwHOGkaxaDV0H7XBBNTc5JK
	cWJVPxUU32Z2BgRsJGukVjZFA8FGjVxZXMCBBcJXj8eT6hFgwAGWp+fy8MswIQ==
X-Google-Smtp-Source: AGHT+IHK8rfiJM27oHlLK5GHPmd2hqqsDOGI9Yn9QDRs6YZk6qxgC+lt5HoStl37qmVUZiPr7kv2vw==
X-Received: by 2002:a17:903:1c7:b0:215:6cb2:7877 with SMTP id d9443c01a7336-21dd7c3c5ecmr102075075ad.4.1738222457795;
        Wed, 29 Jan 2025 23:34:17 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33200e7sm7666655ad.240.2025.01.29.23.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 23:34:17 -0800 (PST)
Message-ID: <17bf0ec5-17bd-4a1b-b5c9-2584d01eecf7@gmail.com>
Date: Thu, 30 Jan 2025 16:34:14 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/6] scripts/get_abi.py: make it backward-compatible with
 Python 3.6
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <cover.1738166451.git.mchehab+huawei@kernel.org>
 <6d74360f8cdabeb0bf628a6e870d10e134f396f0.1738166451.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <6d74360f8cdabeb0bf628a6e870d10e134f396f0.1738166451.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Mauro Carvalho Chehab wrote:
> Despite being introduced on Python 3.6, the original implementation
> was too limited: it doesn't accept anything but the argument.
> 
> Even on python 3.10.12, support was still limited, as more complex
> operations cause SyntaxError:
> 
> 	Exception occurred:
> 	  File ".../linux/Documentation/sphinx/kernel_abi.py", line 48, in <module>
> 	    from get_abi import AbiParser
> 	  File ".../linux/scripts/get_abi.py", line 525
> 	    msg += f"{part}\n{"-" * len(part)}\n\n"
>                        ^
> 	SyntaxError: f-string: expecting '}'
> 
> Replace f-strings by normal string concatenation when it doesn't
> work on Python 3.6.
> 
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Tested-by: Akira Yokosawa <akiyks@gmail.com>

Thanks.

