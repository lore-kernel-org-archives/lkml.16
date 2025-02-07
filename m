Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC701B3953
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738965302; cv=none; b=gfsxa8+jWXbZei5FFGnbIIQpi6zwMdnLnsFnz6laSBoiN6JHYHIFmi3jB8SXzoxpkqmecE41ZgeY6kn5APDXntOwzGgnateXK2JlTra1CeAgVonXqA+6Fn8/SR3LaLHk1lSjyfqIZSvV8Lit+LkMcFN7BNcAzAevLAmjRFJMqR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738965302; c=relaxed/simple;
	bh=1gd0yH30pcxmkVpUUSXoevvZ1wIpN/0PdpaN6tVQ7vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0wq/jEVe2DdaEBIE8ZeV6X2yJV3jvS94xt9emnGwR1V29AbdcCaj9W1AkHH8eW95q0vUPobbN39r9sphNXjuKRolkkOEqcsdP2PhhhVvpCzRjwrwY5C6WB8bsBnqzF1ANwyT9d53nvk8pjOhEOV3L/G0uLXMVcqwLTBE/DKcyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=bOUR29+4; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="bOUR29+4"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-844d555491eso75952539f.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738965298; x=1739570098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5IBqtH4R3jDvL4rKWTD+iWS0bbTvtCiS0BwL590tGJ8=;
        b=bOUR29+4mFYUIO2dUBGytCdkMQbvdNnM3m52dq7b1tfsmzMKvLZBf2aBmNnWfgXbI/
         LyOFDSdXnB9jVjdaBVKkjlcfxrFyy+S7c2fzBEcfNJSBKqBdczx/jkkqTZ5zjwXsJrjd
         VI2tGyDOcD+EZB6FraiWIQrDm0fFnhivbnQUF9VpotAZzJz57IZhz1y901FecGm1T5jz
         NJRXTjKHACHO3YX7M+i3WMZrHSHH1SE5Fdg1YC5H/SwY7IimQxR5RewKW+X+tkY8gDGD
         AR/9R5WwHdgzir8850P8HJacX0qZJ+VUkrSOX9X8gaXTC7c2t0AoGFQ94DD5xXaEiCii
         NSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738965298; x=1739570098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5IBqtH4R3jDvL4rKWTD+iWS0bbTvtCiS0BwL590tGJ8=;
        b=H63qhHfIUQoL0uE9ybpqRXMnpSMG91wafj53vzI5IvuaDCsY+zp2li6XF9H+cFw3LY
         LOdE1FNLrk0IGPLz5lAvB39ahhqmMouBWfpsYRAOes8Ngn18hitWC0F3PqtH5lELedXF
         r4s1D0fUOO2pny/7qGaVQ3d9dcnMMKzsvdVU+DT1MiYNEEDM5ZeagsbCwivHyHmNZqGu
         MmKC8DetDA5aBFw24flWoqVnz7QwY7PUCs7vsUytyZ6x9H3oc5BStsQemQKj086lG6cV
         FAlA/3M7ZFTTF5lmkO+qmknzrjnaH9HZGgs4Cr/n3fZKyKEQDnH3wOT589EJM5GXI3m7
         tz+g==
X-Forwarded-Encrypted: i=1; AJvYcCUGyp3gRFUFP/WeAkSEAFlZPWc3hJEGhIIpC9N9LS2tdwgy9WV3h/VAPqbr1fFEZNUsH7dV+rcbp0NPKh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvsPVMTHmd+u2m7mtuu9HWGYJ1GikBPzfw/boaPcJoxrXqqXYX
	FmqIsdeBTpaL/zuWt47N0WGE+mRm7aZv52cxr8c0IkL2sepEXccdRDgmB6/pOYY=
X-Gm-Gg: ASbGncuHKSHw7AnY7Hv1EnjyzTqVENxdyGpsg2jQ11JCT/+Urn9SwF9qRo3AR3GxkUP
	ZfvEDuxoWgQfMIlYs9cdXkvAlDaMxJIm5L/5VsBCWpzk5NQhOteDLw83Ul8rXpoGsGBgAV4sY1Y
	XAlv4186BoeLgCKLGlmMV3eFyBF2V8OMNZFjBjDZhVzz9zgIIu4VU/1yiKokRYiY+0IS9ZE9aTU
	GumPPyMXWA0g7Bcddw/x9bRf8hT2iQHyJgOfA9BTsqBnuUu7XY+zO/6ssRMElh8CnvsVdWLehgU
	/wB+JmyB6q8=
X-Google-Smtp-Source: AGHT+IHtZu3iwfSrRceCWPHMvjUaJ4b5MixZUsAk664E4N5LXxNLDuIGyZG7eeJAsl3IlpSL0Ym+fw==
X-Received: by 2002:a05:6602:3946:b0:84a:5201:41ff with SMTP id ca18e2360f4ac-854fd886d54mr481503739f.3.1738965298354;
        Fri, 07 Feb 2025 13:54:58 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-854f67b90b7sm87271439f.40.2025.02.07.13.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 13:54:57 -0800 (PST)
Message-ID: <f4efd956-ebe9-4a02-8b98-b80e16db95af@kernel.dk>
Date: Fri, 7 Feb 2025 14:54:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] io_uring: refactor io_uring_allowed()
To: Paul Moore <paul@paul-moore.com>,
 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, =?UTF-8?Q?Thi=C3=A9baud_Weksteen?=
 <tweek@google.com>, =?UTF-8?Q?Christian_G=C3=B6ttsche?=
 <cgzones@googlemail.com>, =?UTF-8?Q?Bram_Bonn=C3=A9?=
 <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-security-module@vger.kernel.org, io-uring@vger.kernel.org,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250127155723.67711-1-hamzamahfooz@linux.microsoft.com>
 <8743aa5049b129982f7784ad24b2ec48@paul-moore.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <8743aa5049b129982f7784ad24b2ec48@paul-moore.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 2:42 PM, Paul Moore wrote:
> On Jan 27, 2025 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com> wrote:
>>
>> Have io_uring_allowed() return an error code directly instead of
>> true/false. This is needed for follow-up work to guard io_uring_setup()
>> with LSM.
>>
>> Cc: Jens Axboe <axboe@kernel.dk>
>> Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
>> ---
>>  io_uring/io_uring.c | 21 ++++++++++++++-------
>>  1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
>> index 7bfbc7c22367..c2d8bd4c2cfc 100644
>> --- a/io_uring/io_uring.c
>> +++ b/io_uring/io_uring.c
>> @@ -3789,29 +3789,36 @@ static long io_uring_setup(u32 entries, struct io_uring_params __user *params)
>>  	return io_uring_create(entries, &p, params);
>>  }
>>  
>> -static inline bool io_uring_allowed(void)
>> +static inline int io_uring_allowed(void)
>>  {
>>  	int disabled = READ_ONCE(sysctl_io_uring_disabled);
>>  	kgid_t io_uring_group;
>>  
>>  	if (disabled == 2)
>> -		return false;
>> +		return -EPERM;
>>  
>>  	if (disabled == 0 || capable(CAP_SYS_ADMIN))
>> -		return true;
>> +		goto allowed_lsm;
> 
> I'd probably just 'return 0;' here as the "allowed_lsm" goto label
> doesn't make a lot of sense until patch 2/2, but otherwise this
> looks okay to me.

Agree, get rid of this unnecessary goto.

> Jens, are you okay with this patch?  If yes, can we get an ACK from you?

With that change, yep I'm fine with both of these and you can add my
acked-by to them.

-- 
Jens Axboe
