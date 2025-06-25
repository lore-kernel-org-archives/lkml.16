Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750AE17BA5;
	Wed, 25 Jun 2025 00:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750811751; cv=none; b=RLxLFnUbvjx63Iu7grVZjZMYZxXI5R+55mHDiqUc6IYPbVQ+E7abxPOVgh7tM1Nqg0WHWz2uTwdIqAO18nLK6A3+tngWjm1kCZbAWuOmCmWKJRHAsgkuttHcX7Zo9qa8UdiXfXJEiS3EsoEv5BEmBbqNmC9BioawcCprAjriluc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750811751; c=relaxed/simple;
	bh=sROWPN44+2mcx0ma22tb/KVhUiR0M1abHve71GH8VH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1wMSuHACqqbuj6zXDtVwj2cTZ7vhOkUsLaH6yufscOrZ9XYM8QQLB/PgVtif4H8tPiWHMTNLFObyivgHvIHWW2e+/xSQXHZygsS5TSNIsxaJEbrhRr4ZIm5Gi+scFNYZ7Kl0GLY2NcKMtz3HcvMXBXWjrK3IvTWiSCPX6oG5Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckmX7u5h; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckmX7u5h"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6855531b3a.0;
        Tue, 24 Jun 2025 17:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750811750; x=1751416550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xt1f5riGYDiUF/7uPb6G3TAiMjf/SPVAn0RI7Jz5Yq4=;
        b=ckmX7u5hU4Fh5FCTuKHFIpck8RscmYke03/276tiMUtd0IlpKBngTs1aGrjGaBXmgc
         qq46gjHxDOSL9IZDVl6JHX2heZHTN1qYm3jWqNCJO6IhAcA+w2mImRYuJUWJMTpzwqsV
         F7XSvYXyB/jpNwmznnCNcimzhRS8d+Xa0mDmt8Cp0yCHx1WFfI9nVbDSmMieZ+H6P+aH
         KHbGYu2R+qgUuGEX3R4L63jVrWifP9sR0ae5PHRafBW1UKxGBjpQLqhHHQzsIHFVkBFr
         KDrHTUp+Jm2122hKV4jSMMnagI/mZ6En6eJc19xGYiHFTsnpYq2sLJATJxeO27ykgLVO
         StAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750811750; x=1751416550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xt1f5riGYDiUF/7uPb6G3TAiMjf/SPVAn0RI7Jz5Yq4=;
        b=seZ0Dskdh5dWFrFRtC5a0Q7fjIRWekccM11Gywhy+LrbxFipN/2zB+MBY4AWDHkzhj
         H6sqTZhbG8Qz0jIFP13D/aW6ctFCJQwNU13dFh4xQo0u0NgE77ZuiWO2L3FE0IITzv0P
         V6jtSKahEJ5hi39yGAmLLYYQ5C+uGNxMXM21Y8dzpnr4g+7t3ZTGEzlLVhufrcm6U5J0
         ecQo9Nky2xEd65W/5ClHTA/c1rtkOkE+z9yVIxv3ZOiOXGdvUA5UrJSJgmYtrJ9/cxNc
         5nvbov320oUIwvcVK7RqGvn/d8e7BByxTAuH6adX3AXnjNHUN9K4fma46zmZBeN2ags6
         Uhbg==
X-Forwarded-Encrypted: i=1; AJvYcCUkzyrXkLGVasnWuU6v5VZ3l4G7gpJjUGMzxvCEWLqqQ7wWGZX7+2zdPZggEiyFAbWjoPpHswpTJlc=@vger.kernel.org, AJvYcCUx3SFbCMjy3myYu6snC4HmPYjVlC5T5nE8NoytfINIcXl7AwTmStroZwG55j82803/ry3VD46YC8lRYefI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5L5rNOOdy1wsvRviT+AKtlGUoH0qSpBn8IXNeyyl9rF9g3AaE
	fAAcenSQDmJN+nDHM4dsjVZunKzIixtCG2hgRBh7jYs0i09UedygPYzw
X-Gm-Gg: ASbGncuZydHhyxoltFbhLl/S3ZbdyXWAwfAHs4sf0SAvTqqOalaKnauOTMuYZantsbC
	DXYm58GbUXl7dKRkwWGGpXDUvJKEgqvqQ9sjkx3TcWbx90rVO/SkDEleZ/LTdXiwwtv9u7w/+cF
	pZj97LMZ65AH3stj7mQT/2ERxDSuD0HMzLCABXusk5Why0EJV7qhMpltwUJvsWZIlnQEJOj5tLx
	IXOq2gtNtu9VZPh6MjiK3Z457HbHE/DK3VjsMVYjR2Y94uyk44jPpgd6CHphOsj3k+BVL1FpsH+
	Vzkag/AloH4Hhy8DjZk95/zH3YthMJnLc6DNyY/Uf8Rvm789xUC+dCatXXS11/RSEJct8w==
X-Google-Smtp-Source: AGHT+IE6NEPzXX7zMzrW+vQCNWxzVpk/RaT5X89eXtSAFIPiHD/Qiddu1XKs//TvT2ghvpc9mhCgAw==
X-Received: by 2002:a05:6a00:1990:b0:740:9c57:3907 with SMTP id d2e1a72fcca58-74ad45bd06bmr1609692b3a.19.1750811749601;
        Tue, 24 Jun 2025 17:35:49 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8854935sm3065013b3a.137.2025.06.24.17.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 17:35:49 -0700 (PDT)
Message-ID: <fb2d7547-dd6e-4f6a-978f-b92ae2eb20cb@gmail.com>
Date: Wed, 25 Jun 2025 07:35:41 +0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] Documentation: typography refresh
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Vegard Nossum <vegard.nossum@oracle.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stanislav Fomichev <sdf@google.com>, David Vernet <void@manifault.com>,
 Miguel Ojeda <ojeda@kernel.org>, James Seo <james@equiv.tech>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20250619042318.17325-2-bagasdotme@gmail.com>
 <75f99fce-affa-4acc-afeb-2a9f70a6d907@oracle.com>
 <aFjNA1TkBiHXNKPD@archie.me> <250eb150-ef18-4e62-9791-f2ec4801cd39@gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <250eb150-ef18-4e62-9791-f2ec4801cd39@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/25/25 05:59, Carlos Bilbao wrote:
> I'll be honest -- I was initially skeptical about the value of changing
> fonts. But I do see how the updated typography improves readability and
> feels friendlier overall. It follows modern web design trends like
> Wikipedia’s; but I do wonder if we’re trading off some of the "personality"
> of rough/challenging aura that fits kernel dev. Your new version feels a
> bit less hacky/unique. Anyway, font preferences are subjective, e.g., I've
> seen people run terminals with white backgrounds!
> 

I'm also leaning towards following web trends by this font tweak, though.

And yeah, when I first coded my HTML and CSS code in school, my peers 
would've like to use non-monospace fonts ({sans-}serif) in Windows 
Notepad without knowing that it was bad idea (as they didn't know that 
monospace was the norm).

> What I’m more concerned about is that if we merge this, someone else might
> want to tweak another part of the UX next week simply because it “looks
> better” to them. We've to draw a line on what kind of UX changes we’re open
> to. From my side:
> 
> Nacked-by: Carlos Bilbao <carlos.bilbao@kernel.org>
> 
> Still, I really appreciate the effort you put into this, and I agree that
> readability matters, especially for long docs like ours.
> 

Any suggestions without this tweak?

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
