Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276272566E1
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197099; cv=none; b=IceXqxE/43LjvnL1Wb/VPHCTcjUf/SoU19oIQPkSJjnqo7PfVlxXrG+0J9+2WFs5vXYESBcbEYTtuMKNzObwVFQ/xYXLD1ruFBJvVt8vjY0nr1iUuNVb/wRPJK77mzN/BqbbzE2JrfdJmOq2ow7n5fI36uOJWilkPRi09spAye4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197099; c=relaxed/simple;
	bh=K2v+V9BeNPO6z1mSHU2f46T3osTrV14m8I6JlOMOUTc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/BsZp4aB/ERZMyo8vLUG6vbCyR8QWjGstAU4rFQF61BmNyBG7Dfgof6U/hkbM4ADuHIvyaaM5Tg+QvZ663132VpUJa+ZJa4JAWJv8wrSXODm07GbpWl7JbH1WVwKMzr7bZqLbktRD5GtHwHfvftnqW583vBYYsf6zTu5tvKvSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfS2RhDL; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfS2RhDL"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5e39d1e0eso233439185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746197096; x=1746801896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1D5cABUWl03Gb3dEb9Zn/xPv0rDHSpYAcBsKyT8bso=;
        b=nfS2RhDLjtxVsuw/2kdqZtMrVgvVzdjD6q/qgmtQyIk4SQKB7Xj9FOkVUlx1iFjOxw
         DckQRfrv1dCFElZJe8va4so/3UoQtCaks//dU8vn4oo7lEFJwGYwtr+l9H1uIraA2fMA
         ylm7/vyRPzgkt0xCH5Ofv9xJp5W+q5ydiPNtZLJWs3qLlwxqY5SYrBtrMBtf6/Fx6s3f
         1wSCiIozGGZVb3rtvdJMXHitxMlwolq87GwIHi0JKcpMlLc/36cgwB8fz2vBeMdP3uBj
         Fk73zDZgqpLyMkSGElIHZIjD2Z3ZdFGlg3Eqq3r9vYj1145aU5HvMDTxtIEAGfPBVuiY
         poTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197096; x=1746801896;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1D5cABUWl03Gb3dEb9Zn/xPv0rDHSpYAcBsKyT8bso=;
        b=QHZNepZAJouvtRJuYcdjoGFjgKV96dOE44MWcpsEzrPcVkZ66er1aaSOx4Cs5sMR1l
         /Uyha7UXYcw5l6N9ztSOyU0HBBSpfonXlM6zWIl8DWTKoT3p58NLWNltFeXmWbDlUbVS
         sJM0jTerwY4+xQy6N4hkGDvuxkJ/OdO5VuCzWEvhn3Vi33QsAEtgXXKiTPcm0HOH/6DG
         YZYCz2ws8nLKNYRa6YMuv+aERxQeM/pmjt6kqfHNTk3l5a3ZijSw3y7Qqas7xHqgRDEk
         sQs0xWA+3ODJlU7pWNlIld76GPqFmqZNmFLUFV1Wx0UbCyZBiCQ1uu9M2aD82KX5pmoT
         OQUw==
X-Gm-Message-State: AOJu0YxG1Fvao1GplUhCh1mPzaJcJSF8592alBR4sj5QLg+PXT44MvA2
	QgM1Whmm5looyWmHLiGymj2nBMkLGfhlgoGBvhU5BGmFhSp1XBQt
X-Gm-Gg: ASbGnctcceLDooPbbU1OsDcowKBiSJz6hW9p56xGyKTDD3e0ZPP2dIB0OlRWW1kbh1m
	dYqB4OsZR02tPfnm+M8Gceb7O/McjnqxtM118ChTsBwJHq6xitx7mLZXrE7dn6KPujJxhrM9ED6
	AcXIzB6kz+Of7uuBxkPpl/HxPm1guj+S72T0oDN5YaPVLC02Us1NkzrvppuIO5Fsv4777LQ80vY
	sLSjgTvR43I7Ch2k5VtV1L8hcrZB5a0eHwypTqJiXwYpY+XDv2vull5xijel3De6abUKb9QYesi
	zPBOoK7b1YoeY/10AFrrs0ukaIjKJfhlMGLTSchDFFY2kycvamX9n/ilIuhFI48PGWX1GvO5qvQ
	U4RDmz2VJpXwokAMEImV6tDU/1gBpvH0=
X-Google-Smtp-Source: AGHT+IHRPivqnggcPnth+cCtUlU5ktQEZ68fxYNwiRGEvvMI6JWX9VzuD4MXwQqFgO70AGZX+P3yaQ==
X-Received: by 2002:a05:620a:1a9e:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7cad5b2383emr418969385a.5.1746197095964;
        Fri, 02 May 2025 07:44:55 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23d0d0fsm189599885a.50.2025.05.02.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:44:55 -0700 (PDT)
Message-ID: <6814da67.050a0220.2f3283.cdc1@mx.google.com>
X-Google-Original-Message-ID: <aBTaZbjRBhRl7mDS@winterfell.>
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0EDF21200043;
	Fri,  2 May 2025 10:44:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 02 May 2025 10:44:55 -0400
X-ME-Sender: <xms:ZtoUaHvANPzb0oMXyUaUUbvZer1Qt2-dLwySerQz7pmaYVQKqdy9pQ>
    <xme:ZtoUaIeSvirOVsOwHJBs7DuaKe5rsRVY3U4oZC_m5ad1Ng--Wv30Fd1hZdzbz_3qV
    oJDIY7uHahqT7ayTg>
X-ME-Received: <xmr:ZtoUaKwFnohi7sgoHTCIucE4KPLorIxgmI8iH_LCfO_zQ4eK-On72pDn5iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedvjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedv
    teehuddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphht
    thhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhngh
    hosehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepnh
    grthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtkhdruggvshgruhhl
    nhhivghrshdolhhkmhhlsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ZtoUaGNe1Mu8wfVu8CTHH9LCHKLyYxsXz9SOJ--aWi_9AyGtYZE_jw>
    <xmx:ZtoUaH_mwK8azKp1HllcyJC66m8qPsryEX2dja-9RL-71VRnMwU3dQ>
    <xmx:ZtoUaGXaMkRsonYzmvw8dMOu5aksFuwaqDvT_yRsy7fjff1-yE0x-g>
    <xmx:ZtoUaIdMlxeymlj3_FZFsirwcAxVKnXIqvP1dFwzi8h4SuivDFozuw>
    <xmx:Z9oUaFesUaE_dn_vLVrg6F7MIorzBO9-4lWvzZ3QYq1oCOoJmM4hR6XI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 May 2025 10:44:54 -0400 (EDT)
Date: Fri, 2 May 2025 07:44:53 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] lockdep: Move hlock_equal() to the respective
 ifdeffery
References: <20250415085857.495543-1-andriy.shevchenko@linux.intel.com>
 <aBTP9AaJ0uyzAjxG@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBTP9AaJ0uyzAjxG@smile.fi.intel.com>

Hi Andy,

On Fri, May 02, 2025 at 05:00:20PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 15, 2025 at 11:58:56AM +0300, Andy Shevchenko wrote:
> > When hlock_equal() is unused, it prevents kernel builds with clang,
> > `make W=1` and CONFIG_WERROR=y, CONFIG_LOCKDEP=y and
> > CONFIG_LOCKDEP_SMALL=n:
> > 
> >   lockdep.c:2005:20: error: unused function 'hlock_equal' [-Werror,-Wunused-function]
> > 
> > Fix this by moving the function to the respective existing ifdeffery
> > for its the only user.
> > 
> > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > inline functions for W=1 build").
> 
> Any news here, please? The problem still exists in v6.15-rc4.
> 

This is in my radar, so it will be in a PR to tip soon. I didn't reply
earlier because I meant to find a whole cleanup for ifdefferies in
lockdep:

	https://lore.kernel.org/lkml/Z46BJ8FhWCIXbM7p@boqun-archlinux/

to avoid whack-a-mole fixes. I never found time so I have to postpone
that. Thanks!

Regards,
Boqun

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
