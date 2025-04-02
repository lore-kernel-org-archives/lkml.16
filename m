Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB721E8358
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586616; cv=none; b=jUwJxsIMts5upJ7YrA7GoFewJFYS3H8x1mVzl11+oo8L4snVXHAzhmCfy+jeBpHO4/gPdjnzmVgXDyiW1qv2jaemCGMQf6D21hAViMW9s9XM0WCILm/EELiEep0J30v+Ztedelv4r6FcGKbwDAFP87kBWRoa6I49xgV+SzJLEK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586616; c=relaxed/simple;
	bh=xC2TSzPWbOUlb2UBRsGOcZ0jbCIVo8I7fsmn+4MUbn0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gNl79NRStkVIn3f3NFAWca9oh83wJI4S07anUs9whVispCZ1pNvcZHxAUSmoa13axLRpR1PbAU4+FG2Ivzu5I4faEsWWRQu4q+niZdfDj4qOb+msxmzLq81NNPPswCpNc3m3s+DIwEo7ylcayNDPv4DF007GfVy++x/p+0b7OBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d586b968cfso125755685ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586614; x=1744191414;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xC2TSzPWbOUlb2UBRsGOcZ0jbCIVo8I7fsmn+4MUbn0=;
        b=P9bd2TFvMLrMix2E9scovaDaYU5Qqw1571husDHjyRYgVmTgu1/OxUE3b7b9506VXn
         RtbYAH5FYmSwD9tohIxSBfQNA+wMYIETEPRIQn4bf9j3fAqCBJWJsmtXfRQSV+3usqhP
         IlDfE5eabL8syVVPa/fjApYAVyOGfOkNUVdk1u7ieYdtbxo4MgoSpBqhYRdOgTsJBg0d
         YoBOOQ91lzpfJSqFbjCEFyWU6YoaAL1GyP+hvXrSgvVQi079UIRAqdwW1KC4pAvEaWix
         Z80M4BAO+sry+tcmZUAB+kYZicKq3V/J8kGMtPPfirYJw8ZME9t9/qC8UHimUbbqcf+3
         4PcQ==
X-Gm-Message-State: AOJu0Yx4eKFxjIPo5q5JwadZZgsNBZKutQHWP9GuoydUplOzw9ePkUUw
	p70J3pbdzRfwLArEnl4/mn5xLVaFOJWDOdUGQNixukiIxwNdMHW5jpDpo64kGB/4lCb++PATzvq
	zzjpEwQiApzkF+6GFngixdHvGFWH7J6QtmtpvrfjvBVtMp51rdzVfUyw=
X-Google-Smtp-Source: AGHT+IFiXHgcahIAHM5W56FGTrikjj0zZmMlYxk8F5PyziDUVHxUyFYRLwgaCyD5R4FiSU2aVUOb+7uYYvFeTYwtpS6yP83o/j6e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3386:b0:3d3:dd60:bc37 with SMTP id
 e9e14a558f8ab-3d5e0a045cemr200454195ab.22.1743586614150; Wed, 02 Apr 2025
 02:36:54 -0700 (PDT)
Date: Wed, 02 Apr 2025 02:36:54 -0700
In-Reply-To: <67e3f2f0.050a0220.2f068f.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ed0536.050a0220.31979b.003f.GAE@google.com>
Subject: Re: [syzbot] Close msi bugs
From: syzbot <syzbot+38d72234503f2b05981f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Close msi bugs
Author: nogikh@google.com

#syz fix: PCI/MSI: Handle the NOMASK flag correctly for all PCI/MSI backends

