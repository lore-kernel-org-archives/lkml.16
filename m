Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE2F286897
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200446; cv=none; b=PDEqAlfxlxxQ/Drp+giECaz9IMKbRLOeLswWpQcqY4bjMtqL1SE48OqWtF5EJmpldee6T6SL2318+XAXgumGi30wvNsbWNq4I8P5HiGJkLD/GIZIpi2tzxvcvaRtReJxT2ylD5CD7hyT6tEYQ8S2N8OrLxu8uwREpamPfFW+iYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200446; c=relaxed/simple;
	bh=yjZz5cqjPxCELpVBkF9BIDvsjB8/4NGvmo0rmXZMq4s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FWPiPE08WSnmR2foTjpepGMZkzfj72+kAmdG0iDdDEwPDpbtHQcOt+tr7MNm7JdGVBsQ9J6N7iInwp5C51Wo/qh/f4Xmwj6Sqm8dXae/6VUNDBFD6hrNEcvJnMcfH2e6fUkrzqcbGnBW2lq307kDvz0BY6zi4EQuufHiIcqFXTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.222.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so540629585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200443; x=1749805243;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjZz5cqjPxCELpVBkF9BIDvsjB8/4NGvmo0rmXZMq4s=;
        b=MlsduYLqvatMndLy+QP2Hk7pxJ9DUGZN6djxDCgpkuTScgFiHUnCcShZyhui/ed5Cv
         8w5CeyIGrgI8q6oIAEWXC3RiXTvHTJYhA0dOc2uLhxRob9X0dODLY5sqaRn3ZFWp5ABA
         urL1gslgu8qUEjSaPJmleHp60Cakp3CTzgwkv0sGSC/TNE1snf4fE1BLB+yOP8QoHwz2
         Fhn9GwnBQ1/X7G2oW/9OS0PmNAv/z9/32BK0x0m7TMmDjQNtHg8YM8Bem5AjLf/n+bql
         ZI++WaBD5zohrrcwUdiehtnwAOF3gaqUIcM+HQTs+eLr9Lt5axTgTgMaQRrEkKFk+VsM
         wyYw==
X-Gm-Message-State: AOJu0YzI6fVRwOJDb1QHZmPpWQ5N5Uuw5Qyub1BSi8dT3udQy88vaLxQ
	2ObegHnnS1f5sTGTGaLHMZTwtSoqTaSEfbtDCKe00lstzP4cz4ja1NAYhXKAhJDkhl5gKNIFyQV
	GDGi8NkGEjMiezee6+q8403OTlULTYk613p7x2WjuV+UlpHILL1gFJDM51ZI=
X-Google-Smtp-Source: AGHT+IHdtfTf/YQQweWThFDrXf3h20ZP5yrlFxrKlU3g9JMeYriMcK9U8SbaARVfCSyaoOqS9i5Gr6FPByN5VjODN1gd3zuqPbye
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd8a:0:b0:3dc:7fa4:834 with SMTP id
 e9e14a558f8ab-3ddce448577mr24595035ab.15.1749200431470; Fri, 06 Jun 2025
 02:00:31 -0700 (PDT)
Date: Fri, 06 Jun 2025 02:00:31 -0700
In-Reply-To: <684298d8.050a0220.2461cf.0039.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6842ae2f.050a0220.389efd.0000.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 e271ed52b344ac02d4581286961d0c40acc54c03
From: syzbot <syzbot+05d673e83ec640f0ced9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e271ed52b344ac02d4581286961d0c40acc54c03
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e271ed52b344ac02d4581286961d0c40acc54c03
