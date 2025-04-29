Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1969278172
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912525; cv=none; b=gfxwHF+/Ig/L3XPidvNU0BW7G50rvfHaTWjBeSmTden/o35321fqTvtSjNdaaEgx40FlhDPLNEw3hi1PG+s/u4YefaGm+qoxgmL3/KYu4h86ZtbSZ3zmWn5k7kzyOT2xeHI+ZAFkKyM4ewZFavlsMGrYTglnITWgS//d274bfvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912525; c=relaxed/simple;
	bh=vYKNzFRfeSD8uhdK3ZiLtOXLvaQBwII13UmNV0ReRrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9khakJR4AhL8w3WjW46UcQhcMAZxGnsr5V8WYGF0RUoRwJD8xLgjerKAdaBnRVX/KRHYuMmloQQUHXEQa0l+HI+baIugQWrTirDX1uDGCCD5BuC53IEypDUHwtXn5H/MHefYPvDVyMrnl1LaCKh6B/SH/GJXjylZFdtlcag4ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nGt7mxBk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nGt7mxBk"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so3853436f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745912522; x=1746517322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XImyMVSLZL6nTiWgBIjQP2A74qR2PA0/ckZKHqWgLH0=;
        b=nGt7mxBkb/dRqEnTwopi8fasGsnZrPNMtlBqx6I+yANf+b1Bni67L1uqm7iiwdw7mu
         qAPZtMR+vGp+0PWJgndBWAPB1/StZZA5eq8iXZT8KurLNACUiKnwNlmpCPdGM4DWfnRl
         SHs39vqBtuQJWJqLeX4g6mG/rMhU8d4YcgVegeX4BS6MP+yTZYjPH5zlKwru9R8rJhkk
         l3gZZgGDTrPb/LiTglceVDVwp1nhh9/4mAh3uhwxpMRdA9IzwC+ryBUgm2yVTytQhcWl
         wnxVsPPW9KvJZ7oXtEFeR7q4bNvyWT2m3zi5T5UUSw9x2wDFI9kU9r6SzupvMkd1DEpi
         f6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912522; x=1746517322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XImyMVSLZL6nTiWgBIjQP2A74qR2PA0/ckZKHqWgLH0=;
        b=AFTnQqF/dnafyG/K0UUqA0lyzfc+vaN90lC9w8cEgnvD1PGAQkQaDh8XLJaCHllsfe
         jwWJ4CYoshVYt4kkHpHcUv7mO+qKYP6d88nOhvkbDqCUzwd7HNCicXIqivVzZ0L5C5JC
         MIsDR750j+Vey1eGBfzihHI98SCdHNIf7oaJTGIwHe2IxG0PO2lYf1fXI7p8hPza2QAg
         n2F9tdm5+5th8OyboyG9uaHYQ8CMqhmfjgMNKB+IFuMnMJhPsIy4HRVJ/zBnJbCA2t2s
         gGBY/Sz77NDIRRBBp0oDRJ8EV3WfMQd6dypumwqch8RfxrcZFV4nbVLdPco7Udg/ShV8
         S6Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWbjF82tO5AZJp83oiiewSwDMz5u1j9/BfFm+R6cAtOWvrS0o8TpQmcNadhRT74eEHJe3fZyUjcvlqIoLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg0TsLAFVzrHOgwNY9/ihMAik93GsljAcGvR35rz9YnUa8vPl1
	6e9JexN69nSCSd5Ctvkli6G/5gbxxi8lI/oqBaGQZQhcC9mnWw+nx9k4SfLP6BI=
X-Gm-Gg: ASbGncumR2iJixfcXYZ8Vb7JpcJSDbVkrFkGq7NyAl5AkQ27tDFESY3xlDpsqtzt1s+
	SYTfofLj2yylvUziUf4H+TzQwT1izuzZGmohB4NKZkeFc3dwtvjAZUx+jo7V1que9owj6KmmFHx
	DaXV88e2fIJIavXRtGg4k0kbL8JbeNMUoHZutXUt83QtEn+SO3YweP+Ntkfqs0j/KEG+6v0X3xv
	jEPWfoviYGDWYmGnz0s0OtYsejyH14yzKUXgR5k1damPN990zkmTCuf+LUOq/jPDtl7hRFuTJtr
	vPlNIfBYZwEDxQxkslOFy6+2NF7x4pEBrbZ9jsKcVHg=
X-Google-Smtp-Source: AGHT+IGGv7E79J2GQd/UW8LiJcDmHFN0qa1OtSoQpyK2if340bHg4S63X8Ujs5w3GbfTFYVvGSkaIw==
X-Received: by 2002:a05:6000:22c5:b0:399:7f2b:8531 with SMTP id ffacd0b85a97d-3a08ad77608mr1109534f8f.38.1745912522007;
        Tue, 29 Apr 2025 00:42:02 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13483251f8f.30.2025.04.29.00.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 00:42:01 -0700 (PDT)
Message-ID: <4c92fd9c-e545-47f9-bc67-0dfff962f506@linaro.org>
Date: Tue, 29 Apr 2025 08:42:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf tools: Fix arm64 build by generating unistd_64.h
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, arnd@linaro.org
References: <20250417-james-perf-fix-gen-syscall-v1-1-1d268c923901@linaro.org>
 <7703f88e-ccb7-4c98-9da4-8aad224e780f@leemhuis.info>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <7703f88e-ccb7-4c98-9da4-8aad224e780f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/04/2025 2:23 pm, Thorsten Leemhuis wrote:
> On 17.04.25 15:55, James Clark wrote:
>> Since pulling in the kernel changes in commit 22f72088ffe6 ("tools
>> headers: Update the syscall table with the kernel sources"), arm64 is
>> no longer using a generic syscall header and generates one from the
>> syscall table. Therefore we must also generate the syscall header for
>> arm64 before building Perf.
>>
>> Add it as a dependency to libperf which uses one syscall number. Perf
>> uses more, but as libperf is a dependency of Perf it will be generated
>> for both.
>>
>> Future platforms that need this will have to add their own syscall-y
>> targets in libperf manually. Unfortunately the arch specific files that
>> do this (e.g. arch/arm64/include/asm/Kbuild) can't easily be imported
>> into the Perf build. But Perf only needs a subset of the generated files
>> anyway, so redefining them is probably the correct thing to do.
> 
> FYI, my daily -next build for Fedora based on its RPM spec file broke
> on arm64 (x86_64 worked fine) while building libperf. I haven't checked
> yet, but due to the error messages and a quick look in the history I
> wonder if this is due to the quoted change, which showed up in -next
> today:
> 
> """
> kernel.spec:3115: build libperf
> + /usr/bin/make -s 'EXTRA_CFLAGS=-O2  -fexceptions -g -grecord-gcc-switches -pipe -Wall -Wno-complain-wrong-lang -Werror=format-security -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -mbranch-protection=standard -fasynchronous-unwind-tables -fstack-clash-protection  ' 'LDFLAGS=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,pack-relative-relocs -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -specs=/usr/lib/rpm/redhat/redhat-hardened-ld-errors -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -Wl,--build-id=sha1 -specs=/usr/lib/rpm/redhat/redhat-package-notes ' -C tools/lib/perf V=1 DESTDIR=/builddir/build/BUILD/kernel-6.15.0-build/BUILDROOT
> mkdir: cannot create directory â€˜/../archâ€™: Permission denied
> /builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250428/linux-6.15.0-0.0.next.20250428.435.vanilla.fc43.aarch64/scripts/syscallhdr.sh: line 98: /../arch/arm64/include/generated/uapi/asm/unistd_64.h: No such file or directory
> make[2]: *** [/builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250428/linux-6.15.0-0.0.next.20250428.435.vanilla.fc43.aarch64/scripts/Makefile.asm-headers:81: /../arch/arm64/include/generated/uapi/asm/unistd_64.h] Error 1
> make[1]: *** [Makefile:108: uapi-asm-generic] Error 2
> make: *** [Makefile:128: all] Error 2
> error: Bad exit status from /var/tmp/rpm-tmp.vAfil2 (%build)
> """
> 
> Full log: https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-rawhide-aarch64/08975350-next-next-all/builder-live.log.gz
> 
> Ciao, Thorsten
>   

Hi Thorsten,

Yes, this is the error that the fix is for.


James

>> Fixes: 22f72088ffe6 ("tools headers: Update the syscall table with the kernel sources")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/lib/perf/Makefile    | 12 +++++++++++-
>>   tools/perf/Makefile.config |  1 +
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/lib/perf/Makefile b/tools/lib/perf/Makefile
>> index ffcfd777c451..1a19b5013f45 100644
>> --- a/tools/lib/perf/Makefile
>> +++ b/tools/lib/perf/Makefile
>> @@ -42,6 +42,7 @@ libdir_relative_SQ = $(subst ','\'',$(libdir_relative))
>>   TEST_ARGS := $(if $(V),-v)
>>   
>>   INCLUDES = \
>> +-I$(OUTPUT)/../arch/$(SRCARCH)/include/generated/uapi \
>>   -I$(srctree)/tools/lib/perf/include \
>>   -I$(srctree)/tools/lib/ \
>>   -I$(srctree)/tools/include \
>> @@ -99,7 +100,16 @@ $(LIBAPI)-clean:
>>   	$(call QUIET_CLEAN, libapi)
>>   	$(Q)$(MAKE) -C $(LIB_DIR) O=$(OUTPUT) clean >/dev/null
>>   
>> -$(LIBPERF_IN): FORCE
>> +uapi-asm := $(OUTPUT)/../arch/$(SRCARCH)/include/generated/uapi/asm
>> +ifeq ($(SRCARCH),arm64)
>> +	syscall-y := $(uapi-asm)/unistd_64.h
>> +endif
>> +uapi-asm-generic:
>> +	$(if $(syscall-y),\
>> +		$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-headers obj=$(uapi-asm) \
>> +		generic=include/uapi/asm-generic $(syscall-y),)
>> +
>> +$(LIBPERF_IN): uapi-asm-generic FORCE
>>   	$(Q)$(MAKE) $(build)=libperf
>>   
>>   $(LIBPERF_A): $(LIBPERF_IN)
>> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
>> index eea95c6c0c71..a52482654d4b 100644
>> --- a/tools/perf/Makefile.config
>> +++ b/tools/perf/Makefile.config
>> @@ -29,6 +29,7 @@ include $(srctree)/tools/scripts/Makefile.arch
>>   $(call detected_var,SRCARCH)
>>   
>>   CFLAGS += -I$(OUTPUT)arch/$(SRCARCH)/include/generated
>> +CFLAGS += -I$(OUTPUT)arch/$(SRCARCH)/include/generated/uapi
>>   
>>   # Additional ARCH settings for ppc
>>   ifeq ($(SRCARCH),powerpc)
>>
>> ---
>> base-commit: 2b70702917337a8d6d07f03eed961e0119091647
>> change-id: 20250414-james-perf-fix-gen-syscall-a8d9b4367d07
>>
>> Best regards,
> 

