Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB11CAA65
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746615397; cv=none; b=WD5ovqCcvPwWki+SAUJ5g/Afzzcr3grj3ya+GvPnOcFvyZwT8tJq4C7SWSDrONhHPkqtrGrVqsoosiQFF3fBuR+mUYpqzRtlbv0x3Yuh09TprYfqlH9u4P6VilxFwc/iS8xMobxht4QFEXCjmN+ZKNYhdWgy822dtbmvLWEe7vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746615397; c=relaxed/simple;
	bh=5JFYY3a2Ru7OIQWa1DCqjC+hgh16GXpBKQhZODpXF6Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=RxPJinucdsTePZNMny/tZQNm4/Zd+GO0EYf4dzZWZR7Pv8JYhx9IOSbsW0VkwFYD383l/wFwK+kEf93FDSvSrDUjLAp+spLLPXold+S2K2kY8S5gzLv/StJqmZvReSk2FHf0+3ELMplJf/eCZ/iedKjKZqUDcEBIK3wXFkaPgC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3da720e0c93so26697665ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 03:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746615395; x=1747220195;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JFYY3a2Ru7OIQWa1DCqjC+hgh16GXpBKQhZODpXF6Q=;
        b=HiacjRTkuEbC67Z9hvbzsYXL/7CqHLQR06CMmx4VRTp4b18XuNbFdcO/SjtJcEe2oa
         8htpKLSRdv3BB0ubXD9SISteoU1pHWeDgZXlps9NGoSg/hfakKzNRPPsCJJeYpzUxSdm
         lDuTyEbwi9RBX3YmSM5UryhUUcO6Q3+3XCNIw61ZfN94o8BeSs0t8XK1jc8qNJk7Y0oL
         NO5USWLosnODOpVgTXZG7caXTT9crrmZzjjPkVV4h48kXpWAOnydp/x34Sz9d5B7UXPy
         yW14r1/dWZRbriTt8g4ZO3yZhSOwSyMMNr7r5E9CUuEkTPbT3rPYNFoQwQH+wxKTMrSs
         0xEg==
X-Forwarded-Encrypted: i=1; AJvYcCVo1OgLz1UpEx3yOQtIGZa+hMQbavx3TnPvDf6OTrFkD7BgnHZQhg6puSv0Xz2LxnJqVG9+WQR2gYu0CQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzel7oPhJ/ynNDagajtD8Cj553+439i70PTwAe1PxTDJ8fm3QbM
	5a+8QZYEvHQRZdRK1hZ6w6iC36dfGt8jkHNP9aRa/sY06l3CCQsyAClEvhV6n/DWH5u5tUYK3aV
	7LK/nMM2g8cAm0oIqC6S79tH4J/6f2Puf7WBJmignZGv2s+YHyqPCxR4=
X-Google-Smtp-Source: AGHT+IFwP/c+dY8CzFpcNdLjTCaEdwwpOk0Ht59+ft2dk1suaHAuFrEjbfYYkPvtVMgXMoQNcoaluXyq4TeXfy7EOEblmUovnkq2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198e:b0:3d5:deaf:b443 with SMTP id
 e9e14a558f8ab-3da738ed6ddmr28139985ab.3.1746615384395; Wed, 07 May 2025
 03:56:24 -0700 (PDT)
Date: Wed, 07 May 2025 03:56:24 -0700
In-Reply-To: <4b032951-aaab-4d85-afa1-e3020ba7cad0@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681b3c58.050a0220.a19a9.001f.GAE@google.com>
Subject: Re: #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
From: syzbot <syzbot+47321e8fd5a4c84088db@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru
Cc: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 0d8d44db295ccad20052d6301ef49ff01fb8ae2d

Command #1:
This crash does not have a reproducer. I cannot test it.

Command #2:
This crash does not have a reproducer. I cannot test it.

