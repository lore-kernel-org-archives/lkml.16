Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF21BAD51
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 01:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743730472; cv=none; b=MhR8LlLQoB0XKuAf3SXVlBhUrfg1xJk4cjY4i6xPZrIfeO8u3ylHnS9WGuU9K62OEsJNRIywiHAMx4BZd99OmJE/5KfX8T8noJQ3+BzFqGZeP1Q7wg5/aT/wqfxrufluru5avonKmD30pS9dlgiCzQRB7L13EoBJUtJ4lvzDRPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743730472; c=relaxed/simple;
	bh=WiAyzZ5WyRvsxdRTlCI9PbnPOpAWDexPfHUxCwCPsRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pN8mPCVkphg+Ewdi5l6V/TD50/5B2zZgIOtZmhNbqptk8PoKq5XJmFRRO0i1cgqy2QyNdcSn05+1ejbr8onDMAYrSmp6h6XNxoQT9uj8R3Pwlso3wuvqZOwg+YPaVLuEyramaepEnLV1ZpXAvfCyHeffvILnX6SN3d78JjfUsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j827AbAk; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j827AbAk"
Date: Thu, 3 Apr 2025 21:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743730466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4PHvMjLr8KaJRptWmvWh7wch6EgDRZ+GW28ZL9pV5NE=;
	b=j827AbAkCRxcmmfupJW1BaT6dEnAbOUYhBC/YCW+uzAKddO4pDJ2+SX/Gz9G8R1/Tpjeef
	cHiMvLza9GDB1j59LiESoMwfYSaAPg/ML23IiMR+qAIJ8llJpAkGJsKxT+0oPPFfi5epo4
	2p5Hn8Hn50VFjTFoeWIGt8czewtF/8M=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: linux-bcachefs@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 0/3] This series addresses several minor issues found
 using sparse.
Message-ID: <zzxxg3gfmd5vdywegv2x7wsw3xzpdryrtlkka47o4zurqmzgpc@z3vv7jzta5dj>
References: <20250404012822.188485-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404012822.188485-1-gshahrouzi@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Apr 03, 2025 at 09:28:19PM -0400, Gabriel Shahrouzi wrote:
> The first patch fixes a typo ('\%u') in a format specifier within a print
> statement. The incorrect sequence was replaced as it didn't appear
> to be the author's intent.
> 
> The second patch corrects the type for a function argument to __le64,
> which fixes two related sparse warnings. Although the argument data
> is already little-endian, using the specific __le64 type improves
> consistency and makes the expected data format explicit.
> 
> The third patch ensures cpu_to_le16() is used when preparing certain
> on-disk data (directory entry lengths). This maintains correct byte
> ordering for big-endian systems.

Thanks, series is applied.

> 
> Gabriel Shahrouzi (3):
>   bcachefs: Fix escape sequence in prt_printf
>   bcachefs: Fix type for parameter in
>     journal_advance_devs_to_next_bucket
>   bcachefs: Use cpu_to_le16 for dirent lengths
> 
>  fs/bcachefs/data_update.c | 2 +-
>  fs/bcachefs/dirent.c      | 4 ++--
>  fs/bcachefs/journal_io.c  | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> -- 
> 2.43.0
> 
