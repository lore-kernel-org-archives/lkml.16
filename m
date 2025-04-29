Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CF4213227;
	Tue, 29 Apr 2025 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926223; cv=none; b=afQ84s5zRNIphWI10vXBxG8AwEo4sNvPpaR4Qwumr2D513Pq7GP8vaKF2cnWKTmqIPec0KcWeI80T+OGSMfeccit/jO5i/yXDPeMEffaAeqqYxlPraoZ6WEhmHnx2GW0OD9iEVrri7NxZrTHBNcMKeVx6btIww+HH+x5//bTvAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926223; c=relaxed/simple;
	bh=+Ye/Rk2sj4qGoJFhIN1XdDSIRpkdHTKJCQ/OeFYYmm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sv6qUu8FCLgMnUbrlv96ZXk6viTaHhLDOjQvS0kCQzv4VSxewrXmvQIX0u5RLhedhPWZVUxGWQnDwlKz0lVQwCT7SnuP2Jd2+eckX6cd4RM9oXdGVajYnLkmZZmaTeVoPEPq+NIUSfIJdcdxd1VGXEXChglFUSNyteEXI+z5Ep0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlhUcUcZ; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlhUcUcZ"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d813c1c39eso54083675ab.0;
        Tue, 29 Apr 2025 04:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745926221; x=1746531021; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ye/Rk2sj4qGoJFhIN1XdDSIRpkdHTKJCQ/OeFYYmm4=;
        b=GlhUcUcZ9TfMtnKvirqdvrA3rbz0dCwiL4DvWISrFgN44+KMxSizcdnB3Npps/Fizt
         58QCu9QLyCTXYThj1gYsGUnz0OUTqaMz8Fo1PAwhDZNwpBFZ45wRQenrtWjTDtRYQiNu
         I6GL7vg8LeQEfj6xW/JoFO0W1pFPKu9KDZVxxyaLqWeF6TY9KH1TYPVAlGB6GYJnV2KA
         3TsD3lFmToVO6wJaz0rnT3J6rp+DZ06U/AA3rrREDLqzcMsiHl3LhYOPA2oBpvSWkUeG
         83+hUEEyISw9it4I9aVoVPTGoUV5EypPg50OvaA6HQxLzGNYc8VDR6uGdHYTFeuAThFp
         DvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745926221; x=1746531021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ye/Rk2sj4qGoJFhIN1XdDSIRpkdHTKJCQ/OeFYYmm4=;
        b=s7+bcj3Hhn1cv3x0g+zrmR3+qgeo3gzS9/BD002LlibifrQTPsTL/Ktd6SiDcu3NcX
         oAYCcLrRtpHuuelIjOATXip/sc1dvfmXPHt6xt4GqDVlF1n3pBX/cOQwIU+fOX9xYIUa
         GSE1TQdp2LOTBnqolljYoRh/nSYLxiRJxdqngm/NcPRkJw/JuUzFpyhoWaLJGjZ5t9hx
         WFm+Fodi2AebLByBSCEvT4R/vNqIW2p9vu470iptdeCZ5TsusPZeSWh/tw3/UF97UEWY
         tqjmqbmJ69K9QnPr8673T1KXiLAvDO7g1h4tFQ0Lp2ii8ZN1zTEgXPlW2itz/tvXES2a
         KQmw==
X-Forwarded-Encrypted: i=1; AJvYcCWGh1P0DucKGQNlf0BH8dh0z3InCc30CXYn295dtnSTsdwVh71ZzaUM2ckFGclPJwPIOp7cvd2aB2WUhJPh@vger.kernel.org, AJvYcCXRRwIW1fafF0b6NMBYmFpIG4z2BENGYWhWHt72m8ny6VBHxDaE4Nrm4age1LjvhuH/hrY6ipbxEBC1hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXXFWFnmGtC4SaP76FTxW4v02NF2h1N1adwzfo4nLWiwDBVQPo
	zGUCYCQHg6ntBrE5cEc5kxWFAwCbHXDKoUvMaU1FGJOdAPpSIFLukk9kZc8eRI5Q1749b90c1+E
	eMSWcrQnFPf/GOCWSC821Mvec75xmNlOE
X-Gm-Gg: ASbGncs8STq6SyT/EqWqGuB6Lqh6B+aNLiadue8s/nj5zA/0HjUu6MGPeJjb1LN5Upt
	31tElUmFUGT4RT8HeJJFih1UAuy6Z1LqnfV34spUPersOS1Oh9ZHPAt+dAmqr97a1Ha9Z7GhEYk
	5+WdPy58dhedJ8pfnuHA==
X-Google-Smtp-Source: AGHT+IFAyiY8NWA0PBCK58v6Kj5qMP+HrLUR8jTHUannqEQEXexzqbTzJJBYHQndzxijZhRcdBF6+YaGMKpVqJkVgws=
X-Received: by 2002:a05:6e02:240b:b0:3d9:2aa3:fe2e with SMTP id
 e9e14a558f8ab-3d942d6739bmr133595915ab.10.1745926220821; Tue, 29 Apr 2025
 04:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425200051.2410-1-a.safin@rosa.ru> <CAB95QATm-iNJokfcSxpen3YBbx6xNUrecELD44squoaqCQ-b7w@mail.gmail.com>
 <8dec9c47-d13d-4e59-b1ca-fcb9e3beccbd@roeck-us.net>
In-Reply-To: <8dec9c47-d13d-4e59-b1ca-fcb9e3beccbd@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 29 Apr 2025 13:30:09 +0200
X-Gm-Features: ATxdqUHD7vpuKnNlfcCWcv-vy-gnZ2_h0vyL24KCnKsJk5e-Yb3qcLqwG3V_2Wk
Message-ID: <CAB95QAT4JJFYiXviJB78KELFnsitDj=Zb3EM_1F8uqiRHMwBhw@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add WARN_ONCE() on invalid
 sensor index
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexei Safin <a.safin@rosa.ru>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"

> If this is seen, it is an implementation error which needs to be fixed.
> Returning an error to userspace will leave users annoyed but will not
> result in a fix. The warning backtrace is warranted in this situation.

Thanks for the explanation! I'm still not convinced that such a
generic error message (without the type and channel) can be of great
help. Something serious needs to happen to trigger this error, like a
hardware change, or a RAM failure... If the purpose of the message is
only to grab attention, it could say that explicitly. But anyway,

Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Eugene
