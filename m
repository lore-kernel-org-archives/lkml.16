Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333A441760
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395755; cv=none; b=dHuJzD/Yv40zHYWR27vdH6ATRq9S10XNBcNj9U2h7XsJWCfceheCemgyOb5MeNMPOAThFkxuduFZXdHvJlGGsbX2ApxowRO59mdKqM0U2z9Qhtcj24WrL2IFmyFQDd0+P2/xh2TzNexn3GJndX/WTe23B+jLKVDID1KH9LLWHRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395755; c=relaxed/simple;
	bh=qiMV3dMi+9DlhdCTYBcFKYMBvMxUD3LJ1STAMRmHlO8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mcdl/gttZYQv6RVsklrDM4+3fT9OhAsUzFrMyprdjPw6s4VpOyW7p0MS249rAEADjbkZkDteLh+BUeD1vWYxv0Fhg7Xwxu8um04HycWR8PpxyGHCf4a7Udhv+sgUssoRAurCeXygOGFoxk7T2aLaPZZM8QUQwRsF4pWXbg7b0Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCPe+Yz8; arc=none smtp.client-ip=209.85.219.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCPe+Yz8"
Received: by mail-yb1-f193.google.com with SMTP id 3f1490d57ef6-e78effa4b34so2693794276.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747395753; x=1748000553; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qiMV3dMi+9DlhdCTYBcFKYMBvMxUD3LJ1STAMRmHlO8=;
        b=aCPe+Yz8G15MyzbyDkOHeb9WfI/Xo10utwQ0lt3hQVJBJGcStgHQAK4w0334lpiuuR
         nnfbJK8gkKGZ7ULYn2zk8XQWqDym/PUnk8TJy0qTyThQPNhLJnRnCt6tW7qpP7eC2fHd
         68NFrFRp0b4CskMLKWcXY+4rr32h0BIwXF7Cp+IbrlhCY7ZG7GCyo88VORLjOXY7aHiG
         6Rp+xwEXEt6WJcNaxylPCwAPYfH/Ss4ZbbgA7oTTpy+2nW8bxEHEtENzsVoc1KykZq8/
         7MPbDIIB/3oqG14ensbO2/iCXbsChGve+haeKQnkcIl1kqjh5/aS/5d2TZz18QujweqG
         A+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747395753; x=1748000553;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qiMV3dMi+9DlhdCTYBcFKYMBvMxUD3LJ1STAMRmHlO8=;
        b=ww+LczcelnmUHSkpsGHViz+jLlAczxiM8CSsOqfiLm37BnN/rYLEHXOKkrekXh54ky
         GPPOuhMaxpkxxIENEJA944D9AEuDJw2ZPTUwN78IQ33x7l+3VKTHrFnIywFrxF8P7s1W
         KZtabFrd1m1HuOX4OjYszoQjB9iJg8F1OSZPDSruD748+vCGtkuEL+2G9eNj1r0CAYZo
         n+uVzKj3AUrPiO6oj20KdM3sabl/X4PlrQwS7b7UHmxiJVWlrFCmS/3XZDoWG+/V3hxa
         baeoCyJCMzmabd8nYP1Wvs3UQKPw2MWi+/793g3uYMb/ZtASC0p11wkvaquIycTo45Mu
         cinw==
X-Forwarded-Encrypted: i=1; AJvYcCW1g88gqyGUcGRJ0EFch9kTzsKWVyWpDHlfIHHTgIt8wJM+Yu7cnZbxC4H3nPwT9CkT4xIZRpMd8xOKqRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0/Cs6TFqKE7n2RbDNUjcjyiQCrL2zqdoozfBBNeJ9WfDbG6dE
	hRYpCh5jdTc0MplNDJLHymlC7OW4O7CguviNiFpYaTbzFBJOOzwOJkx9T/HrXw0qBnnBWnG6Wx2
	YpS6BZs9it96WsjZpmJHjow1ERfi7k+kFpEYSgvo=
X-Gm-Gg: ASbGncugU1bWNqlhYAo1mv9YgDkYCcfUemq5DjYUqqsW4iGaCkaDKGuku6N7UvLrzzr
	4wec/hA0nZZsQp0m01phU3jS2ExfnNTgseE0y12R8MJ+nLlg1tUJsLOUfCUPu7fXEjMhecXZDaH
	8+j8JM1t2rkrzzBrk9blDZE2BO/g7ZAonZaeQ=
X-Google-Smtp-Source: AGHT+IEqOHRPI9mMx9Iw5eaBYbZdEYeRPHy72IJwKVqT09nHXqCoGVb4KDCzuftFzMlgMWjU6O9shtHe9RpoQvqfBL0=
X-Received: by 2002:a05:6902:2b86:b0:e78:f196:5d48 with SMTP id
 3f1490d57ef6-e7b6b18c7d4mr3667234276.13.1747395753173; Fri, 16 May 2025
 04:42:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Guoyu Yin <y04609127@gmail.com>
Date: Fri, 16 May 2025 19:42:22 +0800
X-Gm-Features: AX0GCFtdxDf5MJAWdsDhhE1EdqPM7pPra-wvzgCAWWruf6VBGH0_LqXshVq0ZUM
Message-ID: <CAJNGr6vHrsSZ4QrRbRrN8-+tTb7ks8+xY9W7iE2VLsdgZe-eFQ@mail.gmail.com>
Subject: [BUG]INFO: Slab ADDR objects=NUM used=NUM fp=ADDR flags=ADDR
To: ericvh@kernel.org
Cc: lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com, 
	v9fs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I encountered a kernel crash on linux5.10 described as "INFO: Slab
ADDR objects=NUM used=NUM fp=ADDR." The issue occurs when shutting
down the 9p-fcall-cache slab cache, with the dmesg log indicating that
objects remain in the cache, triggering kernel warnings and errors.

According to the dmesg log, the crash occurs in kmem_cache_destroy,
with the call path p9_client_destroy -> kmem_cache_destroy. This
happens during resource cleanup after a failed 9P filesystem mount.
The log shows that the 9p-fcall-cache slab cache still contains
objects (e.g., "objects=3 used=1"), indicating incomplete cleanup.

I suspect that p9_client_destroy fails to properly release all fcall
objects in the cleanup path after a mount failure, possibly due to
reference count errors or a memory leak. I recommend reviewing the
p9_client_destroy function in net/9p/client.c to ensure all fcall
objects are freed before the slab cache is destroyed.

This can be reproduced on:

HEAD commit:

2c85ebc57b3e1817b6ce1a6b703928e113a90442

console output : https://pastebin.com/raw/4CieLjqM

kernel config : https://pastebin.com/raw/gPbJY2Bq

C reproducer : https://pastebin.com/raw/EanQb7c

The C reproducer may take a few minutes to trigger this crash, please
wait for a while.

Best regards,

Guoyu
