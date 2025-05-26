Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5221C84C4;
	Mon, 26 May 2025 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748291027; cv=none; b=L2+/Ij+7YSa/KnFOrLc+MC1Rsgf3v+VGp/Bc2mpZJslNMwYupNwGdsMzxJ3hXZJ+ud4qswUTLc5f1JF8mAc5GRIOfzIHZo5QF4o0K1m1p06Tse7HEMR6DZxdciCjYYf8sCjeAUWhOlaH4u1/3YJ1M/HeN9clTvN2kBwClmJxpUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748291027; c=relaxed/simple;
	bh=+6BRoM2/WXB05O0ZhT3DqDkDWPn5rCY/4zpmHwarQlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPlcd6rJ6PuoUSZqgiDuanDhbrG7NUGoaDnh+aowpUw7s/WVvy8yJ5qTk2+7gXQ1ZV3pas4iIcmnqCllC1Rxr1lmEmd/0e3o/5vlJcMHlg5Gz7d/WPf/3H+maoPQRphHd2Z2eK4JQAYBnqvCkimhtiTp+d5AHOJOBPCp9lDTAMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVBdCNiW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVBdCNiW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ede096d73so19984725e9.2;
        Mon, 26 May 2025 13:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748291023; x=1748895823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7+gUcKKexaxy5novFqIZxIAX0ITBngrhPCqKSxeyIA=;
        b=jVBdCNiWlUrPjf83kbgurIdSDZJG6qChM2aPPZEZSgyT+CSSDlhxTyy8VSVjBzUkCC
         kU1eFAD2J+DHFiv90dNvGrdPFR5N359J+brDSXVwjVWTFs1NUbJSCIm6HDA4jmlIg39g
         07h67q6ax07Zc6iXs5K7g+7lUOWsmvdpdXTxDso2fJxMFwLDH03o5Acvjzn91Hco+7aC
         1jWM3lm0x/2Ft8vwjn25KLVxNanQwfjfstqo1V7pxdVw4FZ5v1bOaL1IPF+sBqaqHBXy
         Dg6aWVoaUDhrY89h3tE3mqiG0LomIG8/B9jpLuHdtXZj+dv8g4q5dJCj8aOGypoqyGJ3
         43zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748291023; x=1748895823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7+gUcKKexaxy5novFqIZxIAX0ITBngrhPCqKSxeyIA=;
        b=Xn78uMX4EMSC5WhhD3yuHyclEnAfnSobbrgX8Gzic3yhUDXSWwWmwRAsbhH8O9kY1Y
         TYSfJR01TTgEelEf/Z2e9PEvn3UGgA0eWLDpsBee0m9ZWpC0w0zkd3htl3XyNXcmGzZZ
         ST8jndppxMvx4HtNch4K+8F6JZ3g4hgXFJo3CWg9jwLZTCQ/TT6AFSWSDvQmXmoJg3jk
         mmt8g4en7tR29qV7PsLR5lztUknX4fzOiDK3OOkJX1MjRI0Mp4kHEbpbX2Dq8R/XmvgG
         2JEuWnvYwUMAxTghiZBRP1TXKzN6A6uVJCPpuvrEjIpVLvPyn75OxhEo6HBgLkX06S5h
         3CFw==
X-Forwarded-Encrypted: i=1; AJvYcCWSaxhaiJ7TgkJMoVrQ8UnloLonHZn9Nn9O8cTjPJq8WVaHI+BTo5eKDoS5i28IR7KrIxfgolqmdmIVPlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxD3MQx/uIAiECPolWrBrqM073Z0y9Fg/Lpofy8aOwU4m3CmvF
	iG29W+nqysBTFHCE3IfOVGK6nFXyLOKmD09kAFSws6kBORSlE4eqByTq
X-Gm-Gg: ASbGncsXWC4JuZsvZJndSH0oS0/W/pmz5FUhuTBKeALRJ8m+vzb9bon9EBT5YO1nmvq
	Upj8bcUQR4udA70eaT6dfHPlqX1pdTw+93xIb2Hk0SNU3Bktk4xMNzfP2K5jhSL8YzTbtDdXGN8
	x2hQwS3h1RYM7caMw6N4MHBY8TVpn+vDILPwnJdFVWSpNKr9hmedVjmCKxeGKZv0AwEuNj+eNdZ
	mAprhAS20zWfFogjvv3K5WhiyyVLu48GKCA6Z5nzE7UtCdR4TZE1OX1dzdQei9oFBF9blv3sAra
	/iwUgICyEU5ouFc0RC9i+g0Uy1LrAU8y7p3UpVJ/CN3Nh0JNIBpJ41bM9AR2rqJhJ/ZvUAOE2QB
	II3Q=
X-Google-Smtp-Source: AGHT+IFZTWjswAKPy+IU0hlmiBXBclD4o7fhR3ZoHwVNe9Sl7RasJ8jOpeu5CcVSK0cpxpF4k1GPsw==
X-Received: by 2002:a05:6000:2401:b0:3a4:dd63:4ad2 with SMTP id ffacd0b85a97d-3a4dd634c14mr2939557f8f.37.1748291023340;
        Mon, 26 May 2025 13:23:43 -0700 (PDT)
Received: from [192.168.1.46] ([154.183.23.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc52ab88sm8737719f8f.11.2025.05.26.13.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 13:23:42 -0700 (PDT)
Message-ID: <4c4ff0ea-509a-4e33-b5b5-ddf6e7213474@gmail.com>
Date: Mon, 26 May 2025 23:23:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: escape literal asterisk to fix reST emphasis
 warning
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 shuah@kernel.org, corbet@lwn.net, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org
References: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>
 <aDTCdQNUN4Zlw2jJ@casper.infradead.org>
Content-Language: en-US
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
In-Reply-To: <aDTCdQNUN4Zlw2jJ@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2025 10:35 pm, Matthew Wilcox wrote:
> On Mon, May 26, 2025 at 09:43:59PM +0300, Khaled Elnaggar wrote:
>> Escaped a literal '*' character in symbol-namespaces.rst to prevent
>> a Docutils warning about unmatched emphasis markers during documentation build.
> 
> I don't think this is the right way to fix this problem.  We want
> the test to work in both rendered and un-rendered form.  I think
> we can do something like:
> 
> -For example:
> +For example::
> 
> to turn it into a block that is rendered literally.  See
> 
>                 For example::
> 
>                   echo $((100 * `cat active_duration` / `cat connected_duration`))
> 
> as an example in Documentation/ABI/stable/sysfs-bus-usb
> 
>>  For example:
>>
>> -  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
>> +  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-\*")
>>
>>  will limit usage of this symbol to modules whoes name matches the given
>>  patterns.
>> --
>> 2.47.2
>>
>>

That even looks better in rendered, (::) are actually so prevalent I don't know
how I did not see it before. I will send v2, thank you for the proper fix.

