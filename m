Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F07190664
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745518205; cv=none; b=UBBhIpK2+vS0AQThH4wtuuzVJ5R5k9xX00nMnjfCUO+bPDU/1bTsaBuJo1n+4C2aR4ijVHpij1YGuSyuYTOE3bRtcBfrr0DywPupQCx3W7il6vINAUfy7h3vhc0oYdLhGnAepVfF4TN1LVlpXmjJ+jCL+JBHUtKiuXFmmRvdBco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745518205; c=relaxed/simple;
	bh=Wr8Howp6YUBHFQ5IXcbrHAh69nUeNbi1WwiX/cJv9UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pw7hawetXGPJZdQq77zn54XKmkNEDlZWWC1PKPy8CIiAzRxaKo6SZAEdl2Dz1tgmfIgSEGs+pB4SowNGBFIRQKF6HvR9PiGub+PfHj4et2276omcdY15j+qbceVDdytg9/oLo0GcW9ey2V/8o3x3fWVwHfKAdZQpv79899eGbNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=bKZu2i/+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="bKZu2i/+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240b4de12bso21202815ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1745518203; x=1746123003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+UKNt0lCLDr2VLT9kOvLTb2AuOQOpzIZeg4tCrvuwj0=;
        b=bKZu2i/+MrIu2KWaD9cKAvnwOtvxeCXthuKHF+RSMnLrA28adNRkceF7FVKDQdVdOb
         Nvq6c/Jj8r4Z19qC5Pwd3i793T8SUDrsgwkz5e/def9SNCHPVg8SYZ/nlELW5/MxEspu
         3fkd6+cWdFheKMYW0CgmG5pGFUhTOq8OacB+G/Fubs4yQGoQoLNEiYqTUzGTeokFEQd5
         o/G3Qe0xBpy2OFfQtwTjMjZfVpJgERu7ftw5jiMl+1hFlOiK+BFkFdUYxKr+kHfXTMN9
         aP9osERILIZ6wsDW+OtIUr30RDevAJkzjjvHS0+p9M9XRYNWLF4ncQkUdhN2Pc/3Bius
         9adQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745518203; x=1746123003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+UKNt0lCLDr2VLT9kOvLTb2AuOQOpzIZeg4tCrvuwj0=;
        b=dZLIlSTCjxOTawRBKolzc+HpXnjf3LzJfByJInWKnQRFzwIO1a2aeLXqA3bVuZkUfj
         2p/SlaNzIshyUSEyRQf2CwRrsthw+AifYde+zEFZJSMa17lbQIaVSRg76CvnhmYnjZE7
         n8ts5FPVt7+zzq8AVfnV6/XbAbjACS9JpHt8MotITNkwT5Jb6KbT/7D8/dbphFcVbg84
         Vps+6JyAzSaqiAxYiU9dVKmYDeZ+vBnYkXFojDfSRyBycd/zBGQmWcr2OmsfxWdejr5W
         QqQkyOZ+hLoL99kh5i5y8anOKUU22RYAz0kihj9HMtWtMQz7CwGjFl0rfSLt9qMrT/B8
         ROfw==
X-Forwarded-Encrypted: i=1; AJvYcCUatCcXhT03qGL/4iUShD+RIPQ34UMbR3Sfbwc7GSzV+VVjs5ggNck0WaeGy/PYOJBOti42cRmyO0PH0/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8KksMLNYO09yjSin2R3rLMVSVZ6cqucN8tz4nfltWrRj0pA26
	dCouidHLQmGUVgn4XAtvxOuOE4C7cR5WrDCDirmQcZ/LfWoicFWmlgtcNZfZ/00=
X-Gm-Gg: ASbGnctq9+ysskNnvjhmsAZ4cqny1IsCRZOeG5PNYvtCK+SqNTbmCRihqwSvjpUNXjT
	gaJ5JzjT1MtUVqh5j6h8LU1fcT2sYKuiATHaB7jUp8azhf1VgKDYcEGXFdSkuvUesJVsDn8rGoe
	DCzE8PBEc3EcXBhpAp9eT+OFzdKQgOGbkiUQ7VzUOb6Mwo5t1+Z9NxuFSRGp1gUnzxEv1Yl36G5
	d1mmqRuSgoZAvJWeR510S/7ih0PtdUzs+lh2NzHF4NBL7A8wA9/nron/NQMDrFEU0kbWdzM+oP5
	cl4XbFBnSTDa0PN2Tx3ExtQbea1V1FjOAHCQjBAczeeU8whpMqHHsgYU2NknjxoOi2xQP20AeqQ
	rgH6UN/qQnrTXojz/iF8=
X-Google-Smtp-Source: AGHT+IHnCaTt/PjXgficrL39pGhcE2L6yyJvkQieKK32vsywiH1L2LBk23RuW6NeWGc4L/G8Ur3ipA==
X-Received: by 2002:a17:902:d50e:b0:22c:33b2:e420 with SMTP id d9443c01a7336-22dbd401ed7mr5490555ad.7.1745518202886;
        Thu, 24 Apr 2025 11:10:02 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:1cf1:8569:9916:d71f? ([2620:10d:c090:500::6:c802])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e751dsm16782485ad.142.2025.04.24.11.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 11:10:02 -0700 (PDT)
Message-ID: <6d9d6ad1-71cc-47f2-b7a8-d61f5ecdfa55@davidwei.uk>
Date: Thu, 24 Apr 2025 11:09:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] selftests: iou-zcrx: Get the page size at runtime
To: Simon Horman <horms@kernel.org>, Haiyue Wang <haiyuewa@163.com>
Cc: io-uring@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250419141044.10304-1-haiyuewa@163.com>
 <20250424135559.GG3042781@horms.kernel.org>
Content-Language: en-GB
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20250424135559.GG3042781@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-04-24 06:55, Simon Horman wrote:
> On Sat, Apr 19, 2025 at 10:10:15PM +0800, Haiyue Wang wrote:
>> Use the API `sysconf()` to query page size at runtime, instead of using
>> hard code number 4096.
>>
>> And use `posix_memalign` to allocate the page size aligned momory.
>>
>> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> 

Thanks Simon. I'll apply the patch and run the selftest to make sure it
still works.
