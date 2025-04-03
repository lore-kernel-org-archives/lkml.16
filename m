Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D376524BC14;
	Thu,  3 Apr 2025 12:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683011; cv=none; b=FFJQs54t4dMpU8mP6qTNVmut0ZabV5kMKmDYW+1slosgCh9JdtIn4fkL9didPkVS5cyGQ54hLMQQafw300e0XFjTswDf6DWg6HjAI83EyL9svmQF1csaDG1X9cjgcI/gTMUqi0Eov8lZV0OmxEwpR6Nir+XohU9ZuUyqMCqptnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683011; c=relaxed/simple;
	bh=NmfEykaHPyLg567HGY8JUEJFgdg5it78uJulPuBnAn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeEHh1P5YddmRFEyQwdtWOZsE0oXX/01LN4y56Mknld58YFwIfQjtOImvSKD3gZheOYa7vlV40OD9c1ycnYCj3vQb+rCDA6ffRlmVVqOtpaXoMUn+jt8piQJ/l1XmNLQN1PDaNi8wd5+9sGU62KzC9IvNAFiybb611yL+ANymXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJR7zyg6; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJR7zyg6"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so556133a12.0;
        Thu, 03 Apr 2025 05:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743683009; x=1744287809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8pdFqe5wdSrbRSE+VzD86OQZDuUqgJTjeTU/Xy0AtM=;
        b=cJR7zyg6auyPVJhnN25RkWNGGMjPzfe/y7S8sEZjDVgL7NneKNbGOurqq312vqIVA2
         7xz6mj12v7SzTd9R++BnNSPXxXyubGwq9pQYUw1UQMU9BS9So0fOo1ncaoJW+Ee69FlB
         ukOzwqr3e8XhLcZY7hfSlABRWHJYtA2z3aZJQ5yCPpxTESS1cRpxvGvGSgHdTKo5WOYd
         RY+64g7daNzeI9W4pifeV68Rrrdn0B96gg8xaECfrIh+bWR9hQRSAKlwJGOS8QJ8PLYM
         mIlW9NhD/jnDNNhE2TTfTITwiV+dPlLWWLxqg2EacWtzqybg+0IQbBPKF3LxiunliYSD
         Et2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743683009; x=1744287809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8pdFqe5wdSrbRSE+VzD86OQZDuUqgJTjeTU/Xy0AtM=;
        b=Au3RZ3YbvRP9GwVwOYyLbGqTGkCh6qL8v1oADWUpfcfx5iPQlhMVTYFJQgR+o73dY/
         fV2a+KdKdadS2CvatocPvNIEgSuD02ohWtaLQi+5HkpUtVYG3OrwjojURj7ZdcoVmJ/v
         5XFte43ucWKEuEbQXD3hrcXMfCFmQ/UPhUDle4Rn5Yjb8YCFeArMwV8yElNjN+knj65j
         dtvSwez+OxFs1Po9QKl1Qv8SWUTcz84oisXyl2AUF342/W1rGkpVe77nnnEuSZqdB/p6
         s4wxKXUDo973x5bnBP1TyGcuH3FN9SVy09OBuvZZ7IC9x0AS/D6vcu0w0SXeOyxxUWEB
         FOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb/qq+WIPD1eZ0rdRTQmtr2lFp0K3h/ps+R67bvej6V/TDpsB6qXcQvs1n3LLmJ7hSvRnX8kfhh8HWVwQg@vger.kernel.org, AJvYcCX5RwFGH+lgMqGCu0+pj27oMvbqLRO9cXsD372mqysLY93owOEfNGamOEdAvPtFUHhN2pDJu9h0g1+cig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUTSwd19l9sYXXYIeo/WuU0n1Oisvo5BkGn1TNwwTHsTtQM+qk
	oapYP/OjnqYIA81SCYUsw6r3Mm1/DGtC5AR4qTtQ1IEEvK3EO+LT
X-Gm-Gg: ASbGnct6i380QwVK/GoE343YO+f/rgOH3DdL2ZeZ2qup5T/sIrtkOiScC81bQWfsRH7
	yHtkaQcA3DWqMM5nPZXHRMS9IhVDQ3v7ND0hS1XPkmBkBRMcBUS02kOMiRrHzGhF2+pzVnlJ70y
	bmPvACu3sh9kTA98+gZY/+YPJLwp5EautLFCucDHF6rOaLmGLkQqg3DbOAM0ambKaUDl3MToTJW
	FHXrU9swpChBfYzXBkk4WwTfQv1SD7jANjrLeNvZWl6u7/GO9xt9P9oiAgRZPTnYtlwqskh0X0h
	WJtDT4iDSEG2S0z8cu443nTtytDG+VgTd1AqQCgpRa28Ht//OYBtDM96QQ==
X-Google-Smtp-Source: AGHT+IFWoVNkJ+dWO+H8xv9fdaQxquRaqZ7L7UbIv/NP4irRU4/58KAnlGg4QMTZpPPagLZn6A+MSw==
X-Received: by 2002:a17:90a:c106:b0:2f5:88bb:118 with SMTP id 98e67ed59e1d1-3056ef07ba0mr7329969a91.22.1743683008951;
        Thu, 03 Apr 2025 05:23:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e45fsm12833045ad.135.2025.04.03.05.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:23:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 3 Apr 2025 05:23:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: David Hows <david@hows.id.au>
Cc: Clemens Ladisch <clemens@ladisch.de>, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] hwmon: (k10temp) Add support for Zen5 Ryzen Desktop
Message-ID: <c5dda37c-52d5-4fc0-913e-4610e30c4eba@roeck-us.net>
References: <Z-21SQkZpuWiWK06@archibald.hows.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-21SQkZpuWiWK06@archibald.hows.id.au>

On Thu, Apr 03, 2025 at 09:08:09AM +1100, David Hows wrote:
> Add support for retrieving CCD temperatures on Zen5 Desktop CPUs
> 
> Signed-off-by: David Hows <david@hows.id.au>

Applied.

Guenter
