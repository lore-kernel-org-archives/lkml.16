Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7332135A3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922725; cv=none; b=c1j4j1aj5m8VogaPJuB8WzRe8m9QdtHm6GpIoYS4iENeo0XRVchXOSfV4rd387D0Hvj3ijo133dlrLzI48TTncN6a1441OIppAzFXLwtj7GWvK/pJ4l9h94svz+96o9L+E3gvRT5bncRJ3PKHQubvER+gFcArbg1cD7SfZkNqJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922725; c=relaxed/simple;
	bh=z2E8jHyASWq7HV6g5EL/dQMtq8lV7MbAGJ2XOg39Pjs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=c3JuXsv+oygPSjCrmNao1rdd89G2SsCSqnUDRsu+KTSkkFABAdhfLnNhrY11cISc8jIVLPHcgA+m74lia1VUl7pWBaxqFnnbxaud+XGpMHuJXOd/CXR0hEDb7Hw083B6lACmFgrisuksqMmnQBx0uax6f2+4z9zdlKGoyggOhlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85be9e7bf32so1045752039f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922723; x=1746527523;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBJKd33MnmY6A5IylZariQ6qmIc4mPq8Kzw+IYRRLP4=;
        b=c4eXt9pt5G1lKUgzd+Kr38lmXEFxQJ0SboDUaGdYYMCcgqLSRoje9Py7WmJH9bkviU
         cfRr59sAi8jMnILNXq3JSvF3+zwvQP12kb++lYq1WyMvQJXYIm2tkQ4yxaLyqatcMGiL
         Lbr0DUAxcCvEZ2hQGVCjdMD28P8EdQ5VSTkSfxUUHJcAxltsn/DpHwGmmz1NtnJTia/m
         BvQuL+MewrDlosJgsvs83HJFHyox+kUvHix7GpMFmn1nav0QuGI5Ax3P47QgH3rLwcfP
         VqUug9D2kS/oDtT0qDMYvGKpHc+gxgczqMhYFGcCUiyZuLkkcvIRuBXGKvtBjmMEsngx
         G+9g==
X-Forwarded-Encrypted: i=1; AJvYcCWCq5jXp+wyZ37gv1w9q/oXFy+RDZneS78Afqj2MU5xJe2zOWXwapyDHUDkgT8nZw9uX15ajb0Cc/I0HMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN3ouRdDC6yBjJCeMDelzKLWmnVM8dmkKqfcqnTIXk0Gc+u5eS
	8topCkXfuJ3G3RrmRVo+boTKmYQP/FmLHCrQ6Vhd/wfVBhyH7SumFxYY1NGm0AyiU0lmqiv/Do/
	fRPr+IzNMi9QblD6OWNSGTIOQJa/aFFtDcoWxiEit1eOL+lzFwbcrGRk=
X-Google-Smtp-Source: AGHT+IHaYT1bz4kZUtenX+8FvXMCJaAwee3VvUmwWFgNK+BR5Pw6qg1RNr7afo9FbfCMu1jzqqLtFvrB9BObiK6uz2qctCcOVywK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3a8a:b0:864:4862:91a2 with SMTP id
 ca18e2360f4ac-8648988fedamr291177639f.10.1745922722979; Tue, 29 Apr 2025
 03:32:02 -0700 (PDT)
Date: Tue, 29 Apr 2025 03:32:02 -0700
In-Reply-To: <tencent_7212DF0676098EEEF9EECD0C9F27D686DC06@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6810aaa2.a70a0220.23e4d2.0038.GAE@google.com>
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
From: syzbot <syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

net/mac80211/ibss.c:1821:26: error: redefinition of 'local'


Tested on:

commit:         ca91b950 Merge tag 'v6.15-rc4-ksmbd-server-fixes' of g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=90837c100b88a636
dashboard link: https://syzkaller.appspot.com/bug?extid=4bcdddd48bb6f0be0da1
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e87270580000

