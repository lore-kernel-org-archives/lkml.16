Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6C823FC43
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915074; cv=none; b=dqsK7J4jGuNweTD48wHapKBuKuDASluNmsxXu3NYVdTbkweFgyEpR053BbolcAwkuOQ9UEHakbusb2pL3YReatayKnYGb3latXeqMWw2DQSLKOz0dJoCLbcG1cIOKvXZNB4hj3hWkDzDpqIKE0tfXCppf63QCVB4K5qJfkBWQgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915074; c=relaxed/simple;
	bh=LwY9QkKjrGqjAvf2nxBCWR+BzENMRju/lQJYqpwui6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubffOZM+vS6ogZj6SMFktOJOMzpl8cvCHj6/MOpnpJ+t0+7s2HUB+5MmaUWUPVWkzYFYy4z+q3JbZoE/Fd5dT+S+RGBEt+Pu4d4ZFwFSQlYi0GH7H+PaEmgIki/lumN8wobYTrmwUM0auYB1x4D3nNMJyhkoUVF6fXjm5oLyxa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BcONL+OD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BcONL+OD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38dc9eba8a1so333747f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 23:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738915071; x=1739519871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+8W0r1eBfeQeUIpnApB8DWC5KBFE4067O0DEyXdDjM=;
        b=BcONL+ODGvVDDwQhj3IupJ81Vqw+avYXwPHfioeycwvyBUvN5Teu4tmVCPjBdbO53Q
         Q6wU9q6v8kAGLl5WHBglsv1beGlUVxJ+TlNdTuCsq3Qv/ztRTKioaH3N7DLBoB4eFYM1
         epI/b4zKZDyZ+kkfGTf1gx4lqtiVDMgoQZG5dHyZUXzVLWOaCyiSJZikQdb1AjOBlR+/
         xf617MF/eER2ZQ4ZoeVfYvlWTFAHsY9lj6NPauimjfX4ym6Dnzc+C9zrshyrXsTugy6y
         +YfpxuS2CLoGvnO5uy8qmY2BUTlYXihgQrxg2oXXlbCRuTIQCxXapvlsjdYUHjhRNHrM
         KlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915071; x=1739519871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+8W0r1eBfeQeUIpnApB8DWC5KBFE4067O0DEyXdDjM=;
        b=ldiU75yKO4U0F2QkwkKxQp2ftVZIvPST5uN7/CVswO/0ihfDGItQpaPuvm35L/9nUq
         4toBQ64FB8phgMyBQZYkYwabo4kfmpLxRZHiBAUnjGG26jba6/Q/nk/5y36bJTkL0Gwd
         PdjFS3/UUxz3VzarnWj7iSOzRrpxjhF0w+vQYNq1Jx5QIAUz7m7RNlWOFhwDYpfW/Gm4
         j7mCL+yNmozvxXxnjB8FBNmRFKwzouyXa+tCZkW8WBJpusgEsbKT0wVOItLxUsvQ3w/g
         c7F1PLss4+fDWrLlCyKvg5d9vH+BZFgUXZFnbAnE2zF1fk4rSgkp7G2vaU/rkVhz4TIL
         UaAw==
X-Forwarded-Encrypted: i=1; AJvYcCVgsZ0GOuG9WEz1f/64gPCp9/XN9EzJIPMhhlUD87sIP9c/d3qjxho30L4YUuhTPKvZSgq5I5X7yXidK8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEZJ+8c9G4FttrVJwlbDBhYxoWG0n/UCtt2ZNYlxRY8HIER90t
	h9uyKy/YQtgAUdIqWfSiFhv0JtFdvUMuN/TttiNqaoEpqcIMOBKz3v+PwS1n3F4=
X-Gm-Gg: ASbGncu8zdJdfISUulB8DJXUOYdkqluYPxLbZgDn3WrVYmKziLMQa4kM3RLCmYqbQ1i
	2tW4SvP/S16HDnXu8lsypoD9o1F+HWDSrhZ/wR441ynZTxxnkH7FHqaBS6qGnGgnhbkYd2uL8W/
	v7QjWV1SAp1riPzgbQFIE5rKKW1er7p5/BOhH1YfC+vc/X3/FHm8I/DtzuCxCn7V+bMasaB0SX1
	bqSvj/sdrefJ1BdpmF9uOonjQkeSfSFRqxlMExkcRHpKskz1Wk/c2LtiVWaDLPNDjbFgtFyF596
	qUjOxXI+gALveqFsdFNG1Xy6pZY9gpqG8STDGPhf2jL+uq6v1AgZmd+0b11m
X-Google-Smtp-Source: AGHT+IGq74MwyyBs38GAGswE+10Qup4jIp3Pg2RgGuSrurMbFniM8/Z3Fz5NjAT2LPHjyfZgPXz2qQ==
X-Received: by 2002:a5d:64ee:0:b0:38d:ac77:d7cb with SMTP id ffacd0b85a97d-38dc8dd105bmr1267323f8f.25.1738915070831;
        Thu, 06 Feb 2025 23:57:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ff64sm44791635e9.9.2025.02.06.23.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 23:57:50 -0800 (PST)
Message-ID: <76865725-35ce-48c6-822f-ea6cf817cee3@rivosinc.com>
Date: Fri, 7 Feb 2025 08:57:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
To: Atish Patra <atishp@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Kaiwen Xue <kaiwenx@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-2-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-2-835cfa88e3b1@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/02/2025 08:23, Atish Patra wrote:
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> This adds definitions of new CSRs and bits defined in Sxcsrind ISA
> extension. These CSR enables indirect accesses mechanism to access
> any CSRs in M-, S-, and VS-mode. The range of the select values
> and ireg will be define by the ISA extension using Sxcsrind extension.
> 
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 37bdea65bbd8..2ad2d492e6b4 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -318,6 +318,12 @@
>  /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
>  #define CSR_SISELECT		0x150
>  #define CSR_SIREG		0x151
> +/* Supervisor-Level Window to Indirectly Accessed Registers (Sxcsrind) */
> +#define CSR_SIREG2		0x152
> +#define CSR_SIREG3		0x153
> +#define CSR_SIREG4		0x155
> +#define CSR_SIREG5		0x156
> +#define CSR_SIREG6		0x157
>  
>  /* Supervisor-Level Interrupts (AIA) */
>  #define CSR_STOPEI		0x15c
> @@ -365,6 +371,14 @@
>  /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
>  #define CSR_VSISELECT		0x250
>  #define CSR_VSIREG		0x251
> +/*
> + * VS-Level Window to Indirectly Accessed Registers (H-extension with Sxcsrind)
> + */
> +#define CSR_VSIREG2		0x252
> +#define CSR_VSIREG3		0x253
> +#define CSR_VSIREG4		0x255
> +#define CSR_VSIREG5		0x256
> +#define CSR_VISREG6		0x257
>  
>  /* VS-Level Interrupts (H-extension with AIA) */
>  #define CSR_VSTOPEI		0x25c
> @@ -407,6 +421,12 @@
>  /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
>  #define CSR_MISELECT		0x350
>  #define CSR_MIREG		0x351
> +/* Machine-Level Window to Indrecitly Accessed Registers (Sxcsrind) */

Typo: s/Indrecitly/Indirectly

> +#define CSR_MIREG2		0x352
> +#define CSR_MIREG3		0x353
> +#define CSR_MIREG4		0x355
> +#define CSR_MIREG5		0x356
> +#define CSR_MIREG6		0x357
>  
>  /* Machine-Level Interrupts (AIA) */
>  #define CSR_MTOPEI		0x35c
> @@ -452,6 +472,11 @@
>  # define CSR_IEH		CSR_MIEH
>  # define CSR_ISELECT	CSR_MISELECT
>  # define CSR_IREG	CSR_MIREG
> +# define CSR_IREG2	CSR_MIREG2
> +# define CSR_IREG3	CSR_MIREG3
> +# define CSR_IREG4	CSR_MIREG4
> +# define CSR_IREG5	CSR_MIREG5
> +# define CSR_IREG6	CSR_MIREG6
>  # define CSR_IPH		CSR_MIPH
>  # define CSR_TOPEI	CSR_MTOPEI
>  # define CSR_TOPI	CSR_MTOPI
> @@ -477,6 +502,11 @@
>  # define CSR_IEH		CSR_SIEH
>  # define CSR_ISELECT	CSR_SISELECT
>  # define CSR_IREG	CSR_SIREG
> +# define CSR_IREG2	CSR_SIREG2
> +# define CSR_IREG3	CSR_SIREG3
> +# define CSR_IREG4	CSR_SIREG4
> +# define CSR_IREG5	CSR_SIREG5
> +# define CSR_IREG6	CSR_SIREG6
>  # define CSR_IPH		CSR_SIPH
>  # define CSR_TOPEI	CSR_STOPEI
>  # define CSR_TOPI	CSR_STOPI
> 
With that typo fixed:

Reviewed-by: Clément Léger <cleger@rivosinc.com>

Thanks,

Clément


