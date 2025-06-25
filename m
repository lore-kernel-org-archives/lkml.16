Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26DF8633A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856612; cv=none; b=V4mwqTiQ1R5VE3Rk29bdsepFWFRx6YJUWaO42z4108V2Nv/ubTMs/Jaokq7Acr15YkA+4++zGzR4mOFU5W8O26+VnwnoHA+az8v5Cjro9+6K/DW1qP2e81CE+bH5/9qwrAE3XJSwjCYBm1V/Ysv96yNoG6w1rotMyCWGPIvnSq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856612; c=relaxed/simple;
	bh=X2a6bqPFcCqZOdUd0nAAfcySHkqblc2JtB5nNaZZass=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SctAk+hCrzFDF4U6ePTpiJ8cNFek+yZNcLmo25qdDi6c70O89GPOFVqohBUijuwMe73TDWkFoiLNpwVqbFo7wzjMBuOjptOmBA1RWHZ926ZWm38abga58bHQddJHNf0zDOdPNeB7tL0+MmBQ21XHoT7LXpZK/eB9PkIXvICHjFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=SRZtoZyb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="SRZtoZyb"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so1527603f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750856608; x=1751461408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R67vbOcUZfWm73DIVUMK1L7ghH4UOTOk4lzaOIIxPrs=;
        b=SRZtoZybsEUzO2clrhTmINgsU6cevKwEwVVcvlh9eyiP1+Co4Aar74t366p44JvcUY
         bPsI4oDM90ISY0NHQi47k/vtv+Miqe3uylbUp3BEsiD0uxAtQDicz0qQ5y8tzbBWjDXu
         zrroXO1TVgHwwvP+58PGm9qdb+SLNsSPVA0AO4mQp+151ThY8qIBl+oxwJRlHRwCqYa8
         OMgxRspppNlwcB3lJwYq//4VfqAS2jsMBW7KV7A2Myih/O50DK1320HPcHbMKfIkfB1Q
         DzdAD56W2tcBt+HrlDNr1GhbFFwQDU2DGEVayr8NSamaNI9GuAVh5jLCxMUENJCzHrjX
         u2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750856608; x=1751461408;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R67vbOcUZfWm73DIVUMK1L7ghH4UOTOk4lzaOIIxPrs=;
        b=LqnfxhUjYGJCzYWjFyu0RvkScnsOIL2R7eA+ecb7dn+Lb/RYHqThp1nG/fvhNfztTp
         e8BtdD1k3lKJjWec/FxMbF79YwUql4p3nJqlxaCqY9jGdJ7Uah9qHUfuBNMd9MY1Cjgi
         N4/ZXG4Ws7YDYmT1D/vkvNZBhavFPfgTH73Hcj9YWzZtK9qqm1Ra1og1WGsZfBfhTmDt
         fFao4wDnVfMDHg/BhPM7mLxELoDJJK8ts7FsL5lGW8a2Ti3yzAaZs5DJm6ZiQlArB/oC
         bFgbc1KhECoGKN5Rc3ATr+taD2jwksMT6uPuFX7az9Ee6bP8FSAcUbfvRig6pntIl6N/
         xWaw==
X-Forwarded-Encrypted: i=1; AJvYcCX7K/SQxoRFpFkIks5R+9bg5T1I0DlbxKuHdKe3r+UmJAwR/9j/7CfzPL66v4YssZ2VzoP2sR/Wqvu5Ldk=@vger.kernel.org
X-Gm-Message-State: AOJu0YynGEYhEzkTsLz39D/4Ixe0IFWQBJuEQK1at+f6PvLg/tCGYx78
	s/c1tSgRnFWNWZeqFu4M08q1v2NM1LjyJNw3OYNMiQ3ycLYvkbcG99MD1QgGh1O1+g==
X-Gm-Gg: ASbGnctlsyCENBwMb4c2QUFTj7t0CCo4tbdQyCOry6VWYq4AQs48lb1EL2JzemSD3uk
	hrrinIimFa73GjQMoT0y6zGBivLX10Aqsx8WVv8bzkBTk48B3qASgIZIypkBL/L3ghpcKxQlje0
	1jWy4JwNvn46eQQyedqHmnpRPTY0uIY2qlveBlxRVixdyRho1hOx20GrZz5/11+HrhgS4BDDpZg
	1wL0wDNz3f5xH4kVtW7BhE5eppA/JLIqpiAXPISO83AenJFB3tHXWVmRbUuKI5JN38go7dkYDnk
	0S+LmOY2g1PHkUozs+J83FyGdIQ26MSrdBxPkxvbv2T48e2TZLiTsdAIlFOdAcnN
X-Google-Smtp-Source: AGHT+IFgMJIq/eGyoizczszmR53QE4J3SMmdHR+AgUSfMQ6K9taH4rprzgWuCxaybgUuO0JGEwa4hg==
X-Received: by 2002:a05:6000:2406:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3a6ed5da5bdmr2064474f8f.16.1750856607388;
        Wed, 25 Jun 2025 06:03:27 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0bddcc68asm151660966b.174.2025.06.25.06.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:03:26 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <41ea8706-ffb2-48c6-8a2f-5c4c51dc1a0e@jacekk.info>
Date: Wed, 25 Jun 2025 15:03:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] e1000: drop checksum constant cast to u16 in
 comparisons
To: Simon Horman <horms@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <46b2b70d-bf53-4b0a-a9f3-dfd8493295b9@jacekk.info>
 <20250625121828.GB1562@horms.kernel.org>
Content-Language: en-US
In-Reply-To: <20250625121828.GB1562@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey,

> 1. It's normal for patch-sets, to have a cover letter.
>    That provides a handy place for high level comments,
>    perhaps ironically, such as this one.

I'll add it in a second iteration.


> 2. Please provide some text in the patch description.
>    I know these changes are trivial. But we'd like to have something there.
>    E.g.
> 
>    Remove unnecessary cast of constants to u16,
>    allowing the C type system to do it's thing.
> 
>    No behavioural change intended.
>    Compile tested only.

Wilco.


> 4. Please make sure the patchset applies cleanly to it's target tree.
>    It seems that in it's current form the patchset doesn't
>    apply to iwl-next or net-next.

Just to be sure, iwl-next is this one:
git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/linux.git
refs/heads/for-next
?


> 5. It's up to you. But in general there is no need
>    to CC linux-kernel@vger.kernel.org on Networking patches

I've just followed get_maintainers.pl output to the letter.


> As for this patch itself, it looks good to me.
> But I think you missed two.

Rather: I have not touched subtraction on purpose.

But checking the compiler output - yes, it can be dropped as well.

I'll prepare an updated patch set with subtraction changes across Intel drivers included.

-- 
Best regards,
  Jacek Kowalski

