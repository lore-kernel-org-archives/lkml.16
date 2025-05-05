Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556781DC993
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433121; cv=none; b=agRmFnSJWMXdXm0rjM3CXjtBZSFBmlZ9hBe8z58fThM0VDeTUIqcsLS9qXaM8D167I8DwAJ1/hG7tdyFiYq3kPVdfcUyCE58j6k1gRrmKbCDwv7Y4ZT2Sj8k/2gZd5+fpLo8OzGWYVUP/S02UO/ZM78CxgIvvh3e7Z64fbq7lAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433121; c=relaxed/simple;
	bh=pfav5XWatG+Z95zxS6P/8bVEMaogmxc67Gd6x6yUUfk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=fJlkvwidc+siTqL/4/nHnOgDIr1A+yuBLDyagRww8SBA/o5LzaTNN34XattoRi0wO4TTmjh/1uAkaRkeYp83dJAN0Im2F476V0scdXZw/p0CfUs/WGcSFOVKL5ModSwdT1DsnEWqRkMsp11rDYCr4N0H/a0AD58zb8h4rJTDTdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d43d3338d7so85011835ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746433119; x=1747037919;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfav5XWatG+Z95zxS6P/8bVEMaogmxc67Gd6x6yUUfk=;
        b=uvH+cAMSJ3py8sW9PTLspixHay279fMOoRVGsPa5aAzDorXr4NfulW3CRtoQ1+bI7G
         6IklRAwVA4y9CKX+VGKX0UMZRedCI6bOE5BbotOm3MSv7xJsovCxy2mi6Dag0RRFVze+
         DDKN+RkR5UO22SrszDsSJZXAeuoAS83j/tUSivu7ewhDZuBLBvM2quMZ5WDR2habQc1B
         1RmL+tFivYelNkk19w0f93etxDGx5TrzINfO4qAiNNc51OdMutIoZ5tLKVRU3/g3pKvU
         e2ezfAab48gAi8wGgao6hTV6OiNdgGsvd2OcMQg49yH4WlRYeEZNHBeSHbA3PSTwK9+b
         6CHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDn4Ut+mtTU3u8MTYDhZa76ssNy+yZ177ycrD5ZvjUgNXVbxhkUdAsZ8zcbbrL3b1fEyeoMioOEUWo3xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF311LPRIHAy1+Kzg2YFrBCz4vmjzu7V+hYHrJHyCB1oP0ewSs
	bc7f5fypr9Tm7N64FJjnNTA88yP9IXW7/9Ien0/XKAQ0vK256QvZT/gR8N4Uy07OlIMOC3dNpiV
	6RejNuvd29evBSL6W8k0cE37piysb7j1xUG35QV+zl78KdwJahyVm+aM=
X-Google-Smtp-Source: AGHT+IEgOxt9fa/sVoLNRcA/B5Pk94QQmGoM2lSzb2L64i0ZKtvIOIQT/GacLRKBvBLZ3fmCXWBTT6qnpkM02GKwh38cTs7RvJVm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f83:b0:3d9:66ba:1ad2 with SMTP id
 e9e14a558f8ab-3da5b126413mr55862305ab.0.1746433119508; Mon, 05 May 2025
 01:18:39 -0700 (PDT)
Date: Mon, 05 May 2025 01:18:39 -0700
In-Reply-To: <79c01542d7ebc269df609737b6f1a71e6263fc20.camel@codeconstruct.com.au>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6818745f.050a0220.11da1b.0045.GAE@google.com>
Subject: Re: [syzbot] [net?] upstream test error: KMSAN: use-after-free in mctp_dump_addrinfo
From: syzbot <syzbot+1065a199625a388fce60@syzkaller.appspotmail.com>
To: matt@codeconstruct.com.au
Cc: matt@codeconstruct.com.au, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz dup: KMSAN: uninit-value in mctp_dump_addrinfo

can't find the dup bug

>
> On Thu, 2025-05-01 at 04:15 -0700, syzbot wrote:
>> #syz dup: exact-subject-of-another-report
>
