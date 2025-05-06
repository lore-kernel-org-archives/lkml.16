Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E794027585E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539668; cv=none; b=l2te+4GrSPeD3+pRq66sUkQgLvj9Ba9c1ZseH35K9SCyON5e5s7gK8y6wjnq//EHdEIf7czsv82hlQTZfgiQGZ7UF3arGYmt2y8w/NirWJp+bdBLzGjTG1Yt9GgRVoVqOWtKPDe5yVw+fZMeBGWy6a/uaDTJykbLTzpfmITJrMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539668; c=relaxed/simple;
	bh=VOJchMnfC7MkoiTzklrBTFsWlxub4o0kHjt0b+D640c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=paVgmYkIW6q6r5twWNNp53zw4cKOGazUvjT8GopF5pmjW5pqo40tzCbZKysBLQkgYYvLYdLRk5ZbBSAiHGjYpcOf+MbFZTWhyJYhsX6hwmL8xO1MGOZE8ZVM/A86cjkfgQQeIEsyNOL8xJFW0joG4aRQE1Cq138wlQICrz+TbSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d96661c8a2so65600755ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539666; x=1747144466;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOJchMnfC7MkoiTzklrBTFsWlxub4o0kHjt0b+D640c=;
        b=MX8O0411ylXMsp6ddjYBypFFzn3WJobdAunF+Mf0whbgEAbyMEAU8JqzCAnm86gTjh
         tWEuSx/ddcXk3DPlnehqJi5Y0VS2vnp5/BdIwDs/LkibOcA6Dj8/r4WPvy3MCBERjsjr
         Ykair0PJnECriJotCW6As3Jd5O+LPW1zgdkIe5rOJKyqPTnBYh8wgpIMJOXMdfI+gJg8
         1TbgAOZuemHVdEW/TLRp1+T5pTdVGdf8rNz5Oj9Pcl9ag0qRvvZ4SeP5vg1qXaFLE0CV
         NLkirplXuel1xU85lsFMtjmbtKWLHIDD/HoE5TJupeWYCnz3Ilj0cDjNPLa2ez5kLCOr
         fx6g==
X-Gm-Message-State: AOJu0YzRVtqsFu1nCiyJsId1uc2CYbRlvHmvneCSi0TL+qJNVXa+MPJC
	GEZ+Sc8fBgoq5ds9SPXvEZF4zT7nBh3FRV2nCLfskI061d3Ol+e0s2IeKpgiajFArc4yzo/chkI
	ckvhFLnQazYykeyhAqmDhhuCOJvvW4CKy0U0NKFB9wFu03yEwqqUA96s=
X-Google-Smtp-Source: AGHT+IEQQqxsLwVa64kNR3jDcJHydYoOQjj3WoVjyqmPYrPjivchOTaAmV2YgCo4lg2pxaQu+39FGXb5jVUH1GFLwgi8l28Co+SN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:250e:b0:3d8:1a87:89ce with SMTP id
 e9e14a558f8ab-3da5b24c78bmr102914595ab.3.1746539666010; Tue, 06 May 2025
 06:54:26 -0700 (PDT)
Date: Tue, 06 May 2025 06:54:25 -0700
In-Reply-To: <68186340.a70a0220.254cdc.0047.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681a1491.050a0220.23d401.285a.GAE@google.com>
Subject: Re: [syzbot] #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 01f95500a162fca88cefab9ed64ceded5afabc12
From: syzbot <syzbot+7fb8a372e1f6add936dd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 01f95500a162fca88cefab9ed64ceded5afabc12
Author: dmantipov@yandex.ru

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 01f95500a162fca88cefab9ed64ceded5afabc12
