Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D917524EF79
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900738; cv=none; b=bPmb8i6bQuHlPR24SndF/GZo25WWkUz2tsw8HZS9F0R7POBrHX8lobV9LS2o+kbsWID8WA5S5f4Yd34bzSdWDhnN/fxLgiYbpTQwlUEkYMSvHSyunoR1jwQjd0gT9kYdADcbTTdwi4+lefGgdF1lSvlPHnuPSBC4wy8n/UVGw7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900738; c=relaxed/simple;
	bh=+/4OIRG1mgIFyKcEzT8MzBUT8UyTa8AoP35zj9hv3n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRxqBgdmBHB82IDq3Z1LgOCPFo7wch/tb9YNmdHhG9d1FcN1UFe7shVYvx0X4OCoxsQ0n2/BaER7e1rZUsOaUREkbsIhQHb1ZU2r4JsMjt4x0yQ47XLHGWn2lYMtpT7XkKgpRciMGgIFcRyFaF8Rg+f9UM/naC5LKeNTlr4fC2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acacb8743a7so148719766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900735; x=1745505535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zi7zFVkaGameQCQElY8z6qfvV5cVBlJOJVieQTjHZdw=;
        b=xTp07lkdNvqWfNJffQbGMjydBydLF1UTbV+jefz7mJejl6VOM9/9ihAfyMUzz/wrNm
         SOzXSwExcyvyIsv11XY2DaMaiXcnJEWxPDpHB9khBHs8kCm8RWxjLJbrWsm0QNykrLKx
         NtJKR71tLL7XOdXwgeMmcof0d3Nz5cnnHXzGnSlYsNEtsc7Yv33SOdQ10hRIW6O+zzPv
         cfbVQTFOIWdIMXwpayg/9SkowkgQ3xQJYm53GE4ZatjXAcroNc4jw+JfT01YVj0r7bcD
         ZhRijGIqVPiq1E06dK84yK452IwIN9KC+x1J/Z3cRKER3cUZg3X9PbiJ+ZbbWznjXS+W
         I7IA==
X-Forwarded-Encrypted: i=1; AJvYcCVF3GiUFr/nXR0gK12eVxCmgrn6MkyLET4OGyUGV9SyBBPuQvBc1AEuNe9T7gAfsvn3QaCHTO6JBv7tby4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yk507Y3UBo9mVqkuYY7/cGBM39vJDtWR2fSNFASxhBuztXS1
	GWkG6A2IxtQd6YTy/SNb5f+xN/9BaZcIFVEe8rYFsvOmPDlxWWj7p3JgOw==
X-Gm-Gg: ASbGncs8qWq6wl+6/K7GXpPU3vFxhxPZSnfkH9dFSy6sisFKbMDR3B/rpnVdKSqrt03
	Z3gQBZ//kUkbX/oOJ38ytt1FX3XzISJwB55hiji+FUbGTdbSJ+uP1nPdoOv2nDJruVp5yK1JTLO
	nolDhs7UUXwKOQJSyaGoXH7u0prwjxgIk3msjUW1RU43RKA1Ki50wEcDPqt0JTA8sLt52NyWhbF
	pxIn4CKDg/Xl9FmzR2Qbp79vYma98xtvlmx/grURE7n5+P/c7HcVAT/YGvZoDdm0+HIHBOGS2OL
	mWBG7ertTeJwyNNG0TlLBqsVSSr0FZs=
X-Google-Smtp-Source: AGHT+IH2FaJ1yPWDr+BeheIyMDzY5poAhbMf+kr6PY+cZP7Z2qrrqQ+2zbvzaFbssHyM7fxsxjInQQ==
X-Received: by 2002:a17:907:94c8:b0:acb:1165:9a93 with SMTP id a640c23a62f3a-acb6ec0f778mr12255466b.3.1744900734798;
        Thu, 17 Apr 2025 07:38:54 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:3::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef47ecesm1686366b.159.2025.04.17.07.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:38:54 -0700 (PDT)
Date: Thu, 17 Apr 2025 07:38:52 -0700
From: Breno Leitao <leitao@debian.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Joel Becker <jlbec@evilplan.org>,
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
	Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH 1/4] configfs: Delete semicolon from macro type_print()
 definition
Message-ID: <aAESfDy5M26hQ7CY@gmail.com>
References: <20250408-fix_configfs-v1-0-5a4c88805df7@quicinc.com>
 <20250408-fix_configfs-v1-1-5a4c88805df7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-fix_configfs-v1-1-5a4c88805df7@quicinc.com>

Hello Zijun,

On Tue, Apr 08, 2025 at 09:26:07PM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Macro type_print() definition ends with semicolon, so will cause
> the subsequent macro invocations end with two semicolons.

where is the type_print() macro invoked today?

I haven't found any reference for it in fs/configfs/dir.c

Thanks
--breno
