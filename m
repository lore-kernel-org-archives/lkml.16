Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB35328E582
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149082; cv=none; b=rgIfMGl08jj02jON5IxUehSjF4Uje5pzCuoZgH4ZxEC+Av2chX06HBauV1OjvXEYNfHD9Qtg+OG10dcGcFLZlDJYkmEiAO8OjsUVO72OrcXVXgPq5s/VaL+HC4CmA6aOcoSSm7ZP7jUfTABX0b0h1UzCDQSI+CYJ4B4hHOs4JG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149082; c=relaxed/simple;
	bh=vSuPr7ri2jzEwCjhbZAQ66WU4exRsQXK236Tp2UMrTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDdL8TyxsQgLrnh9AtdIcPL0hRlF3P9Jl3G8CTPMpA1gvIXLAPmwx3Aq8gPxUpGArrXSk5eAOD1l6YhFVi+7Fl7KWL+ZbeQ0VRNMwuqsmMJeW7gqH1Q+64nRCGPuVvP1zLErbXAlE7vIz1qikYF+CV4R4ChDNg44uGkTZVkioC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Wvtiko5C; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Wvtiko5C"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so72411656d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747149080; x=1747753880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vcA3Z4jzMIZZtYMJRiF5ZNA7Jc6yPVtKd63c9eBjQkY=;
        b=Wvtiko5C64luSkzmOPA9Q8VE1OKFd7d1d77n+Z8k9WA7aULQ5Vw7w6Y9hAH2TPdXc5
         1zzwMa+lrbKJ0mRTv0YWBo8txJ5RiSYAeNuekwhgYVz21gTFDUSfiqq63VPLSHJHACeT
         wxdcancftGFxirCfCwa0YkyMuBz/bhWa29pj59KIynAgbYQ4rlMmts7KSjqDyJ7Vd4ni
         eI3wH+igdU7SPo9XMPJw65c5ryOJyc9rpyv+TCDB6ol1FlFR/Qe4sJaUSeVUkohT6nfX
         ruSXxz56/rq7d7MFCYFwbKfhqxUXjqnIAhmjpAZZsx6yAOetZ8f7kAC+ph2hCDZBNNu+
         PB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149080; x=1747753880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcA3Z4jzMIZZtYMJRiF5ZNA7Jc6yPVtKd63c9eBjQkY=;
        b=fAYBA8unhQhiOQoANES8TFK7u2LU3KYrJF/MMHYCCm2HqcY+rOctVz8+lbiBxKmCX4
         hU2dcipHL/UbEFHaOf6iHMEr/o8ygntjK2IbutToy0ewFaiQXBrPtWW9giFkLFumSzU4
         oLUsj7jmteZKq2C/UM3yycp9hYeGTqzU7q7zR4Qc5ePYa81QFwAmflSFoP4/vOkj5a9S
         YvJzShGdbXeB5VNEqNiNfrNqe8ZRNodicS092q2sKp12Z1VV0L8QJ1+vNliwnMv7W3Lk
         9UI702opsnkHErRedTr+0VlU0ZocSX3K7WQTSzI9jJOBUxQzuivXaUMGwpDqyE3SUPsG
         H/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQa4flxory/qdnc4ZDZrSerg+ScVgd6kehVOqnrEhtGKQq9syCXEkTnSZNRob3t4nkB5OdTZYuof2K0bI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1sIBwkh3zDBPEA3rueM0riIWCdl9khmfl9sIrG31yjCFcKkal
	qc1hWp5GOLVYTP38y+4rmR8jUNo13AG1ct9VfshyohdkW4oDQwRC2xPY6qe4Uw==
X-Gm-Gg: ASbGncvZ4YKtn0haAFlF05qXBjCrHNMXq0SgM4nQwdLGAXMQSrC5n0TkSWmpmzeW+UN
	fVYpQFgaEARXpV6OUqXywYAGIOh0pSI3x2NulOTuZQFvltqJp2D27C+5dbhN4JNnMTBMXzVQiQM
	AtL18SMbR1vKoDDirncl8FejYbEgqDWd3nh8h7Rgx8l0JWwO5+m9HzC3Iq3LzHgEUXCaKUVT2af
	uGuI3Q2+EVUyxl4RCRIEa/xDqAYMl2wX+GBZ7MKe7Egr8VNE3YmkIfO6v+53gVmgrMXZVXTlxpY
	8Qi6IV+6tffh7Rr3hISBn+4Gy+SyljYGMh5H5I5jiq/aE5bcb2oXqQBGWzDu9muF6XKshA==
X-Google-Smtp-Source: AGHT+IFE+sCALMsVuAzcyi0CFJEyC2jHv15dAG6xqL5vQvflSMq1MuCrXdzeM+nxcj1DyxaL/2CcbQ==
X-Received: by 2002:ad4:5d63:0:b0:6f4:cb2e:25ca with SMTP id 6a1803df08f44-6f6e4800ddemr310098676d6.27.1747149078868;
        Tue, 13 May 2025 08:11:18 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6eb393f0esm51659016d6.33.2025.05.13.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:11:18 -0700 (PDT)
Date: Tue, 13 May 2025 11:11:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, hdanton@sina.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, mchehab@kernel.org, paskripkin@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] [media?] KASAN: use-after-free Read in
 em28xx_init_extension (2)
Message-ID: <ab7652b5-f854-4221-99a3-1c5b192b29ff@rowland.harvard.edu>
References: <000000000000453f3d05db72fc7e@google.com>
 <68235ee9.050a0220.f2294.09fc.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68235ee9.050a0220.f2294.09fc.GAE@google.com>

On Tue, May 13, 2025 at 08:02:01AM -0700, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit a368ecde8a5055b627749b09c6218ef793043e47
> Author: Alan Stern <stern@rowland.harvard.edu>
> Date:   Thu Jun 27 19:56:18 2024 +0000
> 
>     USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12cf6cd4580000
> start commit:   cd802e7e5f1e Merge tag 'for-linus' of git://git.kernel.org..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=11cf6cd4580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16cf6cd4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
> dashboard link: https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143a7768580000
> 
> Reported-by: syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com
> Fixes: a368ecde8a50 ("USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Clearly a ridiculous claim.  Maybe the bug fixed by that commit covered 
up the actual cause of this problem.

Alan Stern
