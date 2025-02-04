Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19340216E1D;
	Tue,  4 Feb 2025 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688839; cv=none; b=NApvC/65yAUfv2rjovLXoEddgppwMvpgBqEN/z3C+ZgGxt9ac+H371uPNHIwbIeV/5z3EX8JYd3r7tRUZ8W+s8l3I/mw2ZW81We+J5lGCyeP26eV0q/HnJD5O50nTimkEFRCFQLBFTaa5RA+z7R+NLwhb8355rc5Gd1z7PgH9Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688839; c=relaxed/simple;
	bh=YZ31DSvbYK3UiNJFHqa77aTtRkfmbc3/8hslY3Bwpkc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QqIgDo6HDseVbZKa9YcO88d4feWEtVBOGem68ISnbeE6Te73qypznEN8Sggbx7wioq43vnLt2PQ5VdjfwZUQTqOCsjLgXdkkcZKlMhCwC7wUUYZDHTeBqdO2ilb2roH2HRX4YaFJVzo/fgFj9tv0kXManV3XuFp0Yg40tDPNdPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cRJeK8ND; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cRJeK8ND"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 078C1404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738688835; bh=QOAA7tsjw5Gi+WdBavWeRcNGWzbHxYGEg9V95OUlx64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cRJeK8NDdrlDpvFUBvLrUzsgMnj/j5M5EE27LvZJMcJQ2rfsAPgegL5P/8iK810+b
	 JM03wUrITvezOFt4H2UrZx4cS0XdxIL+nrNPRR9h5gxZnEFdinJ4BY24Cdfg2RavVA
	 kIKqJnZfBHByL8cxI057goXGNLZf8zIBO8trxybF2acD+c0clGl1EBKEOSEfy6m920
	 lc6HXWinD9MInWj6T/djtYpGF/w+w6zk+LUyrTvMQFi0nBMmfGw1NfDWOaBHnGmAsq
	 0FC071z00l3Xmx3NuxWIEPCgVC49svtaD7OaqfI7Xax6lihuIwTnMGdj9xC78sRKXD
	 oEPep5qVCTLrA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 078C1404FA;
	Tue,  4 Feb 2025 17:07:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: cp0613@linux.alibaba.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Chen Pei <cp0613@linux.alibaba.com>
Subject: Re: [PATCH] Documentation: riscv: Remove KPROBES_ON_FTRACE
In-Reply-To: <20250108020342.4172-1-cp0613@linux.alibaba.com>
References: <20250108020342.4172-1-cp0613@linux.alibaba.com>
Date: Tue, 04 Feb 2025 10:07:14 -0700
Message-ID: <87h659fxkt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

cp0613@linux.alibaba.com writes:

> From: Chen Pei <cp0613@linux.alibaba.com>
>
> Since commit 7caa9765465f60 ("ftrace: riscv: move from REGS to ARGS"),
> kprobe on ftrace is not supported by riscv.
>
> And commit 3308172276db5d ("trace: riscv: Remove deprecated kprobe on
> ftrace support") removed the relevant code, but left out the
> documentation, so fix that.
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  Documentation/features/debug/kprobes-on-ftrace/arch-support.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> index 02febc883..d937b7a03 100644
> --- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> +++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> @@ -20,7 +20,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: |  ok  |
> +    |       riscv: | TODO |
>      |        s390: |  ok  |
>      |          sh: | TODO |

Applied, thanks.

jon
