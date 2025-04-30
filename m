Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCDA264F9D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034816; cv=none; b=L0B4XT6LPi5+oxlT2wAcZYrmnt0s7u85tc6aafKcB4e3XxrtmW2T8c9zR4mmZijKoW4Tj9G6LisnFyBhYFnYN5HO1sahCIg2VGujATdol3QLkVNEy9nt9YC+KR3Q/wtC9qmnylH4H5wNK0ygvxrndaz291VjU19S2/rNVF2BU40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034816; c=relaxed/simple;
	bh=NDzeKYPe2I8Yfoh+f4eSw99RP2htupFat6fSOf0y+Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBRewIopfC86vrNKtST6wz2q11IDF2pN8ageebJGnZ/jpfVhO4hKSC7V6jqlAiz1G+h88SUPq8FqQb61IpixwUTOqo2Oe/yzSdnhAWwa5McojVl5PgFuNGfA0tvIZJm9u+YJVWCW2VqlYzjmDqpX16AaMam00JpnBJwbBHImO6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gP87IG3t; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gP87IG3t"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913d129c1aso121249f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746034813; x=1746639613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fTI+NTQY1S5fmWs9NCsPjnEhqIDgFiuLJ0sQ9mVO6og=;
        b=gP87IG3tzLQfE/9/oZlAJ2LJ+9D2gddvbiu323SYtZkJ2xTboQwRMxJx69Hf6r32nf
         CN9dvCM/fdtkQxNEhsdjT0A1kZzqE5voHnThBobnlkEmgS02cb8dqL7968BDoWdiqjOJ
         WBygYEcslwcPT6UXaKLYezu2C4Pocv2/Fex1q/lMimExLagdypHe1dgFkTmiEC7gWWP7
         wJOtF7dtoEvkUUsJhtr3mU8foK1zbp2TCzx8sTqaZ2kImpbjZzUdVNaF66sHOpL6dl7z
         9LIi9EQHYJCL1bTDS8pO9gZgKivbzzAhNk5HbrP47+jz8peMEY/yDsjFFNXvPcppVjKO
         HmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034813; x=1746639613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTI+NTQY1S5fmWs9NCsPjnEhqIDgFiuLJ0sQ9mVO6og=;
        b=iK6uDuVfdTCx4NA6kHxXQF+cGnT3htSkOWQ00UDBmnn2jgYLvkYnCjvFkB/LlvfLuA
         FRAs/wSVcFMjtc3SEMaL5E5l1GiuJr/xNsHv0ET8JDBlmCl7rsL3lVmrphYYGyDEyqhX
         hRNZq3MK4YCcTKgc7fTsxVDMBRx0V0LfRfx/2e70Mh9vus9D+K/NSIOQUlACgwB31Lf8
         nrtH/WK6rTsKcSRTLSgdAy44wW0IfrSQ+rLmZAR1eebSuR/x9cTezLi6xlS/SFNmA3Fd
         yTIs9M7avMiaYXrdOMrIvholO4fQnLO/y6hnG1Jk1vjz7JUidQ4ISugPEnwoOjYDrevD
         bQbw==
X-Forwarded-Encrypted: i=1; AJvYcCVOUqahQdDzjNY5Kh36cRwqp4ekfQz2nbuhBGE4AXvzYn7bdauGPnu/Ji3gPrNOyLjCiPdUHNKp0GF2AtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3az4KUzP6IyLYlKc3YYAgxUUtxc5oLjxEvQ+FJbjZGlejstU9
	2F2sAj/ekJp8LKHa9lybAAEzCb/U9E/bOkzPdbhmfABZb2cNWZqd9iwfpIFNZas=
X-Gm-Gg: ASbGncvNmUVe/N0cqE5JP2BBDEtgB4xWRfJC3L6829Fr+tQFm5Y0tOH3MgQ1be88XCf
	e7Vhu02iD2tu2Vmgq9DuoWngTmbmW/U/DndU/dIFZAfiVFEe0ID8Af3J00KC3cT+1z29gdyyD9U
	VVZeD7v2liUAIk+wUBcZgbpIzp68ZCCPXpmXSfC4L4tOSlZQq1ssFMKqB8dv11fK7TbF/wcsun/
	zw9BvvkEXJm80kmgBnJkUuJ5zycs+AM3izaFjN8yIR+dvb0AU2+dhwWRheXXLaSf1ieDJ6E+BQV
	3gm9dBqQ7riMs1ptO0C/qTwJk9ib57iUp3xC5UjpI+4FaQ==
X-Google-Smtp-Source: AGHT+IF1nO2qpvxe8YcGotQpsDAI9G2//rj00Y8Vv2gR//T8UoGu6ib91X10edaNaTJyuRE9TTivJg==
X-Received: by 2002:adf:ee0a:0:b0:3a0:831a:8fef with SMTP id ffacd0b85a97d-3a092d00c42mr301702f8f.22.1746034812866;
        Wed, 30 Apr 2025 10:40:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073cbf04dsm17858905f8f.52.2025.04.30.10.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:40:12 -0700 (PDT)
Date: Wed, 30 Apr 2025 20:40:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Satya Tangirala <satyat@google.com>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dm: add missing unlock on in dm_keyslot_evict()
Message-ID: <aBJgeV7pZ7Q47OCb@stanley.mountain>
References: <aBHZ4puON8GNK0vw@stanley.mountain>
 <20250430165037.GA1958@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430165037.GA1958@sol.localdomain>

On Wed, Apr 30, 2025 at 09:50:37AM -0700, Eric Biggers wrote:
> On Wed, Apr 30, 2025 at 11:05:54AM +0300, Dan Carpenter wrote:
> > We need to call dm_put_live_table() even if dm_get_live_table() returns
> > NULL.
> > 
> > Fixes: 9355a9eb21a5 ("dm: support key eviction from keyslot managers of underlying devices")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/md/dm-table.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> 
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> 
> But that's an awfully error-prone API.

Yep.

> 
> dm_blk_report_zones() gets this wrong too.

Ugh...  dm_blk_report_zones() is too weird for my static checker tool.
The checker is looking very specifically for error paths with missing
unlocks.

regards,
dan carpenter

