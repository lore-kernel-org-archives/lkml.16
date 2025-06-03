Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C4021C190
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 19:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748980605; cv=none; b=FZnevOMjK73pQat+PbYSFOrxzfbTmjfxVqp5dhpbkwooxSogUN0+FmAW1VV1G7zg63hirS85qedlZbwTAWvMlIERczrIEEN1alSQrqcxVdz2Pnr1QLLLY8VXgDZLOgiCAF8mR0ii4nGAnKV7B+96REpHr3QSxp6y7rwDie3sDbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748980605; c=relaxed/simple;
	bh=MBHvsPqLN43xkFuBcIrA2Mx8sNirdLFvv+sbxgKdLnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjGLLR4w551uLCUu/aJqp76ncEsdG118y7m5QUcrbvimmuUXGV6vNUnYEZVQJKNea5rDjfISRfuujCdFdArFWzk2uWIButoBEFGuWpxUfLV1WYnDOaxY/EsPqpOSTkiaFl8rvIomX6+D/xTz2t6hhVb27IiNSDxSGGNcKKv0P68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Rj+0GeOZ; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Rj+0GeOZ"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86d0c598433so113328239f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 12:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748980602; x=1749585402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5u6OWYlzDc1r2jn1fmfgfB/4o5raE1Ta4oX5ByxSCk=;
        b=Rj+0GeOZQGXMhYB6yNsBWlogkXQi9XRgqPc4mjxcmK6aBhkZOAivRg1OEfWX+Iy0RA
         WOVv2yRbolDY++vIqgO7Ftm9exoOfDChBYOqrAhjMTSwpPjZYUd93HYxLx30vzdjMcXF
         Gxd2It4ox7PHEUiZsYxQZ6ATIKoIpmePOr0jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748980602; x=1749585402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I5u6OWYlzDc1r2jn1fmfgfB/4o5raE1Ta4oX5ByxSCk=;
        b=xCStpJjhTa8ezvHmXXcE4R1QmUo/PVK5ba024ZSqH1Kpp2im82YrmXcMvH+95IAxbS
         URVaD+J90MFsRTqUXCiYM717EMGE3NhJPYHf3aMAljMUbWNCJKcAUhAGlkuVo0u86754
         e3+NjuHLjrw62+cjVO/dpckYorVRuMbK6bv3HRAPcvpaOGs1fq1hjTHtDH+HlN1WYb21
         bdXLXAU6ZYFprxCuaVCuSi3Nnw3te33qJV0GIT4InENU/5OrxLEm0o77xd25ZehXHB2R
         vaY7yzLPfkTKgIOChhz9DjOz1bFYavm0C7mw8MCOe0R64+UnGaK5FFJ0TB44q5k2IZb/
         5C8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZZoHPEb8E6rp/hJjx5sqx9bycHvsLz0joD+Ma2PhZpADFjs1vHQdh7BwCJ1m+XSFAxrDHQmXLeADO7j0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNSsJWTNWcRfmaywbeU9TmTXs7/MGMCqp4VqWSm1GJdyRQPWVr
	rQUqIBcDcQ5S1Ui6HpC+bjmcuh7YmBd1Ycxu3pYApt7QornmQBkJQ2n4DXBgwKP7Rxo=
X-Gm-Gg: ASbGncuufEc97cRTfoRGkkG8GFMKPGDiS20YH923Jcs/FEWY6XqiWRAclFGm/tUf2BC
	vZVMQ26adi5zg5a61AzvlDehqxGiXP3C/o1Ef7lYXDFM85pHpvx/sjJKGNRGvvoC+hDmVxJCX9I
	6WWIQESx+ceiu/YSR/xAyrG8ecuT/HeYHqYmbK3oWjSz5d/mtfaqerhVDkguFoOMBIbWhdzSva5
	Cr4tsyS1DFMNt+BMju3JgW7l06fqTtn+zm53kNvcVQX1RZ7bPH7g5KbeBQdGl7WrGrdEdrTKOEP
	tY7knpYFwsYDQL2bdMOS4v+z2U+NDNzi59H56qaAL0JV/0BoejSVTjdKJpAVxQ==
X-Google-Smtp-Source: AGHT+IFy5GLJWHFh8Lt3t78XkxeHDflX85Ik4jxEhVm2uHr2zRJEI/xgrIiCR4nT8+zefTt5WmNzlQ==
X-Received: by 2002:a05:6602:3f09:b0:86c:f3aa:8199 with SMTP id ca18e2360f4ac-8731c5d2a88mr36409639f.11.1748980602420;
        Tue, 03 Jun 2025 12:56:42 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7f22536sm2472425173.134.2025.06.03.12.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 12:56:41 -0700 (PDT)
Message-ID: <328326d7-a72c-4fae-bd39-af4d89666a91@linuxfoundation.org>
Date: Tue, 3 Jun 2025 13:56:41 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: Add version file to kselftest installation dir
To: Tianyi Cui <1997cui@gmail.com>, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250529003417.468478-1-1997cui@gmail.com>
 <4a28c302-b37e-4963-86c2-87c5793c2661@linuxfoundation.org>
 <11d3be92-a934-439e-be36-6d898b437681@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <11d3be92-a934-439e-be36-6d898b437681@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/2/25 19:13, Tianyi Cui wrote:
> On 6/2/25 3:48 PM, Shuah Khan wrote:
>> On 5/28/25 18:33, Tianyi Cui wrote:
>>> As titled, adding version file to kselftest installation dir, so the user
>>> of the tarball can know which kernel version the tarball belongs to.
>>>
>>> Signed-off-by: Tianyi Cui <1997cui@gmail.com>
>>> ---
>>>    tools/testing/selftests/Makefile | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/tools/testing/selftests/Makefile b/tools/testing/
>>> selftests/Makefile
>>> index a0a6ba47d600..246e9863b45b 100644
>>> --- a/tools/testing/selftests/Makefile
>>> +++ b/tools/testing/selftests/Makefile
>>> @@ -291,6 +291,12 @@ ifdef INSTALL_PATH
>>>            $(MAKE) -s --no-print-directory OUTPUT=$$BUILD_TARGET
>>> COLLECTION=$$TARGET \
>>>                -C $$TARGET emit_tests >> $(TEST_LIST); \
>>>        done;
>>> +    @if git describe HEAD > /dev/null 2>&1; then \
>>> +        git describe HEAD > $(INSTALL_PATH)/VERSION; \
>>> +        printf "Version saved to $(INSTALL_PATH)/VERSION\n"; \
>>> +    else \
>>> +        printf "Unable to get version from git describe\n"; \

How does "git describe HEAD" here in this path?

>>> +    fi
>>>    else
>>>        $(error Error: set INSTALL_PATH to use install)
>>>    endif
>>
>> Why not use "make kernelrelease" to get the version?
> 
> Thank you for your attention for my first patch! There are mainly two
> reasons:
> 
>   1. We'd like to have the `VERSION` file written to to the tarball. This
> is because driver hardware tests needs to be run on specific hardware so
> that tarball is copied onto the DUT and we can compare the running

Okay - you want to save the version in tarball. No problem there.

> kernel version and the test version.`make kernelrelease` only print it
> on screen, 

This doesn't make sense to me. "git describe HEAD" also prints it
on the screen.

so we still need a way to store it into the tarball.

You can do the same thing you are doing running "git describe HEAD"
and create VERSION file?

> 
>   2. `make kernelrelease` requires the kernel repo to be configured and
> prepared, while `make -C tools/testing/selftests` can run standalone. As
> a result, I don't want above to depend on `make kernelrelease`, which
> may break compatibility of people's existing CI systems.

Yes "make kernelrelease" requires repo to be set up.

thanks,
-- Shuah
