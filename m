Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F061A275
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133214; cv=none; b=bAADgXo1hy0dKEwZ1xyHwTcgAnG7sbJC5HGdFFsTdSTXyLl8/ugIVq0Ru/2MlrmRvNZ5MWmSSixyQN+3LUE7AIAN6ySmD98dv7PM0nx0vBTLra0uq78teBC0yq3gbl9oaVbjuVwQVaO+QbDwf5qJncBt6GE2eFeocnFfIpk2SEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133214; c=relaxed/simple;
	bh=D6FHs/ptAilhM8k5cptPkwXfX32KrVT7j6xeg6nw4ig=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=p5E4iSuv7Hp3vguJC2l5K/wP74g5DdX91n0kzMUdGGuXrfEs88ShGl3EUbjf8YXQWBGsXipKCSJ4HyOwkraIstk+fZqi10EKwtjrzru4sTkPyurrBFgLfFA7jCziTaM0F2qi7r02oIU86ZTVkE0kVlzGiSq0XCqH3uuDmEpe3UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc4908c4dso16909745ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 07:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749133212; x=1749738012;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6FHs/ptAilhM8k5cptPkwXfX32KrVT7j6xeg6nw4ig=;
        b=U3mYEcw8I4QYIOlXwW+i9l8KRnLMrng7kkfRXJOWX+Buz8sg4M0V3dJu/9rcLmxRsX
         WqjaxuE0yen2LYPSmIQRG2vXiOjZt0lu+WgG7kd3L4DlqQfkAOAwFv8rTiIXhc5BBk8t
         /0cQhwlv+ZyHkUFUt7Ed5eOENqQODiC6dDuBwjnS3LzVzDPcRwWbHa4oW1bIBqRCBjaq
         ZOZp1D/6yvG5iJ0KhK7D7s0SpueomzukpVOyl9hofkvgUz6QFF7UJYTDPHbT1B1Np0PT
         qFGoLJONzAsVrNzI9YsAdijX9fuR7PgexpBq8SccrSZNfEoS/6SQtxECUTL0geFkUWVA
         +oCA==
X-Gm-Message-State: AOJu0YwrDCmAFXQM3S+fsIDHRjzGd34KIAFMzBD+jC65teigIuxfMl/I
	B27LyjxmFkfb+z9ltsvgA1+TlTptL9rqIEMBDjhO+EFNVNbZJQ+J7acZQPai4AfDNzNwL5zKzrT
	o2UW+i8othJ65yHUkdXDtylMmoPByotToZ/nJ9n65ny8OwksVfXqYd6Ht2JE=
X-Google-Smtp-Source: AGHT+IHXJxMZUzeJGr5gjn5ZHOkqieCieywvm0KhEh9DH4sfh+AZuMhGimu0Jcbh9neUyl2kfi/mQrJa9hJ/S6Rez7upIbeOZxLs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1526:b0:3dd:bba3:5348 with SMTP id
 e9e14a558f8ab-3ddbed6e5demr76339235ab.13.1749133209675; Thu, 05 Jun 2025
 07:20:09 -0700 (PDT)
Date: Thu, 05 Jun 2025 07:20:09 -0700
In-Reply-To: <0000000000004f557c0615d47e6d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6841a799.a00a0220.d4325.001d.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 ec7714e4947909190ffb3041a03311a975350fe0
From: syzbot <syzbot+3a36aeabd31497d63f6e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ec7714e4947909190ffb3041a03311a975350fe0
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ec7714e4947909190ffb3041a03311a975350fe0
