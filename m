Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C31A71747
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745590235; cv=none; b=GZm8mzX/b7+7iqYaeHI/2/9+N92ngfqRAhgImKob2AOutm+gl5NNrh8aIIuVQGJXcx8Eq1wktIH0fkraBYjHjZe2litdKEOExunqN8R8btD+o9QuXssY5Gb2sQGQm3Y1JPHbM+aVuvYkW5zgrC3+y9nDFBfv6Y0JtkD1YUFzlGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745590235; c=relaxed/simple;
	bh=/rX+ziX57zGoQIm/RCL/KQe/uluB4VBdf+HVGBADkRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdzDmmhjRPcDItfwYIMazRbTQfrNPIZaDgGXVQGfD3SvglDWyoAB37UEKCk/Fhe2myjDHqx99W6bCoQBzwu1Y/oqYuXqDlqDhptqJXUNislsGV5ayEkPAcZdhbCR9UTv04HDy2ZmMRQJT2QNrCPz4LaRXsyl2LIQ2+VOMa7lzRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpFWQUZX; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpFWQUZX"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so1833649a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745590232; x=1746195032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNAuTjMgVlygJr1EupxAIOTzdJ7TQuKQ9O/2lcHFNW8=;
        b=VpFWQUZX7CDhzaTkdD46XY0GZtlpaMvcmP9LL6GDyXuokoFzWsBRc2yo35EScLeuyA
         /U2PtszNbh8F+R2xereHmqrm0WkXE+Odk0BuSoPBf1szU+Hh4kZzWZlax5Rocc1pUuhW
         e/Xabc2agLBBoNi36/LlFWXBPNJoYTxmjs6i9++pG9CsYVC4bspfYInyFQG3LJPVCv3I
         zrTt5heDhbkYY2s9tKwVS4h83HJKMBDSWanLFlXSQGPOuSBMQ4lyOPr2BFSB2rJQO+HT
         uaEscQjwYKnGdXDgo2ceTaCwV/kH7YQmh5SGZcmL0Zjm67XkWJhAVAqps23K8txfLzIB
         2c3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745590232; x=1746195032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNAuTjMgVlygJr1EupxAIOTzdJ7TQuKQ9O/2lcHFNW8=;
        b=H0ul6Oxs+Cv++RQM31CCTalfKO7tfaMIjoy8aicqo9GiI3gvl1roRmeU9La5jhvLHc
         ZOYpMwPj7xjjZinQ35k2jkg5+nYRiQPiIzgKS3Qjcp/lMKlKEHIWnxyA6m/PpuRYcVlZ
         5fSTiJ9v6zQ406RgSb7a5VQUTdq/uV8PMTRmwxxbYCZ59BhLxdQsWmB7VVTR+hRaycQY
         vaP2D4a+q7u1KSVCBsXwgcNrZgsS3l+MCwj4kS1Rkk7/ElXLrHBGhbhh1bNLYAz/CjVe
         tnrqgIsvTGh6HehfkrcpOaNnrD7GrMsPtaFtR3lHDM/HEKqj9Ne7gBvJi+8PW+9ELgG4
         H0TA==
X-Forwarded-Encrypted: i=1; AJvYcCXP3Ik+tE76S6lJDHx5nVh7sJSNeOsrgSAvLBYFYchw9bqlLR/2I6chEOd4DJJj9mcUrwhPVtjg7bvPlCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC4c4afALjckYI2ZtC2mtwKXPGGzLanlqpgmfjPq5zau35z6MY
	MLdK0UMfdDTdyGhvY09hcdLo018QhqyGHaFRfMmgr2SS3riQ0LKx
X-Gm-Gg: ASbGnctEOA6Y8evXOPhb4vSHgpdT8fyU0e8KEStCzFrJ9tVaLwmN/pBnh+W2upaMyw9
	JdD9K7aOFrFH3nVeXuJMMg3o+FtP6fYALYJQiScCLbTdrTk8TXJP8qVpd+FD0H5YRnVtfKb6fVQ
	XqV8pl2mkCPzv24TcStIEkXAszftaT8MyIAloxazpVv10hYblrMQg6GjKicNqMuMjGsmZ5tv8Qq
	D/b1rdKJVdCIFjPVMa8lL8GoJ2lbyR3OXRLRd6iBhcRChRcz7CSdgB0jq7j2aPthgNOvwtpRqV5
	TKsK/E8ofrM88Svxwnr/dQHuONajofkx2ZDGlmDI7g==
X-Google-Smtp-Source: AGHT+IHm3W5rJdHBqUtq2kw1QMgQBJ75bn+aujcCqxU4ypt61u1uAXTYR7nqwgZoVn7D8PKAlfZsLA==
X-Received: by 2002:a17:907:3ea8:b0:acb:b9ab:6d75 with SMTP id a640c23a62f3a-ace73540b78mr202231266b.23.1745590231476;
        Fri, 25 Apr 2025 07:10:31 -0700 (PDT)
Received: from [192.168.1.100] ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6eda34a3sm139062666b.161.2025.04.25.07.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 07:10:31 -0700 (PDT)
Message-ID: <5c175b6a-e9c8-2546-a4fe-98572c3f4935@gmail.com>
Date: Fri, 25 Apr 2025 16:10:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 15/15] x86/atomics: Remove !CONFIG_X86_CX8 methods
Content-Language: en-US
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: "Ahmed S . Darwish" <darwi@linutronix.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, John Ogness <john.ogness@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-16-mingo@kernel.org>
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <20250425084216.3913608-16-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25. 04. 25 10:42, Ingo Molnar wrote:

> -#endif
> +#define arch_cmpxchg64			__cmpxchg64
> +#define arch_cmpxchg64_local		__cmpxchg64_local
> +#define arch_try_cmpxchg64		__try_cmpxchg64
> +#define arch_try_cmpxchg64_local	__try_cmpxchg64_local
>   
>   #define system_has_cmpxchg64()		boot_cpu_has(X86_FEATURE_CX8)

#define system_has_cmpxchg64()		1

Uros.
