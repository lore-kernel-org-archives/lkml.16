Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AB318A6A5;
	Wed,  9 Apr 2025 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209393; cv=none; b=QmvxckXW7VkG28QienqR3ZsHDLVcMgfP93NKyEy4I30XQmxuTm2NnMibXq33jLdGzM403U4VjkIXFT7U2ZP91GfEMhL7hkculc6APXMYp1/BW8nY2Y5HnX1mNju9tFpUwt+EQ8+Zr0gy8Vvre+f+z2MnUnGVI5o8ly/rXfT5S8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209393; c=relaxed/simple;
	bh=loaEqD1hV2GLORmkOmIAkVMRJQh9otWpEfAWrshknPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtCd6V95FGZRAbLdFc2VckRr9UvnXucHraqsA3wjhKqV1dZFJN39mhsYhfQBgD353N1Kvzb4dnw8JBtlLcsb+uBb7gtZEl3E7QEA31xwbLlGL0lTQ11ko0eGnaUsENNZGHIAMdiBeoBBHg3kfGIoR0opf+hQP7uPr1siol+n+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJwYKl7Y; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJwYKl7Y"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22438c356c8so67300535ad.1;
        Wed, 09 Apr 2025 07:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744209390; x=1744814190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvH8MQf/kYTUa+cD8bLtmsX34EThoXCrFmCviz1U1Ko=;
        b=NJwYKl7Y6wrejA37opZb/FEI8BOCZTMew7CUuiVvQ559PGMkyJo7fJFY9e9Y72kysD
         3S3+5orB6XqM1hbc1y16kX+7t+NMCnm8dLO2cFx5hdvTIiSux6NhtiXOZ02/jdBTaxVq
         UBpz0cS11CniarG0a+b4c1jWEd8flwezg9taZvFH/MToxM2ZG0/eHHSuVgy/Bio5vxAb
         7L5hnTfUAhBlSB2duOtg7QVSy3tvj3h6pZ9Q8G/VNYXtvT/2CbrQC2z1594E0fIpqoy9
         5svEMmNy+7oNS/whle9e2FKpOo/KNG6ohnQuEqU+FmLQJcWzUXakSEA2Gf0/BA/5JjP+
         kOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209390; x=1744814190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvH8MQf/kYTUa+cD8bLtmsX34EThoXCrFmCviz1U1Ko=;
        b=rcWi80SewC3lkj6YFfFuneZRkCNUsB/S1k+EcVNgoA97r52EDevuA1Pd2f1QhKp/2G
         hdXtighrVx7Xb2jb0LBAw8u86DMLMfxz97cAOYOnT55YhKeiswy87zsvV/bs0lvu3P0V
         VrUKKAcnYCk0AXVRuBnGl5mxxmyGvhvj0jZv+HsCUxgskWX9UWhIE7EXFk14vBDYRL2g
         /McSa1UQoAbNO/bDKHR6S682qHQyhSxLMzmwkL8vaCqOUdDOQ/yqS0LByi7vKd/go58f
         zHza6cf+EU01UHoeVVZ2QzEW9gHOtoGi5wwtDaQ3JsXQWlXoPlkv2cxv5Xzq0KKBFZ23
         WiBw==
X-Forwarded-Encrypted: i=1; AJvYcCWbJquWnMiYo/hUa4Epqc61K6Xn46wmjaTe2vgwxLuOpFY8lP6o+jcG2u1AHS4g/tLqf39q4LIbJ0g3ag==@vger.kernel.org, AJvYcCWvxDqxp8hGdLmunFcxmgTuXuvaZzIqDcYBHyiuZmDmtUbu91dP9okhKBxmpNmVVXZ3f06LlhRrSvulnWUD@vger.kernel.org
X-Gm-Message-State: AOJu0YwgdXBiGM6gE4E4RN/w/Tw08dOBPMlEUX2kUriQWK5mQdS9LcAY
	bYL/QKNS0uNW68oteCfVrvCu5YLZ7z8JVjAE9dq9KCoL7Vkld5f067KbUQ==
X-Gm-Gg: ASbGncv6iqzH3PWFoRIQb1c7nSj23VbaXC5pnmYMjrgQA+jIAvcfXIQrIsXpZjbb8Y0
	r/O5ZzvyhKLrHJQO6SvoFMexmUFbuUMo4iLBkq4TgmPAMusZNmqwpNWLAcGRrwdEtYAS+WGvR/t
	hTlVpLkIHGAMnY0XqOs8KlbbOabqYxWz/gakQHVebNoeeir5fcR0uFXoqh3jtsJoSDcDmW7J6Aw
	eXLPy25E1Hd8IKoOMfL9QwhGeO0EL3g4iFJ70ffdORIoqcZpo4vflo5hAvOKaHm2/LDHcNdW3KE
	wEqMkuVOp+OzjKBg59yubL1A6l038DnQtJYjLuKxWeQrYnZdvzQcWA==
X-Google-Smtp-Source: AGHT+IGoc/FUV3kpjR6oT7QNLE5Izbz2r67zQddYj125bH5eaXDv4wiafChSacc68NtufDg61E+gpA==
X-Received: by 2002:a17:902:c411:b0:216:7926:8d69 with SMTP id d9443c01a7336-22ac2c2ed5dmr39394975ad.47.1744209390456;
        Wed, 09 Apr 2025 07:36:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d4677asm1447186b3a.55.2025.04.09.07.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:36:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Apr 2025 07:36:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] hwmon: (gpio-fan) Add regulator support
Message-ID: <f78ef1eb-d24b-4fb9-bdb0-ac7476ffcb8e@roeck-us.net>
References: <20250409065430.1413439-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409065430.1413439-1-alexander.stein@ew.tq-group.com>

On Wed, Apr 09, 2025 at 08:54:26AM +0200, Alexander Stein wrote:
> FANs might be supplied by a regulator which needs to be enabled as well.
> This is implemented using runtime PM. Every time speed_index changes from
> 0 to non-zero and vise versa RPM is resumed or suspended.
> Intitial RPM state is determined by initial value of speed_index.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied (again). Let's hope it sticks this time.

Note that building with gcc on x86 does not typically report uninitialized
variables for some reason, even with W=1.

Guenter
