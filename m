Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5192A1BDCF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744936669; cv=none; b=mVY1IcuwXoinRimPMShPciMb9W3w4LzcOVn9jxPXDy+Q6N9vkbehOC6kRWPONbA8lBB3WpDf4TYb77EmC2piwVPIZONjQpMXFpWRhYlYMJFUAZimNcn2vg10w8vKJmFrC7YbITmJ0MPN8JIV5gSzchXcNfgtJ9b8sTTZr/U9Duc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744936669; c=relaxed/simple;
	bh=3NIm5IUACzB+ZLdRPDjPZAKHRcbTM3evGABWuQTX+5A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cNlVtfHK3qbgvo+uyX0cv+xsdqiRhmzJ65inGe2AM5Gyi8OK/uMB0vrYhoBTFsXlbaroPxjT7HpW6uCvsYhwk1ZXrNTcS+YtPv6Hdlm5FPnal1HzqAMWcaJVHNNB23Rh6263GzS+Cjm/YnR6dWR6x/3D0Ny30k/wt2RwAsdAFB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d80ac98803so14307325ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744936667; x=1745541467;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFq0UM5/FyIh5SgPdT4KX/QisQmdreNU9RLOSYWs4W8=;
        b=LlLpXBRgnk3OOow+mSj+6C163b1Bz6LEGNrAcfN3xWRqxdy5j3j6C42uqSrRV8XmD5
         b7Gakv0aMetd5ykchiABAH1j+icx3j+dhWG3ZrlCpxZ0pqq8srgcuFtA+p3heHZhUGis
         hmYAvZDTxH9ZlSbnNWLZh4V5nTQ+yPLRqlmWEwatEPTPj2dXdYfPdoic1768XMc4nJad
         Dk0zeqc7RnGx4NDQphkLzgfnJrACgPk1KGscfrNeo1Bi5UdRdR6c2vlfavtCxPHZxxRq
         8VtqnTDQTIIOAkTeKyQdVtTreANrX1ABb4l9vBAo/KZyFsbEUG//yDhMJZOvm1FE/Fjx
         C8UQ==
X-Gm-Message-State: AOJu0YwvWhW4/33Vk3n9W7EVhPIDMqztiyaHOKhM97WfPV0I/RDUuyZR
	DKi3K+PgJyIvFM1G75YhpqtgOd2VmvwTOm2BN9bU4veHWUqizvXpBMlKBxqgSIbPM4DdhFmAP1B
	Ml6mKyEb5XZhaTtbuPXQYcAxaSULJ9Bd4jdlNKAozdrG5evP52HucZGg=
X-Google-Smtp-Source: AGHT+IEdZIqGZyD1DNej3UXzBlvvnRyDfjGYF7zj77s/7mP2aDdHSAkBLLIasTPm0hsNwmpwmdxpTI86g2TYmihK8dZtprHl57IN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19c8:b0:3cf:bc71:94f5 with SMTP id
 e9e14a558f8ab-3d88ee51776mr10930215ab.22.1744936666993; Thu, 17 Apr 2025
 17:37:46 -0700 (PDT)
Date: Thu, 17 Apr 2025 17:37:46 -0700
In-Reply-To: <67f50e3e.050a0220.396535.0560.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68019eda.050a0220.243d89.0014.GAE@google.com>
Subject: Re: [syzbot] 
From: syzbot <syzbot+aec9606169fbc3a12ca6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: kent.overstreet@linux.dev

#syz fix: bcachefs: Prevent granting write refs when filesystem is read-only
