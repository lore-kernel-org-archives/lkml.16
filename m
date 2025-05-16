Received: from e240-11.smtp-out.eu-north-1.amazonses.com (e240-11.smtp-out.eu-north-1.amazonses.com [23.251.240.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803431581F0
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 23:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747437353; cv=none; b=aRS0edQbXbvJ2dnQbXR3cBoZWEd3KELtruDKM4/lqeEiUAyD3jQBvORFgoi4LZy04FwzcKOxFej+om1M+H5X6hTwULWnMrLeppM7mwJLpqduxXCT2x01V+32x/JgbLAlU7oTpCx2L7uwPRXDQZRnf7x7JInDvr552Qqg2eledbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747437353; c=relaxed/simple;
	bh=cPvggfarQmyIci66SqtwkqSQNZt+BSso3h/As/SvT5E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=T3h6S5g7eDrVn5y2x60gYsts01Urm7I8mBEiBIake5o7kkzD9awqNUyNt79ABrJkwPk8KY3yDKqYXbG9QVJx732mhTNd3GMvlj0WYzywvA/cd7qwb3Lqpc2mQGk+9iFv36cvvXtQL2gMS5ZhEPKwQaLcjI254rFkeM13A4CDrd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=Zu4xB87s; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=IkiUHCO6; arc=none smtp.client-ip=23.251.240.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="Zu4xB87s";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="IkiUHCO6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1747437349;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	bh=cPvggfarQmyIci66SqtwkqSQNZt+BSso3h/As/SvT5E=;
	b=Zu4xB87sYoCVlDImMv56Rv1PQ5dhVbaQ2yjPqhxX2AUslp6UD0C84Ump1rtOlOlP
	beqUbIWushOhW4N3R5867DyTnWJddh6FeFq2ttr//6pbRPSJmZso12LNDNVw4csAOff
	lLa6HDJk2ZLozELQW3ryOCkfZKJ4lel4Vha2pshhME0H+2iUAXmg9SQXYNG8OpukShj
	qKZ9R0qiZ0seRr8cajij0jTNdPBxt35jBsn+jEuEEqIGG7avtDbD2sQsW856j6p3/yz
	1l8nBfWZFMcQYKHVv6zGllsKjmV8AV3r7vsyp/B1LEdOKe7aMLmDJnVmLAgaLMVnYrq
	dxBs72WpeA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1747437349;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type:Feedback-ID;
	bh=cPvggfarQmyIci66SqtwkqSQNZt+BSso3h/As/SvT5E=;
	b=IkiUHCO6gY9nVp/W/c9+FE1H5OuSOLAA+WZ9uBpkxsFjLYmj864euxBREEshqm0M
	mgGazQaWt96ZAWGeYSBqeIVW4yGKuZeslrQ+DeobJtXLTXzONb3zh8F1DnmKxVyAxUf
	CaOMgcUiIyRxiBZIt8taDK5/Y4eZALK1mFkoEZco=
X-Gm-Message-State: AOJu0YztL8+8M3HgfPfTH7fP9ZYnvSNaoOmPaTwNVpMXQaswzoeD1TKo
	0RRvF33HazkuYpabnYB/FD8g7IR1S76RI27u8pY5+qv06JZBml8IKSW4BOOcxEN8gvUHbNFjZXm
	G9vaNZk5bwb8Q7svEqUR8biVqI5Gt9tc=
X-Google-Smtp-Source: AGHT+IEPcYWy16TJXz10BUaONSoxvf1D8udTQFlJh6bPU72MAnG2M2ehgw/pB1K67HIQKz4bp/55wOoqDmKNowqrFlg=
X-Received: by 2002:a17:902:e786:b0:22e:5e82:66fa with SMTP id
 d9443c01a7336-231d450f307mr67312705ad.19.1747437347096; Fri, 16 May 2025
 16:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ozgur Kara <ozgur@goosey.org>
Date: Fri, 16 May 2025 23:15:49 +0000
X-Gmail-Original-Message-ID: <CADvZ6Epno6+tMP0CAP-zPpXvpgRy+C_Y8DwDj1Tz5Jb_RycYsA@mail.gmail.com>
X-Gm-Features: AX0GCFuTmo2oBGGIqK4gBdHsKIzDFG2M6kqJVXrSUAkJhL9lUXZrM6aADG2maug
Message-ID: <01100196db61ea58-123409dc-7381-487b-91b6-166193f3f349-000000@eu-north-1.amazonses.com>
Subject: [PATCH] kernel: fix acct.c first test openai codex
To: Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>, 
	Joel Granados <joel.granados@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.16-23.251.240.11

From: Ozgur Karatas <ozgur@goosey.org>

Hello,

i want to try out the openai codex and it seemed like a logical
process so with rcu_read_lock() a protection is started but we dont
call rcu_read_unlock(); it has to be called to end rcu read lock.

I guess, this means rcu stays open forever and data structures are not
cleaned which causes performance degradation.

Regards

Ozgur

Reported-by: Ozgur Karatas <ozgur@goosey.org>
---
 kernel/acct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/acct.c b/kernel/acct.c
index 6520baa13669..8a2b75063d16 100644
--- a/kernel/acct.c
+++ b/kernel/acct.c
@@ -330,6 +330,7 @@ SYSCALL_DEFINE1(acct, const char __user *, name)
        } else {
                rcu_read_lock();
                pin_kill(task_active_pid_ns(current)->bacct);
+               rcu_read_unlock();
        }

        return error;
--
2.39.5
