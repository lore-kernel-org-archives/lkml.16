Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A99C3D69
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293926; cv=none; b=YDqwUEPyFtwdnU9R3i2yMRTqteUfF1qTa0eIDAFU/WLSRaubt+aLk/XCoPICSg+sal6+ZXJwaMZgK2Ia1se9N0cxbbSUvgjSQUhBw8//lfq/mM25UH2/4JkG5kUZMh1KPF0RAMb5ToPZON7+dHMrRFctTJkFaR+nYe8gtawoSSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293926; c=relaxed/simple;
	bh=paK1o7yHiubSycjhW7QFWMXqOYbkYxDkZaM+RT3djIk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cRCzZm9cRoc/A1iFj86iYG8Q0fXmnQKBtEFP7D3uC5rblTQDyd5G0JPkYJ4Yj8zuW65gnkMk/6idguVVuEsqh6pW/UJHT0wKfj2LCQSbVYHO60AzKHO020N/0aBjbD9dZnPfKbsEsZlbE33PCmOV4ajwY2PZ/0/llAwXjbN1InU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86f4e2434b6so194398339f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293924; x=1751898724;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6HBrsR+tCEswzSMPXXeBLs3OfGGqiNtBtJT4F8VTIM=;
        b=fiCtBPCfjpXU8Ew1kG+T7wwtYn9lgkkS3ZpPj4u4ERbczf1CUzpFMjX47PP42ROd+U
         TE4C+1BlLHlo2vLtwz2oMwlOzaoajN3TX0jynMMywaLJmwx8rSVRGBCBpN1NEBWID4MR
         R3am3JpeXDPNBjbvTTGiCG11sdzNx+/D6Fh3UT+aDwUiDOxukBF7XYt3xUgTnI7wCa4a
         IjwKY+bpQSscnZq+26Mt85B1mfEgXQhgGFg/OL7wqxWVwV2O4RemRMa60+RNmxJted+o
         GgyHfEGbzO/+yRPEuJX9hi6WHxpO7kTvYtrHkdKBbmY3EHnEfN4MKNg7G0ZNOsS1jeY6
         +RRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5Rrvm59Kl0sDzDYqy6wnNlGAySil+RIHNj76DSNDkSWyelW6VFGlcmjJXgXu3T8COzOpaTAH2IbBxKRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOnFdgzOcGilFbTMWWkGPDTva/ZqdFC9tXUIeDDjgjJUjwpkU3
	TEHtUKyuRQcgXC8xYJpAA3DLWrj0MBzlgG8iTrUDdHyZIin6Cx4/p+ZRKrIQL9qz9VEIGZziubr
	iuFVmk1eVTc4rwxjulhlv+UqZaUCPutGx/wf6G7+TmTzpEQb9C4tM6fmrW/M=
X-Google-Smtp-Source: AGHT+IFPYPYzoqor7Hr6RKnygkDnpXZMooQMNukoW9qi2rfx/P7QgfjItbn8tClxvlh4G3a+U15Q/a6TEh7HmK7By2ypu7zafJyc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:398d:b0:3df:347f:eb68 with SMTP id
 e9e14a558f8ab-3df4ab61ab1mr140446465ab.7.1751293924490; Mon, 30 Jun 2025
 07:32:04 -0700 (PDT)
Date: Mon, 30 Jun 2025 07:32:04 -0700
In-Reply-To: <840cee6a-44db-4c88-8501-6291f0c26486n@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68629fe4.a70a0220.2f4de1.002b.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/ntfs3/frecord.c
patch: **** unexpected end of file in patch



Tested on:

commit:         1343433e Add linux-next specific files for 20250630
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3d8d413c6928dae
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1362988c580000

