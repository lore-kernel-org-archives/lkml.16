Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE77EED8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743862920; cv=none; b=U4I9MCQgl0TZ5D/2z2D4wA7z+nVCarGQKXu2eHPOFy4dOV0JIcqv9S1hTcUiedSWIIcipjXrpqmIsh20LT8iiXXIu23TMU/Q0EMtkusAJsk2Dg19bYyjjH2z7VtsFn1TjJCJxh3+ogkbeVlRpjeCPTO0XhIHHRGNTs+sHJLaEeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743862920; c=relaxed/simple;
	bh=Kqp+8zjqVnatfeD8Z6voyxBr0VEzpV2CX4mgWJKUYd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrDhZ+Hy5euo0xuQCzGPi4zW3wdRd0a3ec42ZJTKmzQklav70eHJJAFUYZbLGt9dP7yUQn0uO7uvEOxZwU78z+tGttyaWmAU6XiQpXx4OTpJWVXU6AChmE3qydtc+AiDRJcf825bk0TCm7RcLexNsN5ww6ezjZhgu1FKe9PoPl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=idMlTeDc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="idMlTeDc"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so2390180f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743862917; x=1744467717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=93RytDVxxoOt/6piPIaVVVkdD4eQVw9IESIfWY1biAI=;
        b=idMlTeDca9j965+CCza7V5g32x5UMdUY5TO3HbWVVN+pU4IXLPpKf/Km+fVatOIKQ/
         DN24beBCMS4PDWLVabJ1/mRetku0cMMWQOivWjB6PREafKR6sxWcHk5uIfbUUUWZKD+n
         e4ncv7RG1TQtghN+IXU3M9KtvBHfUOFhbjB5sVPKEcdlnTOIOuHu4DcPeMWoUUduETF3
         TceXjpqd0ozS7qXAuDrYZspWAZnTLtM4ZmO5NQB/cZSt2G7+E2cqRPnqvjjbWGBaCvIc
         oHGhQK7Hx6If8qoOCgMwGBfs2qdp6XZNoZ/kozuOhikk4+h5ojOyWp0aKrxBnFjN4Oo8
         sLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743862917; x=1744467717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93RytDVxxoOt/6piPIaVVVkdD4eQVw9IESIfWY1biAI=;
        b=VH8YD6TZYi9ROGImFUHYaebpUZvJ17TAjCWoKlYRe8oBX/tTmFVsmMTFAXOZs4jqA3
         4j/F9gz+/t9jT6vpCcv9te2eu4Z2ZX8PJoy/nTYbt0D7a705vYCJ91votu3LQRqVEnhQ
         w8tIlPF+OFAWQnmWH2zzyFDDitc+wgbjzRVjydv5rAtAk7ZZMmNre4QhiXcpu+dZS7XT
         AuLLc2fDt9ZCf0RfZ4u82wfATZ9UEZ8mEs2nNFpxhAF469Wm2BZImrOFt/lhEpza+kIG
         c/6C+mk7j1AWKZziguGKLQMSoRyiV6duGE5MkQRTq32fvwmmJYqNuSk4l4ghZIqGvAx4
         5gkw==
X-Forwarded-Encrypted: i=1; AJvYcCW0q+6fyRvpVyQYOLgbUxxC6XDTFKkhlxJULAGkVrQZJ1u2vNHUX3T/0EQl5X+5GBA0eGSR/QJ4t7cPVI8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9hVmeVZruPZ1uvfPWtf/U2yTJmtNx04caMl9ThPC9IS8xVK/
	MATRSZsF8p+mXBgG7OuU6QUYwnrbh/PLkQbB1tccuAWQu4PWLHQ5bbKIZWN21VE=
X-Gm-Gg: ASbGncsiOeL5ONjSGiKr3p9RRAz1ic0YpJ/1DYSUmkI0Zc+n2acD1ENZYuPi4H1n8uA
	+DxjWcS4jF/Qo2z05tMlzwpLX/7WkVdFMIlf56BehTsY3Hc0GerrZ2DOomAZIsydo440XM3e3ah
	Nu7Duzp6wd7UIWKIwzb9fcnxVB6xWOsELpw+tYcQgWj3u8JUHS1xCBMvlHSudyW0HCiKI+xR3Ft
	F408oyrouLzf2gb2VbZ9oObkNMlPsXAq/qUuYg6K2cjivYIhJy1VF0tqEspLpdubx4p9q7whMgB
	iBcR4hUbITM4DhapCqjBJTzp/OHM5JkBpUH/aC+e+1mQm6sz3g==
X-Google-Smtp-Source: AGHT+IFocO7znkSY17jMn4AasMtMECTj12lcuX1S1TbaDW9YfQuYql/afhbu7TkfR9L/L2OMBpFrjg==
X-Received: by 2002:a05:6000:1844:b0:39b:f12c:385e with SMTP id ffacd0b85a97d-39d0de17bcfmr5308898f8f.20.1743862917467;
        Sat, 05 Apr 2025 07:21:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ea8d16049sm89484755e9.0.2025.04.05.07.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:21:56 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:21:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Erick Karanja <karanja99erick@gmail.com>, outreachy@lists.linux.dev,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: Initialize local variables at
 declaration
Message-ID: <aec43d5d-8f9f-4951-9ddb-03b66b1ce859@stanley.mountain>
References: <cover.1743820815.git.karanja99erick@gmail.com>
 <ef29adfe7c8a189009b07c2873aa48782cd594ca.1743820815.git.karanja99erick@gmail.com>
 <2025040507-attest-hyphen-5dae@gregkh>
 <ef088d6-cec1-9758-cc0-55fb66ca952@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef088d6-cec1-9758-cc0-55fb66ca952@inria.fr>

On Sat, Apr 05, 2025 at 04:41:37AM -0400, Julia Lawall wrote:
> 
> I guess the first change above would be ok though.

Here is the first change:

-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
  	u8 queue_empty, queue_pending;
  	s32 ret;

-
-	pxmitpriv = &padapter->xmitpriv;
-

Yes.  This is a nice change.

regards,
dan carpenter

