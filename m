Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD9125A656
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611326; cv=none; b=I/RHQAQfcUSzSctMBi9cdVZDMtWqf/uyiWLQrAgBZwkBtA9uRZvBliF7bTrm5u6pXESKE2Qdxc2SRj2b+G5vThHRe6YXjAFQ1lEPxL483l2HuF2SW7tTfKQ5/Vj5rrZcTNTwQ9tR8oC9Yz5gy/0CaQKX8D2mV213e9Ea9emSL1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611326; c=relaxed/simple;
	bh=dem8yx+5jQk2641x7jNRTafYbD0WQO3Z14v+7yZ1MLI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SMkeLLi4ECo+Nj8+QSfNR65IYX0chb42TFidvy2Hp+laUMDTj4mvT+NPP2nwogJX8SkKfd8eex2zpJLWyuk6V7WkAavd2PvoSocThuBW7FWrlYCcvuZ5uBBPEKKWtAXV5RLwHNtsxW3Iv2eAWQJAaKWx+mFiVI/Bt3OVQ7uYZcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d0203cf90cso46944935ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611323; x=1739216123;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dem8yx+5jQk2641x7jNRTafYbD0WQO3Z14v+7yZ1MLI=;
        b=k0oENdwhmJanUUeavHX5xc6WaY3ru8c6gMKQPXHle4HIrpB6VymSMDXC0TlFFfE8eH
         tyED6lqEgu5g8BXD4kqtpLwdEE7WBmbRw3u6O+TA+Lqn+TnN6aOMEsfPGIKpb3+7Msm3
         7zqUiYZtxvJvAFXGXRfpGXY3SPyD2y6ZArCOXYCvzl8AWkBPVgRJTHWQi4CketkyeNa4
         FhdZW0LAsYEbUUSPwsLQ6I6EV+luiL3QRkJ6sol1mEpogknUjqwOYeF7ZuYPH0riPk/p
         g97B95XYZA1TnD3LPtpTm/NWHibbzyl40lOKd4fhiQ8W0nRVVB0r9wCTNxAFBV20uesL
         J4WQ==
X-Gm-Message-State: AOJu0Yzu9to+DjolZRL+DORdh4pVLSSPx7WthWO5QKhEyD5x9SaQSjg1
	bs1iq9luQUUsLdpaI/FInQOarTyeIkHJ+0wc2X+MjYIeRZORR7/gU4N7hVBTEWHtbhNnoh6QlDn
	WoZvpYWOCPIG0TchCsdLnVkpV5kCzLpUKKW+c+op9OVq8FYl7INrfy1U=
X-Google-Smtp-Source: AGHT+IEjO+o81U7Z4xPjqy0+L7J7oCPwWvsZiPGX91iLmNJeS1siXsWkPkWAaNCu1IgsthKUVZbKZXoNKwJFiG8hoY+E3C6owCdp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:221e:b0:3d0:239a:c46f with SMTP id
 e9e14a558f8ab-3d0239acd38mr93882655ab.12.1738611323741; Mon, 03 Feb 2025
 11:35:23 -0800 (PST)
Date: Mon, 03 Feb 2025 11:35:23 -0800
In-Reply-To: <6797072e.050a0220.2eae65.003f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a11a7b.050a0220.163cdc.0050.GAE@google.com>
Subject: Re: [syzbot] KASAN: stack-out-of-bounds Read in usb_check_int_endpoints
From: syzbot <syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: KASAN: stack-out-of-bounds Read in usb_check_int_endpoints
Author: tuliomf09@gmail.com

#syz test
