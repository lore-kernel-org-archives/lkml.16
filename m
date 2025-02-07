Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5B16AA7;
	Fri,  7 Feb 2025 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896731; cv=none; b=JwesqiJ+/Wc9xnwee8n2OVF9YySPYOqimaZ+0Kj2SID+lK7iknRZ2oEKLfi4HcFfQIq9Issw7n3mkHThuPUIciS0cEYvWxRGAQ5pThM2ZU58nBiYG4TCN29G2GDrnXBUUgvS9+FpEPml7VYoct1UMpg+nWXdg1lVOPgXA4DkczQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896731; c=relaxed/simple;
	bh=C65sZtubscFHDEhaC6zic34WkDhVQWraXehsswtWTnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXQp3cZOGrdz/zOCYprG8Broy4iWQedV5omBwn9c5WZYFDXbIcEnpX+gKY89WEoIEt6tuQY6qxpr0BzFAOWRwJC6C/s0IS3DijOD9R3ItxadAAl9CbWPSNXQ1DhBfvl97yrMW4wzQI4loWwQUAgE6zZi26kqeyIhR/u4teAhl40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWlVvfhF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWlVvfhF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2166360285dso29492385ad.1;
        Thu, 06 Feb 2025 18:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738896729; x=1739501529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NN/J8uyeLyTNc3DDLGZ25VQURXZ7qAphNxO/jOtXeFM=;
        b=GWlVvfhF1ZMfwewVy1a+6GjrS18aJFBeVTmYkdRXh1nFuwvIsbVr7z/zLO0A1tP613
         G06Z5FNRw5sIvkb/YBFSTR3dawI0l1HLVlRdAXPPax77sLEOq0Ont+WhsVMNW4Q/WUre
         3Dpbi+ogSGxe3zH24sfHaNl1xraO1MR51K4+JkAbDInlKkmSG6PBOjbSlHzXrcFQ1x7/
         OwM4LviGdZr9dsMdhoCJtxIL6r67ZfUfCGxhJz4yTziWcijOiHg80CZEpwLW4T5OHJf0
         NPw+2Zo04aqcgi26ci3RGH67za5qI+5owmSSbXEJ3V14Ev0LdlUGmBhOBDwmCxPEoBE7
         WAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896729; x=1739501529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NN/J8uyeLyTNc3DDLGZ25VQURXZ7qAphNxO/jOtXeFM=;
        b=R1KRNgINrsu9BA9UKaCQr3YzlKui0l9F5EpI9h0zts6UmR+t8DrPuzcpj+SGdNrpaR
         LUolJig/dpE5o4uwW6KBaf5Lb2CO/Qcs/XXqt7m5nUwRv/dhQwB5KncPbrQzAntXUZmn
         Lt9w5FJBBA8h6u5VxrvKYxUwklgEyECrnS+hwUsWK2zQ3I13D3ZgQL0G22wUctZ510hM
         cvlRd7chSgCpNiIEJKEk59BRmIpd+A0ibDmwjEicfIBZPukGD0G9cRbOBWKq0qDuoUDD
         DiN8J5DSh5ws6X2dsSra7fJBZrQJ00B6A1NCGR5OepzNehX5/fAGMtVnLVvGrezcQh2U
         LvHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxOillBw4FhkwquEKxN/AGrJRXApGVZJbhy0kdlmv7/cb9i59iMeRM9tVzckJFTkGN4eSReIS8cdh7LZyP@vger.kernel.org, AJvYcCWGmNzULpw1B2n7HULl84zfnas6tg3IctLDIu3QEGbslUxCI9tKVYG4/H/3PK8qKYGnnFVzdrXi94vle60=@vger.kernel.org, AJvYcCXzc9Ed3U8BSvyK/r30ogk61IWE08RqzDoatyH7NVuoqY8cBk3U5SkPhIeQDgvDGtveT3Uty7PGvKg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+YGC+ghNxJBv4pFtG0e4XGvC0GbemQbr69clLzKgNN31vdv4R
	8Spm0zx4rh3V8wL0iWIFxzzgAnZB0uqT1YyWAPHGEv+YAvZ3Bis58V9czw==
X-Gm-Gg: ASbGncvnn1IEblbL2/wzT5S52Sqj2A+OZYSNus397Th6gm6yxmTRj2M3qxgdOqCtiWd
	E8nDuKgnOZQuzgHKyHtI+muE86mJRBOzb3jFZNizRSs1+L8UGZ8r+DekBn9P82Eeo5ro0J4DuhE
	0pO7Ek1cbH7jX7HV6JyWPwb7FpPN5dZX+ndbSTVwajau+Oz3bOxkizWhTKz65q509eX8RPNRzFd
	1N271KuHTTI3585ZS2vwqWh5qiDjgv6NE8vWHRRpYo8h359ojZYO1bXlOqqRAAVZCbMcpBlp2bQ
	KBAJtVyiBlniFGsI9YlmSySK1jEM
X-Google-Smtp-Source: AGHT+IGe28OR+F0m4BB5uOpY4rOXMj/i4LZTTePQVKja+wfj2TuK117U6jBj1OvDh51QGcxm6fSQ/w==
X-Received: by 2002:a17:902:db0b:b0:21f:169d:9f39 with SMTP id d9443c01a7336-21f4e779cc3mr29953315ad.46.1738896729128;
        Thu, 06 Feb 2025 18:52:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368ab20esm19880055ad.224.2025.02.06.18.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:52:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Feb 2025 18:52:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: hwmon: Fix spelling and grammatical issues
Message-ID: <e0dcc70d-5dad-44cc-8209-7b31c13b0976@roeck-us.net>
References: <20250205200134.12006-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205200134.12006-1-purvayeshi550@gmail.com>

On Thu, Feb 06, 2025 at 01:31:34AM +0530, Purva Yeshi wrote:
> Fix spelling and grammatical errors across hwmon driver
> documentation files.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter
