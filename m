Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30522563
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342726; cv=none; b=LSC5lS2pFJyOnJsfiTfj4JuN7UoxYrU1836MhqHYpgSTfdvtygCG4ZvffD/2GvuVYA6s7LtzDUHKdAz0/1UDSfq1BiJlyPhiq3EHAwCo5fF94yogKaFjqrb73v6b7CUgYOm6EE5hCxituYcZaOfk/1qkxVX81g7faXYLnPuJRxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342726; c=relaxed/simple;
	bh=xOJb1xRsrhAC+IlZ+UD5XxQ4SDRFfH/5tAWUx5IVt9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pawx1osRBzaCuru+BmVcmw1G0qwMRF0EDOyFeZMiVIiQATvewhZl7SsXYWpF0nptW2FSopY5wUlOm1S11+E1OAcHtXqMtD0dBXU9QdrKcMqfhANi0y9lf7gsmnYU4tL7p3kfhAhUVDjbVdyjW33oTHnwSh3dFyoVBmb68yyDQvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jDnvnTY4; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jDnvnTY4"
Message-ID: <f8759dae-ec1c-4f3c-a44a-dbd22d7964e4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738342707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xOJb1xRsrhAC+IlZ+UD5XxQ4SDRFfH/5tAWUx5IVt9A=;
	b=jDnvnTY46CIUzdJJg/Y1TaH+JgUZpovG+TiVEW2nij2uF91ccg3wxv/M0Bi1wJWrFgm/Zi
	IqAKmfTgZngUVUcVZm6Hx8P6oosWIiZ53dE1w0a3xHRaKX/+VmuVvivoQRtkMzeFZ+BWun
	JO22xSkdydzNTOKqz0X3Ovbf4cc0hvM=
Date: Fri, 31 Jan 2025 08:58:21 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: fix Clang LTO with CONFIG_OBJTOOL=n
Content-Language: en-GB
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev
References: <20250131140407.1392008-1-masahiroy@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20250131140407.1392008-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT




On 1/31/25 6:04 AM, Masahiro Yamada wrote:
> Since commit bede169618c6 ("kbuild: enable objtool for *.mod.o and
> additional kernel objects"), Clang LTO builds do not perform any
> optimizations when CONFIG_OBJTOOL is disable (e.g., for ARCH=arm64).
> This is because every LLVM bitcode file is immediately converted to
> ELF format before the object files are linked together.
>
> This commit fixes the breakage.
>
> Fixes: bede169618c6 ("kbuild: enable objtool for *.mod.o and additional kernel objects")
> Reported-by: Yonghong Song <yonghong.song@linux.dev>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the fix!

I tested x86_64 and arm64 for with and without lto, everything works fine. So

Tested-by: Yonghong Song <yonghong.song@linux.dev>

