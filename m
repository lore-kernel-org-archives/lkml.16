Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3699C220F26
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414718; cv=none; b=KoHJmA/9+14IK4CQR1Iue33hHS/n3wJqtsmHAmNB9fa/shVCtvaBWuymjaMNUyZRqBFuoWobBLtlDlLAnaz6e4bj/H3kxHkCo0Zfp0g5H1h0SyuMBAWjCxhVqrPX/A+MLmzV6g8t6sWksTS56uF/f9qIV3XM8tHkTWMrFQLwcKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414718; c=relaxed/simple;
	bh=86ZYYAyn3U6A7PXVx8Omcm03S1mbI2p2nC4V5hM4sQ8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=rInyn3CxlcPx+kSweqARb2fMb8ovq4xAMuVA6s/Y14bSv4Z9G7zVF95VMsS/gXi4lNVUoL2750ni8DB7Z4SAcgY34s3xTypHlak9VmW2WgvyY7m66jxwUXLrbyPXACbgkVpdQG3r0TguPkpKxoZmZmIigugAZ1io48m6jeCCZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJ7z1a7W; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJ7z1a7W"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so2933669a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750414715; x=1751019515; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=86ZYYAyn3U6A7PXVx8Omcm03S1mbI2p2nC4V5hM4sQ8=;
        b=XJ7z1a7WZhxM7PS3d8Q2Qf1bYfoOI/Us8d7h5sQaGz04hGajVwlsYB2gYc51LxUpkx
         eIjx3siEFMEAleE83l2vMXbo6/TAWRxrmA/4NsW3mq2/E0rtjQqETuMxCCJ8UIomoCjV
         YofmaOPw4pOx55Hrc1WJM/mr7YnDb7FQiktS308YaiUNit3rDmfWPsY1jYOMZJja4JLi
         j+XlRByyn3Zg6aK/a+aEtKan0OYEJcYL21ET0M84QevdXg7fGW0ahlaIDh2DpD6h45m8
         HMyr/oW06COtwGGoYXlR/t8/Xu2ICBN6f9KTJbyQusUs84ykfNm8qDM4pvXTjlwgGxrp
         m/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750414715; x=1751019515;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86ZYYAyn3U6A7PXVx8Omcm03S1mbI2p2nC4V5hM4sQ8=;
        b=tE8VEBenkKxYi1+zPzXuoEvQwwEc0hrcbPNFZdsReCH6rny3WxF6r99S4gw9sn/RT2
         PVQIn1t98zQGKe7WGH7aiCZsAp+FOK0O1IM4HvBS7+oatOzhyDf7av3I9CDNyLq2/W69
         xFK3MjUvqLWwmUWwjj3LJSk0uu2Q+cmv1jxvL/eUNTBeuuvlWOD1w7Yxs7N+QhT3/U6R
         cisJ4vDehH0b+2GmQjyafEjhzzu9jb4bEn4LynaH1UyZ6cziQib+QKaCOYwC2I06DhAZ
         jelUIWLBTUj+F5pEQIpl5bkn/d9PKKx35WRF8fMlMRBuiG4TxQ/bhl2MDqxHiXnR8Ojr
         77KQ==
X-Gm-Message-State: AOJu0Yzn8mAM8enGoxltB3fpw+FxlY0VBoq+O1H3Y9uomKPaz+jTr8lW
	gjI36nDMPaXwLtxPmOEtUVIKy++8+jj80/3FNIPI/NNDGoPJD76Ybihm451/uNxUQ8SNGVcVmUe
	5dzOrLMkxRXCLceEWbbj/zeSM1Ramr8KuGaeK
X-Gm-Gg: ASbGnct/TVMChqNx2mthcsQwx3KciVeB7GcY1g+7hXv4arIeazBqXoilJtHUQXbQNNA
	Jwiy/ABt7KxPx7P8VvquY7grSCy538PqEPN4qK/dogp/7Xz7eVn6MFvWugdRKQazD/Wwdeg86Kl
	EPa9mm4JD6EXKpjW2fNxxe60/4zzjoUIQc4dXZpGhjJBSuEeMnkqFWLeJad7dQj79Md+Mj/0Xry
	w==
X-Google-Smtp-Source: AGHT+IHac46BHxlsTtgjrVLIMsyz0TTIMAst8mSQCzK5mh4gYXh9rIKkFJeQlwxcvgNrvyjpcXfUXNvdrjRoL8Gy0Lo=
X-Received: by 2002:a05:6402:35d4:b0:607:4500:2841 with SMTP id
 4fb4d7f45d1cf-60a1cd33098mr1921683a12.25.1750414715097; Fri, 20 Jun 2025
 03:18:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andrea Bravetti <andreabravetti@gmail.com>
Date: Fri, 20 Jun 2025 12:18:24 +0200
X-Gm-Features: Ac12FXzEeB51-_GarOich-TGzgFf41hjO95T8fCu8tvTXFCo_GdWFW9XAVAmZ4s
Message-ID: <CAE_SDzhqE0JTrD6gxb3Azk-Ld=sZBEJ04AxeXNMx5ndev8u6hA@mail.gmail.com>
Subject: Dead external monitor on Lenovo ThinkBook 14 G7 IML with Linux 6.15.3
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With Linux 6.15.3 the external monitor connected to the HDMI port on a
Lenovo ThinkBook 14 G7 IML is completely dead.

It used to work properly up to 6.15.2.

I filed this bug report for this issue:

https://bugzilla.kernel.org/show_bug.cgi?id=220250

thanks,
Andrea
