Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5466919F422
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 22:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738968294; cv=none; b=JXhJNrhk95onuCVQUlB4NjmtapC3kOHmLokEqD5pkiNFSo9UjSwpz3P0TKjoIorQVf3ux7gIa/eMMt7F1hzxIEs5YZL1eEz6dB00XeCQtdCgizn0X/FSK+2dGVRTB4fJKw4s1NXN/J9YkaKu1giKnXkcTexRviy/LpTDFHBlgpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738968294; c=relaxed/simple;
	bh=xER+J0rwCJQXKyznu3AhTqAUumvPqCAq0oO+l0T+4Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQxQS/lMLM3mrneypBEkgfcW2ZYLkggCX9uNVQmqHQPO2wWXr5StT5xwlLvrH9WmMhmnBlHg2g0fuparPSBPDqDztJ1ShFGMkoqFge8tefmsWUdrR1KKS3I7B29sMCEvNMqs9GRiV9rj0c1QBqZWYZZV9DkK1K+ZACZSfCz+s5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=w44qH0cg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="w44qH0cg"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-219f8263ae0so50731935ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 14:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738968292; x=1739573092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aaVupd8VUc45i80fdS121DnyNihJxKhlS0yfklFXjf8=;
        b=w44qH0cg8smdRVacaHUWJ5+JluQwJAzwMJL91s/9wbzyha0lRsaqsycVXXoBmLXUmf
         8GBGut8+xCexykHdzbfg8uWLz8BoCR17Wu6PMbncbjJI+AN+b0MB94siQ2R6grODGb8X
         y72ThrRxw2rnVprrZ0sXWnk5zdEt7Ch/po0RBwPwAROkxtO1o6WfPAtZpQ4dClYxil2d
         g2K6Iteft2lxPUNkbmorHFb3oyNyGOIgBQM1AMh4WBUp7parZPwvldP41mTdgcKx3O4z
         hQNGfa9/tNb0tv1JinKn6aMWDm8ZhtTh7rFzTNMdufnquS7kcs/KbLJMDQp3Dz9SlswS
         bJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738968292; x=1739573092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaVupd8VUc45i80fdS121DnyNihJxKhlS0yfklFXjf8=;
        b=VEBjFmzG9yfm/JBPXNfKmGYPVw8eGnA9YkLT3TRLq475gVcVj/ccf2bIWbm+KTyu4X
         cZ/jYtaA2FgcgY9ZB02Zdzx6pv1BCMa5nNoqy+HUSfxZRTmwh3KfsGwyAfPKQbB1PWqp
         mp4EMEoDdDWbrKJW4GZgCSLUoTpdBu831tGd0ntRVe5wInbWWIZyN63/6RQ7CDZR8iRw
         3528QFa9oGQEtC50OXyx1XoPdIPHNI25Sv50Nr70v+6gJwXGNmvQlYufp0d/a5sw7wPC
         4DVNCaRZGi2uFJCr56lCBmDuwyIX33jjGIO1gxnIOhb+3v/1JBR+vHPefoZ8SnuU/hoU
         3iFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3iHK93bYb1encGMhr+Nc50RcPaquY03pCf03/m4FMnueAygJDN5Hkq+5vS1N4gsygAqz0CrlZO0gR1bo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1wW9ZKnVf4H4087h/E11kUzuxhhrpuegE4DtJp7HM49AGZg+/
	4x0Rcv8G0VteCa7sq5rYnpgy45IE/8SdWNeeVZkWqgB699pDEKNuRi8qi+gB5Qg=
X-Gm-Gg: ASbGncuhiVsy8N3Y0zNwiwgtTD2uo3S3p8Rz08z4amOJQIos2/E2hb6dmJJtZodOMqU
	sGx4FcpvzWf2IRhCl2HZWz9gfLKUFPqTGi+ErVAyfh9hDi9gpO6txk/8HTxZi4tA5pDdBERF3B7
	PpM4VDteHQf1xvdCUdkxCaJJaUKpOhohwLQPrHzvktcD6PU9I7YUzUuEVEf7XiDFPrgLQPEuK2w
	jrEs+jVeFysG9HIwWy4eM1iiMqep2JBASCtNcNosqWHOvLIc6Xwv8OFOATAmM5pGndLpzjkCRNH
	qX0JfRAqlc4svgSsaOfT93V2Vw==
X-Google-Smtp-Source: AGHT+IGTbu0BMzwMN01MWsrhsIOFLeTlIMVdLcXc0KHhDWapExjSRgm5VmEl2B4ZBoi8LJRoMaWbIQ==
X-Received: by 2002:a05:6a21:7a4a:b0:1ed:a578:127a with SMTP id adf61e73a8af0-1ee03b70c91mr10868884637.40.1738968292668;
        Fri, 07 Feb 2025 14:44:52 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aeb8d9bsm3508358a12.12.2025.02.07.14.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:44:52 -0800 (PST)
Date: Fri, 7 Feb 2025 14:44:48 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, rick.p.edgecombe@intel.com
Subject: Re: [PATCH v9 01/26] mm: helper `is_shadow_stack_vma` to check
 shadow stack vma
Message-ID: <Z6aM4NZyJSGLwIPr@debug.ba.rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-1-b37a49c5205c@rivosinc.com>
 <6543c6b6-da86-4c10-9b8c-e5fe6f6f7da9@suse.cz>
 <5708c19d-240a-466a-b17a-d51b26ab95e6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5708c19d-240a-466a-b17a-d51b26ab95e6@sirena.org.uk>

On Fri, Feb 07, 2025 at 08:06:59PM +0000, Mark Brown wrote:
>On Fri, Feb 07, 2025 at 10:27:10AM +0100, Vlastimil Babka wrote:
>> On 2/5/25 02:21, Deepak Gupta wrote:
>> > VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack
>
>> I see that arm GCS uses VM_HIGH_ARCH_6.
>
>That'll be bitrot in the changelog, it was originally VM_HIGH_ARCH_5 on
>arm64 as well but we had to renumber due to the addition of
>VM_MTE_ALLOWED while the GCS series was on the list.  The changelog just
>shouldn't mention VM_HIGH_ARCH_x, it's not particularly relevant here.

Yeah noted. Thanks.
