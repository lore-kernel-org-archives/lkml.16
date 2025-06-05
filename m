Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE59022578C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749140630; cv=none; b=JRZJUoDTWrTRpohwzIbUDE79CB9YJptardsUjAOko87JaonK72wzjEODftj55sC+Lks2jOlt5AWsAQTKvpDEc6J3LgrJuTX8yMlEELsk9oaDTeS3cTMxhac9ejGzM0XdPwPmXnscwX5nxjuqHXCAMraZQQGfhg2k/Ni6Cm8eqdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749140630; c=relaxed/simple;
	bh=PjYlWDp3BNrBuSPWQfwonAQiBjIaNMna15G9r40nETU=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=c4UwSNNNYUIZwHHAEFQsLMDENZMMncj+mSZlVoSAnIUHI+CokP0na/sJib0+/jfgE6FnXk0QrK1laqfh6bYSfphORTIcUyz036QsN93bNoxBLZf9W2am7xh0EQz44w+ch65nyiAIs42fAADeREHUqjl+xlh4VT58SJa5dDWyNm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=ibQ+QLJq; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="ibQ+QLJq"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4064ec636a4so679070b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749140627; x=1749745427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhmkzSl4miVAEgBkjZzGaQa8Svu0eHPKNh52KfZfwCE=;
        b=ibQ+QLJqxg2RLxe/SejXvpLPRJSaI3e4k49kz7RkAFvbiwiU5HPAVL85ETFCzGBi9m
         70CIfgwthhkgwkZ62uH2yPnDN3cWkQLUVJZOlxYXHmjn4uyO0Gj4Ku/c/yf9saH4oicR
         4D0+QMG4Y8JRcYVqSuDbuqBU7Pq+sIwkgpyloBL7JdYtwwNVE4lu1Nessa+vS2ht77i9
         /tfaRo5C1+xVu50kj9/IsQ6MDVbdqii9w0Y/w6sFQcf/YQ4JSMCDZ55xIu8oQqLKR4Dk
         cEug6xpPbsv5fTcUQEl7tPLs2gXA2Hl1TP+OxUxuAusRHfKLMHdhiQDNXYoCLV/gp15v
         RwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749140627; x=1749745427;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhmkzSl4miVAEgBkjZzGaQa8Svu0eHPKNh52KfZfwCE=;
        b=WzlOAVSEITuRQLLHTXGRmbcrrgq3cwWKdsAulVM847XWZD/VUqpDp/ARyGfTj4hEFx
         k8ONfKKM5lf88NDd2PCwMDl285LRrkvh9zjYviQHtydU0Een8Uod3JGbsm9qMf8gmJ+k
         spKKG01rXXtAAbf5j3VF3B89VYpUDj/fiLRiRZo32u+vY12XUN5n5sDMG96ZiMa+r7O5
         gomKXWL5oXO3Eo5jAjKGYYSft/62OE1iuVQBQbkuLzNjk6+bn5cS5jOTH/+4nC/QrOQt
         Pb4b9uboEElk7uABY/Ub0edF95JC83fkLrocFka79PTLao3u4mnSuV2WmYYX8pTOnFYZ
         Qt8g==
X-Forwarded-Encrypted: i=1; AJvYcCWjr/kylXWGplimn05ny3KcI3IXchNMMOzXOXzrVCsG7KSOeHzrlqfZsh3293R53enBltHYbBVlzdyEzAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw87Cl0ozGmFi7OKzBGqQEgorPekOX6XPy9m92fN/5BNdR4fndq
	bu9UVgIJ7gN0zGGfzVZ492llfNnkq/SLgSh/Dx6D0tUcUjWQNUywHrz72uohHwJv1k+MbaDwq1c
	9gyvm
X-Gm-Gg: ASbGncspR3mYkwyH/WQhVAkdpMAapGML/81hbUQLxtX2fncKg3H/1u/Lvp3AKgMllVP
	Ww8aFTRC+nEh5B1EEEyU5teTQrlRiEF1C4CxlZxDMRcxTV185PEEwda9VRhjoTwte1SYLgAUuhM
	5ws3uS0XVYrXNDn2410BAZlp6LaQQM0MktN5PU5NLGtBt6A4P4KQ8v79P1juMxdgkODSw6+lnzH
	W6LveTrCzlshI/hnYuTWWQHbQXD5eGT0advEYIWjbEoWpQV+aV0hVuCM6a8zpN8kvSu0Qv06ux0
	Fd05+nA0TQ3TyaC6ql7GI0cfDMgZtHWZA/Qh7vnTQG3boBBI7w==
X-Google-Smtp-Source: AGHT+IEaIBy6yNKTCUA69UCGRX2VPwFS66IMWYvdLzscieBWr+NLD4pWHlMFRxq0s85XKrHw06zihw==
X-Received: by 2002:a17:902:ce82:b0:224:24d3:6103 with SMTP id d9443c01a7336-235e12535e8mr123606485ad.35.1749140617531;
        Thu, 05 Jun 2025 09:23:37 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:2592])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-235e425ad08sm27445665ad.129.2025.06.05.09.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:23:37 -0700 (PDT)
Date: Thu, 05 Jun 2025 09:23:37 -0700 (PDT)
X-Google-Original-Date: Thu, 05 Jun 2025 09:23:35 PDT (-0700)
Subject:     Re: linux-next: Fixes tag needs some work in the risc-v tree
In-Reply-To: <20250605163513.7cfb7f2b@canb.auug.org.au>
CC: Paul Walmsley <paul@pwsan.com>, cyrilbur@tenstorrent.com, alexghiti@rivosinc.com,
  linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-3E0595D4-92E8-4E7C-B02A-C33F7289E4A6@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 04 Jun 2025 23:35:13 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>   4e27ce58e7fa ("riscv: uaccess: Only restore the CSR_STATUS SUM bit")
>
> Fixes tag
>
>   Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: b0feecf5b812 ("riscv: save the SR_SUM status over switches")
> Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
> or
> Fixes: 8f9b274ad153 ("riscv: save the SR_SUM status over switches")
>
> (yes, they are all the same patch ... and all ancestors of 4e27ce58e7fa)

Ya, thanks.  Something's gone way off the rails here, let me try to 
figure it out...

> -- 
> Cheers,
> Stephen Rothwell
