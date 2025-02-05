Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D120EAD0;
	Wed,  5 Feb 2025 02:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738723081; cv=none; b=a56SlQKoONPGBUg65GO/aN4UsWvhPec6koFyMbEIqeehIjrsgIAkGAnATPh0OVi/6fL9dp/IMtUXfDGKAwZax8t2cXF7Ni4WGpypZ/BI1BtrCM6EuO3LO/P/g/UyISkd1I0hc4gICa3u/NHxyheUGy/y2HgSp4SGffmTZZMeEE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738723081; c=relaxed/simple;
	bh=0SjtCwBy0EpN9gDablJ852+KiT9vja0588/6+ZooJXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZYES00DKVKbf410gCWmtCfVm9yKQA46CGyZvzjLN6HAq1KrCG8P7moIUnyjT7bBx3Jf1oFevNDj84B3BGPTDKtZRYVejkb3nIxxkyvMFbFt0PmOZmIDZBWKUCoL0nQk/96W4vSYjx9yqNPXe8o0AZO7KWmpTWPdmFZLlNwYEGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKnQvRx2; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKnQvRx2"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f9dbd7d80dso998690a91.1;
        Tue, 04 Feb 2025 18:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738723079; x=1739327879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9YqD7C7VJhfCMl7wUCwqHeMvuQwAb3ZaESvJM09Fy0U=;
        b=iKnQvRx2rHHxh/NDMfbKNKBaocfe8I3Q2J6YL0KRfeaoYiQQl7zJY3Lty0zJ3EZ66X
         N2pyLI/MG5iRrj1ya4AXiTTpni5AU6EpLFaROwrgd4LibBMYniKJnMaC+KQvq/o0kTLP
         kSo+l92AnyZtt36MdpDrqIScIA32YkW51zVwnp18+1v9OeznikGLbqCSX4FTgRzEHSlo
         XaMjFK1fm60z6Kf3hXij2hhRBWEeAf3oQXCqy6+9BPIfZXdJUxDtHJ9hm6J9W3PtMM/6
         t/o5i28a8auQINfusGZcEb5zmMcgOblAepJXE8fqVdCK/z+AB/W2AOaDsJzgy58bqm+J
         ZZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738723079; x=1739327879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YqD7C7VJhfCMl7wUCwqHeMvuQwAb3ZaESvJM09Fy0U=;
        b=OWQn4eOeL4lxXY6FDYovlhrQiXI4lAr850WyY2vqzt55Qeph0tqPTXeCuja0V2+gEM
         0Dl+6yuMFYmBmTTzcT8HNgdy6XMdsKFeQGQGoRdC6qDgHnyqq2k44AiyaL2ObS2Pct+x
         SwRRYIdAm48gb3bNj23uCWRP104jJV/djI5eDnliFgctyIzzWU9DbIbBrJXW7Gb3DWiR
         qrWCG36UylH7RYVtLD5jUf+Y48YRcAnDRoPQh6ShowxW4+zkCRAGtjcNydX1yMK6g1GG
         G6P8isPOrVg+rF2sRU44UDDr8TNBLtpSnk8DUPZQykSrCmz+3vHKALgVB/nwsncWvAAa
         W8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXB95AW0w4MnJ5+EzY5gKIYwtsihfZRiPN7ZCk2vbYgS/7jgE+m3HBX/jAbgdeXbh2N1IL6ts8o88g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYcNYvnpwNMUNRb/aaWGS7E5RagD+gY6nchn6Udxq/ztf+hNPU
	39fj0cKcZK8kfRCW9kmDe0mhhNN6+r431Z5k3NAzwpOtarGa3j5y
X-Gm-Gg: ASbGnctt9fOULC37qk9a0S3e3i2NiyhEeovOyu+jhbM+ASGZuXz6Eif0ulpdaDAJcEL
	p3cEh84dJpR7m3V/eJzDK295PlWp5Dt/3gof+x3P1jGMc2Kods1zC+ZPwjqMv+XkvQInujvOdl7
	hex4azijA+RdkwQlyrSHidWPU1D+ysLupyfNdgPL/b7sYfyI+7SBtcgLS8cjLu/wPMgt0zco/Qs
	J7BSx3WfrbBRECsn0fOngWiRmktIl5yjn+OJ3uGspwRS+npgXJiWUm7KBiRIT+gEm3g2ur1CQek
	5e1kt2OPixIqxEq0lXvQb3zzFE8CPmQl3D3LKVOnrE8LIGDmLCR0hawHF3QZgA==
X-Google-Smtp-Source: AGHT+IGxQsCDfudxB1NDFEIvrGv8L1BkIyn30BbGdaho8Z4JBeHINfYTYWvFqBMciVq7UgKJhMVgYA==
X-Received: by 2002:a17:90a:d44b:b0:2ee:c9b6:c267 with SMTP id 98e67ed59e1d1-2f9e075da23mr1854834a91.9.1738723078671;
        Tue, 04 Feb 2025 18:37:58 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f02b28cb2sm23500935ad.206.2025.02.04.18.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 18:37:58 -0800 (PST)
Message-ID: <4274a2f8-5ba5-45f3-80c5-2de54c44c06f@gmail.com>
Date: Wed, 5 Feb 2025 11:37:52 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/6] scripts/get_abi.py: make it backward-compatible with
 Python 3.6
To: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1738166451.git.mchehab+huawei@kernel.org>
 <6d74360f8cdabeb0bf628a6e870d10e134f396f0.1738166451.git.mchehab+huawei@kernel.org>
 <87r04dei1j.fsf@trenco.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87r04dei1j.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Jonathan Corbet wrote:
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
>> Despite being introduced on Python 3.6, the original implementation
>> was too limited: it doesn't accept anything but the argument.
> 
> The original implementation *of f-strings* ?
> 
>> Even on python 3.10.12, support was still limited, as more complex
>> operations cause SyntaxError:
>>
>> 	Exception occurred:
>> 	  File ".../linux/Documentation/sphinx/kernel_abi.py", line 48, in <module>
>> 	    from get_abi import AbiParser
>> 	  File ".../linux/scripts/get_abi.py", line 525
>> 	    msg += f"{part}\n{"-" * len(part)}\n\n"
>>                        ^
>> 	SyntaxError: f-string: expecting '}'
>>
>> Replace f-strings by normal string concatenation when it doesn't
>> work on Python 3.6.
>>
>> Reported-by: Akira Yokosawa <akiyks@gmail.com>

You might want to add

Closes: https://lore.kernel.org/2d4d3fd1-5fe2-4d18-9085-73f9ff930c2d@gmail.com/

>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> So I'm curious ... later in the series, you make 3.9 the minimal version
> for the kernel.  Given that, is there value in adding compatibility for
> older versions here?

I think rewording the summary to

  "scripts/get_abi.py: make it backward-compatible with Python <3.11"

would resolve Jon's confusion.

I haven't looked into python3'changelog, but it might be
"... backward-compatible with Python <3.12".
Mauro, which python3 release extended the f-string implementation?

        Thanks, Akira

