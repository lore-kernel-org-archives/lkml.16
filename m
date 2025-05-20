Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D392213E76;
	Tue, 20 May 2025 23:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747783297; cv=none; b=qEKPRIfzoTYYLU6I//qD1SQopQsOAHxEDJbHufqvzEXEF0S329M3plcZkUwe3IcltVPBpvkO6Uj+UOufxHz/KEpW6fq/tDYPwcdMTmz+NTP8ZEoebtRXZEkRPcGhcjf6eVMurGikjrmQz4V7ggX8lAURJwopz8u1mePh837ku6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747783297; c=relaxed/simple;
	bh=v+aw4A9SVyQbVRBn11MetQ5cCqPeUWCsuwuqMpbLSCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lo+/vEXhYoZh62tNnncn04cjkdRTUJBnjSwk2Wy96PRX0XSdQMoQCr5xu7lw77WKytCLEpwT6sR83knLDVW78DMxGHgYypxfTUbbYMk3VaFv2f0n1VB7zJAi1uyV/MymTH4TN5huc2MP8/g5lZHtYJISXAuydkmcPn1xLdFck+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0+JzEpP; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0+JzEpP"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so4715593a12.2;
        Tue, 20 May 2025 16:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747783296; x=1748388096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13vGDqZ7RwWRyNFMS7/xqSwKGFwa26hb3FHB8oIIxCQ=;
        b=W0+JzEpPb/g1058aHFSDXsbPu8kQMk4fK9NM4ZiK5VXEjISWj9DOh8QXeTKsQrze6n
         sOZweR+S37aksx6jSoZaas4jFViuaWaltU+luYdHtNcKY9MzjRkhxsEtsTGjunfxm94T
         YlcK52lztJaspgrpZM5hZr/NjNO51uY+0mLfuWJxWKk1CawR1aGISXBoSzQDfhcnmWiI
         0fpDrjF37CqWBvKsX4ye2TsZi9bwfUkP8lWSWSMuxmnFcIZUWrjV9C8Gm3dyNTpuFaOX
         xlcjRtHukGZ3mQlIGXj6H3kSggPA0qe0wjkLcb1TaHr4ovQBAEz/rdGZYm1hFRFGs0Ch
         NyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747783296; x=1748388096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13vGDqZ7RwWRyNFMS7/xqSwKGFwa26hb3FHB8oIIxCQ=;
        b=jEXoaX2UGfC9pqzkBljrjQqG2S4iItSqYIa401WAue053h3w3BkOMoHAY6OK9bpRY9
         24SNc/SFZO+UzksbkZUsHI7W5NSp/kCnHC7arHlCakWEtV92r201CrFokGhf9wJJdrcF
         2WTBggdJTuxEweIr35ZqVDENLVKg9eoUj6evL+gMeFE7QSQf0l+Ft45zmOLwd31zLH3m
         d2QXCbOMOxb/AvW9zMr53P2KeMd29+apncQnR08uVHDPHm3A4DhYaPH9WCDw0Zo5FUBP
         qrvoOHp/t/FjoLTajdA3RFZBh+ktZWs5Zm340KOCEfAa+ho2U/etjXkg8bY/sgaqxOp9
         LkhA==
X-Forwarded-Encrypted: i=1; AJvYcCVRXbQPwbNIdEA5pjfxX/V9cawJs5ov0g3OUm8tGaGb2qxH/EIt+h1qUMD8xugQ9uk7dU9TUJsA8wHdwDw=@vger.kernel.org, AJvYcCXnCoEcJXvofAbQzVqMzkxDt8z4HjhHwabqWxnAvc232VrbnNuVeCmdjwJtmVOSzhuckoinBla/DmO+ZDkZueY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcvsz+z2CDRTB9R4pVxtk+wOGD1sABwZOy97uUD5gC5etFI4dC
	9MObmpheQ34bX9ImkzRtzYJuY/u/gQ8XejNl9QARK01TP/o0TYWev5od
X-Gm-Gg: ASbGncv6VYAD+GMQhyga1VUHvQlaTBLUGkNmsPnq46zR3FU7oEaRcvL2wN9hzcrbG+9
	4m9k89lWmrdTEQVjsOLWs5RevWdCqvKsaiy52hqHTOBohHdzggE2qP6ptzXhpCYtmEhCmp6jJmV
	4IAtmAEUQrT4OJiE9IL3m9lS8xW6O2Q1hLtxunn+UzOBXRD6P/ZO0CSgoLXkp0jF2oLeNAeN5H7
	N3Kua6UhlvnuAQa7p+S2y2xnwsk8JWthR744AnXv4oWmFOwXKY/NH96/swu9xfEYfnOQiYJuK9u
	7+pmtx/5SHxPiPURlVdnfUty7CV4GIwFPyIKKlPCOmgwJ/XgI0oYjHov+U4q4P8lr3YCA2snzyU
	QRDyGopo3fK05PyB8LxkNtw==
X-Google-Smtp-Source: AGHT+IE3nMttAsLuj9+BdITBotd8XjY1uDiBh7WE/LVQB0nDLoooCJQzDkRie44E7ryKQmG8XimTkg==
X-Received: by 2002:a17:902:ea0f:b0:22e:72fe:5f9c with SMTP id d9443c01a7336-231d454daabmr244744965ad.42.1747783295688;
        Tue, 20 May 2025 16:21:35 -0700 (PDT)
Received: from ?IPV6:2601:644:8500:5dd0:864b:f5ff:fe5c:59a5? ([2601:644:8500:5dd0:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed195csm81509475ad.212.2025.05.20.16.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 16:21:35 -0700 (PDT)
Message-ID: <53dc3112-9e34-43c5-852d-aeafea882247@gmail.com>
Date: Tue, 20 May 2025 16:21:33 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrrefl <chrisi.schrefl@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Alice Ryhl
 <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org,
 laura.nao@collabora.com, linux-kernel@vger.kernel.org,
 lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 torvalds@linux-foundation.org, Nick Clifton <nickc@redhat.com>,
 Richard Earnshaw <richard.earnshaw@arm.com>,
 Ramana Radhakrishnan <ramanara@nvidia.com>
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org>
 <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
 <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>
 <aAKrq2InExQk7f_k@dell-precision-5540>
 <CANiq72nPtr1FE_SBU_+wHVptfjnoSGaxjP4LWMzVbOF0M6LvnA@mail.gmail.com>
 <aAo_F_UP1Gd4jHlZ@dell-precision-5540>
 <CANiq72mPZ-ik8k+04BarAu26A1=rV_y7GYZHkFnCezW4jpXq+g@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CANiq72mPZ-ik8k+04BarAu26A1=rV_y7GYZHkFnCezW4jpXq+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Naresh: would you like to send the diff as a formal patch since you
> already tested it etc.?

Hello Miguel and Naresh,


I went ahead and sent a patch to Linus directly since it seemed to me 
that this was about to fall thru the cracks. I signed both you and 
Naresh on it since it seemed like you both were happy with the small 
patch. Apologies if that's not standard, please do correct me as I'm 
still new to kernel development.

Btw Miguel, thanks for introducing Rust to Linux. I'm not too good at 
kernel development or Rust, but hope to one day. The modern Zulip board 
and documentation is very nice for newbies like me. Looking forward to 
making my first Linux driver and Rust driver soon. :)


Thanks,

Rudraksha


