Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5562720C024
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750975744; cv=none; b=pysMEpFazODGsi/SgWOu8NPXbl5L/Qd60sxT3tj4+MHzIks4kQyjQ+buxOrPyY2jk7vt7JU9kzcmQRZRhwRJINzaZwh5JesevPeuz6hdpo7OHNedvCXgbCkYzcxD9R6jJ3GVjlEiUHXHy59wqEw8bdRFDD34ZSIwKw0Npn6U+Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750975744; c=relaxed/simple;
	bh=Jif/8na3lNSPGoolv3lSZ9wK+yU4rZRbBgFnv4gHOmU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JjxdA9AsyEh80IlZOMxdIjoJ5aL9sKRRc0wG2vFkSWc+NsHuYx9prwDYP9jtQeYaFCXmBtI87aHyN0jLv2nNK+kqRXwzsc+mlEu2j828gAZPk8tJ15fOuv7rSGGWudZjmiZw63fGj6LmF8Twcg+VMGlVjc87I1HXnl7nmAZNoto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3df2e9e6146so9429375ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750975742; x=1751580542;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRK3+FlO6ljf6Oh4ZKjAGMcGWuiyrN9PqcQuforqMbs=;
        b=GVJd6gOtFYL4VLOADNdIdThSaH4hlZGYJANxy1fGmYaxdJ2F+TEcpv2fqZ+o6H4ZAh
         NprwyZcnrsrRSjHtwabZYQp8yzVrkd2ymHfImgVOwUny7mgWbT3JFlnwArlR18DN2t9b
         sLi/Fh+kjr9v9pt+OsDESpDPfN3RosCPG2MAkv/rIlVAFMoeuemewJ6+YprbRB7eAUpu
         DlfWsyRoxJcn2nslkADVtc9qC/HrUmcsPqvTas34jxxh6Qylyi+jCnPI245lcI9DKI/9
         rbPXkJ9RTh+jiQAacgMXY9/UrsQId51PgIf2j4lsJHcE0H+dp1PbW9HVVV3woqVKnNUG
         ylFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqFrMF6h4v8rc1PGa+jGmmLRDMzyAGfF4TUJSHZjWpQ/qgQ0vgwkoVuceFVzjc8CcIFqWkLdkcUcKMX+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhegnhACbyx0IsSWS+TcsSUVhkFxNlDpasUUc/6E+53ROfX059
	dhRnlr8+orEhm8wsaaOVXPDJlSG2+lJkFj8A30REYmVub6zEOwKjxqgsf/D+9N9SE7B/ozcfh42
	tLfjF++jVpJL+oA9xa47v8K0SuROgYKZGvT1rfTZYaP0aPhv8dRSQ6eHcOME=
X-Google-Smtp-Source: AGHT+IF9YvS84oqf7D+CeogSq7dl7RAVSYc0jAEbPkuxd2ULtnVpcAkttTSqGPIEZhVUQozKSpavvnpe/mx6JUe9cshg1bA3Ujbl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:214a:b0:3df:3926:88b7 with SMTP id
 e9e14a558f8ab-3df4ab5672cmr14674705ab.5.1750975742346; Thu, 26 Jun 2025
 15:09:02 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:09:02 -0700
In-Reply-To: <20250626214902.1880-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685dc4fe.a00a0220.2e5631.037b.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_ioctl (2)
From: syzbot <syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Tested-by: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com

Tested on:

commit:         f02769e7 Merge tag 'devicetree-fixes-for-6.16-1' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14217182580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=644a0493ff5118b1
dashboard link: https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=127e7182580000

Note: testing is done by a robot and is best-effort only.
