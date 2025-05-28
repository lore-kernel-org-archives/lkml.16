Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E2B1FECB1
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417212; cv=none; b=MuQBep51TzC+PSWKT3q6vZYdMY4zlIzwLtqoXHiAArQdvzBhiiunA8xnuAnUMjdcXRByIhPDDSNp17exzUSQyydJKO6+JPYK/qvkko4WocSy2D9lqwwBL77cW+XGEkRmC8C/UL42EC00V8esrDgnyxncU3GOqcGEM1idP4r60to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417212; c=relaxed/simple;
	bh=FVKyMWpNPzvSR7svhxr8Oo6IbwStsMjYKVoyHU2gqfc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mI0Himf16DA0HTVspmP6IczMtsv18hEIbnvXFY2mzgRBXl5MJQLSzj7sMbMz9/hvRyXTplx9h2fzoviK8MtPeSB0FV1SbHeKRPGJDkF8zrYUjycdxPLxNn4PsB9FKlKlqG3jZpsbMvCdQ/w6HlIb/MILjLlVn0WFMF4p+aHpXvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrFQJ86C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrFQJ86C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD25C4CEE7;
	Wed, 28 May 2025 07:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748417211;
	bh=FVKyMWpNPzvSR7svhxr8Oo6IbwStsMjYKVoyHU2gqfc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=GrFQJ86CJfW3LnlgJQ8p04zT1DZ0xD8I3OkZMnjL+bpnKYTt7LHyY3yeIZD2dlnx/
	 HWQAVNGak0WqGP6DtIh9b1XSM7bT8nwHmfTKK/AVwy5HbcOkN4fMbcDYquZW2YVMyC
	 ejBHwf/3zmM9vzlG6vPKq72ALWw6dbeh0S+cSw8Das3nEXe1OCTKJvQo38A3a5RW0+
	 QPMKGgzlal4AVofLeWm2sSttzrT09TWMeHkWhfEck3A1FJg9JxP3nw1tR3lwWGx/xn
	 Q5Qxp671UZrJeaSQSChXZBJDS8GbPySKdWJWGGy3uMhQe61hMG81FFI2GiQkmGgNxw
	 i4L9t6lmyXSYw==
Message-ID: <c454bb4e-0232-425d-b77f-cddcdfcce4a4@kernel.org>
Date: Wed, 28 May 2025 15:26:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v3] mkfs.f2fs: ensure zone size is a multiple
 of segment size
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250527165411.3724453-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250527165411.3724453-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/28/25 00:54, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Otherwise, it doesn't work with a crash.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
