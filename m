Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F160175D50
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743333172; cv=none; b=uHyevS4ic5/kSaBpAMCIhVNfqUdHspefFAtUsAQmsZrl2pvjDbYFWhLUGdrafrKZ78HcuLnovOkpNwaABGDnHFcbZLrynm8vzPZrn8B+eNEgfJuYiUucutlbrTMkqs/pNFaAvWMmQCcKL2euKMWYR++9SV6I5x2qMrt9I8XdAQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743333172; c=relaxed/simple;
	bh=LnWQlUy0Obb41LuuYcG29m2i3AkxpTw3bT9Z6HbqeoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYe9cpgLWfi2yDgkw1zBKjK3kQVUQ95BmyLoJlyDfRAbbg/JEYI2SAjOrYqZM56d6JO5d4xaZF1WsT2PZ9jfUVAxxj3cq5i8d1GcGjQ+WJq+SAlP4PEBb70FTDBBVC4CLGnTSDhFiMsNqP5KDX3BG3vYYX/iQyE6DTVr1jLbnYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=An30oobd; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="An30oobd"
Message-ID: <14e0cc95-95d7-4e7d-949b-d944366510a3@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1743333168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJY3OLhP2SkmfexLon8hzKLe4fDSbbfUy/idzgYz8bg=;
	b=An30oobdO9LFf0QQeb0gDKl+YJQCJivOaMuyVu1pPFaynt3+Ue61jxmEiUC6ouLugMvMst
	kN3ZFifMDLqlyIj8VnA9284owVulaFeSA062+b6Zn+OhXyvrr0NWcrbqdMUgJAU0SpZLnh
	CNPnID6XrLh/kIit6F1L/M4lsfIVJR8rdtVCy+Zj2gSzeKpAXT+nGzxSo24kBWFqcNA6tR
	qOLK+mvmtb88T+CfR3GxerP7HPgkwH5Jw6KMRWYO5PORxXmfh+DPW8L6CXpU4VeOoBwzF1
	n4bnN7Zt5KppamvM8SYNCglFPb2I/DhGI8+/VAgrx65OGarD1mex7uawOLGIMg==
Date: Sun, 30 Mar 2025 13:12:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] selftests: riscv: fix v_exec_initval_nolibc.c
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250306-fix-v_exec_initval_nolibc-v2-1-97f9dc8a7faf@iencinas.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
In-Reply-To: <20250306-fix-v_exec_initval_nolibc-v2-1-97f9dc8a7faf@iencinas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Gentle ping :)

On 6/3/25 20:49, Ignacio Encinas wrote:
> Vector registers are zero initialized by the kernel. Stop accepting
> "all ones" as a clean value.
> 
> Note that this was not working as expected given that
> 	value == 0xff
> can be assumed to be always false by the compiler as value's range is
> [-128, 127]. Both GCC (-Wtype-limits) and clang
> (-Wtautological-constant-out-of-range-compare) warn about this.
> 
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
> Changes in v2:
> 
> Remove code that becomes useless now that the only "clean" value for
> vector registers is 0.
> 
> - Link to v1: https://lore.kernel.org/r/20250305-fix-v_exec_initval_nolibc-v1-1-b87b60e43002@iencinas.com
> ---
>  tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> index 35c0812e32de0c82a54f84bd52c4272507121e35..4dde05e45a04122b566cedc36d20b072413b00e2 100644
> --- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> @@ -6,7 +6,7 @@
>   * the values. To further ensure consistency, this file is compiled without
>   * libc and without auto-vectorization.
>   *
> - * To be "clean" all values must be either all ones or all zeroes.
> + * To be "clean" all values must be all zeroes.
>   */
>  
>  #define __stringify_1(x...)	#x
> @@ -14,9 +14,8 @@
>  
>  int main(int argc, char **argv)
>  {
> -	char prev_value = 0, value;
> +	char value = 0;
>  	unsigned long vl;
> -	int first = 1;
>  
>  	if (argc > 2 && strcmp(argv[2], "x"))
>  		asm volatile (
> @@ -44,14 +43,11 @@ int main(int argc, char **argv)
>  			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
>  			".option pop\n\t"					\
>  			: "=r" (value));					\
> -		if (first) {							\
> -			first = 0;						\
> -		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> +		if (value != 0x00) {						\
>  			printf("Register " __stringify(register)		\
>  				" values not clean! value: %u\n", value);	\
>  			exit(-1);						\
>  		}								\
> -		prev_value = value;						\
>  	}									\
>  })
>  
> 
> ---
> base-commit: 03d38806a902b36bf364cae8de6f1183c0a35a67
> change-id: 20250301-fix-v_exec_initval_nolibc-498d976c372d
> 
> Best regards,

