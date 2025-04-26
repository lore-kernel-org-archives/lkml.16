Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED3C25CC52
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745680197; cv=none; b=Pv7LyxIA+3jo09uqF437Y3DVZCdqXwgy0fpneDfHsLAUF/4rxGb0jrS836rvh49A51EJAQnUcHVShmW8PR55o7St6dBqvdHwjb7qe9XevDwr2cRuA5QgWa7P3YaNVilRb+6hEXLu0ZJfzLJxlj/KPvBafODj446tKJbjMati4Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745680197; c=relaxed/simple;
	bh=bKo4E9p7jO74TcWp2wF5q8TC5G0zpfA94nlYlKwq3kg=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=jaXg+Mq1kF1gLQPlAPBoadfvXkbPg9gMvb1pAbiOBfjVF5Aaiwe5TR8aGBwS17sw898uxYLTgOOad60q0IGw7VmPJakQkeCoGHrSHSr5ZXoGcwAAFtCKItvFOPA19wIWTBQnXCPOpXAF6FU78sk6aMshmHZcg7mjIiU/6SIwqpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net; spf=pass smtp.mailfrom=telus.net; dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b=VOOFOgX3; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b="VOOFOgX3"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b061a775ac3so3278798a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1745680195; x=1746284995; darn=vger.kernel.org;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bKo4E9p7jO74TcWp2wF5q8TC5G0zpfA94nlYlKwq3kg=;
        b=VOOFOgX3NyjMtvSWlc0L9uvn8b9rclqCq4nR2ow+k1pM0XDzcsSHEYs9I2liUXNtil
         9jRb1OIDFV9jHaSQVyjxPk5UrFSOVbb1awLTpum5bgDy6TWPoOgNjw8Qa66/gjfA3vb6
         H9+mQbooijtbZKrneWzr6Ig30uF5/wgVP/uIUDgEOXjWTHl/mZn9ZHFh6Qw/5JBlFx5m
         e7W+HCchnuTF9earjUbxpclK38TBec9OlEEdpKtNQATSstBEJDqaregItkWnsdEeuA8o
         0ubVQKz/Nww20V/AjCM7t18UYExQI4x5inrTL0mcSYiYLHZ9zAjyf3N1dNSdb6k+Jvm5
         8Ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745680195; x=1746284995;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKo4E9p7jO74TcWp2wF5q8TC5G0zpfA94nlYlKwq3kg=;
        b=t6WrPXLgbmat7iV+PirScPAlAa2X1hfRMVNrJmEinXAtaVZ5iJtr+GJTJxPcvYQWKn
         qqyDimJL6ivzDZHe8AUJdpEmYdmx14hN0pcL7E3Nz97AEr69Q5EdbDtv1Ej8a/fz2xdx
         ZQWTA+bHUlTKtFuCQCEdcFrZ3W8DZamBflfDD+C6ck4y9w5TCH7JV4H1B8oPM0a055qh
         Ei+h36DjB+LFjJIR9DxlxTX9tXntUks2vMi7Pex6AWVyX3mnmOuQcwgOkXrHmim9pU3g
         PdvjA1T/+UxhBilmAM1fCGwHhezo1g1dXgwnDCnC89bTS/cZ5P5G7DQAyT3ErwcSi2xE
         drRA==
X-Gm-Message-State: AOJu0Yz5JTy4ztV5bNI7dxKoyv1gNMVYdLQhattNUXU3+iJNxKfBwbis
	Ib2UrznCvsZQfluq3kgVaOnPUXX7kYO2VSxP1QM4szbKUqI1tfvbj7PeztQeovQ=
X-Gm-Gg: ASbGncuM5K4kvZyPbT63z6PVsDN3j3WEHJoptKTEwsDB+ha0o6BEYpVQxwvE4osNpxJ
	iZQnZ8VjjMITxDSBdMF31L2Xb3noHl3tE8GcWGhpVpPqWIYN/smFIg3ZEuWa0PY+6GWE1w/620m
	jHY6XS8ct4Y8p2dnKG9YdS3M8pxB1FIlCydCvyh22Gm7tnb99XAx4E8rilvoFsQYCvHW27308aZ
	lORQwuzxFgFA2Wxz0CQdgNYi/JrmVt/Nazj+U3/ZCY8ULZb2CqUUXyUtmYhoetUIDSQ6K92nMet
	qsentSDaMZefy1pEcBbi9mU0priCvgRALWfq0XQl926CXEHPlJEppTkZ27reQSZE1gf2CmdvTaf
	vwlLW4IxTb6giAvnt
X-Google-Smtp-Source: AGHT+IEYskuolGvFdNkCiGhRwpw7QdCs31sHmvOeTbKE8BUlIl4qzQrF+wIH/wcPjeNQgAkBtPsM/Q==
X-Received: by 2002:a17:90b:586e:b0:305:2d27:7ca7 with SMTP id 98e67ed59e1d1-30a0133b15fmr5152386a91.16.1745680195056;
        Sat, 26 Apr 2025 08:09:55 -0700 (PDT)
Received: from DougS18 (s66-183-142-209.bc.hsia.telus.net. [66.183.142.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fa80fa97sm4418296a12.51.2025.04.26.08.09.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Apr 2025 08:09:54 -0700 (PDT)
From: "Doug Smythies" <dsmythies@telus.net>
To: "'Alexander Egorenkov'" <egorenar@linux.ibm.com>,
	<peterz@infradead.org>
Cc: <linux-kernel@vger.kernel.org>,
	<mingo@kernel.org>,
	<x86@kernel.org>,
	"Doug Smythies" <dsmythies@telus.net>
References: <173642508376.399.1685643315759195867.tip-bot2@tip-bot2> <87zfgfi017.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com> <002101dbb349$03e2c7a0$0ba856e0$@telus.net> <87msc6dmbz.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com>
In-Reply-To: <87msc6dmbz.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com>
Subject: RE: [tip: sched/urgent] sched/fair: Fix EEVDF entity placement bug causing scheduling lag
Date: Sat, 26 Apr 2025 08:09:55 -0700
Message-ID: <002401dbb6bd$4527ec00$cf77c400$@telus.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: Adu2t8ZaKw4W6wwgR5eoqJ2PN11NsQ==

Hi Alexander,

Thank you for your reply.
Note that I have adjusted the address list for this email, because I don't know if bots can get emails, and Peter was not on the
"To" line, and might not have noticed this thread.
@Peter : Off-list I will forward you the other emails, in case you missed them. I apologise if you did see them but haven't had time
to get to them or whatever.

Also note that I know nothing about the scheduler and was only on the original email because I had a "Reported-by" tag.

On 2025.04.24 00:57 Alexander Egorenkov wrote:

> Hi all,

[Doug wrote]
>> That is a very very stressful test. It crashes within a few seconds on my test computer,
>> with a " Segmentation fault (core dumped)" message.
>
> Yes, this is an artificial test i came up with to demonstrate the
> problem we have with another realistic test which i can hardly
> use here for the sake of demonstration. But it reveals the exact
> same problem we have with our CI test on s390x test systems.
>
> Let me explain shortly how it happens.
>
> Basically, we have a test system where we execute a test suite and
> simultaneously monitor this system on another system via simple SSH
> logins (approximately invoked every 15 seconds) whether the test system
> is still online and dump automatically if it remains unresponsive for
> 5m straight. We limit every such SSH login to 10 seconds because
> we had situations where SSH sometimes hanged for a long time due to
> various problems with networking, test system itself etc., just to make
> our monitoring robust.
>
> And since the commit "sched/fair: Fix EEVDF entity placement bug causing
> scheduling lag" we regularly see SSH logins (limited to 10s) failing for
> 5m straight, not a single SSH login succeeds. This happens regularly
> with test suites which compile software with GCC and use all CPUs
> at 100%. Before the commit, a SSH login required under 1 second.
> I cannot judge whether the problem really in this commit, or it is just an
> accumulated effect after multiple ones.
>
> FYI:
> One such system where it happens regularly has 7 cores (5.2Ghz SMT 2x, 14 cpus)
> and 8G of main memory with 20G of swap.
>
> Thanks
> Regards
> Alex

Thanks for the explanation.
I have recreated your situation with a workflow that, while it stresses the CPUs,
doesn't make any entries in /var/log/kern.log and /var/log/syslog.
Under the same conditions, I have confirmed that the ssh login lag doesn't occur
With kernel 6.12, but does with kernel 6.13

My workflow is stuff I have used for many years and wrote myself.
Basically, I create a huge queue of running tasks, with each doing a little work
and then sleeping for a short period. I have 2 methods to achieve similar overall
workflow, and one shows the issue and one does not. I can also create a huge
queue by just increasing the number "yes" tasks to a ridiculous number, but
that does not show your ssh login lag issue.

Anyway, for the workflow that does show your issue, I had a load average of
about 19,500 (20,000 tasks) and ssh login times ranged from 38 to 10 seconds,
with an average of about 13 seconds. ssh login times using kernel 6.12 were
negligible.

... Doug



