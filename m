Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274A818A6AD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737179; cv=none; b=XWoOSXBVKp0oEKwG/GvGXtRorxOSSuzxo7WoHE9ooxMAaWTWw+G5UCLTp+2mx1HEUerc/NGqRUVLaR+jx5c6kPBQZ1/cA5k0ahJVvGDZjN515h1DbTxflZP26hk9tkONATG4cuBLkFWHRpTfU5IruhL44SYaTQ3SJp/XWX1qOpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737179; c=relaxed/simple;
	bh=4ChK7e4PZIbGo6yIhGanb9DQUsVcV2UEtIFr/3kfE74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gG1cVpkZd3mwmHGgHMXzAWUoHrTB6V5nHQwkrC9hvU20WGBL+B2zBz+QMi9lFryydzBMsJyQMRhdr2wFxq9Zer/87vdKg0tl3Am5aVxTUu+d8gkQJVA0uOqqafbT+glxaRr3IMiGOdFdNt5a50R4ENE7buSw8U927oY8vm2APwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=jLMaqWT1; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="jLMaqWT1"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-872886ed65aso90545439f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749737176; x=1750341976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bU6I8KFtIF7gtlB8ZnFNNleYs6udjVIddSeSWWR+RTk=;
        b=jLMaqWT1BEgl0/V26AQ6QvbOzAwrlSs6JmaTA/YqKMgf3CGUpUJey8j6TYA9+bpF6z
         hrHwFR4BplAvwb3U+OE70O4z2OhO4kfFkgBuiktW+5HKHPK+7FEwEd6xn4DMoJG1CCMi
         4CpqQM37OLf3pxLphThmlhZSMVQnbiAPEalhpi6g9LSChwx4vATi7FTQiCwH/bItCC4t
         OWfVrrWWKnksu6ZmXeamxhTmFU9JciUVqNXwJnhHasBMiG0a12bgqImDxEPgi1bk5smP
         SOg+sxWUzPwnh2Q/DyLroiUYLmIgnFYbiLGwEJL80pU5XoQyfQyIieOmWomvjYZODEqP
         5qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737176; x=1750341976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bU6I8KFtIF7gtlB8ZnFNNleYs6udjVIddSeSWWR+RTk=;
        b=reVuyY3GzJItFHgFVdrivaRNGh+t1dpy0D9ig4jJ02AO2yRyKVnJD8/eMeXpZjvlIo
         Uf21IUkfj7wkFzK4WJA2AOUEH/8uUQRIz5bf/SUstuJjIQG7z7UHFVdyw2LnkCt0N68c
         MnUMZFDDvcfRTWX9ape53gLo5NNAna6V5JzKT7VNtNRK8F+NfxVvO292AeE2XHALsjof
         2emntU7fR1tUTkd1FVuf2KPLJfAocOWVsjf7gF2ebNtcW+q5t/39JXULEX7waEQY1hOX
         zJ08GCO49kDY80UGq0uwbbvLmvIQD6B0bkJP2jWTk17+Fo33Oa1nr1D2XZ/bPJ9L6yyT
         4Fag==
X-Forwarded-Encrypted: i=1; AJvYcCXV4jtGsNt5SvUH2mlnVcraBV4Fau/Nf7FYNQ/if6R6GRo4AFtm2MUTwf4jJnhf0691fv7zVPhUlPBhHfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+UqO4XuLpd7xW4xy6uFiS+rFxE34l8JjerJOQPNtiQhzxSpVG
	bhn+xg8vPuwuHf+aq9H2lzTada27cgo3K7ee+niR/jZrREwUKD2xoMzXWJcOCwNXhupkD/AwwMJ
	DA7Ui
X-Gm-Gg: ASbGncuUXMOGOxD5cL3Rleg5/yBDxmYvyVOvlANVxc0CJW7SOKiHVkBGy+cse4aF47J
	Xh205gpTnu4OgwsXdY+iMbLD/Ub6rrA60tLFktrYIPE9drdRxMB2PoDeIxg/C+DTwzFxv2Syd5S
	dGBcNz/WIxmnI6/+tgZ5bhZgW2gouy/dox+iQ59RlJ5Yem/ekQDrIzqfM41weIyCzUKqaCIiFKs
	fIbNCTQCmz6VMTeCkLbE+cyjedSjyNbvsiTNRJ52uhOUnfq2vbTltNLvqNLilNG5fuVj+BwrLEE
	8KG1OIaVPskd8wuT09WQ/ufHpkOqFR3VAxHE43amHgI9kL+JONh1wUSc3w4=
X-Google-Smtp-Source: AGHT+IGwa/W/bwZ6mhkAXRr6G5LVK0LhE+hanV4uE2MJO+JAFyftWu8co4CAKe/KphaDCpHFbCPT8Q==
X-Received: by 2002:a05:6602:3a03:b0:869:d4df:c2a6 with SMTP id ca18e2360f4ac-875bc49bbd2mr915998539f.14.1749737176105;
        Thu, 12 Jun 2025 07:06:16 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875c7f64de6sm35469939f.33.2025.06.12.07.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:06:15 -0700 (PDT)
Message-ID: <e6194c29-18de-4dc9-a2fb-2ad63816481d@kernel.dk>
Date: Thu, 12 Jun 2025 08:06:14 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 5/5] io_uring/bpf: add basic kfunc helpers
To: Pavel Begunkov <asml.silence@gmail.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: io-uring@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
 bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <cover.1749214572.git.asml.silence@gmail.com>
 <c4de7ed6e165f54e2166e84bc88632887d87cfdf.1749214572.git.asml.silence@gmail.com>
 <CAADnVQJgxnQEL+rtVkp7TB_qQ1JKHiXe=p48tB_-N6F+oaDLyQ@mail.gmail.com>
 <8aa7b962-40a6-4bbc-8646-86dd7ce3380e@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <8aa7b962-40a6-4bbc-8646-86dd7ce3380e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 7:26 AM, Pavel Begunkov wrote:
>> For next revision please post all selftest, examples,
>> and bpf progs on the list,
>> so people don't need to search github.
> 
> Did the link in the cover letter not work for you? I'm confused
> since it's all in a branch in my tree, but you linked to the same
> patches but in Jens' tree, and I have zero clue what they're
> doing there or how you found them.

Puzzled me too, but if you go there, github will say:

"This commit does not belong to any branch on this repository, and may
 belong to a fork outside of the repository."

which is exactly because it's not in my tree, but in your fork of
my tree. Pretty wonky GH behavior if you ask me, but there it is.

-- 
Jens Axboe
