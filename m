Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD091F4C8C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027055; cv=none; b=O1ZPKYKOA8mx7y97QafJlZ9Db73O6uc5Rq4tXj461USE47BQvB6xRBT/XQMn3pLOqCx1FAm6VkWtt8+qa2jNrKPg5bVutc7Y2DVQV/lZJ0WGqGl32Z0qCL1LX42lhv3JKvFr8HuEi3xNRffELzSVjuMbrIYIhRWXjM8fKAUMAH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027055; c=relaxed/simple;
	bh=Ucyb7HM9q3iBWoY+J0DTOECfsiFV+K/mKL1I+Hi+Bh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ucF+BZr9TQMwj2ZbrNxFyUpE86+kEa544kUvfCJ6nhrx9/1+AiNf8YWgFk9/AeBeJXEF3FJR/8SLtSJEGIuvfp3aEM7JVMH0ig+SBfN9WN5gfzSLxT7j0f0yeuhEMc5oWD+zGFnlaUb3a5CrLYeLUdI5gbbYxh63ms2/YSuF/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AMvrb7aL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AMvrb7aL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ea341570so45695665e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749027052; x=1749631852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3foMmPCBN/XslK94eXO9+AImwpoVgcIU0XR1j/KP7x8=;
        b=AMvrb7aLhr8rg2AFi+oXRe1iGMWyP2DFL8Qv1pYWjuBjsHrOule9bjoruvcJXS4Kb5
         CjEHjH4V0fPdDoWYnefW/lxpim6R3WlxLcitdgecwnbbMnS3pROFFtl6ZCwRWj2lqAHx
         TqMCgJK2ncvk8X78YFKQvKWR4kh/w2uoZ3uWeTPANAV5j1WEsj6lFdHbe//j5UjT61SQ
         HOnuRgVXAxhRwYFelK6TBb+oiQKHg/s/MGUFbd91cmPcJYhH7tahSz56ESJmFJl/7y3Q
         TftnrQ9nvZLnhsoX03V6icGdnphNlAeAkV/1DhnPR2nkjf1Gl7UrtyxlE+4ticjCpfOS
         9AvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749027052; x=1749631852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3foMmPCBN/XslK94eXO9+AImwpoVgcIU0XR1j/KP7x8=;
        b=tunp8Y8haZXE2Tg1T/W7oK0qC58Fse+Cr+5cmO0jpDef3vWHoRypGkuL0PB51b4+VJ
         mMMWUecuopMwblcOha9NJuIyOg8OBH28pqnJ24TeI8abu8ix28rSV8DGurh4PPAoutGU
         xn99LauBQ3sKx9kAXuWU4uaCt4U7Jo+xu5+pqhJeyi0StJCwIioYRIciwN2YMPPpOAvA
         iKAOPa3QWowTyOdc38bA6FvfA9tX8jw9KwhrvYovQtkzwOsXFwe7vzXU71mbte1lm/+y
         qpikVyNnGDLVU1ZdRJCEUNR6ONraNNQ29cUPIuQdBITb6AWU5B2KyEmgCmWn1fIa+u7o
         us/w==
X-Forwarded-Encrypted: i=1; AJvYcCX5DMMZ7exaw0XILCUQQy3YK6hn3Z/Qc1iCiH9T9piQT1KaDjt0zKTqELSaLk9np8tfBcK6hpxJgpgXtzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGYYTD/1MIV4/KOMC4eGFX6OWqORJLZaz2jsD+A81xK3Ct8Qk0
	Mt5LTHpRyVyJUTBGLVeWu6oFuBl0KT580TJTQb3nN04/ynn71ajG0z41fr/yM8mw03E=
X-Gm-Gg: ASbGncsu3j9xIY0U02KM5izAfuSzyl4c1CVyMSHg8HiaixKbAsM72u4M1NOLQYJGdZ1
	Mb+p1D4lRsXKBmFy7Oer0vnnjPgSu7MhdU1gjTEN+WrxsqJ/l8MGDx8NVKFcGa/IF9erPErn3ZM
	U1WMGE92s9GgYvWIQIDfOo/qYFAjSYq49uY14MtyN01iaQai8JAwaw1YBi/pRBurqzpY+5dSnBq
	EttyvKXyDSx09gsxqfH2cmXnRKMFHjwXmheFUrfTqOsm6pX1jPgJjd2OWZu35LgQea4iOeEStx0
	yjF6P+QGPDz0b/pdXGSncCcKdduXKZrldXbietndxD6ljJ0v2rfzviNAjSVjfJpc+e/FUw==
X-Google-Smtp-Source: AGHT+IGXuIW66YuEANUhSYmsO07+uY8r6rrbyfLLgRS1ue2JXGNF53sbcRUniQkWcRX66Kf/R9mD8Q==
X-Received: by 2002:a05:600c:3acf:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-451f0a6b1e0mr15804905e9.4.1749027051914;
        Wed, 04 Jun 2025 01:50:51 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-248.rct.o2.cz. [109.81.1.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5233b0723sm311469f8f.86.2025.06.04.01.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:50:51 -0700 (PDT)
Message-ID: <4fefa5cb-462f-4e13-9d45-f58775d78bab@suse.com>
Date: Wed, 4 Jun 2025 10:50:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] module: make __mod_device_table__* symbols static
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Gomez <da.gomez@samsung.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org
References: <20250602105539.392362-1-masahiroy@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250602105539.392362-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/2/25 12:55 PM, Masahiro Yamada wrote:
> The __mod_device_table__* symbols are only parsed by modpost to generate
> MODULE_ALIAS() entries from MODULE_DEVICE_TABLE().
> 
> Therefore, these symbols do not need to be globally visible, or globally
> unique.
> 
> If they are in the global scope, we would worry about the symbol
> uniqueness, but modpost is fine with parsing multiple symbols with the
> same name.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
