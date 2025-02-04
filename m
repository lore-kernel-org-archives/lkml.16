Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDBE206F3A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738671559; cv=none; b=gcUv34ihTgmkNSR0hqvKa36faJbjnzjWVL5d2hQMUp4/jXLIbf+3c+NqWldmgOAj+PPobaR5i4qkp0pqjsEs+ZyXiaexgmnoxQUkI0gj1jDngTWJXDpD3kvzpBH+NOmu8wLM6v9BMKviRAIsppZgZu4ZrC7WkG1dGzOx3Y3cX/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738671559; c=relaxed/simple;
	bh=Mr0FuXr8a4wpJsAAWx1cd2vNdWLqxjiJMd773NZ3+ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aMKAAeN86yRX2vHB3GmRFOSRGwBW/2Sca0BpUiQLqQ62r976AZSY8Pm4wRbaX4ffwYgzGc6inJG7QDxV0i0tbAmMH9UJGu7CLTAauTL5356ISoKONu4TwOoYoUvB3mokGIVHFslyboFZH/sDuaqBM0ZhNAaGYt3t/9gW4/8c+wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M6S5Plhq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M6S5Plhq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaec111762bso597494666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738671555; x=1739276355; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsezKdeSKwYZj2Gc71tZVnHA/twO8FklaekB/V9xp+Y=;
        b=M6S5PlhqzSLAn2A2XRvJuZHKz7Kg6UiEfwfJxjK8nzm5zOLzA/ZApZSDjay4D9QEMi
         6+XY5YfCU6fB1NLWdW+VkIFxx09Pd2kPCJ5bEolzjDz2ppIMrILQt+lZkx0mp58uNXQO
         xh7mTG63XeQEKAXLRgaG9PURtlPJubS7o6+VTInVcM0bIaEPFd5c8j/ZcY0oHqlc7gTc
         KyyFR5EVSn+LU6qRJRrr70h2gDOPdMPHEFpAdji8b9Z6utYXHDRVgdD5h/KNiHHL8j3y
         mf6iNfJb7qQvIb9jZbX3LXP+myBKnXP4wqDjCDJSFP3rB/iYyaPhi3iGoVEHBAUI3jrS
         9pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738671555; x=1739276355;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsezKdeSKwYZj2Gc71tZVnHA/twO8FklaekB/V9xp+Y=;
        b=h6DCqlxaITc8Hk3vrwOI/Ix+byIzOLKuBSHl3PUKy4ZE0irOu8mG3WxI/loq9KEDoL
         QpUGguymV74RrWFBF8FxJM5xZN3fPcdx+g8cukHVPZP5xOvnbqFiEfpJLF1Mp5RvJ3q9
         Qq23+n8/o0EVsF9H/iOn+bukFI+xKfqRdBwFtmPnoNcIPqJXsFqrJOTAwX9tvF/32SKS
         i5/iOnHPm2Tf1e3L3P+aCm9WSh2XeiktXgXF0bv+QsWns0uDCFEMoZP+JuxwGbx5StOI
         d0E+0is5WZecz//eQRIdqEwWFVljCE4nTQNcyxGTLUHkeWTp3f9E8FLaotAUbjH7/c16
         c9Fg==
X-Gm-Message-State: AOJu0YzNWBwkdveYzx0FkDJmTUh/8xs/86MNHIXucMY843ipG92Ob4UO
	uxgw8wAjzhfewtUhXhh1m/eexeK0CYh1I8uCNayC4v0vkIxwuAUdLZuK5dQKmw0=
X-Gm-Gg: ASbGncsdRt62gxAcp0u/lh1gx+8pAr+sTbtbI5q+sSfJrW6708kjoucPo3aunWXYxIV
	yd3LeDb3vTaxJ7LgCo8XoAsFpKaheh1LooJtjIU4JKVis1leZbyC4VYndRESUfRNFy6/tUluQQr
	/XRob2sKTn3yg079XFJN8VRFEaNqogXz/AV7qCfpENvs+9VNS5lkxT/b5xvPjYTkb9IVg4OVG15
	IoSQxdR0gK/xanfaMrcSwbct4nmmPXlnS66C65lS+/dv2l1YbGAVMPVZHB4TY9WJokW7XB1Yo2p
	uihBLG794AAbLgN1og==
X-Google-Smtp-Source: AGHT+IEwqcYpYQX3qCjOOLIQKrrBSa5mgJ0AY6GyMzMPuN6SNgZMqvRW2Tw8lzVKFa0aqMaH3AapFQ==
X-Received: by 2002:a17:907:9691:b0:ab6:dbd2:df78 with SMTP id a640c23a62f3a-ab6dbd2e39dmr2863868866b.35.1738671555490;
        Tue, 04 Feb 2025 04:19:15 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a320ebsm911008566b.154.2025.02.04.04.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:19:15 -0800 (PST)
Date: Tue, 4 Feb 2025 13:19:13 +0100
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org
Subject: [GIT PULL] livepatching for 6.14-rc2
Message-ID: <Z6IFwZwdjFGvpYMP@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull a simple fixup of livepatching selftests from

  git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git tags/livepatching-for-6.14-rc2

==============================

- Fix livepatching selftests for util-linux-2.40.x.

----------------------------------------------------------------
Madhavan Srinivasan (1):
      selftests: livepatch: handle PRINTK_CALLER in check_result()

 tools/testing/selftests/livepatch/functions.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
