Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D32B1E480
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744462313; cv=none; b=H0cP+8hXJks+P2E1HBSwq4l4F+8zKVauDCW4jR68KJxLeb7q1zX0C6bpT5JUuC/3r/IoBbIXwZ1tiwlu6jKqYyoLAwSuh6CGWi5tNQptP7cKECJ8VFdllm8SPff9PqeWXNbQFpM7XFaZmJQmtc0vXa0QYEjs27Ub59RKrv4F1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744462313; c=relaxed/simple;
	bh=nO9SaDtIYOeapvJB1AF0x9P8bXuIjOq7OEELF9LMA94=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=KLUzV27KVbcJsKPY9I5lc6N1fxyKX9eVi+9nmEs1+MR0MYPmKpR7zCHG6drfV2Njnr/Qw55bikFYQtdqTktXGSzkB5fpWkW5D6B7HwQVv7B7YJUWRIA97p+nQc/CUdtkIE2Sw4Ecjp2LnqqBgKdi9NC5Stwli4zTZaTwOgvK+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9+RBKyu; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9+RBKyu"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2c663a3daso541855266b.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744462310; x=1745067110; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nO9SaDtIYOeapvJB1AF0x9P8bXuIjOq7OEELF9LMA94=;
        b=K9+RBKyu6wDaHGbzvDA9o1qhVfzBu4pQJD3L5lB5d2jfvDRfb0QejDXzGf604mWYP3
         l6AqOjMXHcxFaoEZRbN19NSjWeuajG1qJhDUJiqUxYbvfbhV6eSOifFPn1TGik1CPtLn
         RWtmFiTTMatnOI64jyzZvCyVH8+5qoO36OUYRGDaXurhTEm7jI5Dq/OHhT4qay8mxXRN
         uTWx9BGSl8tnZh46yEhjnyL21TkY6QgCvubB07vP9wMIfJzy9vAyzDjcNnnCgGDd4byG
         Pl+UpQGfFNAKYTDfyp/9EJrKnggu8Umgcsjq/kA8dvpCDbzXnal8hA7yPI+pS1DOYzcJ
         muiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744462310; x=1745067110;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nO9SaDtIYOeapvJB1AF0x9P8bXuIjOq7OEELF9LMA94=;
        b=I5+rnNOM426wiRdOgKfyDMLdqC7U0Jbz2F7JpiiGEPk1VpkqiApELT6mH37PH40SvP
         dpdN7fTV7rJho5qx5CgR6ynAfimKWDXq7XGt17KlPP6ug8Vbzw/Qet+pdgBPt72SyA/0
         AoE8i3m5EDSBVX4ITcIebl3LFEfuE38EQ9woOtolDHyBGkF8uRRyCBEzNA9krRMd1bRA
         334akgFBZ/jHQwUN1PLakmusUSnuwgtvEDhNn2vgeOUStZHk4e04k9whHEIUOkTC0Ttd
         Fjhl0lN0nQCoS3EPr2YPlTfI6Go6F96o6/Rq/PFDtQWSbyXll8+9TjwIcAmuDRHJaNrv
         Gp6Q==
X-Gm-Message-State: AOJu0YzalcL2IAQzq/1edQ8du32n6TRJuZP19RRWcM70ldzojRzT50Zg
	KGJky7MR5MxAVkqDIMHgVGQQjMcfIvhsrhBDK9c4TvW1Tfxdhw+F4YEO1WmpC6vANCHkWN3J2J2
	38KaBVqEmtdOO7An59mIUXbBT4dBr4KXu
X-Gm-Gg: ASbGncsjmf/tfBuJD8LjLxLfkGQdR3simxnX1Y4RueCYHpW/O3USqbFSWYS8izWkTYo
	z+kOWwHtrQhJAjRVJ0xEAyUYrS3ufahtMqiiMTEF7sF1i7RV0l5tkQliBJcBB7zYReAIjXcDfQa
	vXxCf9MBKsfw5XbP1hmYM+ipy98ZiAgw6xd65CEzFURmPqmiIj8VLh6w==
X-Google-Smtp-Source: AGHT+IFkmml0RgnZ6qbUYjx5+3xPICuf/uDDYROHCigwJcEUKPiaEG99dw6WKJfPo3ttPScxV7qnMqDxn15p2wbOZnw=
X-Received: by 2002:a17:907:96a0:b0:ac7:c734:ba7b with SMTP id
 a640c23a62f3a-acad36a5289mr570164166b.44.1744462309808; Sat, 12 Apr 2025
 05:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: daikichi hanayama <daikichi.hanayama001@gmail.com>
Date: Sat, 12 Apr 2025 21:51:38 +0900
X-Gm-Features: ATxdqUEA8caHKylm1mu6Y-h8n-2uY5KlY9mt7e2t5CFu5SrfCPugV0J1X7Va2XQ
Message-ID: <CAFg0RQknZxrkpf5BKgJ7mgzX6s5R7KKARRYk-uTiY5UOSo_1=Q@mail.gmail.com>
Subject: PROBLEM: Kernel 6.15-rc and Apple Magic Keyboard with Numeric Keypad
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello.
I am using an Apple iMac 18,3 with a Magic Keyboard with Numeric
Keypad connected via bluetooth on Archlinux/EndeavourOS/Fedora rawhide
using systemd-boot and kernel 6.15-rc.
I can start up the system and enter text without any problems, but if
I choose to restart or shut down the system, it freezes when I shut it
down.
When I connected the Magic Keyboard via USB, reboot/shutdown worked normally.
Please,please check this problem.
Thanks.
