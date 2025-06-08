Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6F713CF9C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749397276; cv=none; b=m7bo33cMOuBeBEw9QtQAmvLFVq4fPe8Y9BgyrpnXpsRsR5Twi7w0umRJi8F/LV8E1r6q7gbqjlJ3c4VZeVz/RtAmHVrAecsmRm6/NOfyrxkxlHGRh6GqGDpAd5WlNZPkP1A6sIz1D6cFlSRIiW+K+vxGXxZ2Y6KS6ZagaHsNdGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749397276; c=relaxed/simple;
	bh=w9Tn7yjzWR2uPqn10gqrrwL7BPOpISHaZKXF7dsIRac=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WLwh2rPFyxBf0wwXAajO0hMH03ai/62p0nZLdnidzGfsZOaPcZL+IIOVP7jl4cUp+LyrufbYXVaVwEAqaZO6BFTd/EYmAU2CSTmmqZtMcoThtRRfaaqVE3nvn9NjFamb2ciJyf3U+jOpRvkM2l8LOrtV2yvawxzr7TjwM85Ympk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddbec809acso44752965ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 08:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749397274; x=1750002074;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAE70NEi0T0FADs843dUAT/MnCqmvusO6x4sAWrq/mA=;
        b=jKfzyNtSgLlnPgB8uxQDDfSa6saamBWj/bOAE9BSwTSLqUH+6j01SIg32WqNZ5nrBJ
         rnh0+za8uycUfivegt9VK5VeaoIi5avF161eBkPJXwbv8Nm7UwYIxu+9oLt6dA/hOxuF
         X5FQ/2fvdaalh10h46GwAwYpYqafwTDAc330DSR2EFjErGmxV82cgjPWGHHFDbSDdMRW
         QgyQeeREYkfNr0XGFhQtPayxE1ckLo+7cxDdLDRmpcwKzLIeFXXNQYy/qVXeJop5Dk9M
         YLbNR5eiTkzmKyQ/bsD3Cwu88bIRQciOtDKGP8ZR4MwlKsx7n2IU+UcLIzMlIBKPHxOL
         n4uA==
X-Gm-Message-State: AOJu0YxX4aTY6gFh2UCHVIz1vk1l98Z0EpicjLIaMAXDQlM9iBVvk3Rk
	wYMf6yupGC8qZ85r2IsloaA+V2II4KUmKtwirPyAbXGxg2L5Pb6NmLaWmBjLRTCxA6KuZU4sCl5
	ZVd6c20JJcpaTTqNjAMCvnBI023ynoQye//qyye1+4RzQY95RvHj9A+3KMa0=
X-Google-Smtp-Source: AGHT+IE2I7qlHIIYp0mO/1O3LcvdCrgbIhy98fSLqCXrfEfev1JI1Rb0MuHRecy7QMmj2RkooRoCxXHUjTf8iQXfhfTomlS74caE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3808:b0:3dd:d995:30ec with SMTP id
 e9e14a558f8ab-3ddd99530f4mr45523875ab.12.1749397274678; Sun, 08 Jun 2025
 08:41:14 -0700 (PDT)
Date: Sun, 08 Jun 2025 08:41:14 -0700
In-Reply-To: <68342b55.a70a0220.253bc2.0092.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6845af1a.050a0220.daf97.0af1.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+bcc38a9556d0324c2ec2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix: bcachefs: Don't put rhashtable on stack
