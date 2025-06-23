Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54D12868B8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691789; cv=none; b=SRBNGAIjY4FHiMUHeaDRv6JyOXE52yb36mUWizTdfC99BtNCi9BxR5jHq1DhQo7SIfEc6/axUgApZauw+wEkjCEpLc59+ioip7m1U+3cEgEEquCLzAXTp56rjzSoI/xEeM7wpuCNRPyeiKVArTXZBohCKtC4/cvzCGzmdhkXwy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691789; c=relaxed/simple;
	bh=tTps1bgZeMgIyRyJgAf8j1ySEUwFTEFRO76HEfCVNHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4bo7DaQyjdW5SntuTKDnNIsR4w96SPwSqeHhKGh1/iVCPIOcnQSjMJ6wvEpr051n4Ax9jKY/9UDgY90wjOk0Um0jt3JJZg/0Mu8GW7bEuAGhmKYJGaAlekkSBetx4XeTO+k5mMcz8kaCkBf+5ontakuABPguYaKKZyV/PBSzuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sD5PmEZP; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sD5PmEZP"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c13802133so1198054a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750691787; x=1751296587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6IukKYGwsGkuNIehFQ5uVE+/NktpdK3jn5Mck81hCcc=;
        b=sD5PmEZPBDH7Gxh6c721EhwdNRp6I9zVOP0uQXkQxy4YSIu1teCxMhfQi0WCUBZtbX
         +pEdNyvuffrUS/VPCUxzWJRgLuHaxN3tWsGPsM8VPN6w/UndADQDJ/DWqW7a3yppBYEF
         ulb0Pt5HN8XGhrXx8pi5IivZG74YchlCnS6y4AjLA1fO9C5l0im/V2pNzr2FreIJAISx
         UjIkE6kGmvD3hsJgKvoZyMqen04xGTLArgB2Lr5Fr11pwbBwBiUJzztTE5zRS3DP/rvM
         MlU+TpEoEdtQWRbLpl+EBiq/Kqoio94NuaDEpG6JjccXe3xCd9bHZz6bXVQoGEccrxOA
         edIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691787; x=1751296587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IukKYGwsGkuNIehFQ5uVE+/NktpdK3jn5Mck81hCcc=;
        b=QbXaRngTO5hzbyl/s1M+B94MJiF5AyEjIO2ehwT3DfTtHhMncF+t31SDCe3dGpJ9ye
         pCKx8kNyXQs2LtQoc0VXAABa0oJrygPYe7hPfX7C8yo4uZvmNW55LIV9lUKwpaKecPtJ
         7hzIoOEHa77wDQJD7tucNilj3diDrz34SjjhtbHnhYoMcw6zUk66EDFhLZClb/IuScNp
         iNDsFPW8lOimR7UFoSUuDhC4XvsMOJpGxO0MK4LikuPgIIyFJlZpBVzJ39RhKGxvsRAX
         jTRDudh/OqU7UqcHLLLpZUJ6WjQAqsl/cOXR9HQjOvLUPgsMz5/Oyn8qYjfQQSid3lda
         xeoA==
X-Forwarded-Encrypted: i=1; AJvYcCU0PARdTme2PZ+4plvWS85Iryh1ldZBTR2s8T/dGmkBAucVF7XGeO5eqS4S8ZAUCdWi+xPKBu9BZbvlxew=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDdZvmi9+Q7Dt3ACoMbZCBabyBLYZpBnOGnz6gNQIWYSNY2RxA
	2DVpG1a2qhsWhbEcOWqDC2CcLVRgp1v5G91oM80YpF6WaM98QSy5B7vHKCQ6ZiO4B6E=
X-Gm-Gg: ASbGnctLjzpMGKaLGYHmW/OF+ym7vGxYufisYq6wk9Ud6w0+/mH+Ety/sZQ63tCkqeZ
	j6hekcqsDZ2bZxiJsNaC2aRAh5+9ajKV/8ZCpgVE8v4j5cvjixocC+/zJp99ZoZDO/Zf86DfGin
	QLNRYkuyZCPMqiJ5J8Pptsm+60OWkY+SYaQE9zAluq7hwjTx2Ydz9jTw6dGjkr63SenKXDOsUk2
	SmdTFR5JJ6AZU973w2GpwvAb3qNqO4BrjDtw56Kh+R4zfEbIXti4wd4MUnxjlIfMU1HGsJPbSqy
	kmRQGMRbqAW34wvpeaMNKE3BaThkjG9BQ3vLH7lNKZ7C5J6LkQc+oAwTftQHICtV+iNGOA==
X-Google-Smtp-Source: AGHT+IHlbM4+Rmaq6vOY5wWyrfoXJ+idmbhQ0NYlP+olIKnC6D1vqqLXRsoxiZ2zwA9HYjiRRt9rYA==
X-Received: by 2002:a05:6830:6991:b0:72b:9d5e:9429 with SMTP id 46e09a7af769-73a91aeec81mr9759609a34.12.1750691786969;
        Mon, 23 Jun 2025 08:16:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90b33b17sm1466219a34.30.2025.06.23.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:16:26 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:16:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kisub Choe <kisub.choe.0x1@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep(1)
Message-ID: <a775180c-3ecc-4fb9-bd8f-9f8bacba94f9@suswa.mountain>
References: <aFdAEM6GnCudvqMV@zinc>
 <efa56904-eabf-4493-b064-652d02839c6b@suswa.mountain>
 <aFlmL0DtydfsbFl0@rpi4B8Gs>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFlmL0DtydfsbFl0@rpi4B8Gs>

On Mon, Jun 23, 2025 at 11:35:27PM +0900, Kisub Choe wrote:
> On Mon, Jun 23, 2025 at 01:54:01PM +0300, Dan Carpenter wrote:
> > On Sun, Jun 22, 2025 at 08:28:16AM +0900, Kisub Choe wrote:
> > > changed msleep to usleep_range to
> > > 
> > > Adhere to Linux kernel coding style.
> > > Reported by checkpatch:
> > > 
> > > WARNING: msleep < 20ms can sleep for up to 20ms;
> > > see function description of msleep().
> > > 
> > > Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
> > 
> > This type of change needs to be tested before it can be merged.
> > 
> > regards,
> > dan carpenter
> > 
> 
> Thank you for feedback.
> I understand that this type of change should be tested due to its impact
> on time-sensitive behavior.
> However, I currently don't have access to any device that uses this
> driver.
> Please let me know how you'd suggest proceeding in this case.

Just leave it as-is until someone who has the hardware can test it.

regards,
dan carpenter
