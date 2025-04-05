Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B0A1CD1F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743865120; cv=none; b=bqNt0NmIRpIoLfsTaeKiXbOTEvsQ9SFDDo+sl6f33DkgWdIjidAjMxG3GymZpd3YvDi1qi1G7dutX85JENPYEzdyEf3unxnzJAKzCmW8uXWl677KUf0xGroZ5PbulzUdzVIYD0y7rH+yMBMO8BhWlU4Ro52ygdZnyLPXr+ofWeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743865120; c=relaxed/simple;
	bh=N9t93yqbj2djYP7dFCDgM1xUqHLYdb9cLQ/mVQ8ZdXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtmLpVqou7Vxag+0p/LluvhftX/1EXOyqmk7tUrl3BtDTuJBSSG00MrWMcLxy9BeQW318GwJ37uPbF94mcjzbsM8JbVrgx3Gmww3a5X3qbsqsC4rBpJmwHqudHfJ4MSgZ7ds4BbrJ2tNRZhdkmMRO+pJi1aKfooo7Xcun6y/Nco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f67+a8D/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f67+a8D/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c14016868so2578184f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743865116; x=1744469916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m/SmM4ytvnKmQeFMenBw45G9NZO2G3CpELElKjb7zxY=;
        b=f67+a8D/2zKiT8jXQX4G1gj3/TZakI341o6lk3AUEHtk1zA0DNRanFUSe1S87Jwc0A
         yD5olctTra021ei4YF3vqcwR9VluGfls1RXfrvw6hW4P/ytb+gosVQyPprSmzx3rz8Vm
         0IMiKtM9MFUQuJmCETB7BysXMyFMYIJQvLIQkyTJ3v76e4HnlqtaF9ayI9SClL3xgMwT
         IWhGsppCkxkGKN/qMSkLyHGAfpCQJTGg+mLS7hGztrkzVzQjv0O6l2eM+FRhcxa70ay+
         iHaaLy3EAqB8z0Z1bSmJbak5QS+S5ljRuCRRAloax/Uq+qcap7dKliNzAspJe9wnv4QG
         4hWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743865116; x=1744469916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/SmM4ytvnKmQeFMenBw45G9NZO2G3CpELElKjb7zxY=;
        b=VOwiMSgMRjlUnDf/Y/JSIShc69dGRdWmbrOcHTHkaxe6A+m4hirNXuuuIzpeaLegxL
         Bm9DpVYnEdLiVipTOhDCXUYhDA9w+6IvQN/qnMZcnKHKdAKvThjk6C5fNktWrhlThrBb
         eOSToXSVfxJ4vHEpOVu1aV0rVMCb8MPP0N1ckT754ij3GYCChKYucuHquKCpfJHgaZmV
         H9GnDN/9v3qfYEz8Xe82GShbvDkuYJ+9Tp03THksZWkmcO9E3ibJKAk1BHyRgDxVzgrV
         mBi5AvPhYWQsxgP1np2CoFAnAV5Ogr4dHVTPkwy5HGuQzOR/qBToNreyu+xszQ90yp3K
         +/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGQBmQyriOyhhcI6iQmJQm/1XrFp6fsFNhfV8KUEeYPEDV2W0RtcBytlNGuaUQ+u6ZmO4roD3ZQ/CKE4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJCqPAP/R8QWvV7T05KtVpJwb/UuSPtjeQsP2XoQBV1yHtRxb1
	Rm/C37peMf1eeX1aaSuf15CcChQsCF3N8f3a131SltpSoCAvztLRRwjZdjgQYio=
X-Gm-Gg: ASbGncvQ63JtsL87lqNBcMAJuJlk+wKUkeVvzJrqNVLJ7kzXD0XhC5RppSh458J3NFO
	CfVEEHn2eBkZsxp/4BHU+yprL8OiLolp8XtYD02+aTc/0gMoX42IhswayI4cY/DDyYCH3qUAxM9
	tGfwZxQh49WuGXPWJWi5Imjx60j3af74k+RzxjA10LxHgj8sOsZbf+2zO50x6XBBe05YpSoLCm0
	UcGWipA/QdAhfL4tQzFIGqzv84bI3eK6wIeL1/VLMaQiO5ZHUSOr/S24xnM+RBmsALvaIIIucR8
	uJ7mQpdyl5LkcUKog64anywelpRWmUz4j1qxN3VRV/HPMt1EDQ==
X-Google-Smtp-Source: AGHT+IGstSgETdMzDdB1cn7SMeAEZaDIH6PcSTPH4LkDpdeT8mO6u1QWbvUSiJCc2vQ+HL8ELQ38HQ==
X-Received: by 2002:a5d:64cd:0:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-39d0de66efbmr5815830f8f.47.1743865116566;
        Sat, 05 Apr 2025 07:58:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec34bf258sm74822035e9.23.2025.04.05.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:58:36 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:58:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: rtl8723bs: Prevent duplicate NULL tests on a
 value
Message-ID: <7f19d199-9702-4829-a4a7-b1eada2adeda@stanley.mountain>
References: <Z/EuZuvGyQ9QBl6z@HP-650>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/EuZuvGyQ9QBl6z@HP-650>

On Sat, Apr 05, 2025 at 02:21:42PM +0100, Abraham Samuel Adekunle wrote:
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned to NULL.
> 
> Remove unnecessary duplicate NULL tests on the same value
> that has previously been tested.
> 
> Found by Coccinelle.
> 
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

