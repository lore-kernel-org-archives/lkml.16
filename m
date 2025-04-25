Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD241BD9D0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607272; cv=none; b=He7tpohhaNbSLjRcYXtZn3UC418Lxj0394nUuH1CMXV2T7I7csUJnRihBJbuYq/jhYAdqB1E6i496shdy41KK8f0OTRchAZq9CtZ4LT4RV2yoY1Sel6doASyr5yke81QAzDBNs+n/pfxMsXxmQKBqJhqTFTwjAF/BqGN+YfEm48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607272; c=relaxed/simple;
	bh=kJ1/r8UiPOrNsc6nJpu1qE9JfJ3CE0SI9wzu0ksJVeE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=gG1D/bH5khtEAeQ5yNWF/u6rxsz2GYrR9n6u+kAELqE1VOrdOVvCb7yh70+5aqjqN+iCdEh7AXtze7dzPQ0LTPoeemfqMkv+rhYyGK6Pkd0xL5c1bCR4whPRwr5tM9adi35XiAJPyhaFtiM405DhsakO5ktfKadSi5Nhz7L8wmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d43d3338d7so42689995ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607270; x=1746212070;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJ1/r8UiPOrNsc6nJpu1qE9JfJ3CE0SI9wzu0ksJVeE=;
        b=wV6k+QllGM/4LFSHHeJg4wEjLf0ZhQF87DQaGmHCKXlQhYB8hFtd6LVXM7djtPCCi3
         K36lzv0l5KQ3X1gjz5Xm58PCRfFY1xOiAC10Lor1qhtXvUGkkGQlLLdYRM06xJe/dP3f
         okJ2rbnXTIDOC89xcnhN9Rs0CbtBctaQama8jrcb54UENiVw5Uafve4P4/pOUy1toOEM
         JzH4RvfWcAfAYH1cLfwUZSO0lMcgqVtw41ArWOU2h4a/tW/0KgVHA8Md26rkIE/tn8WO
         ib835hHErKBileWb1h2Q+jETB/1LlGfaVOz14hfxhIgb8nijrYQCLdF+EP2gM/9TVC0a
         Up7A==
X-Forwarded-Encrypted: i=1; AJvYcCWnRN1rbItJ3OpucbCPPSSS+ux0wBZ0CYKmpHxe1c5tzQOYNMyVRaW/80ICLfEQQPqzbHCM0/uf7uEj33A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn295O83rfqmAWxkNLGG4SGTj4k1ujWKqJ0V26yoBjCqiauTzC
	5swDTapI+DlJfqMPrEoe73jq64LAAgaIxa3jwndm0blPZpMN5F5QotrqTTtvkyG2J53IKXmvXEK
	KteO1kOHKR4Q4zHjguMrGZwoh/9LtrwtZMXWCrzePedYqOVHTLXMkhDo=
X-Google-Smtp-Source: AGHT+IGJdIL+EZ8uR3ocHTGETXhvSj9tdasz/Qp6EeTiDInK0/r4AQCiR9+b/t0s2kGqwsF0QkM1+Rjz4PNL7fxxjaIbaXHXdxEE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3cc6:b0:3d3:f4fc:a291 with SMTP id
 e9e14a558f8ab-3d942e40402mr7903905ab.19.1745607270379; Fri, 25 Apr 2025
 11:54:30 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:54:30 -0700
In-Reply-To: <3629779.1745607261@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680bda66.050a0220.4fd67.000c.GAE@google.com>
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid
 context in lock_mm_and_find_vma
From: syzbot <syzbot+844241a52d3e9dccc8d1@syzkaller.appspotmail.com>
To: dhowells@redhat.com
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a64e4d48a0b77e4ada19ac26ca3a08cd492f6362

This crash does not have a reproducer. I cannot test it.

>
