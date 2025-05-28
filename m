Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFDF22339
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443529; cv=none; b=DFJQoz0XdpGHFuFOJY2sl9eDjRkChI6VpDOaKiackdoP4fM2xu5AlGJa/U19QVF0wlzkUX0rYPsGCHmwYpy2c6WFL6Za0O6AeVwkTh8TLb55lA0To9zr7jjxlgFJoxaXoU5DfUFK9tT7hZB8VUFJykj9Kaeib7VHq3BbdSf38sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443529; c=relaxed/simple;
	bh=pmJnWyaWtacG4qA9MnSrkri+m0ZViEInoNhsLA5VOO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESH7kcVyWYKnL4VrY+n9p9v8wuAWEd8/AiY0W9URtWr6RklDl4MdRynlC37ha/rJSyPZ5e3n2OKfyufu1ctLK4EIQjPOaNIYSigbl/WnxnLMQQWTdK3E8c0YGgjkTcCbngSdHb+IK0y5dMh/V528Es10AUlBNQsoA8JLdeuLNdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HI6pUFuM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HI6pUFuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748443527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8NsMEdT9aL0A0o+tflXH9VCdZUeVOkrNj4UYHGNir0U=;
	b=HI6pUFuM+jKPLUR6IlTJ7TOlx2d1jJUoIeNVwCI+sCYO056Fu9ZxkPtQhwJHqC5PCF0gzD
	T8MGsaGitOHHVjaV7I9wKfQW2aYtCdI5rt5J3HWYp2VzVAhWQm3jdyaCYoygqQlY3tVkSw
	wAQgA5jYoJqHmZHGZR/K1JiFld2b/fI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-kdK8cEuDNQ-oSrS-7Dsnow-1; Wed, 28 May 2025 10:45:25 -0400
X-MC-Unique: kdK8cEuDNQ-oSrS-7Dsnow-1
X-Mimecast-MFC-AGG-ID: kdK8cEuDNQ-oSrS-7Dsnow_1748443525
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa5bef30bso61477326d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443525; x=1749048325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NsMEdT9aL0A0o+tflXH9VCdZUeVOkrNj4UYHGNir0U=;
        b=LlI+H+0PoV2UegM0vicM8pIJLA0flRT5Q45/PdCIEw86ADZrhH9S/tRpbmvJYQU0zB
         IsVY0Q1GkmBDfin8wPdfYBWpupGEy/zprhloYmdMkjKfBHPiKz/D2Z3bn8q6edPW4Oe6
         mawwLiJNiNcRfVp4Yx/fBxY/OFxcAIgQD7HV8AAIt9dzszpvqWlY9W4lxFpveLr3JKvz
         HZSLQhlkqD7LaWKDs2xvcdZHUrDblMztQzGfV9OO58yeq3UF0lJ776dmNZs5K2+Rb2ua
         d3zdeVfdUEKPAu+yOB+bKcsTQY2OYnn6I+Rp1ahvA8EoyPS0CfabQjp6WW6AMnmoUv9I
         xLkA==
X-Gm-Message-State: AOJu0YwGML+iYWT4UcGeM9lbl3JuNYGuzAFbE5jR3It0stVhpMc+kd9z
	zX0ouM2wVBuhX6N3v4GWoWSEQ7HBmvDpF0vcimC+cnXaGtWeHLWDkIp/9XLap7EJaqhG+uLWgIe
	u/GSRmvIUWihpL4/XCVwtxzrXZKAyWEOe9ldEvsSyJ27DblM+5qkaqItqqxdXlSs1yA==
X-Gm-Gg: ASbGnctihVdt2gL24yx+6akf3aqRKQ1GqeyjkYiOoDzCOos44zeqaltjGl/gN/qPDbU
	ymB/5BvqpmVlHyLetg+blRgSBjiuZHp8aL/rdbKYgkroE6ODzw7My84H4XpJeuFska8uol2pXe8
	G6olwHy+8So5aaeGVNODpRyIQCRtE+Zsa0nHUTWkmmml9IFKdlOUmc1NXvlZLEORBryWNuOQRe9
	xD813Ubq47dKmRsZ6tmORSEsIhGmYhE83SUNPU8MJoYJnV0JqfpVaXHHCVBMGBlXjOXvCzAIgib
	99/7VsZs9cR8AAMQDCaquSPN6Cujk8gIc+8XiLkLNcHB/HTj5jJlxe6sGZdyDAt8hl0=
X-Received: by 2002:a05:6214:20e5:b0:6fa:9b5e:f1d1 with SMTP id 6a1803df08f44-6fa9d2954d2mr264243056d6.24.1748443524815;
        Wed, 28 May 2025 07:45:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjuC/6+FGCtr2tyOGkUY41luUxvRRwiJGQ2hOzrBdgImVPVlnSyRIaLJNcGzFhoJ53ssTsYA==
X-Received: by 2002:a05:6214:20e5:b0:6fa:9b5e:f1d1 with SMTP id 6a1803df08f44-6fa9d2954d2mr264242576d6.24.1748443524365;
        Wed, 28 May 2025 07:45:24 -0700 (PDT)
Received: from [192.168.1.17] (pool-68-160-160-85.bstnma.fios.verizon.net. [68.160.160.85])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac0b22361sm7140546d6.2.2025.05.28.07.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 07:45:23 -0700 (PDT)
Message-ID: <88a28ee7-ec83-4925-9cae-085b0dcc78fe@redhat.com>
Date: Wed, 28 May 2025 10:45:22 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 49/62] kbuild,objtool: Defer objtool validation step
 for CONFIG_LIVEPATCH
To: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, live-patching@vger.kernel.org,
 Song Liu <song@kernel.org>, laokz <laokz@foxmail.com>,
 Jiri Kosina <jikos@kernel.org>, Marcos Paulo de Souza <mpdesouza@suse.com>,
 Weinan Liu <wnliu@google.com>, Fazla Mehrab <a.mehrab@bytedance.com>,
 Chen Zhongjin <chenzhongjin@huawei.com>, Puranjay Mohan <puranjay@kernel.org>
References: <cover.1746821544.git.jpoimboe@kernel.org>
 <0a12cca631dd6f4c55015e224acefb641b3824ce.1746821544.git.jpoimboe@kernel.org>
Content-Language: en-US
From: Joe Lawrence <joe.lawrence@redhat.com>
Autocrypt: addr=joe.lawrence@redhat.com; keydata=
 xsFNBFgTlmsBEADfrZirrMsj9Z9umoJ5p1rgOitLBABITvPO2x5eGBRfXbT306zr226bhfPj
 +SDlaeIRwKoQvY9ydB3Exq8bKObYZ+6/OAVIDPHBVlnZbysutSHsgdaGqTH9fgYhoJlUIApz
 suQL0MIRkPi0y+gABbH472f2dUceGpEuudIcGvpnNVTYxqwbWqsSsfT1DaAz9iBCeN+T/f/J
 5qOXyZT7lC6vLy07eGg0uBh9jQznhbfXPIev0losNe7HxvgaPaVQ+BS9Q8NF8qpvbgpO+vWQ
 ZD5+tRJ5t85InNiWR3bv01GcGXEjEVTnExYypajVuHxumqJeqGNeWvx26cfNRQJQxVQNV7Gz
 iyAmJO7UulyWQiJqHZPcXAfoWyeKKAJ37YIYfE3k+rm6ekIwSgc9Lacf+KBfESNooU1LnwoQ
 ok9Q6R5r7wqnhCziqXHfyN2YGhm0Wx4s7s6xIVrx3C5K0LjXBisjAthG/hbPhJvsCz5rTOmP
 jkr+GSwBy2XUdOmtgq1IheBFwvWf08vrzNRCqz3iI1CvRpz0ZYBazmkz924u4ul6W7JuCdgy
 qW3UDLA77XlzFrA7nJ6rb77aZF7LJlkahX7lMaKZUzH+K4aVKTdvZ3szm9K+v0iixsM0TEnz
 oWsZgrkAA0OX2lpLfXvskoujQ84lY989IF+nUwy0wRMJPeqNxwARAQABzSZKb2UgTGF3cmVu
 Y2UgPGpvZS5sYXdyZW5jZUByZWRoYXQuY29tPsLBlgQTAQgAQAIbAwcLCQgHAwIBBhUIAgkK
 CwQWAgMBAh4BAheAFiEEXzkJ3py1AClxRoHJx96nQticmuUFAmF2uf8FCRLJJRQACgkQx96n
 QticmuU69A/9FB5eF5kc392ifa/G6/m8q5BKVUXBMWy/RcRaEVUwl9lulJd99tkZT5KwwdIU
 eYSpmT4SXrMzHj3mWe8RcFT9S39RvmZA6UKQkt9mJ+dvUVyDW1pqAB+S6+AEJyzw9AoVPSIG
 WcHTCHdJZfZOMmFjDyduww7n94qXLO0oRMhjvR9vUqfBgEBSLzRSK96HI38brAcj33Q3lCkf
 8uNLEAHVxN57bsNXxMYKo/i7ojFNCOyFEdPCWUMSF+M0D9ScXZRZCwbx0369yPSoNDgSIS8k
 iC/hbP2YMqaqYjxuoBzTTFuIS60glJu61RNealNjzvdlVz3RnNvD4yKz2JUsEsNGEGi4dRy7
 tvULj0njbwdvxV/gRnKboWhXVmlvB1qSfimSNkkoCJHXCApOdW0Og5Wyi+Ia6Qym3h0hwG0r
 r+w8USCn4Mj5tBcRqJKITm92IbJ73RiJ76TVJksC0yEfbLd6x1u6ifNQh5Q7xMYk0t4VF6bR
 56GG+3v1ci1bwwY5g1qfr7COU7in2ZOxhEpHtdt08MDSDFB3But4ko8zYqywP4sxxrJFzIdq
 7Kv8a2FsLElJ3xG7jM260sWJfgZNI5fD0anbrzn9Pe1hShZY+4LXVJR/k3H01FkU9jWan0G/
 8vF04bVKng8ZUBBT/6OYoNQHzQ9z++h5ywgMTITy5EK+HhnOwU0EWBOWawEQALxzFFomZI1s
 4i0a6ZUn4eQ6Eh2vBTZnMR2vmgGGPZNZdd1Ww62VnpZamDKFddMAQySNuBG1ApgjlFcpX0kV
 zm8PCi8XvUo0O7LHPKUkOpPM1NJKE1E3n5KqVbcTIftdTu3E/87lwBfEWBHIC+2K6K4GwSLX
 AMZvFnwqkdyxm9v0UiMSg87Xtf2kXYnqkR5duFudMrY1Wb56UU22mpZmPZ3IUzjV7YTC9Oul
 DYjkWI+2IN+NS8DXvLW8Dv4ursCiP7TywkxaslVT8z1kqtTUFPjH10aThjsXB5y/uISlj7av
 EJEmj2Cbt14ps6YOdCT8QOzXcrrBbH2YtKp2PwA3G3hyEsCFdyal8/9h0IBgvRFNilcCxxzq
 3gVtrYljN1IcXmx87fbkV8uqNuk+FxR/dK1zgjsGPtuWg1Dj/TrcLst7S+5VdEq87MXahQAE
 O5qqPjsh3oqW2LtqfXGSQwp7+HRQxRyNdZBTOvhG0sys4GLlyKkqAR+5c6K3Qxh3YGuA77Qb
 1vGLwQPfGaUo3soUWVWRfBw8Ugn1ffFbZQnhAs2jwQy3CILhSkBgLSWtNEn80BL/PMAzsh27
 msvNMMwVj/M1R9qdk+PcuEJXvjqQA4x/F9ly/eLeiIvspILXQ5LodsITI1lBN2hQSbFFYECy
 a4KuPkYHPZ3uhcfB0+KroLRxABEBAAHCwXwEGAEIACYCGwwWIQRfOQnenLUAKXFGgcnH3qdC
 2Jya5QUCYXa52AUJEskk7QAKCRDH3qdC2Jya5awND/9d9YntR015FVdn910u++9v64fchT+m
 LqD+WL24hTUMOKUzAVxq+3MLN4XRIcig4vnLmZ2sZ7VXstsukBCNGdm8y7Y8V1tXqeor82IY
 aPzfFhcTtMWOvrb3/CbwxHWM0VRHWEjR7UXG0tKt2Sen0e9CviScU/mbPHAYsQDkkbkNFmaV
 KJjtiVlTaIwq/agLZUOTzvcdTYD5QujvfnrcqSaBdSn1+LH3af5T7lANU6L6kYMBKO+40vvk
 r5w5pyr1AmFU0LCckT2sNeXQwZ7jR8k/7n0OkK3/bNQMlLx3lukVZ1fjKrB79b6CJUpvTUfg
 9uxxRFUmO+cWAjd9vOHT1Y9pgTIAELucjmlmoiMSGpbhdE8HNesdtuTEgZotpT1Q2qY7KV5y
 46tK1tjphUw8Ln5dEJpNv6wFYFKpnKsiiHgWAaOuWkpHWScKfNHwdbXOw7kvIOrHV0euKhFa
 0j0S2Arb+WjjMSJQ7WpC9rzkq1kcpUtdWnKUC24WyZdZ1ZUX2dW2AAmTI1hFtHw42skGRCXO
 zOpdA5nOdOrGzIu0D9IQD4+npnpSIL5IW9pwZMkkgoD47pdeekzG/xmnvU7CF6iDBzwuG3CC
 FPtyZxmwRVoS/YeBgzoyEDTwUJDzNGrkkNKnaUbDpg4TLRSCUUhmDUguj0QCa4n8kYoaAw9S
 pNzsRQ==
In-Reply-To: <0a12cca631dd6f4c55015e224acefb641b3824ce.1746821544.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/9/25 4:17 PM, Josh Poimboeuf wrote:
> In preparation for the objtool klp diff subcommand, defer objtool
> validation for CONFIG_LIVEPATCH until the final pre-link archive (e.g.,
> vmlinux.o, module-foo.o) is built.  This will simplify the process of
> generating livepatch modules.
> 
> Delayed objtool is generally preferred anyway, and is already standard
> for IBT and LTO.  Eventually the per-translation-unit mode will be
> phased out.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  scripts/Makefile.lib    | 2 +-
>  scripts/link-vmlinux.sh | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index bfd55a6ad8f1..a68390ff5cd9 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -278,7 +278,7 @@ objtool-args = $(objtool-args-y)					\
>  	$(if $(delay-objtool), --link)					\
>  	$(if $(part-of-module), --module)
>  
> -delay-objtool := $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT))
> +delay-objtool := $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT),$(CONFIG_LIVEPATCH))
>  
>  cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@)
>  cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 51367c2bfc21..acffa3c935f2 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -60,7 +60,8 @@ vmlinux_link()
>  	# skip output file argument
>  	shift
>  
> -	if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
> +	if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT ||
> +	   is_enabled CONFIG_LIVEPATCH; then
>  		# Use vmlinux.o instead of performing the slow LTO link again.
>  		objs=vmlinux.o
>  		libs=

At this commit, I'm getting the following linker error on ppc64le:

ld -EL -m elf64lppc -z noexecstack --no-warn-rwx-segments -pie -z notext
--build-id=sha1 -X --orphan-handling=error
--script=./arch/powerpc/kernel/vmlinux.lds -o .tmp_vmlinux1
--whole-archive vmlinux.o .vmlinux.export.o init/version-timestamp.o
--no-whole-archive --start-group --end-group .tmp_vmlinux0.kallsyms.o
arch/powerpc/tools/vmlinux.arch.o

vmlinux.o:(__ftr_alt_97+0x20): relocation truncated to fit:
R_PPC64_REL14 against `.text'+4b54
vmlinux.o:(__ftr_alt_97+0x270): relocation truncated to fit:
R_PPC64_REL14 against `.text'+173ecc

* Note: I dropped ("[PATCH v2 45/62] x86/extable: Define ELF section
entry size for exception tables") since it doesn't build as per the
comment I left on that patch.

-- 
Joe

