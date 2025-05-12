Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC12242D8F;
	Mon, 12 May 2025 16:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068040; cv=none; b=kM120U8OKDXCGT3YN6olzGOitBmSLo6Mey278mJv/Q99LX6dmaKg1tBO+Y92ionK5/syQLis3KOwEwc3If+dbaj2aLQGnRHyNXuz6c9DpnTFAMV4yM+J+iph129kEbiwUf+9RXRmZSSbrands9hKuYt9YoPR9vBrJU1LrUog8iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068040; c=relaxed/simple;
	bh=d42VcqIwwc59BNXUvj97V+qCgBw309ILUFJA+lM9jVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bj4S0ehI3v8L9iP9jWEUmOyuH7ZPoJJTUePHIbPStbk8rnk9pBmGgj5efySXSTjMk3GrALk5blWFNkngMMBUoBTiJswcuaGxdV0BtK/guWDbFsAWbLC6uAFnkx+54q+VtfEIgLKB2iyJdMqVwcwZYUtfvEQ+W2zviciOtzUaeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/HAV4dt; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/HAV4dt"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30aa8a259e0so4394781a91.1;
        Mon, 12 May 2025 09:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747068039; x=1747672839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUZ5MKbxqMKW25DiGJEZkMzbdWG5K50zfEObNRWcBIc=;
        b=c/HAV4dtfqLelE3mpQaOL3gZeZ+N3rt/4RdKPvnzhvQj8UR5WcVBz2mluC7il9e5rD
         tFNveEQ/oy4gfp9+bdLOE3eUIYWCuIn7lSS57UPBOcOVNiaHiEP2I3fCa5wi1/mqWqt8
         W/2JyBUqUUEVKxqR1WupC52bYN7OrxgLoD2uxWnlkcO4WxEofM5J6w89rIcgFsPq5wbc
         n39lJ9Ldo19xT7e2sXS8RXYu3coHifTtg89ZNR1AEtUiixeeSlH7Lo3vR5rgxxV19QSY
         bIBppupRCZFIoJpiD+xgU3zxByPh0Pq/WWZ/GzqONL9OsU5nYcYXUtDLzeC8TbBtdgUP
         JVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068039; x=1747672839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUZ5MKbxqMKW25DiGJEZkMzbdWG5K50zfEObNRWcBIc=;
        b=s+IWKRbfZvPK2aKSJTwxEI0GU2E/mdyqP6Qj/D0Og9Fr7fyqkm8Ggfpa9mkkFLM+cV
         iPGo7g8rlNK/4fVTBY5lJMNbPEZrI4d+LnLIX6gibfwKdmpTj1yYio37n52sujqtjWX3
         uUJb+eFiGPbGRUN4zxUe22055Mz4AiatCkfWAU2DEtJQMEDIsc4JfciiOoRlIEjr5DCH
         n1/T9Poi7BbLpHMie2bXSiasQkuwAbH6JzbNZzei7zidi9Q1AMM0/VOADW+iV2tcU5cY
         wBgMlEU16JW5FqC6yiotk4R+5DxFpVhQCYjeUZLTivRdNluFpRZVlMhnL1xT7AkBB13b
         +z8w==
X-Forwarded-Encrypted: i=1; AJvYcCURi/KXmrvbDxDf2vMmyipnLPYqA3VvpJsQ9yul8Zka2HufgFxFa9xybxL78tk05TX28cOKj6zR/UhNtXXp@vger.kernel.org, AJvYcCVCPGYD3vmxZCZZKF9PQ16NXD2ZX2QHgDyxI8gblLPDtrSjshFdALcOoEXPcJvRxhsb1ocwSbpvNue7dA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3lQl+dvAC027slzZB9tnXH4jkbu4YHwlHILjhIK3AjHeD2YP1
	6g+olQjoS9dDPbmEpXv+olWqGikI92FLSSYFRhsRBmu8/ogk4qBb
X-Gm-Gg: ASbGncu0fhqjH0CNKFqvEaUC0AZqxUjmFp4AvED6jjPlamRP6m8CImnR/ZFFf9eImZY
	9cHuRbkoFvzoaQ3QECYU0DmO05zm9bbyuTKsQqVddieCREnScQS7k2jCrV8cjM1TTWqnng3Wzxn
	fOA1xcbVjwWmjWdJL+N9ojR3kHV3OMEW0ruMTt5BcvXFKyh2D3PtxaU8ruYwJEE4QWgZmEs5GwT
	ke/xXe5KHgmmZvSsJC5fvEHuse+ECSiBbntPgDNjE+I7+JSqD7A5fuyXym9czlU5Bl653Usimig
	phYAlQbwbuEhKs46ckn/WJtAAT3ty4WEBsOqcjjhTg40EWrOI2OQtsQdRHYmfZPD
X-Google-Smtp-Source: AGHT+IFbnp3JNg7DGbkC6g/lSPmOWpBRkhW55l+EEdF+FhvMuN8xXIJem//w+zQJ5n7PE8scP9wrhA==
X-Received: by 2002:a17:90b:2e08:b0:30c:4f95:e0c with SMTP id 98e67ed59e1d1-30c4f952ff5mr21694078a91.9.1747068038507;
        Mon, 12 May 2025 09:40:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4d2f196sm8950902a91.14.2025.05.12.09.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:40:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 May 2025 09:40:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wenliang Yan <wenliang202407@163.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, derek.lin@silergycorp.com,
	miguel.lee@silergycorp.com, chris.ho@silergycorp.com,
	eason.liao@silergycorp.com
Subject: Re: [PATCH v7 3/4] hwmon:(ina238)Modify the calculation formula to
 adapt to different chips
Message-ID: <48c71b79-07a0-46f8-b4fd-5e49534b216e@roeck-us.net>
References: <20250506053741.4837-1-wenliang202407@163.com>
 <20250506053741.4837-4-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506053741.4837-4-wenliang202407@163.com>

On Tue, May 06, 2025 at 01:37:40AM -0400, Wenliang Yan wrote:
> Modify the calculation formula to adapt to different chips.
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>

Applied.

Thanks,
Guenter
