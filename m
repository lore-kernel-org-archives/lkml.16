Received: from out.smtpout.orange.fr (outm-51.smtpout.orange.fr [193.252.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF85A291C2E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817557; cv=none; b=mRHMim9suj7s7ZRXDMFZd+E8uA6B+hyAm08i05HE7HtROHOfMyA3qSvcwxHfvqyeoUXb3EmENv99P37DtA6+xaTG93TZ6iHsG63m9u+j8HeU9Xn/PJoZt++pl6dRPBuMNYF5Qro9bloc8Vo/Qvu8U4nrvIa2e4jahkQBojTj+iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817557; c=relaxed/simple;
	bh=2mn0l/m6M2uSvV7dvbYnSPenaAzhChqJo6eFRW4XeTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qaeOBxL3vWIa08sD7LmvdAdg+hlCmhlB8+BctyOwYRuj2s6CPaTsDXxB4dQXeQBZ039i81iq6lQZeMisKEq8ul+shHRpxrgHRQJuhlTxuBd27gP1X0d4lA4LtXrWOtPoKXZEYb04RKgqxW1TD5NnZFS0hsddJUAUsmskRTphg/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=PDIZcUG4; arc=none smtp.client-ip=193.252.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="PDIZcUG4"
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id Q3SWuw5MZP9oMQ3SXuOWQ1; Fri, 13 Jun 2025 14:24:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749817482;
	bh=J748P/ycE21D8ejg0rZJK2DeFaE3v4xzrkl0Hh+KRZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=PDIZcUG4cnjNu4R5mz1NQELnzrs1LEswuUz7H16c/Tda46YuuvHcUucbfXDCxj+f+
	 8BSOWLRSFczQ5nDu0ntpfaSe/wZ9fNKoOchFdGGObllo3GSe/7aa2WUDUTCn4sUX9E
	 nXN1lc3FihUGc+0rE7tmA8YperZrah5QrKftdJ5UTy96Fb2ChnPbTHnmDzKTA/cwt+
	 Kt+3+HRe+HVa8x3H1Z/aIlezGoU1cbfl3yMnp4RKQq7iAChtp1H7ljPLrkPPyvA3gm
	 NY6WH8jLBOD9KiYYTk7pXmZJ44EWcRKnnuJbZbovRfsPO5X+I57lbY3ASRLnurd+nf
	 y40hwVhAEQEew==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 13 Jun 2025 14:24:42 +0200
X-ME-IP: 124.33.176.97
Message-ID: <b5030bc8-34b8-4275-86ba-11e11ab2bea5@wanadoo.fr>
Date: Fri, 13 Jun 2025 21:24:35 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1 fyi] tools headers: Synchronize linux/bits.h with the
 kernel sources
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>,
 James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
 Kan Liang <kan.liang@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Namhyung Kim <namhyung@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 linux-kernel@vger.kernel.org
References: <aEr0ZJ60EbshEy6p@x1>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <aEr0ZJ60EbshEy6p@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2025 at 00:38, Arnaldo Carvalho de Melo wrote:
> tldr; Just FYI, I'm carrying this on the perf tools tree.
> 
> Full explanation:
> 
> There used to be no copies, with tools/ code using kernel headers
> directly. From time to time tools/perf/ broke due to legitimate kernel
> hacking. At some point Linus complained about such direct usage. Then we
> adopted the current model.
> 
> See further details at:
> 
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README
> 
> To pick up the changes in this cset:
> 
>   5b572e8a9f3dcd6e ("bits: introduce fixed-type BIT_U*()")
>   19408200c094858d ("bits: introduce fixed-type GENMASK_U*()")
>   31299a5e02112411 ("bits: add comments and newlines to #if, #else and #endif directives")
> 
> This addresses these perf build warnings:
> 
>   Warning: Kernel ABI header differences:
>     diff -u tools/include/linux/bits.h include/linux/bits.h
> 
> Please see tools/include/uapi/README for further details.
> 
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: Ian Rogers <irogers@google.com>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Jiri Olsa <jolsa@kernel.org>
> Cc: Kan Liang <kan.liang@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> Cc: Yury Norov <yury.norov@gmail.com>
> Link: https://lore.kernel.org/r/
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

For what it is worth:

Acked-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>


Yours sincerely,
Vincent Mailhol

