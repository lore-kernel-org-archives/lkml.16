Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57025A659;
	Tue,  4 Feb 2025 15:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683195; cv=none; b=K6BdwMk5NQ0hE0NmCIBXvl3Dw7EnGYKHuAdpukAnRlFT/0gkA1tc5nxtH+D4DU1LF3oHWItqgVSHBt86tuVs/MhCBkQ50OZQkGcL6b81d+56ebXOYNeP2g/TR4vSsnVo0qoaN80KhtUOf5a0SHcVgF5sXFpZjo/BLQJ/ibk7Zwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683195; c=relaxed/simple;
	bh=M9uUawyrHC0Uz4Cwg88n2oYlTJ/FD0v7Gk+s92DkQqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atdLY6sh9bW+tfC+wTrhHyM60XsMP8EEyfqEU183sV1Yfa7qzp7nbgPh1JGwm6TVsXogjN2CpRfdRfLI3Pb63j1vgE/M2W1Td3jM0S/poz/16S1nZH7tqG+4AyhDNOtiPCATf5VkbPnb8aGIHfCBHkpBlQAQQlGWaDz9dCi95So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnGnhp8h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnGnhp8h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A29C4CEDF;
	Tue,  4 Feb 2025 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738683195;
	bh=M9uUawyrHC0Uz4Cwg88n2oYlTJ/FD0v7Gk+s92DkQqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DnGnhp8ht/4fIGuBodraYzZxbVHtdb+5cA3L3euS8lir5wVFIJD69zajSK3xWRPQ0
	 YejkMAExF6Vn5LMhKqTO2gbSi5TJHSLjYAeSFas0OuePdSpsduV1UZKb0t33gFpT2e
	 OhAnEynHLzREiRV1ulenCf/+UocHIL60V4APTNdVM0CPPG2QaStfhzHjpCLHOhtPes
	 n9T1reAD+RawtkHTFroEQXmhXirj4Ld7qWB/FK1QlVWB8FUvbXJHhF4/JDfHfWu25Y
	 VMF7MzxqnQRwdudrara3odqpmwRKnYk982pnorT3mF69ThVHBeDzthv/0dWT5pZgpq
	 0xg92tXoz+WHw==
Date: Tue, 4 Feb 2025 07:33:12 -0800
From: Kees Cook <kees@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Eric Biederman <ebiederm@xmission.com>, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 06/16] elf, uapi: Add types ElfXX_Verdef and ElfXX_Veraux
Message-ID: <202502040733.E5BCE2A5@keescook>
References: <20250203-parse_vdso-nolibc-v1-0-9cb6268d77be@linutronix.de>
 <20250203-parse_vdso-nolibc-v1-6-9cb6268d77be@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203-parse_vdso-nolibc-v1-6-9cb6268d77be@linutronix.de>

On Mon, Feb 03, 2025 at 10:05:07AM +0100, Thomas Weiﬂschuh wrote:
> The types are used by tools/testing/selftests/vDSO/parse_vdso.c.
> To be able to build the vDSO selftests without a libc dependency,
> add the types to the kernels own UAPI headers.
> 
> Link: https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFEXTS
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
