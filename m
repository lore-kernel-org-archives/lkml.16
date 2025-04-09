Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F87725DCEC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197162; cv=none; b=rOx++oRzM/nBjG9XDWDLM423AoWJSBsVMoqLhj7qZH2BsNi4HzLqbz+PFBneK5VPwm2dAqUPSXNgG5u3TjeJpQkDWg1zHZHee4Tlq8WFicrwFTVbD6sHsQkXux3gwvj51SnovMVdkuByTuyWmdhQkhFy91tk+IssyDv4GgAoRek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197162; c=relaxed/simple;
	bh=Z3WABlsB1UGI85o/kZMzF0WpD59YSXlr7X6B5QRZKZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMBX9NL8U8Ju0pt5YEgSAvj2BRWJNdA7YF2MoqxtxOtYJ9GqvGg79ZJ27EX75fotqBitjGsULRU1al4cE9OnXjgUkGELXxrASa2h9GwayqGYa3RR6zIgGjFb2Bjv8Lmu7/c3L/tB4C5R8urJB+M2wYL/JKTOckWy4KeO+PdNucg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YN9ANTEh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YN9ANTEh"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1efc4577so3629161f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 04:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744197158; x=1744801958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mipIJnl4yQ6XlD74FRUZU7GUyWJ8NwjpLfWewuTaQrM=;
        b=YN9ANTEhJdOtNckiXq4MufqvBj6BKGMTQW/HT5yFV5FsuSh/Y9u9UqbGzGBqQtlazN
         dk3/YmJrW8Ey8bkBhu1kvJ5hM/35WfR+ecOnb7GB55FY6LmVu6jzLY/Kmstlr1NIG9qX
         C1XM9/6WUhJtHlPgJdoocCGArB/Bk8GzoghhofAi2cb6B2atzJ+bND0JEQ1TDwLv01ig
         SsS09nKRrrJZW05ZddI2Y2K6k7REO9cYmBO9E/hsRHo7g3UBPHgx16A+SAzSVZL/i808
         2A3WBTPYQtfwCFChzu00it96cuuXhhAKTMQpAsI2EjGTodbkVsiCAIsn+ht6HL+OrPEI
         t98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744197158; x=1744801958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mipIJnl4yQ6XlD74FRUZU7GUyWJ8NwjpLfWewuTaQrM=;
        b=UHhpZa+FV0eusJHkLqd+aa8gPAFYvNEIkMuvvIUluO7dcneYHywqYFEKovDCUi3kQL
         GHi3cj04wPGTBhRN0kn3yQfM9Bzz8L1KFzTy4Rz0tLRJwntaHf8wv3fl/Vt8mcQ0H5kR
         45xi/JR66tNbr4Paw/rt6YFYzJUcJD7dhchsTj85PMMFF7Jv6HDSvOOB+BskCQFb82ZW
         mjVsVor42HD44Oa4IAHD6fWN4bnAfouuEPv7TXYoHMU/fvQ0XA/RHFCc+Gn38LZ+Gerv
         GRc19i5+ounBGub3yPG8HqPDldQWF5XOOpfINt72ddGMbpR3pMNSD2oIPvw5PQso4c/Q
         v8+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdjoI+bcr8NOfFu/6ejsZ08CD7aexKZSY9uFs9ndhVxNNfLYJ8aDEFbBjuiKKXNmU2HaySjOgkveQMZrw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys4krNP6q0FyZ97fgyH4wRKMfBWjzyeUP1ngqV7/keViDUlXh8
	9PpZplcV8fi+IJl6W8yBMQmFehHcHHO4VajEnAUu37T3hUqVL0ZDK+o0Rz7eQno=
X-Gm-Gg: ASbGncsRYFfdKTMyp+XkR584XncR9F7QZrUciKNr76YbXkLUBNYC1f5v/6hpofFl6L2
	IdcLYwIMoJ9KDMKt3K1PgKbhSo8SixRkOmfqghvrYJMzYZUrpEzeEg4z8AMhB8gCjZMPPXfT2Lm
	OuWKaoBs6eFq13xjTNVak64omPUzlZ9kKf1KPPxdYjcMl2QkpikIDwjihTVQ7+lP9Dcvm75p5Kq
	DYuOowvXLQ3o6aeP/85BwAHsHExJhTfdtbI7CVrkAWKk3TxJXUiR1La18D8VeK2AJPH5lvZfCiI
	cfuQntw0yvGm94lZG6HzZXDZjKSe71P21cfXtwpFUlnEfNWuj+kjoy+N
X-Google-Smtp-Source: AGHT+IHfn0sTQ79iQ/7T8zc7UTi7ax1XoigXfd8iHlhWM9zbTWV8ADTloCpAqHEZS/cwllSwzMqp4Q==
X-Received: by 2002:a5d:64c9:0:b0:391:2eb9:bdc5 with SMTP id ffacd0b85a97d-39d87ac56a9mr2016059f8f.23.1744197158492;
        Wed, 09 Apr 2025 04:12:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893fc88dsm1309695f8f.81.2025.04.09.04.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:12:38 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:12:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Brian Geffon <bgeffon@google.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] zram: Fix uninitialized variable in
 zram_writeback_slots()
Message-ID: <e858f6aa-7593-47f7-9bf1-64a747a2e0ed@stanley.mountain>
References: <02b8e156-e04f-4ab3-9322-b740c1f95284@stanley.mountain>
 <osj54aiqi3b3dtgyfituj6tqpar5s7trkkx7hytfozl4cifc63@mu7bb5pyse2n>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <osj54aiqi3b3dtgyfituj6tqpar5s7trkkx7hytfozl4cifc63@mu7bb5pyse2n>

On Wed, Apr 09, 2025 at 08:10:22PM +0900, Sergey Senozhatsky wrote:
> On (25/04/09 13:58), Dan Carpenter wrote:
> > The "ret" variable is only initialized on errors and not on success.
> > Initialize it to zero.
> 
> Thank you Dan.
> 
> > Fixes: 4529d2d13fd1 ("zram: modernize writeback interface")
> 
> This is still in mm-unstable, mind if we fold the fix in?
> Or I can send a v4 with the fix applied.

No, problem.  I understand how mm works.

regards,
dan carpenter
