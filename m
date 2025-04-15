Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D599218FDD2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729949; cv=none; b=sY5yvMUusJ5MFJ75p3rxfp9+lgrfMObBM777QxAMYbXut+/zQYilOh1b62i9FRcFfaeqoFPxQNSou/iE52n0h7eGnjHTmEMMlmE+a94kG6wTiUnBJiNbH40JnZXbFb/YSQfh6Q7z1MObUVFrhS5hOneuSdqsAfL+kz8Hj3VxIY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729949; c=relaxed/simple;
	bh=XRYe6k301hVMrjUu3bWA/ITB1UE99EqwDnjHlWIAJ5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HeyV/rgBqdWLoSboeD2cxssZAGmRqRmcUoXLYYpg5UjFpfWt3VuzxUBX+aiRkBh8pC5FD4iQXz6ogXZP9i49zCIong21Uut8RiPC1SNbCVG6RTGnPQ9DNnZRqvBE2bbgiB5P3270ssaocUuMd/cXeNcNifWodClPjnQZ5X+samM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5neojpM; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5neojpM"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b07d607dc83so2205368a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744729947; x=1745334747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRYe6k301hVMrjUu3bWA/ITB1UE99EqwDnjHlWIAJ5k=;
        b=j5neojpMlW6uBWxGJ7A1z668410yoBtbPsWq8EJbXEWK2HmrfpbvdN7z3nU2c/VtqF
         zi1A9EDtA5TZoviMTebGSm4KmRgN8NZv7INGB5afMdxIK9BsEH/u5jGO6Zn+wHTQ6dFh
         xPX/H9G4K4W3XZcW5xztOqIHcQ440AWo+pk+rXNsJsE0qhTS5lCFcPWbHka5xOn7h0BJ
         pg0/zN7TbOqLuidwfNhe+D57Lc/EsFgl2shRT7jblhymvzxSnw0ayXupJFepH/0ilnNL
         rsAjPKb8AFIgmU/6RhDpM4vMnfUWjzjkepqsnJaGOydDHNmu9U9rTwTHi2QY9LEhAdcG
         zOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744729947; x=1745334747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRYe6k301hVMrjUu3bWA/ITB1UE99EqwDnjHlWIAJ5k=;
        b=fzva1qAQZ/3/fH6P/YetyTTBJukQXawZk4Yv7w+07NO2rCuUjhl00OvPUCQdGewcfl
         njTndsd8FjdBlZaR8QM0mYdeSSB026p/4N1nf7cUNgSUvPnkgljCI21BlnIvR/TeCqlz
         RORiMO8E7g12TvSmRiybu+Djifnn1uGpzh6HyrsOevq44al9Cen4M+6jGQ6vIY4N+LEO
         rDeU6+4bgFVV2s2JwDByssOy3CgeAqTF0EwyC8ZfwMh2uYCuucyoscBi9uqbM5/iKsux
         w6WHkGaZ6kUyfZ+BRh9iMg2fKDulDdxSZ8M4ulKl+Vt8UntpddxyuREy41V9QEyjDswg
         2yUg==
X-Gm-Message-State: AOJu0YyTNG4G+7584Z9oGGJP1CyaqTTT0/k12skpyE39SlXwLNqrCkF1
	J4n74QLFcOXx7ZLJUP4Qc2Tk4Yuc4JGD4bjdRP0wd1HmBcCL9HDT
X-Gm-Gg: ASbGncuM/DkWsYpxyy4oFdtjEQGMJFJnfweT8PiFdqs5y/3Mup5i6vAliHZ6YF0ifaC
	50/ZsxI2ELc9JqYMRy26mudSK7jRJ2FE7m/MHMjAZwJ/VBs+GRJK6dWYwdQrj587nsiJ+ukloIi
	unn+OqVpzEygr6KPbAlbWtzZL1PUpVAHdJ5a7LNsO1d4tz4MpdQkNG/AOw1FCvkgWJiVpx2OLsK
	GWsMNy1Mj4srYTNSsOZwvBGsi6NcaUCiEJHH72H18BzNXUQWfsd+tpDS7juB4B+h2ck+r5rpQeV
	aJDDQ/qDWdUar1EjTQCBN0iQq4bHNEwQDBCvLLroiXJfTnrgj9G0x8YeiOdmIEj08sBksw==
X-Google-Smtp-Source: AGHT+IGj7ZxILPPDEM4ewVWgq3UXrZqhbLQLcORO2S3VQ8N9izjc75niAibXbVA8PDvR1mljpZ7BrA==
X-Received: by 2002:a17:90a:d64d:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-308237b9f43mr20795438a91.24.1744729946613;
        Tue, 15 Apr 2025 08:12:26 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df06a1aesm13297932a91.5.2025.04.15.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:12:26 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: syzbot+d472c32c5dd4cd2fb5c5@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [udf?] possible deadlock in udf_free_blocks
Date: Wed, 16 Apr 2025 00:12:21 +0900
Message-ID: <20250415151222.11052-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67290b04.050a0220.2edce.14f8.GAE@google.com>
References: <67290b04.050a0220.2edce.14f8.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
