Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B811DE3A0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669766; cv=none; b=MiBbLb2gJAd9d16v5jvgQiK62Ni/A0w0aN1uWxt6OwePJlwYavI/wvmEJvGU4Xm/uii4drJYofgBicZCob4oIwoIlBM2T+2d9mHe+lBsUjdnzIOHIDMxhlQQlRE1dTbbrBjdMDairDfiz7gyaOT2NhlNN3PkL1Cr7cXEI1aCIro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669766; c=relaxed/simple;
	bh=7aJm33v5icxCm0qidJHR4iPjTjoB6eUlKP7PS5rRpgo=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=monvSi44thA4rP+3G4uaHskO37j0PIoV9uCdiMi5Fb1En+oEfVeFxROwM07iHf1Q/Ecc/ggSiuJhdU6CZTHfFGoJnjff3UFwBPZYUKmV8Q2flPg0TyiQGly/BYaqv82F0doMAb9MZwXH6pV3Gf7RoVqcCbTBMq+65nYPN3D0fdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unrealasia.net; spf=pass smtp.mailfrom=unrealasia.net; dkim=pass (2048-bit key) header.d=unrealasia-net.20230601.gappssmtp.com header.i=@unrealasia-net.20230601.gappssmtp.com header.b=ztjyqZ9T; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unrealasia.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unrealasia.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unrealasia-net.20230601.gappssmtp.com header.i=@unrealasia-net.20230601.gappssmtp.com header.b="ztjyqZ9T"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22423adf751so6257325ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unrealasia-net.20230601.gappssmtp.com; s=20230601; t=1743669764; x=1744274564; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7xA35ksag9J2Xv4q27dqXCVSa6SSb65HZF1swwOeMnk=;
        b=ztjyqZ9TXGK29UdkScKH+W7ZqVArzkYxcekA9txAChAAFotFABxXPwfVRDA9srhUuq
         2tOjJsVr2En5p7OmePEDROoe63pxSjRbaMJ9n+4i+Rqc6lfG71W5OF2/3e/Wl5hGOACY
         ulIEI0vLZf9B5C5FZGGXrWTU5nwUTdXK27wZAdsA/4OPf1GUueJAAeLP1VQOF6aFCOaM
         Rm6HR850cCdHPAEgZtg3qHwlfOzNFiawwDvzjr1NFGUeTQxndBKS6Pcv0J5l0aCG5mwC
         A3p9PFfHzMCcxGlCgxPSgewIhdvOwXadg6Yw4A5+HAout/dwkRhwluXczd5bt/F0CuuD
         gIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743669764; x=1744274564;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7xA35ksag9J2Xv4q27dqXCVSa6SSb65HZF1swwOeMnk=;
        b=kVsFO5DUEsJuWRkFFYpSiICSsIhHeApzvsgXSr7Niw0vbXb8OPANTS82W8DxhyTCam
         GhQo5PY1ZSET+KlHmWhO8vwYFOVGdpcHWNq8VMPdSv8tFAAo7lMcXvMHaWI77SMPUZjm
         d6Sin/kDEWLYCdswRAE2x6hK+3164DkE/cg830L06O+VfeC5QjCFijJ8563YWtUwOaCU
         hsw0n9ynw2NIJanog5SzCZaF0ZFRt+7MaKM5F+PRcACqRcEsgUaKezTnQ6qDtDShTQbO
         EqAh4hq6CFoJ2f/HZf4OSUelJOiTgJYrKUZvG7VMFXPPPK+7+HlCLEoa8tX2ecWzm2Do
         ZtGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmVPs7Z1ydVavDRrtS7XET6aa4KlTYZPXjHzfvo5K0gk6mXAUcYNJYqMLPh64D1I8s1aYjGOpNFwNxY2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAkJkUa99URluX0ONWR4dx5qQVn6yPR04TKYrmbzYV76+U5IQb
	MNZKPa/N8piZx5QGpfFL9NGaBncuThaZ8hMEqAQKgDBPNAvYN+AlypLtDukNmkc=
X-Gm-Gg: ASbGncusq1S2kNNa2m757k03TqhbNaStYz8/MFYHpGIkYg6pMfNGJ/iZfWgFjh3fIb4
	f2drQrHTfTZwQ597hseUiEn21EeMmcagkpxOdii3pMhOHq3O3YWiZSa3uhE7TJlFu0GmNzryE9a
	kJEb2rYGCtyNR/LRSHjbweqtnbT5ikJ54SgHb8bL5V7DN6J3rlC8t0Xk3DHoVVzfYkjbBCHqWVA
	ebPre3+W/wt5jX7eFJ08IOrEv5RuAVquw4jvTODUY/zxO/QZTWIktCWT6RNkOtOnRH6smVmIU/W
	rB4b/nWVodLW31GQAspTB9kJ4ARO45JCefoL/IpMZqDLmrcNDHtbflhR/js=
X-Google-Smtp-Source: AGHT+IEjowCN4gXZXqm96TUY0x++o8jpRQdsEDVEgbhHSa9RgS155jbANLrw67GahxHTNTH1o9uHWg==
X-Received: by 2002:a17:902:e847:b0:224:b60:3cd3 with SMTP id d9443c01a7336-22993c0dcc3mr20120225ad.19.1743669764333;
        Thu, 03 Apr 2025 01:42:44 -0700 (PDT)
Received: from muhammads-ThinkPad ([2001:e68:5473:808e:fc9e:2417:ec87:2160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c2566sm9173505ad.95.2025.04.03.01.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:42:43 -0700 (PDT)
Date: Thu, 03 Apr 2025 16:42:32 +0800
From: Muhammad Nuzaihan <zaihan@unrealasia.net>
Subject: Re: GNSS support for Qualcomm PCIe modem device
To: Slark Xiao <slark_xiao@163.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Loic Poulain
	<loic.poulain@linaro.org>, manivannan.sadhasivam@linaro.org,
	netdev@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>, johan@kernel.org,
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <W6W4US.MQDIW3EU4I8R2@unrealasia.net>
In-Reply-To: <DBU4US.LSH9IZJH4Q933@unrealasia.net>
References: <2703842b.58be.195fa426e5e.Coremail.slark_xiao@163.com>
	<DBU4US.LSH9IZJH4Q933@unrealasia.net>
X-Mailer: geary/40.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi Slark,

I just implemented it in the wwan subsystem since it works for me (even 
without flow control). I wanted to port it to use GPS subsystem, 
however, debugging in GPS subsystem is too troublesome, especially when 
the driver crashes.

Unless i can have some VM with direct access to the Quectel hardware so 
i don't need to keep rebooting my machine if it crashes.

For now, i am getting GNSS/NMEA data from Quectel with MHI wwan 
modifications.

Regards,
Zaihan


On Thu, Apr 3 2025 at 04:02:01 PM +0800, Muhammad Nuzaihan 
<zaihan@unrealasia.net> wrote:
> Hi Slark,
> 
> I just implemented it in the wwan subsystem since it works for me 
> (even without flow control). I wanted to port it to use GPS 
> subsystem, however, debugging in GPS subsystem is too troublesome, 
> especially when the driver crashes.
> 
> Unless i can have some VM with direct access to the Quectel hardware 
> so i don't need to keep rebooting my machine if it crashes.
> 
> For now, i am getting GNSS/NMEA data from Quectel with MHI wwan 
> modifications.
> 
> Regards,
> Zaihan
> 
> On Thu, Apr 3 2025 at 02:06:52 PM +0800, Slark Xiao 
> <slark_xiao@163.com> wrote:
>> 
>> Hi Sergey, Muhammad,
>> This is Slark. We have a discussion about the feature of GNSS/NMEA 
>> over QC PCIe modem
>> device since 2024/12.May I know if we have any progress on this 
>> feature?
>> 
>> It's really a common requirement for modem device since we have 
>> received some complaint
>> from our customer. Please help provide your advice.
>> 
>> 
>> Thank you in advance!
>> 


