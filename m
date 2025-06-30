Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F77C28E605
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312472; cv=none; b=SrQZg6xQRWoouWiDVBy1bDlLQ0nrGZ47WQ63f8g4Pqh1J7jovvSPFGqkPgNrlzHGJyf/KYO+chyGJhW8KK822p82H4A8AVkLsU/KNPu9uD4uDS7K+DQpotd35ZfHYFqaXIKRHoCpqPs+RH+P71LgCrIChWaJxjpEPPVbaFeHTp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312472; c=relaxed/simple;
	bh=Be6wlW3qxh61YAsYffI4w0XqSmxDwkX60bMi3A/giEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brbL8ZPDPf1elnKRmVNfyYttSrIBMi1TVHHiUWiskKeJepwS10c/zKW/1gpqS8LeBIxo1S8ebXMuTuWyNkyZi3H0tRyIqxJDfZKswsiMgVnMOBt7S6zAui4/OEBKU/ySowpIT0x9aEIUlzErlXqjB2Wx46LBwYJsLTIrYIwkn/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=REE8c3k9; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="REE8c3k9"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-73a8d0e3822so2488187a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751312469; x=1751917269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YmZU1CwxbYdxvjVqnDRbR2hmU1JLOG0dDJmR8AN044k=;
        b=REE8c3k9Llv6fjCLeJmfHradu278Erz2k+VU3g4DSrG941g2VFe2jDCZ39SHGGvrso
         KTjZObWwzFZ6ALjM+UdbYisTShNDFZNaFXdKY2l6jrN8pMeSXYv0Nan0Up2OfYWSSiaV
         HMnASmvLMhXmxwmTbFtfxpLJH96KiWZmFyjwDtjfIJ/HSeZbvGv57aGMkX7lVHFQS/gg
         bulvC90/VU5iFR22U8arTd5mmD7ob7c+ky8Ejj0SSTVSOJaLW8tS/Vn21yiWtD/TCpEv
         p/d64ZmKFhM4hdirZcc06ZPn7iCOjEkOP7EpUI1Dq3wR1cLnRjkdSntDX+TyqF5MCSCB
         LlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312469; x=1751917269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmZU1CwxbYdxvjVqnDRbR2hmU1JLOG0dDJmR8AN044k=;
        b=BPvSB/5mRMMai3P/Y1N7cgwUndUI+8lu0+nzmLwbyA0WpzmX7arAkdk9c4wyHNnNeL
         hOT96TvLxHYkVT/4vPo/aTXsNudz3+Rs9hJXkyEA9dAdQ8px+fME+lyHxyJrDxy/vJgQ
         wk52dbFW59FIz8ch0S9LE3RsIPRancn4kp3S2bhHsbf39AOuhcOJW0KzvyrnCM7IsToi
         Z4FPqz/BO03tfY1a9oltE0kFsf+FF4GBeBYGy0S7t+BZxsEpFnFCii5pvDI/2Z55qme4
         i9Vbq41JQurny+xDGUu893fga8TeBYVf3ZUM0U22/qnBGhEIduiIcSUJAidwXTUe+xoH
         73Gw==
X-Forwarded-Encrypted: i=1; AJvYcCV/pn7ijNaucbWrGt6z/OmWFm84YTt0e16OeS5Eoi3xsbf6YcgJI6xV4IxqWyqZb3YcJvimYjKkdIQmRtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzScKUDIVNYoLwFkLxFIleSK9o1WWHwIXfyV/9pWFyJby1zoy7B
	xq7oiKIHi9RYC3LyFybknCN3UsYBT+FS6cOw5rYfygZl2xW/5rfBjyT9WJK54Xc2ltk=
X-Gm-Gg: ASbGncuEpc5858bxmNhThHOyOV59RAWsXsoJ1nZ1BoxUQ2AQAIYRhWHzq8hEEXMcUvy
	8lML4MC8TCegcm0M+ILBLyfRylRRk02J5PF9TrciErwJc1r8xhnJ+H03fm+LVQFOL1rggpPQ2Ae
	UH6Nu5Um4pweYQhiD3hNcIvPHicuotA9R63r+csbb7Sv8QxMGaPljbHCbwWQwTLcB0gyojA3+Dp
	quPKUHto3ceMDK2wsJELw/oRfMYzI1KzjZxWtBfWAfTOGeInNjE6CJFmt9or8NPy/Mh/MYusFhm
	M+/TX5Rwpiprl9KxfNJZGwAW6PDhnJ0TWfadEvcwaY8VF2Jp/m5wt3XZkGjerbAbHFKz
X-Google-Smtp-Source: AGHT+IFCr/h/Pq7YioC0C96yZfnS46Emb0XznV8LFfoTN6Hof+uG2lgGCVIDP4UToYNd7qu111FhBg==
X-Received: by 2002:a05:6830:2901:b0:72a:ec6:7fc1 with SMTP id 46e09a7af769-73afc6507b1mr8500368a34.14.1751312469502;
        Mon, 30 Jun 2025 12:41:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afaff249bsm1798804a34.6.2025.06.30.12.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:41:08 -0700 (PDT)
Date: Mon, 30 Jun 2025 22:41:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gu Bowen <gubowen5@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
Message-ID: <0bf20f7e-117c-4495-9805-baade7f466ba@suswa.mountain>
References: <20250630133934.766646-1-gubowen5@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630133934.766646-1-gubowen5@huawei.com>

On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
> To reintroduce the sm2 algorithm, the patch set did the following:
>  - Reintroduce the mpi library based on libgcrypt.
>  - Reintroduce ec implementation to MPI library.
>  - Rework sm2 algorithm.
>  - Support verification of X.509 certificates.

Remind me, why did we remove these?

regards,
dan carpenter

