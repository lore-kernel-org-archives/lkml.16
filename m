Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806DC28688E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751578066; cv=none; b=BDLcifATX5COTiWmqgtKJI1bJ6mscdupdprin0PePuSq6poWvLiZcwvvzt4QdStDTfEnQ50MtZ7xmG5clASbPxTjtoVbXl0luzCsDiuy7m1bJWwUqCh5CiAipe7MmoojFK83EgvhQ6etf7+f3V8AYVB3BvXlciyGboWlTJazBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751578066; c=relaxed/simple;
	bh=pR1IIRHr8ArJ0Y+JNiMFcAvCzTUuROwWD3R7Ya4SR3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnVEh2r2clHsNPvlMQirtcOjUPYoOwBrP2JIQFQB5dyO48tFrY9z2HCqy1ZrI2MEpC9NXUmEYYmSE1pt99xutiEKV1SyGiPH9PEiS3psXiEo0Oevo4c+HZUxQxXam26KZVaDEJ6uRZNzUorql+O+q0qFXQMd9bv3mgJlDUdZSYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Zv9tRpGk; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Zv9tRpGk"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d3e7503333so39300085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751578063; x=1752182863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uU8YCv9CcoLMUipTRqeJpo55S+l6K/zToV39VgctkOo=;
        b=Zv9tRpGkLIyynsSvDOZxT7vBTsqaNcVLmHPXaT9PLaOp7626SQUDxZsxrindIEeUBQ
         i/GQhAiyJ7DpTuYEjBgFZC3aKwjT1fL2oxAHUdU/QJ3OEo+muWQISq36mv3f8ozQaEsR
         VjOoNJzzLigwgVI00ry4ZBQ2ieAqt02BAQ7JKVDMM8XCDnGT/dJlOtTQjMcbN1mO/nrV
         2Mhf06OaNv7xyq615uimzzJOdlBDU/EOdpB5IEvdSYBGR56yM5rOFqa0r3H9aJNcUTfB
         dFUM6+FDn3ZG/xtjEJ0NeA3fOGWKCgP3gMf4wZZtblhMaEFevPcYIP6iYkmGtKiIRnLH
         siFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751578063; x=1752182863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uU8YCv9CcoLMUipTRqeJpo55S+l6K/zToV39VgctkOo=;
        b=d1nHzCJUjKYCQFG1yBjrLOXlbIFF8YyJ4R3YihLD4gpVJwiLKuWQlRgvE6tg6E2l2G
         Bza6rsgGlgJ1kIk2bJ4ZL0zDsuG9dVZjPV3uB7AR3zvuH0l38HG2axWrzmg06GBpRNkm
         pl4Li14yvAUZTJ7zi/6GTAx+MZdEmcBAEWC/zbpmu6W5syNGfaFveDM5GJGKG5ULn1LO
         sybF2TA1JggbfZBYYuwyzKRjeNXR9WgfH+vQUsV60kiCguP4Vn8pNj5G9rxD8POPUzEk
         KWXYy+PV/QsJlJYHY7KHHSWjfAX0odPMF2JX0WhF+YM0pRLSw6UxRgjCJBdq7BDAEzH8
         jcJg==
X-Forwarded-Encrypted: i=1; AJvYcCW3Pt/PS8a3v/nQdJEMJmHpkOVew74b2qzfyrSku7S8nU5nb0NuPcUwXQefbHSRj0GESWo/2qPGtX7ld6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxox5ZA2BADvxYvfyXVbBpXmiRdF14o07yPgL9Q5ZgTtMA0FxIO
	7RvvNJLIgnqnG3C67HFkypi2+ziMVz7W/IBidrgY2JJs7DrIvQSw8ICZ5RhAebQbBQ==
X-Gm-Gg: ASbGnctm8LRNgL2W+nziEybT3DLwS7rPqhLXBJsXghD2WM1eXIaNQ+20jfcnUEfcNla
	mjxdttxOLPKUxW248BONlrtZID/OICR8bTu31RLTFsd6CtaoYuEjhgQe+KKysa22JPiHjthiOfQ
	sm1MtPIyOJP/NvEMGNgpisq8952ZqO0mTKnNQa4S7MVo+IztK2W39kqkFHVsbiqf2Sa8PC0rOsJ
	2TtxEiLG3Sn1z5qxD11mFKYXdwuVEVJv8r+uydhzoOpVpWJvvBo1YBPM1vbTGPxkbTIraPxncYG
	EdHr65uuu3RBaeURj2usoddNdUQ/d3H6eIebQiqXuKy76gBRoLBSRMRvb5aKXo4=
X-Google-Smtp-Source: AGHT+IFayeYDIBHtgolb1suqZFOVVasoaMun4Cb8238l1PWvfo39hWVGjmS9btydEA6scnP1+J1ijA==
X-Received: by 2002:a05:620a:2495:b0:7d5:d49d:3e29 with SMTP id af79cd13be357-7d5dcd0a63cmr70764785a.45.1751578063435;
        Thu, 03 Jul 2025 14:27:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::35a6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbd94242sm54327185a.9.2025.07.03.14.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:27:42 -0700 (PDT)
Date: Thu, 3 Jul 2025 17:27:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Hillf Danton <hdanton@sina.com>, Mark Brown <broonie@kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	syzbot <syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in hub_activate (3)
Message-ID: <b1657fab-b34f-4f52-94e7-333577cdb450@rowland.harvard.edu>
References: <68648254.a70a0220.3b7e22.20c4.GAE@google.com>
 <20250702080515.2160-1-hdanton@sina.com>
 <20250703000946.2200-1-hdanton@sina.com>
 <d73e0c09-b71e-40c9-af60-86b0dd6258e8@I-love.SAKURA.ne.jp>
 <de8af03b-4948-47c4-b9f8-68f7e4112264@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de8af03b-4948-47c4-b9f8-68f7e4112264@I-love.SAKURA.ne.jp>

On Thu, Jul 03, 2025 at 10:48:56AM +0900, Tetsuo Handa wrote:
> On 2025/07/03 10:20, Tetsuo Handa wrote:
> > Caused by commit 9bd9c8026341 ("usb: hub: Fix flushing of delayed work
> > used for post resume purposes") with cc: stable.
> > Shouldn't we revert that commit and seek for a different approach
> > than wait for a reproducer?
> > 
> 
> Sorry, wrong commit.
> 
> The line was added by commit a49e1e2e785f ("usb: hub: Fix flushing and
> scheduling of delayed work that tunes runtime pm") with cc: stable.

Mathias has posted a fix for this problem:

https://lore.kernel.org/linux-usb/20250627164348.3982628-2-mathias.nyman@linux.intel.com/

It hasn't gotten into Linus's tree yet.

Alan Stern
