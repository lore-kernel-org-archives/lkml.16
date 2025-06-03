Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0788D221F06
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958495; cv=none; b=pChXrY6+G0B2V6CwYpL5G3LiDqY+3yVgm1FQqzTZpjMDLe6B82GFDfT2NeYP7ph9OLUhO1dgmEGKKZDo2+NogMSTfRUAvG6QCdO8XXwW9KT84YT7ipeAzQK8vLkQDdE67EZobfynLcRzWawCuYTcKWLrOmgWtFiW+3u47huROn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958495; c=relaxed/simple;
	bh=MpVYyNvNpYOTg4wdWRUA02Rja+rmN6akRw4SD6btFQY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=uftQx7X2fThucZO6/ClTUQ4AbvMhZiGDgPn6iS4aLudqKzJTKdkv0cHVx23wTb56ZsiIT+DahF5D70GRq2eJ4nW52rqXcoBmFfY9FppEfV0gOwKWDKRXAgrBoU+PMXIeM2/Z5YuO0Av5Zhh7+ev3V3BIKBMPAPdxNuUXaLHDz6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so6537325ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958493; x=1749563293;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vH5uXKxA+g9DhmzmYiLnVttaCFRgKDoDat39yDvMsMQ=;
        b=HzjWj5+aKevo9O7apEHFjysogkFfv413HHdwjRU4S+/aCujHns9oCIqOywdPNrXVrv
         S8b8s/HEF6LHmcZnc0A33Nt7t+nXniyINVTmTnjzNy1pPbZcHG2cyXIjh7Yd+0gbJlVp
         NPbimm4TOUPaVhDd2sETJ35ZASkRBZORZKuAHDT6E0tm4iTJz3O8p5C3oLt+or32YnIK
         3niWGnVRr4eJyDjPARRRmfEgN5A6iy3HvyftM4KW99zhDayFEpJjS5VKz2tL8YNpXlZp
         T+yFkVUENdAbJDkvGAk3fJsMl6sh2M2yKT/951XtJ9gEgWyJiSgDd5shipcrq1+5cLtQ
         sCHg==
X-Forwarded-Encrypted: i=1; AJvYcCV/nuBVCjDWZCLGfKykG3ALL4oofka3RJv/gnji5KUQXDYqz/8Fe2c8FyiixPnUHfHqWLOqOLkUW51FA6s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+uOKxud9VcJNUHo607P2pfVlCjiQz+cceGRyq9d+ihtH7/dW1
	M3BBmwVMWsXFVR6m/F73n83D6OAfUoAi7PRYQMRMB5WVuKBUIC7W/buBLzh66qvw2rTD1fUIlas
	cH+nRGjHoTSMGk5QHdEMV1GjZzxyPJSokXzliMGWYRYwU8K1LHpLfOIm7JC0=
X-Google-Smtp-Source: AGHT+IHOhyZgUqNnAbrBIKAbrZjWoMYNhADJRRCcF1/lcRqFw6l0QC0rA/d2OnlIC7ZAjwvlDADFnXJ2Ed11DTS4/ux2LcRg1S65
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4509:20b0:3dd:a4f0:8339 with SMTP id
 e9e14a558f8ab-3dda4f08594mr87459005ab.8.1748958493078; Tue, 03 Jun 2025
 06:48:13 -0700 (PDT)
Date: Tue, 03 Jun 2025 06:48:13 -0700
In-Reply-To: <2dfb1e75-6a4a-4818-80b5-4519c0a06c4d@kernel.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683efd1d.a00a0220.d8eae.006f.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] INFO: task hung in io_uring_del_tctx_node (4)
From: syzbot <syzbot+818ea33e64f8caf968d1@syzkaller.appspotmail.com>
To: axboe@kernel.dk
Cc: asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org, 
	krisman@suse.de, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.dk/linux.git io_uring-6.16

This bug is already marked as invalid. No point in testing.

>
> -- 
> Jens Axboe
>
