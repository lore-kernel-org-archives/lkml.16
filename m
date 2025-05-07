Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D2C2116E9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 18:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746644021; cv=none; b=F+1+ot6pD7oGLLzjK+rP43Mo7CiDEwHrPAQBx/D0icEVHIwm9XlOOgeb3kWod1c7bh7EAZX2ba5pt+3nX2bXZ7nDCemcBSlPlO+Znhqm6fs8yKV1h/xQKKdL6H7u91k+lPYs/BNeGIEDD0hmdOex9Cd9ECYKZAZ97enIvA/BrvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746644021; c=relaxed/simple;
	bh=4vKFr7qe4vZRrtcDl0MgUKtLS085rq+jZEdMX5rs7hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+JkEIy/x1Ww3yjhsMnUsUkQAH8AwPEALtYkmu5DThmwe0quCScr2goU6f275BdhUPS3I+u6+36ZUu73UDVpUsLpnug5gzPWVCwGP/r1UzttV4ZFZCvCPDIpqdqMaFOoItmyu0HIjqypxnB2Mqr4xUvwsBHZ8OkgA8F0uPO2jXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zW7ccNI4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zW7ccNI4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0b135d18eso119925f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 11:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746644018; x=1747248818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1fN0IMnzWBFaY2VN7IEwty5K6yq3NVqO0kz2Muvh8c0=;
        b=zW7ccNI44l8RwiOkFcwECg2pYgOpR+pOzuU3cXO1YV4YV79RWQMueRDY3RcHSFomHr
         QIyjqBIGNh17yehm0Zlr2tE+ZVQVVWpaDqhn3tNKUUfB0hgd1k73fRhXKlBOgtkhSz/C
         ujbvmtmN/zlOLwF+E/tJqYz9cF5THr3llGQAOi/V3A9irej28WihDyiDsBsbU4og+NX7
         fTUmnC8J+QSsqkZaUm9CSVDiFKxtgMF3gcTKRmmEEoxQW6F7NF2Nz67EEm64LvpCVyWH
         bvFYuamI0mZXIaxW2SC6VeHlvGUVJY8FCUja2gYz2PjmKilU6xb9/camijDjRBYB5tgp
         134Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746644018; x=1747248818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fN0IMnzWBFaY2VN7IEwty5K6yq3NVqO0kz2Muvh8c0=;
        b=vy2PF9EaFnLxRaMSN8f8T2VNl7hsIagWkpWmumYns1JZI65pEzmj1rg9pPF0DpRhTU
         VvryFAOkpBS/RXh3U0tMOktY7RuI7w+Zv1IQcaZK6GwscG+SuS1OZ+FhjgSzFa0kjJbn
         UJxGaA32SnQjCn1vFT/ObU9mhRJue2ZIoZAnqEiJPt264TaY8dzSHjt0mIBPup7pLIG8
         EXeD8EAVLCv5WMEE0IEV61TMpr3GomdcB/LUJpj8iH2B3c/Fd2WObekahAIaFNPi2Jt9
         S2bLhxLHBvXpngXPkT5KjORFKnEIb0AYc1AagtwXTkYhNa6ZHdlu6NuaHC+Ye1AlkQC+
         fOcg==
X-Forwarded-Encrypted: i=1; AJvYcCXAM36NsCpfaA8W9P6Tqla95yR+OORln6NN5VJf1nfPSwGGNp+K2UFktkbyqXD7fjeGYCwkrU0B4RtywUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvnQth2tx0rXa6GuCldO5/3AMv4M92h4+evMMgIzfCnxcq9W6g
	q8YLLscDsafQGk8KRyqzJrtA53RUI2JkT5D54VEjmNNtg5kfcSwncmNlu16HLXc=
X-Gm-Gg: ASbGnct6V9TxwwqF3EhD0Bo25BklFiH4XAWKs+cAQmarcX+oQUtNa/S82QhkwdvOlgU
	j8f/3xPMJcYiQsMTFBkPEoLa+g479UXlBvGYICVxebXT+nlWJMcnNMhL8pBMA4c1SNnOcEIeW2F
	SnGzpZY7poY3kS8IRbqw+FWgu1V3ui56uHr7/LoOsXOZHWY44CxM5v2qazn4+b0tKZKpwqw2bwH
	JZ30dGaatNp06p79zn2/1CFJGI6hrgiFl5KsVlCd2Hi9P6v+juA6AXFTXcuM73BJ66c7E4lQ+2Y
	vgjyGQKkbjRdIXerrBOtTzhwkFpXKXFZjyqfTHtgx+gryA==
X-Google-Smtp-Source: AGHT+IGbXFXl7/yZ2iz0z8i5yTYKtsZVTWA2mRb1dQUNrexl1xahP0QPQA2Qyb99RIZzlQKi8epSew==
X-Received: by 2002:a05:6000:1a87:b0:3a0:9dfb:b001 with SMTP id ffacd0b85a97d-3a0b4a41ad9mr3680514f8f.58.1746644017747;
        Wed, 07 May 2025 11:53:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0ba23e334sm103209f8f.85.2025.05.07.11.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 11:53:37 -0700 (PDT)
Date: Wed, 7 May 2025 21:53:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: rujra <braker.noob.kernel@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [FIRST-PATCH] staging: gpib : gpio : gpib_bitbang.c : fixed
 parentheses error.
Message-ID: <aBusLVDVchI-mHrN@stanley.mountain>
References: <CAG+54Da+jDEXRQMgmXGyCD2EHjNFjA9nS9=ShdJPrC3EKjUgBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG+54Da+jDEXRQMgmXGyCD2EHjNFjA9nS9=ShdJPrC3EKjUgBg@mail.gmail.com>

On Wed, May 07, 2025 at 10:48:45PM +0530, rujra wrote:
> To pass it as one parameter, wrapped the entire macro expansion in parentheses.
> and build it successfully.
     ^^^^^^^^^^^^^^^^^^^^^^
No, it doesn't build.

regards,
dan carpenter

