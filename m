Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB6233F6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743479462; cv=none; b=rGMljmn0jz2CifASYEddxfzk1Xq0aDoPrXgFzP7pp2Zvp7huAa53kV/HfY1b3IFNL7gXj6+xGyTBNsbpw5P6ZC9ni0N4cmjFMA+5mUeATIyQ0e3IOQiVP72lpZetOwPXjfTE6dZQhVoBc0CefU/ttwWiiDcT4GcRXIWHfKwln+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743479462; c=relaxed/simple;
	bh=luxTCYpThQkdy85ahpLpEvRU0c7cs85npMLs/7Yw+dI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=gRqktcsYubJtAi5pa2rxWV6C/itggBiMuZHSRc8QL/TLPIXak0tANYdYEbsoW3gdKsAiGn80kzHzHsTsxy0jt481ORgGFKxaas9IlRgdyxjGvEtFYhwsvoZdZl1h03h0PdyB4hxOgN1qi+PO95aGSiewcz4X5cffJkluwfyGsZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d6c613bd79so13024385ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743479460; x=1744084260;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luxTCYpThQkdy85ahpLpEvRU0c7cs85npMLs/7Yw+dI=;
        b=ndp8gEOGGn24lHQLhYFkCACIce6oFObUVkBfi1/LtA0VGnqQWTo9+p52sGRfFdNNcd
         xEukiusXYuqA63CJr3xkiDSCjkUc5Lcl6YYPOyGHFi46E79GZFn1IvBO39LjZai1qowu
         U88+tRldI8KlGhiQiC42LdzUXuVDC+FBzkwIUYawEdZf2j1qnfAwUtFNhK4UfJveNqr4
         XH/Ji7XluxfuC+hYbFKwjH4C97JJLynpSFsHxP3onCYeFFr0glYVcrwY6OnDXChyd8Ph
         nr0qdM22sSyMvgTmjkbuHzRQPpsg3+XmH1xZ8VwzYqOfd5v/0RHaSl0XTLpUr1+Vy4Mk
         ihmw==
X-Forwarded-Encrypted: i=1; AJvYcCXG9XEw81GUomC+1IvZ5hvEM1L3LV+VyKVn4uX3cK5LBkguRImxT0CmGrZZ087auuYTvis3XntiFi8CXi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNevzpLu6HU4kEjaPVnqBFRFTjlxnGWpziTz4/ul8a3jhNwZ9d
	WosDK9EwNCA6BhidATFqOey0F/1mzI5qNPciareMQooKXYqvVPONHkTqzAsQqMxclsrQEUk+NvB
	X0P1xRL/XWkdd8D3IXqxZwPgRrKTGdYgZPGat3mLhigxndlumg9J2oSU=
X-Google-Smtp-Source: AGHT+IGkBpKviturMywRI5Ted+04bzLPfb9y8ZGR7DN2nogN6zreyWgu5aHUt3vwtURtF2R7uSz843egpgJHmRBUwE+qsszIkqlm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17c5:b0:3d4:6f9d:c0d0 with SMTP id
 e9e14a558f8ab-3d5e0909503mr123303095ab.8.1743479460272; Mon, 31 Mar 2025
 20:51:00 -0700 (PDT)
Date: Mon, 31 Mar 2025 20:51:00 -0700
In-Reply-To: <kqldb4h5g7k4yeh5qjazwamrxcov2sih3ebbbdofi6fijogsis@wrauzumcpsz5>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eb62a4.050a0220.3a8a08.0000.GAE@google.com>
Subject: Re: 
From: syzbot <syzbot+c761143a86b1640bc485@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev
Cc: kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz close

unknown command "close"

