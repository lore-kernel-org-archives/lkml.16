Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214481E8359
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491754; cv=none; b=Viqt7WSetnVWWuHEElYC2GlBl7nJxSXTOuSg0aQOCuEHaJ7cSITy3fzh+8/ui7qoguB969e3GIktjWidgiftwDxD6mc08XsVgE7BAJonnGsI2VLwFpLfDMLhNo83uUZGOzjNaiOrf5uLwye8F7PJ83tdClUqRQ/tHrkX4ASsigc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491754; c=relaxed/simple;
	bh=0LaPR3cdlZSaxBOc2xcd/StQhQeM+2Qmg8A2G9kUVIg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=eVzhLaHBdl9QRo23YocavLvbmgGMiQzmZXMYewQ84GYv/dp8pfIB+jKbvT6wwtdaDgrL343KjVoks688zG/VOqfxhnvR1OPbdJqDyOIQEpWBhoSI9NqoL8Wt86Y8n4b/IZUUoOgNut06RHhVD9aPOriTTDg2lULq7+uEnT8pFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=widx1Zio; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="widx1Zio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743491730; x=1744096530; i=markus.elfring@web.de;
	bh=Ufr8jWio+k3mAwH6vRZeNy2DQEzSjS0mBeDw/wYCdD4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=widx1ZioDtdpjurlfr+BfKggyrhEV3NvwOhfEpEaNmlSPAycW4dDOnCqyp/n6u0m
	 NaJBhau+ilht/YAgkmY0BGWDWCP9LQuDYjncCxavqwoWSDipP9sIjNcK9CSUjpa8W
	 nlRKr9bL0ksDW8ktDGu5whUhW7YbCj78spJ5NV/Q/3jBhbyz12D4qWAojQ/HRYCN0
	 dp04CgKlo+bgCfu9zuoUxeja1Ybpro8OHZll6FPQShAgFsOjTUAphurft3IOmtDF4
	 I/Mf60Y8m9/cA197xNJha2JGnJ8YhxD2t7svPatYL52p8djsESoRahbTgfJxb3ocy
	 ON/JDIdagvxOX4TfFg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.54]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MAtwr-1toHKj15fl-00GGYs; Tue, 01
 Apr 2025 09:09:20 +0200
Message-ID: <03d87a25-02ea-4e4a-8d3f-c2fcdc4d068e@web.de>
Date: Tue, 1 Apr 2025 09:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250401033935.17617-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v3] drivers/misc: Add NULL check in
 aspeed_lpc_enable_snoop
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250401033935.17617-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9ghQMBunowstGfr7Qbdl++g5f/BvUsX0AoqlPh8HYvKL8GZYMsX
 yZRQOWRRNANFr4jw2YfJLK5EUbUmnVuuo5hJwu5tRWtS9qgDOAmpFJN5ZUeZY3fAv1uXZub
 RMxnWZDvwUIR/Gk68FCUk72oaFPQdMhOFkgBxBjRH+6uf5v2boobf9GcQSk1/SnGrJuZqXW
 TZfhrRgSY8F1Rp7gXIaHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AVsIm+6RSYk=;PrlffSMgd7hpKDqnRezgtqkWjFw
 ZuXIDWOOhFXZRp/sE6CqYGeNWsWGVdJlbiv2FLmnBPHTESSttB+NbnYPrqABu+Dd9fMdMmyiJ
 RB/lF1Kn+JgOYgdyQG8qHKodS1Q2Mz8LULEGuO4E7HWRMiuPiC3dN5uc49Iz1ZWDF8Z+rO0HW
 WdpARtLj89PAtIS4mKeGqHk6JEiK/spI55Z6rXclNUkmX9kWV+DHVDdPPRYJj28SD29aRvCwI
 +Eek5lhq/Hy79CyZfnRz8CwACKaybIRXnKqxyfRnPRMdmci5zSq5lps9z5Xtcjau6oR7bbyXI
 5zNmGLTsbduGfugEaRmiIcksmObTgCGX0m/Ko0M4vBJ//QCN9yw1EtdKpFx+UFoQKiD1566lG
 HVMcG2Np6cAIxaXq9hBYOaDVPLGEA7TLEBfzjme38hi2NyLyZUTEFFMBCOX6Y+jIzkOACl/O8
 x6T720TLEGyJKjdTJ54D3R7HQYjMXVE5TRkEnygFunNjhDlm4zmp9oQp8ij7wp9di1vEle+7f
 pZkkUigMVz0xYCoM4OaEaA6FlFoaxkZgkcl3KCgxcNaLQwUAwQ3aQz1AFILm4t38uIEDazCL/
 xM1UhF7g4B3qlfSwwE4cGehWN9LlPbOYfDFRkKsPcHWQQ39VCf25wQY/V4TSAj0eeKnG43EeS
 VHnvSSgWki8aDlK8qZXuvJJS7kT/uzGXvZTazGGI7hlZUc0/OqLrhYENi2AALgsawk185f5z8
 xtOH0YkInY0WKCDBXWblDzsgCz9AJ8xHZ2IXxni1Squu8ea7p7i9ddWEIgog4CBMFS0zNMDUz
 7xu02iE1sTnuXRcsEaCckEavgYtp7l90+wDdG0FfJ24ng2IHqq2dkZXSOsMmYSw3Vx1QU/22q
 tXnyaKVhQdJ2QMwQKrrmOARzZWI4LDP8meNY2MbSDj2scPrI/l9iAhjI9XsNgyb9LJFd25Wlg
 zcvIZUuZ7EqtSKLYXWkDZ9KfHPImfz5Nvv2dGh9B7JoaK0L1OqLStiB9DQMY2jKRqqoY2qAoU
 qkjE5ghUZ2avqLE2gKEjdyetxl6dksR6KFrPSRw0zIzgWSsv2b18dnfqDX7niv33J6izTqLAX
 jBPB8/o7pIrGymY8Kts2xneb4oehzwIgcrffJ59Em+uao9KBK/rtPwIxYjvMAEKV6VhOOIp0s
 CYNCoCcYYGKfL8H4WroBxccw6R9KGe9BD2SHvVRGGWBNaS3ZSvW4B81tVYHh/MCMLMiKJLMcd
 i2+wek0mzvgyjzG9gHvlSqAc4P4gQ8cIj+rQjhwed56OXNwEi+O1Jyl5IO4MS7QPwDJqIHjqS
 fIUnSg1cMgpViH5m7nNqwVFbq+ZeZnEEdZC71c9CzipHoPAgOPTN0xHvXsvA/U6mTi04sGeDC
 dd6Y48FwROIn5rCGRhEtStxkS3PJsg9Bn5LvTILmqRE1UBkKnFVzATShRIkrtMFGnFyb3abMD
 70wcHQ1A+SqC1OfJO2YS5UTaNgDsVPGhH8lVcJrAVSIaak2Wf

> devm_kasprintf() return NULL if memory allocation fails. Currently,
=E2=80=A6
                call?                               failed?


> Add NULL check after devm_kasprintf() to prevent this issue.

Do you propose to improve this function implementation a bit more?


=E2=80=A6
> ---
> V2 -> V3: Simplify the arrary access and correct commit message.
=E2=80=A6

* Would you like to avoid a typo here?

* I imagine that there is a need to offer such adjustments
  in separate update steps.
  https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n81

* Please choose a more appropriate subsystem specification.
  https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
log/drivers/soc/aspeed/aspeed-lpc-snoop.c?h=3Dnext-20250331

* How do you think about to append parentheses to a function name
  also in the summary phrase?

Regards,
Markus
