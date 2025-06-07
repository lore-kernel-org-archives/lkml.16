Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC01F3BA9
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749295207; cv=none; b=fsS+il8e2fWM9ycNzDtva15vGC4uZztqxVgjPGvrnBAsQLvFD4e5D9KxO71gWbj1+hc3KpiT3sBsezDwxYeoGxSE0Q79YmK0hrlhP6lNTsb7gMaxRUqiop53tPmm3JH/i4/yM9KdTd6dNrOLqhEqhwYI3Dxuxu4UiOIJEFr7tkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749295207; c=relaxed/simple;
	bh=ezOwLJxBd+E84cmXUSsMjmFEAV4KywkBAe2NsMojkx0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gUU9eIdNUN0zRvGR82WtcE32L8ZjoJM7LUJCD57p7E9O6phYYPBuWUOYJ7rrCEXq0NkkN+ABeHxXG1zo/FqIA9jwct52C40xosQUDwn8/I9DQjuVBmHBizvnUGze76FW2a2+FK/4pn22MFhdcxztJTaYSgjt9DPTwvP2FqEJ67M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddce213201so19195185ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749295205; x=1749900005;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezOwLJxBd+E84cmXUSsMjmFEAV4KywkBAe2NsMojkx0=;
        b=jfr5UnZmm3udgKCNq/4I7Wbta++tT1WInvd00/zadj983yeqCXjHC/odSpIhR4amZR
         V82dceVwRRkA51Ko228JFbZVu/QE8btn+EG0Zeo8zK5f7Zp5hmotDLbFdeOAubPw09sE
         +ywgX9Kh9IIy4ehfk0kwQoQmle7iJ7QpJb1SatUxvyM0Z4CvkTnz16UpeF8PaUlSuusW
         lFNUnwD+6NiXH6rc91jI5aNg1Pgxqmj16gGT1wvRG/wddlafKJpgG6uUpYf1aVzGTwCD
         31FKr/HfdzKdIZs+1cUpNTE4BHF5/+WplDEVLj/uZLkI498fSlXT1MgweuoFcvGHoImR
         vQhQ==
X-Gm-Message-State: AOJu0YzhC8B7T6Ot/Q8iqjWBxSO2nv7Y32vatcH9swu9HaqUsUs5Tu3F
	J9aHq0pMP+lJL4+QTcxcuhvnI+CDdUaVPkQMBTJbUp1O0bLTHgSGLRVeOuCsu++6NX0MIWMW6qO
	y0vjQAzXerFw0r/oo5kfAqjhDHIBMVB3R+CYCc49Rvqfr9vgQ1q11IZn8HGM=
X-Google-Smtp-Source: AGHT+IGKNAvPMq3I1C5vFuouOKWJQC8FTanoXXkRkbXNtW108j97sxLOHSvz+f0G0lDOEKIg7WKLnPVFewb9LKMNxJ75jPvXUzyi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e05:b0:3dc:875e:ed8d with SMTP id
 e9e14a558f8ab-3ddce5d8c17mr63591625ab.4.1749295204793; Sat, 07 Jun 2025
 04:20:04 -0700 (PDT)
Date: Sat, 07 Jun 2025 04:20:04 -0700
In-Reply-To: <6841dca8.a00a0220.d4325.0020.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68442064.a00a0220.29ac89.0054.GAE@google.com>
Subject: Re: [syzbot] kernel BUG in populate_free_space_tre
From: syzbot <syzbot+36fae25c35159a763a2a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: kernel BUG in populate_free_space_tre
Author: abinashlalotra@gmail.com

#syz test
