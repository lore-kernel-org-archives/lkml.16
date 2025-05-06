Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC048F66
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529948; cv=none; b=tn1rrfv60PApWOKCl5GtCqnuRiRtDffJqaNOW/XKSNVoTsiDUw3+ZkPDSUSpGC8bTHyJbTlMd2BsWbrASsGeVpXhXNZFl1wGsa5aAaoVAM3PB6tpXUkDm6xG8YBIWYAIu8GZyrA1FoRMresW2oIEymvB2Qt0ROex7khc2K8qV24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529948; c=relaxed/simple;
	bh=tR+stJhv4utnrhvZKH8V2Fr1W5hFt/4WfZSegoSeGlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkyAoJgTeBLtAt/gj4mkZVdZdFW0wV9S3CgnaeuaAbNrrw0uNffWldpg2Po78RMBLy7LQ7IUvQYaFIwQb8z+zZ1s7VWZfeVaH3gyYNE5K5GoHW9vXZZ05rWELNb4nN0/vXx8GfT6NI0QDh1n6nZKI+CS3sAhKJqWYAWLud4iX+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fJMnx8cc; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fJMnx8cc"
Date: Tue, 6 May 2025 13:12:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746529934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v8k8ldnauD0CgQ7E/eO7Pydb5mcFxXh49dyfKEaXF2A=;
	b=fJMnx8cccISETof/TMcXu+uYNM0KanL40RgVBjOakStARBUriGrn3+wLx/Pls0PK0ItoO/
	RegUxQ4qmUm8Cl/IT4W9kZ3CvbeLiunPb3V7EYncs4qjsg01yZa9KStvlcwVWNk2afhH2m
	ghx3kcHW0siik1uLlMCmR/vyyune9Xk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: masahiroy@kernel.org, nathan@kernel.org, brendan.higgins@linux.dev,
	davidgow@google.com, rmoar@google.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kbuild: use ARCH from compile.h in unclean source tree
 msg
Message-ID: <20250506-accomplished-earthworm-from-valhalla-dbcbcc@l-nschier-aarch64>
References: <20250502172459.14175-1-skhan@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502172459.14175-1-skhan@linuxfoundation.org>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Fri, 02 May 2025, Shuah Khan wrote:

> When make finds the source tree unclean, it prints a message to run
> "make ARCH=x86_64 mrproper" message using the ARCH from the command
> line. The ARCH specified in the command line could be different from
> the ARCH of the existing build in the source tree.
> 
> This could cause problems in regular kernel build and kunit workflows.
> 
> Regular workflow:
> 
> - Build x86_64 kernel
> 	$ make ARCH=x86_64
> - Try building another arch kernel out of tree with O=
> 	$ make ARCH=um O=/linux/build
> - kbuild detects source tree is unclean
> 
>   ***
>   *** The source tree is not clean, please run 'make ARCH=um mrproper'
>   *** in /linux/linux_srcdir
>   ***
> 
> - Clean source tree as suggested by kbuild
> 	$ make ARCH=um mrproper
> - Source clean appears to be clean, but it leaves behind generated header
>   files under arch/x86
>  	arch/x86/realmode/rm/pasyms.h
> 
> A subsequent x86_64e build fails with
>   "undefined symbol sev_es_trampoline_start referenced ..."
> 
> kunit workflow runs into this issue:
> 
> - Build x86_64 kernel
> - Run kunit tests:  it tries to build for user specified ARCH or uml
>   as default:
> 	$ ./tools/testing/kunit/kunit.py run
> 
> - kbuild detects unclean source tree
> 
>   ***
>   *** The source tree is not clean, please run 'make ARCH=um mrproper'
>   *** in /linux/linux_6.15
>   ***
> 
> - Clean source tree as suggested by kbuild
> 	$ make ARCH=um mrproper
> - Source clean appears to be clean, but it leaves behind generated header
>   files under arch/x86
> 
> The problem shows when user tries to run tests on ARCH=x86_64:
> 
> 	$ ./tools/testing/kunit/kunit.py run ARCH=x86_64
> 
> 	"undefined symbol sev_es_trampoline_start referenced ..."
> 
> Build trips on arch/x86/realmode/rm/pasyms.h left behind by a prior
> x86_64 build.
> 
> Problems related to partially cleaned source tree are hard to debug.
> Change Makefile to unclean source logic to use ARCH from compile.h
> UTS_MACHINE string. With this change kbuild prints:
> 
> 	$ ./tools/testing/kunit/kunit.py run
> 
>   ***
>   *** The source tree is not clean, please run 'make ARCH=x86_64 mrproper'
>   *** in /linux/linux_6.15
>   ***
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 5aa9ee52a765..7ee29136b4da 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -674,7 +674,7 @@ ifeq ($(KBUILD_EXTMOD),)
>  		 -d $(srctree)/include/config -o \
>  		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
>  		echo >&2 "***"; \
> -		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
> +		echo >&2 "*** The source tree is not clean, please run 'make ARCH=$(shell grep UTS_MACHINE $(srctree)/include/generated/compile.h | cut -d '"' -f 2) mrproper'"; \

Please 'grep' option '-s'.

There are some (rare) occassions, when there is no include/generated/compile.h
but still the source tree will be considered to be dirty:

    grep: ../include/generated/compile.h: No such file or directory
    ***
    *** The source tree is not clean, please run 'make ARCH= mrproper'
    ...

Kind regards,
Nicolas
