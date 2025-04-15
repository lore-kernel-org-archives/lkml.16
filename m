Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE8727510A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744696804; cv=none; b=mRjycGa19++rlLGHNgyK+louvlBlo+wE3HGbCsBDjJmHweIQCubaVND2LJRVrp8EmmJeZik57bCqqxBa/T4NhsXERTSHiqGnp0plNRSb8txHDX7+Q7H9oeKl+UxtMtRG/S8uj4pBIWlwSHp5x97JCV8Hnn1XEX3wx0MiSkcyhrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744696804; c=relaxed/simple;
	bh=30BnLDoNL1Oo4GFo12Sgdolh1uMx4oSYIi6y4Tie1E0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mANwxiwb/mHQCLEF/mZnRErf5uPB7TIdy6cDOBO0OdpA4YmViKboOCYOvoQjZaj6+uJXX0DYQsjhq5GvCBnuIH3aLDy9fbAcKLMwrF1cerO3P6UFBy8/SqPaKvnevEWqS4A5MbudEi6N0ePfXQB3he4dvi0Rcf5rdfQNZKOOdpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d702175925so50794775ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744696802; x=1745301602;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spel44pypa6rlZePUPAJ6+VBanCdedYp6rIzP+5ZZy4=;
        b=MYrYEm0FHolJ0+Ct/hTiGq4Wtjw2rSXJNsmq3tXp7t1U39xpRHP66FiCxwDl3LrBNg
         NKhoP2Ce2IGM+bkeUdY3xC3nFl4gsz9Z5E4e6GPJcWGObCPYi4D3gMqEGoF1wqqdlmV+
         yDoi5aR7IdKj0klGzbM9MehzCeQfhhfGJlbGfsC1Z0sZhSTsezb6d5W0bheRm1sAyV6l
         HBZxx23Qs7ZwnsmE3W/Td2GkzNdpxfZgpf8o7HlT5TCyg62WmpvhmbZp1zVIdBdn7E8R
         0MdgHQwWhXs0p38smPP2uTKxlb0SzWBGLc4gkdzzqaoRZTkdVoxSVcn8+x4on6NLv1yQ
         Fm5Q==
X-Gm-Message-State: AOJu0YzfbyJJZOgBV1DYEU58Ht0WYVRUHgOKZB7pSc8n8gA2p4U6za/B
	OmzaFJfzEnh4lM6fmVn6SrVuHytyN/6A4Of/0QRowOt8Tbfbt7tCptAs9H7y7Hl3Ql6DqKFU6tl
	KynqwQQ2sGekLUnI5ZrziTfVF/PPCHM/cV/tMS61Dx9wQChvZs6p0m9g=
X-Google-Smtp-Source: AGHT+IF5ncEkRLKao3XFTZP+isr5hgY1c/gHItw/OLUWEf5GIQ9xDLBOKvXLtJjHg2GIyyFKmZE2Nz7LnJnoEAVE+W2DILAs0EOh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a2f:b0:3d4:6ec8:c63c with SMTP id
 e9e14a558f8ab-3d7ec267738mr141778465ab.17.1744696802410; Mon, 14 Apr 2025
 23:00:02 -0700 (PDT)
Date: Mon, 14 Apr 2025 23:00:02 -0700
In-Reply-To: <ae35d5a9-c958-4cad-96fb-673e8bb9d46c@amd.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fdf5e2.050a0220.3483fc.0047.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, shivankg@amd.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         01c6df60 Add linux-next specific files for 20250411
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13f1f398580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12c3cfe4580000

