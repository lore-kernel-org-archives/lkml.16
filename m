Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C4625229E;
	Wed, 23 Apr 2025 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417870; cv=none; b=LJhRaebppA46Wmu0B/X86vv5ymLB07Ct+8LOqkhddfH/nmKVg3CbOd6Z/+CK2DQ5gyk9SQ99jbOHy8bvYUfRhuhweWPn44hi8GumWM63eLH7EAt0SBhfay+4WdY7aAKIhpN2mZRjZUm5U3K4aoDpn9gKXAY06/NpHjLmEStbI6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417870; c=relaxed/simple;
	bh=NMi06tZIY8kOcMe403pZub/Dhw8wXAxs4qe/vlXY7ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrMCuxJD/ddtTmD+xsRaJdrKOPKYfvNMA6PEWeSVmtfpk67Kvw2cmR5dpakzudNVwBUohfvXCKo+0Hx5GntUNP9Ays864xXGi/Lr0MZOqyIIreABhRWjSIeRDuxYCQz2V8qO/atzh+AnxVRhuiHJsu6+JmJJ3CSm9lFBDeQtPiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuvMWPWM; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuvMWPWM"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736a7e126c7so5612761b3a.3;
        Wed, 23 Apr 2025 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745417868; x=1746022668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rs7Eu4wOFQGf+O/6DQr/n7FrHchHOgegVEhLmOO2hwk=;
        b=CuvMWPWMAGnWZLaCfxqUVkB0CkeEUTWkIwUZuwgMobmoeDFzrFnuODlrL15lPa5sCO
         EY6lKxbvrf5Y8jVRbMbhM1bjXZm62tIrKZ2017H1OgBvsRRhnHHZ2sFHJ9kz89iETogs
         Q12R8bmG9UHw5fOwKTX14NVCfnUp5FRWYZX9jsdLGHmMYbJNHMJZjYXGItwKRtlHjDNh
         R0KNCcMoxEsNnJNWk4sUqlDM3shd6mnyfzaalFGMVeoC0v6PtAIm0dWQEJ+RU+J8K9Uw
         2LqnjluqnWbHFH7gwpeF3NAMXxI+V1BCnu+waGyLivx9hLrg6/1TJDognikQz5tusgVF
         0xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745417868; x=1746022668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs7Eu4wOFQGf+O/6DQr/n7FrHchHOgegVEhLmOO2hwk=;
        b=E7h1CMGbZHca+ePAvhVh4rHRx86aGhsTk7ersPukwEvdG366vELT5Y3oywCR/REHsA
         TlfF0xlvcn7u+oAOuzcpcqLI0KzwOLSgAcVdq5uKOiV8Z17ahJvwa7s0EPWCpOMhZ2a+
         GJSE+eBOauu8oQpntnDfRUzYV8MzqLEmyojEl0QSNFB57gRMpBz/Zw1uszIsWoXp3ZoM
         pvG0b0NsRN9jxvC+BRK/CkZ2CBbhXv+sS492NQXZL8D3MYhNsWBfjzuV5zJAFfvLdSTe
         ZcotbINl75IsXzQaZZLwJ0WD+hP9XiTliGBUemctLn4udd+ChcQlLCgr8vyn12LpO+40
         XGeg==
X-Forwarded-Encrypted: i=1; AJvYcCVaevbD9p9VkVy6T0a+4+j4loNW2qYRQ5i4IE65A0AYCboMud+g0P9DonOXg5ZTVMggwvjGFSNwAInDBw==@vger.kernel.org, AJvYcCVmnL8KPd/eLJ3AqiAt7QAq+tg4HQs13+Z1Sy3JKGY5FBTWp/3mTY6XXERmVXO7Adh/weUVpm73HD0t3YGI@vger.kernel.org
X-Gm-Message-State: AOJu0YwiRGfk6SshMWEBXqC2z/jr4MxW6SA+c2ujopZde2elzz0F1Zw1
	DBLgWn4EsPK97MIfMODcAIt24aO9hzRTtq5ETVmPv2s+5LDFzsp4
X-Gm-Gg: ASbGncu1l97qWCp9e90nhrHW1fcs8iJ12ulzoiYaRmltzxkJTYvQd8TWchDhHZKqw7A
	ve4l6SY5TL8ZTa9azmKTDIEVKRW8rOP5WZcg1F8vvqEMaKzKU1JFB+gZcqkZGQ2Fp+hJvFb5kwt
	W2IuEfW3DLVAZK5VOKELabee76sZgMTZTXtgaDkwtTd2maMcyIQUsgQiuhE6XEkkEYmqvNdNaN0
	ej4msGtexc7aKc+H15120UqujakFT/XuorRkxwhl9G67KXblgUobQGpXFGcMf0NZfj1ZAxr6C8V
	ba94IBfCi5n82NFzh3LHSw1k10OME+Kya6giMrLBs5/ZVDFh0FDX+g==
X-Google-Smtp-Source: AGHT+IG2R0twJF5LarGHTv8fk8RdiFyXQEq28DGW/Ocevqi/3oYoP4j0obyEr34CZRG6SBbmIBr9qA==
X-Received: by 2002:a05:6a00:130e:b0:736:b402:533a with SMTP id d2e1a72fcca58-73dc14453bcmr24423166b3a.1.1745417867956;
        Wed, 23 Apr 2025 07:17:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaab922sm10885254b3a.133.2025.04.23.07.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:17:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Apr 2025 07:17:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (tmp102): add vcc regulator support
Message-ID: <a41b3348-4680-45be-8484-0da41216f67e@roeck-us.net>
References: <20250417180426.3872314-1-peter@korsgaard.com>
 <20250417180426.3872314-2-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417180426.3872314-2-peter@korsgaard.com>

On Thu, Apr 17, 2025 at 08:04:26PM +0200, Peter Korsgaard wrote:
> Make it optional for backwards compatibility.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied.

Thanks,
Guenter
