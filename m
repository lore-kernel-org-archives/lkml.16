Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588D31C7B62
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738333754; cv=none; b=ijaS24D+1yzsOXzefaITZeBgt6oKJU+o2T2qeURmdWlBzMAz/AvNC9MpIhp1KL0RdThlvgLx8ZpJQp6y1DLTlAlsJWX4h4gArXBTA/5YVQsot87/MOKPYzuJfezbG+QaJ9NCCTHv3FlFPsyOyAdfFjkhdcrAuq+6ljPlu3rlFDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738333754; c=relaxed/simple;
	bh=49ks3svcmPKxfz0ey+OjvWaS0B/BzEb56n3cHabFInw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIcgooZwc//s+mZTx987RWXN46Fhxm+czKi0cMxbN5OX+ZwgIYyxNGtJVKOH1otaSraxWqCXehB5VztS/CawSmH9F3wRiW2AZviLZtmaaNTTHHlUll2GJuy4h6ii7g1wqLMSzJlU0DkppVsQ3zB5xwsbxQInO9cjpTrHQlcC2TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=2DIfhZpA; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="2DIfhZpA"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a9cdcec53fso13618045ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 06:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738333750; x=1738938550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vO7AINUTs9Bcl5Igs1/HkTjC3cy5/ndBlxu/0z00n3g=;
        b=2DIfhZpAnAmbK7q1ghXbeKvB2J3/pRTK9GEuj92X2O8PcY8b/u5/5CaiyTW/8rzVkP
         92nR4l+ckbhpLR2/5UDRF46NsxX0EW4tvjz2+orkL3fLv7+SkyjNxi1cas+Jg28Jd70o
         SLK+D/hQVUkmk2IpgHF7TFOdyAucJhdFOXEOcLCOcymh2XJZO0/zo7RiUochhujMLf5S
         HEpx0D/JHMkoHv5C2Z5s9XHqSCry4VJVW3CmoSgz49GCGXBe+PcNEV/5BHiQYEeP2sMQ
         +tzG2S3uvHMPyav70Oxlv3Iti4VGM04UCZ6kQOiUM7n6AJFBQQuUT2AH8M6XI0ys21XM
         z+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738333750; x=1738938550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vO7AINUTs9Bcl5Igs1/HkTjC3cy5/ndBlxu/0z00n3g=;
        b=vUuCW8tT4rmMnCiFYcbEUzowgT5nmlkz4v5WEiiAwKaJCDCPHOy3krkJRs4OjoffJI
         SQECWRK7RAhBQm82wteo1UF8tmSfc5D32Kl16Q9mv+z0pgyGEvzz/muO+atuzuHY+bNp
         eoRZ9ypFYQbGOXvpJ4WKL/3/eVrXPIgNUscyD/TFQQ9kVF6LuysHIA0GiNEBmHv8vVT4
         EP5OGg1Yl2D8txHezYfBuKtkzWpovQu4v2SCGfQERp7V6qDRE0pvdZHsy56HOYrIkPx4
         fwJbff+MZj00XjIgJZLJaKwL5LwkkwFax5nBPkqXpVlZQywRS1q5kljVWyTPOPJvhByA
         jh+g==
X-Forwarded-Encrypted: i=1; AJvYcCUOfqtp4WHFrK60zPA6XrXBhV/hoPcD64bTen7FetpioTqrKQxA0t8MsJ00a2l/NQrBy9gQ99V+tdV3JyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7zO+m4PQwxhcfbaYYUzHofZiuBUYJ7ryjJ58Wr25TWTiF/dwu
	WCjzzBGmsHMSmaoF/nP9ZNx6fZ958paFjvpaHmjTc0ET81N0ljinA68Q+N0wDZc=
X-Gm-Gg: ASbGncuUrfZpwkZnvwSejX80jfOjxeR1fg3fMyoRANc/aMasWTaqsS27VGHa7/fMuFj
	fsn2JobzWHfx8ALHYQjfI2mFXUDT+50y2FV4ENM61ROpFtef/p25PAXF7yNKHDp3RRI5KBAz/xh
	Jz0tcA8QNpjM+YFPa8kqTWy9OlkO1BRtOGIbd29puA8O6uE2U7HTz4Jz+hlU4sAIYAOUJOj15fo
	LKe0Sv+gwRXxEc/XSSbjXcK6EXT9joQfFa2ugwv9aQ9JEpq1KB9HBLGQS9stU3/t6UMat8db07r
	K8LG7Nh0yHc=
X-Google-Smtp-Source: AGHT+IFROu4zcQ6AI8HfgXNb6/4Gnd5URcbYiElqQwfNYStcpCtJCsAwZ3yUMWS2RDuJhPTyEZMuxg==
X-Received: by 2002:a05:6e02:13a4:b0:3d0:10a6:99bc with SMTP id e9e14a558f8ab-3d010a69d2emr42957005ab.6.1738333750268;
        Fri, 31 Jan 2025 06:29:10 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746c95b6sm829969173.131.2025.01.31.06.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 06:29:09 -0800 (PST)
Message-ID: <d663b7d8-d148-4d24-ad31-c36c3af674da@kernel.dk>
Date: Fri, 31 Jan 2025 07:29:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] lib/iov_iter: fix import_iovec_ubuf iovec management
To: Pavel Begunkov <asml.silence@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <378ae26923ffc20fd5e41b4360d673bf47b1775b.1738332461.git.asml.silence@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <378ae26923ffc20fd5e41b4360d673bf47b1775b.1738332461.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/31/25 7:13 AM, Pavel Begunkov wrote:
> import_iovec() says that it should always be fine to kfree the iovec
> returned in @iovp regardless of the error code. __import_iovec_ubuf()
> never reallocates it and thus should clear the pointer even in cases
> when copy_iovec_*() fail.

Looks good to me:

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

