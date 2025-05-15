Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21C221F0A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294578; cv=none; b=WDv6zixXSpA/Acsp3DNvTGyVuP7U5kBhZddCqEHxns/DGdPZP+CFEhkWrDkh/qavQBssDhQeLva1zk9TCSY6tjgoOjAMTRiY1t1s27Qy7Dl/TEQatl86/T2JD1WhyswNCbM5ueufdR/2x9lLt4N9iA+ko7SQDRxJpGYwV7TK5BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294578; c=relaxed/simple;
	bh=szsR6cUA/KBk1A+1+MXOmIwq7e5nLTeC1bHAQuEP98Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sETyuI6tNwjyv/gCD+eCtxdZKdFdNBynvdQaWruMNWCaivvnWkztab5WfgAj3NkOafOliyWKQ/o4btyxbH7XhpCCSMZAeNOj700PD2yOUhFytTHTi+gJ+rWTpXQ50+2oSl8r9W/+GR2rn7tvV1016WBjAHT1fFxBESqhr1CpMk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQC2ylE/; arc=none smtp.client-ip=209.85.219.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQC2ylE/"
Received: by mail-yb1-f193.google.com with SMTP id 3f1490d57ef6-e7ab544d5efso566487276.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747294575; x=1747899375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=szsR6cUA/KBk1A+1+MXOmIwq7e5nLTeC1bHAQuEP98Q=;
        b=UQC2ylE/xhcdBiKK6rDtwypkF7vcrbccfBZ6ascfZ3HCdnvQQtJiOkkQc5d+DJmv8h
         YyQJgfQtUl1eelbYKu/NTfG4wzRrWfjjgy09i/zqS5GH1Lo/mlE+WLexP/GijLLzCGbi
         iKwnKJawy65vaqWCKUt1RyJVCG2nS8b+ooHN3bZGDG6sQnkSfL+RTwrR30qxbH8To80M
         /+QbiDRb9C3sXw14v5RQ/WWZHEk5DkHYDFNAyGI3UgtoDIWBISC8AFLtzkO1o7zid213
         /aTyAzE2LcjxgWe/zlQfPx+dJBupA6tmkBpahw3usOXzvO3LB+YXyiO2SGdM6emiEBPi
         d5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747294575; x=1747899375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szsR6cUA/KBk1A+1+MXOmIwq7e5nLTeC1bHAQuEP98Q=;
        b=bjO2Uu79lPb8IvMtHSdAEoJdjFhnL5ITsP0xfMqkTbgqpqdxLGcteEvgw1wrwcDGdI
         1d4RFva3R+iJAWo2xd90bXFnL/JjwqoNB7UnKMl2rhRentjtWkzc8mLtJxE18SO14GwU
         vX7Iwmbq1OAv63UzR0UnwC0h0acTYuvu3VvktQgMMxqFbsFcA9mVn7buoGQjfc3OH7QT
         vkwiFuMT9/izG94p/R5A+huNHilzKSogRK1bAAs+tShwuqZwUeHarj9cqloe083bcPFl
         ucKt380anahhquZkphnYcTsIccQ6VKjcJqOxU0h3jrCRvGVG4n9dtD/7t92ia2FmatT/
         2k4g==
X-Forwarded-Encrypted: i=1; AJvYcCWKkfXiCPKt5u99G9uKs4oI8WEbuKZ40y+pkNsCo8O2QdzCy2BDqzQhWm3WmefPITHZpedpPRY1TdMy3xY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmp2Q1Vr5ruPZzLKCGizvCfgYlS8eVvoB2N+ycpKbB0ckpNsOn
	eK3kOEMxUm3r+Te5OuwFkDYVriHQHNEYQXMmajvoTbcG7aPCD5C9uSKSQh9XnMTO+pH2mTGmO93
	LVTLyBsS6WYgCCAjoOm2HQZtC77M=
X-Gm-Gg: ASbGnct3XwT9L39/nAVJhQmCfHQTeDsm6UJFRk3nQR++lDbjS0bWVF68CJlOi/zQYz+
	QBAkkooGTEZS3Yr8/ySJO5GllMrTLMpswi/LEUnv0hNivDelH+yNNNE0hRJFKLwea25krtc7HLr
	sOYWINYP1G3lc2HFSfYQon7AmBPOqi4dMhoZBn0bmVkTo=
X-Google-Smtp-Source: AGHT+IG8opHlVFnveV6TiQeURD6a+n3enll8lWBn546ETe3NrD2IJ5PQV2MZ9ReruHPc7XhuXvimqgjVj7A1AZfCbXA=
X-Received: by 2002:a05:6902:2483:b0:e72:9612:f78c with SMTP id
 3f1490d57ef6-e7b3d5ecb32mr7878678276.40.1747294574780; Thu, 15 May 2025
 00:36:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Guoyu Yin <y04609127@gmail.com>
Date: Thu, 15 May 2025 15:36:04 +0800
X-Gm-Features: AX0GCFt2pwByeaCyYPSlsoCOUmmtgbUEuL0FPS9I2GL2H_SPAs4BqIugp1TYGtQ
Message-ID: <CAJNGr6uG6h=dBLjfB5ajZjv4qdf8-LjcW-i8L3_oqhbvBosSuA@mail.gmail.com>
Subject: [BUG] INFO: rcu_tasks_trace detected stalls? (Late IPI?)
To: ericvh@kernel.org
Cc: lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com, 
	v9fs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I discovered a kernel crash with the description "INFO:
rcu_tasks_trace detected stalls? (Late IPI?)". Analysis of the logs
suggests that the issue may be related to numerous 9P network file
system connection failures and high system load.

Specifically, the p9_fd_create_tcp function repeatedly fails when
attempting to connect to 127.0.0.1, with the error "problem connecting
socket to 127.0.0.1". This could lead to resource exhaustion,
affecting CPU scheduling and interrupt handling, ultimately triggering
the RCU stall. The logs also show EXT4 file system errors (e.g., block
bitmap inconsistencies and delayed block allocation failures), likely
a side effect of Syzkaller testing.

I recommend investigating the 9P network file system=E2=80=99s connection
logic (particularly the socket connection part in p9_fd_create_tcp)
and system resource usage to pinpoint the root cause of the connection
failures and high load.

This can be reproduced on:

HEAD commit:

38fec10eb60d687e30c8c6b5420d86e8149f7557

report: https://pastebin.com/raw/0LB0VhWw

console output : https://pastebin.com/raw/EtnaHBBq

kernel config : https://pastebin.com/raw/u0Efyj5P

C reproducer : https://pastebin.com/raw/WzZ023uX
