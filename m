Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EAA26FDBD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775694; cv=none; b=Tnal6i/uyeqP5gFjlF6SSamkLezphJXb9xA13vDw7Jibjfv1iN9vy1AvmTzlvYDUwaw9cXiNI6kBJuLYL6FNGJKucV4DiPEHw7z1r/R8wNPV/3Dc4ZmO/DhF7gbC34TlT4D3/W0h0LZrSaFVoqzHLBqxhRiPLnrRWqZJBEjzLTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775694; c=relaxed/simple;
	bh=K/uwVCcGVSX8+W/QMeOe6pcnoGgsut4pE2+3QGyJ/i8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CNUqKdzbF059lpl1S3RSCZaI8b9c0Mwo50MBbATvqEgfhxBfFKssPqnyFaq+j3PnFynY+0YJE+Bg95g9eXfzm5D3WnJwtAIsk2bjrowa78xmp3IUcH2YLkhvsV/czQDYF9MHq8eLKTlXzMvyg1aLtHXca4dtNBnHxKu/R8hEmhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.222.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e28d0cc0so304667085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746775692; x=1747380492;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5cqWb9Y4UGheOnUM7rgBRHbDnsHKd++sTmz1TOPsG8=;
        b=wLGFhYvwVIIIu6/VEn1iyrQ8hzR+fdXF7z2jW1oBl1Cighf6NmfZ+em43r3MtmHjrT
         DPvT6dehGEZmPzsRBfRkm7jSUHs0XJ2Mzs7g3rY6e4SwHiVQO3ow4oIAtKNBAl7FDKiY
         xr+aAlhpHBhkgClxzkZaH/ORp5HGmBA/z5TcWowlrPycTfl1yuUbfujFWiHkhmPDOoxA
         CtJ9yEJ/q2E7mz3/4fHsGyg5gFRMvNdWAdQWbWtGhp54E6z8kAo8fjriim7in3G353Z/
         3TeSBW7LASULQrj93N+OrPfI+WBPHh9vSua7geP+nx6aSzxgvzwL9G3i1fmIm0fNomD5
         VMIA==
X-Gm-Message-State: AOJu0YzLXO0HbJzi9kFm+JqkAOH8ZlEhcz6YaWXyTDga4ApZS1Xcd/Y+
	lANYSHEnwgW+5Cefj2mNiKAu6C34FXpFs/Mu2NUp+wIQdXluo3R8mFmOmXBS8/Ur6XIFuNg+rh1
	u+7CD/HYiZxUwt1LEsnoJxga0xQN11En/s0/U6b1vdr5RiyTy/lLFqaY=
X-Google-Smtp-Source: AGHT+IGYAAgTF5wTBK4fBagkglmnm7oHcaHBTsX7zCpTYD73s3xqSKuR4Lk7f2kEum0U/K2PFqxaW/xxaJ4b4eSDLlUVzo2Fo0hi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2c0c:b0:864:4890:51e4 with SMTP id
 ca18e2360f4ac-8676366a532mr323418339f.14.1746775681768; Fri, 09 May 2025
 00:28:01 -0700 (PDT)
Date: Fri, 09 May 2025 00:28:01 -0700
In-Reply-To: <20250509034449.253080-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681dae81.050a0220.a19a9.0129.GAE@google.com>
Subject: Re: [syzbot] [ext4?] WARNING in ext4_journal_check_start (2)
From: syzbot <syzbot+b75d75f957975f3d40e3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, richard120310@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b75d75f957975f3d40e3@syzkaller.appspotmail.com
Tested-by: syzbot+b75d75f957975f3d40e3@syzkaller.appspotmail.com

Tested on:

commit:         c964ced7 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=137b34f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4376adf1299e87cf
dashboard link: https://syzkaller.appspot.com/bug?extid=b75d75f957975f3d40e3
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17384768580000

Note: testing is done by a robot and is best-effort only.
